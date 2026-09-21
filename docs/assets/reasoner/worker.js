/**
 * Web Worker entry point for the Konclude OWL-DL reasoner.
 *
 * Lifecycle:
 *   1. On module load: eagerly calls `createKoncludeModule()` → `initPromise`
 *   2. After init: posts `{type:'ready'}` to the main thread
 *   3. On each incoming message: awaits initPromise, dispatches to the
 *      `KoncludeReasoner` instance, posts `{id, result}` or `{id, error}`
 *
 * The `KoncludeReasoner` instance is stateful within a single Worker lifetime:
 *   loadNTriples → classify (→ getInferredNTriples)
 *
 * Call `.delete()` (via the `reset` method) when the caller is finished to
 * release Embind-managed C++ memory.
 */
// At runtime this file lives in `dist/` alongside `dist/konclude.mjs`.
// The module is mocked in unit tests (see tests/unit/worker.test.ts).
//
// ontoink v0.7.3 vendor patch: the `classify` case below swallows the
// Emscripten Asyncify "unwind" exit sentinel. Konclude's C++ core calls
// exit() after finishing classification; with ASYNCIFY that surfaces as a
// thrown "unwind" AFTER the results are already computed. The upstream
// worker forwarded it as an RPC error, which made the main thread's
// reason() reject before its getInferredNTriples harvest step could run —
// so the browser always reported "aborted with 'unwind' before producing
// any inferences" even though the inferences existed in worker memory.
// (The Node build swallows the same sentinel, which is why the Server
// backends never showed this.)
import createKoncludeModule from "./konclude.mjs";
// ---------------------------------------------------------------------------
// Eager initialisation
// ---------------------------------------------------------------------------
const initPromise = createKoncludeModule()
    .then((mod) => {
    self.postMessage({ type: "ready" });
    return mod;
})
    .catch((err) => {
    const message = err instanceof Error ? err.message : String(err);
    self.postMessage({ type: "error", error: message });
    throw err;
});
// ---------------------------------------------------------------------------
// Per-worker stateful reasoner instance
// ---------------------------------------------------------------------------
let _reasoner = null;
function getOrCreateReasoner(mod) {
    if (_reasoner === null) {
        _reasoner = new mod.KoncludeReasoner();
    }
    return _reasoner;
}
function destroyReasoner() {
    if (_reasoner !== null) {
        _reasoner.delete();
        _reasoner = null;
    }
}
// ---------------------------------------------------------------------------
// Message dispatch
// ---------------------------------------------------------------------------
/**
 * Handle a single `WorkerRequest`, dispatching to the appropriate
 * `KoncludeReasoner` method.
 *
 * Exported for unit-test access (tests import and call this directly instead
 * of spinning up a real Worker thread).
 */
export async function handleMessage(event) {
    const { id, method, args } = event.data;
    let result;
    try {
        const mod = await initPromise;
        const reasoner = getOrCreateReasoner(mod);
        switch (method) {
            case "loadNTriples": {
                // Destroy the old C++ instance before each load so each reason() call
                // starts from a fully clean state (manager thread + ontology).
                destroyReasoner();
                const freshReasoner = getOrCreateReasoner(mod);
                const ntriples = args[0];
                freshReasoner.loadNTriples(ntriples);
                result = true;
                break;
            }
            case "classify": {
                try {
                    result = reasoner.classify();
                }
                catch (err) {
                    // Emscripten throws "unwind" when Konclude exits after a
                    // successful run — treat it as success so the follow-up
                    // getInferredNTriples RPC can harvest the results.
                    const m = err instanceof Error ? (err.message || err.name) : String(err);
                    if (!/unwind/i.test(m)) throw err;
                    result = true;
                }
                break;
            }
            case "isConsistent": {
                result = reasoner.isConsistent();
                break;
            }
            case "getInferredNTriples": {
                result = reasoner.getInferredNTriples();
                break;
            }
            case "reset": {
                destroyReasoner();
                result = true;
                break;
            }
            default: {
                const response = {
                    id,
                    error: `Unknown method: ${method}`,
                };
                self.postMessage(response);
                return;
            }
        }
        const response = { id, result };
        self.postMessage(response);
    }
    catch (err) {
        const message = err instanceof Error ? err.message : String(err);
        const response = { id, error: message };
        self.postMessage(response);
    }
}
// Wire up the global onmessage handler.
self.onmessage = handleMessage;
//# sourceMappingURL=worker.js.map