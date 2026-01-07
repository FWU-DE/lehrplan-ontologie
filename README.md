
![Build Status](https://github.com/FWU-DE/lehrplan-ontologie/actions/workflows/qc.yml/badge.svg)



# Lehrplan Ontology

**An Ontology for School Curricula in Germany**

## Overview

School curricula are a central steering instrument of the education system. They define which competencies and learning content students are expected to acquire in specific subjects, grades, school types, and educational pathways. At the same time, curricula differ significantly across German federal states in structure, terminology, and level of detail.

The **Lehrplan Ontology** provides a **formal, machine-readable knowledge representation** of curricula used in **general education schools in Germany**. Its goal is to model curricular structures in a consistent and comparable way and to make them usable for digital, data-driven applications.

---

## Objectives and Scope

The Lehrplan Ontology aims to semantically model curricula for **general education schools in primary and secondary education**. This includes, among others:

- core curricula, framework curricula, and subject-specific curricula,
- competency descriptions and learning content,
- structural elements such as subjects, grades, school types, educational pathways, and qualification levels,
- federal-state-specific curriculum models and terminologies.

By formalizing these elements and their relationships, the ontology enables:

- cross-state comparability of curricula,
- structured querying and analysis (e.g. via SPARQL),
- integration with educational platforms and knowledge graphs,
- long-term maintainability and versioning of curriculum data.

**Out of scope:** Vocational education and training and special-needs education are currently not covered. The ontology does not model direct links to educational media or learning resources.

---


## Ontology Design and Approach

### Core Ontology and State-Specific Models

The Lehrplan Ontology follows a **modular design**:

- A **core ontology** defines concepts and relations that are common across all federal states.
- **State-specific ontologies** model the concrete curricula of individual states, preserving their original terminology and structure.
- State ontologies are linked to the core ontology to enable comparison and joint querying without forcing uniformity.

This approach allows federal states to maintain and evolve their curriculum models independently while remaining interoperable within a shared semantic framework.

---

## Repository Structure

```
├── docs/ – Generated ontology documentation (under development)
├── shapes/ – SHACL shapes for validation
├── src/ – Source files for ontology development
├── lp-full.owl/ttl – Full ontology variant
├── lp-base.owl/ttl – Base ontology variant
├── lp-simple.owl/ttl – Simple ontology variant
├── lp.owl/ttl – Latest stable ontology (basically the same like lp-full.owl)
├── reasoned.ttl – Full ontology with inferred triples
├── lp-land-*.owl – State-specific curriculum ontologies
└── README.md - this file
```

This ontology repository was created using the Ontology Development Kit (ODK).

---

## Documentation

Human-readable documentation (class hierarchies, properties, examples) is generated from the ontology sources and published in the `docs/` directory. You can find it here: https://fwu-de.github.io/lehrplan-ontologie/docs

Find the list of classes generated with Widoco here: https://fwu-de.github.io/lehrplan-ontologie/


Additional materials and examples, including SPARQL queries, are available in related repositories such as:

- **SPARQL notebooks:** https://github.com/FWU-DE/mem-sparql-notebooks
- **Subject ontology:** https://github.com/FWU-DE/schulfach-ontologie
- **School Type ontology:** https://github.com/FWU-DE/schulart-ontologie
- **SKOS vocabularies:** https://fwu-de.github.io/mem-skos-vocabs/

---


## Contact

Please use this GitHub repository's [Issue tracker](https://github.com/FWU-DE/lehrplan-ontologie/issues) to request new terms/classes or report errors or specific concerns related to the ontology.

If you are interested in collaboration or otherwise get in touch with us, please contact: redaktion@mem.schule .


