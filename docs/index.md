---
hide:
  - navigation
  - toc
---

<div class="lp-hero" markdown>

![](logo.png){ .lp-hero-logo }

# Lehrplan-Ontologie

<p class="lp-tagline">Eine Ontologie für Lehrpläne in Deutschland</p>

Die **Lehrplan-Ontologie** ist eine strukturierte und maschinenlesbare Wissensrepräsentation schulischer Lehrpläne im Primar- und Sekundarbereich. Sie bildet Kompetenzen, Lerninhalte und Bildungsstandards sowie deren Einbettung in Fächer, Jahrgangsstufen und Schularten in einem einheitlichen semantischen Rahmen ab.

[Einstieg :material-arrow-right:](ontology.md){ .md-button .md-button--primary }
[Ontologie-Modell](structure.md){ .md-button }
[Patterns](patterns.md){ .md-button }
[:material-github: GitHub](https://github.com/FWU-DE/lehrplan-ontologie){ .md-button }

</div>

Vor dem Hintergrund der föderalen Vielfalt des deutschen Bildungssystems harmonisiert die Ontologie unterschiedliche Terminologien und Lehrplanstrukturen, ohne länderspezifische Besonderheiten zu verlieren. Durch die Überführung heterogener Lehrplandaten in eine interoperable Wissensbasis schafft sie die Grundlage für Analyse, Vergleichbarkeit und die Entwicklung datenbasierter Bildungsanwendungen.


## Für wen ist diese Dokumentation?

Die Dokumentation richtet sich an alle, die mit der Lehrplan-Ontologie arbeiten, sie verstehen oder weiterentwickeln möchten. Je nach Hintergrund empfehlen sich unterschiedliche Einstiege:

| Sie sind …                                                                 | Empfohlener Einstieg                                                                                                                             |
|----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| neu im Thema Ontologien                                                    | [Einführung in Ontologien](ontology.md) → [Konzeptuelle Grundlagen](introduction.md)                                                                 |
| Bildungsadministration, Fachredaktion oder Lehrplanexpertin bzw. -experte | [Konzeptuelle Grundlagen](introduction.md) → [Ontologie-Modell](structure.md)                                                                    |
| Entwicklerin oder Entwickler, die Lehrplandaten integrieren möchten        | [Ontologie-Modell](structure.md) → [Patterns](patterns.md) → [Verwendung](usage.md)                                                  |
| Forschende oder Datenanalystin bzw. -analyst                               | [Patterns](patterns.md) → [SPARQL-Abfragen](sparql.md)                                                                               |


## Aufbau der Dokumentation

<div class="grid cards" markdown>

-   :material-book-open-variant:{ .lg .middle } **Einführung in Ontologien**

    ---

    Begriff und Nutzen von Ontologien, Abgrenzung zu Datenbanken und Ansätzen auf Basis großer Sprachmodelle, die Sprachen RDF (Resource Description Framework) und OWL (Web Ontology Language) sowie Werkzeuge und Lesestoff.

    [:octicons-arrow-right-24: Einführung in Ontologien](ontology.md)

-   :material-lightbulb-on-outline:{ .lg .middle } **Konzeptuelle Grundlagen**

    ---

    Ausgangslage, Ziele und Anwendungsszenarien, Umfang und zentrale Begriffe, die Wahl der Basic Formal Ontology (BFO) und die Kompetenzfragen an die Ontologie.

    [:octicons-arrow-right-24: Konzeptuelle Grundlagen](introduction.md)

-   :material-graph-outline:{ .lg .middle } **Ontologie-Modell**

    ---

    Schichten und Designprinzip, gemeinsamer Kern mit länderspezifischen Konkretisierungen, nachgenutzte Vokabulare, Klassen und Properties sowie die Integration der Bildungsstandards der Kultusministerkonferenz (KMK).

    [:octicons-arrow-right-24: Ontologie-Modell](structure.md)

-   :material-puzzle-outline:{ .lg .middle } **Patterns**

    ---

    Vierzehn Modellierungsmuster für Lehrpläne und ihre Elemente, jeweils mit Diagramm, Erläuterung und Beispieldaten.

    [:octicons-arrow-right-24: Patterns](patterns.md)

-   :material-database-search-outline:{ .lg .middle } **SPARQL-Abfragen**

    ---

    Beispielabfragen zu Lehrplänen, Fächern, Schularten, Inhalten und Struktur sowie zu den Kompetenzfragen, jeweils mit direktem Link zum SPARQL-Endpunkt (SPARQL: SPARQL Protocol and RDF Query Language).

    [:octicons-arrow-right-24: SPARQL-Abfragen](sparql.md)

-   :material-tools:{ .lg .middle } **Verwendung**

    ---

    Release-Artefakte und Versionen, Zugriff aus Programmen, Einbindung in eigene Ontologien, eigene Lehrplandaten, Schlussfolgern und Validierung.

    [:octicons-arrow-right-24: Verwendung](usage.md)

-   :material-hub-outline:{ .lg .middle } **Knowledge Graph**

    ---

    Die Lehrplandaten im SPARQL-Endpunkt: Datenbestand je Land, Herkunft der Daten, Besonderheiten und Einschränkungen.

    [:octicons-arrow-right-24: Knowledge Graph](knowledge-graph.md)

-   :material-scale-balance:{ .lg .middle } **Governance und Weiterentwicklung**

    ---

    Verantwortung, Vergabe der Identifikatoren, Versionierung, Zurückziehen von Begriffen, Modellierungsregeln und Mitwirken.

    [:octicons-arrow-right-24: Governance](governance.md)

-   :material-book-alphabet:{ .lg .middle } **Glossar**

    ---

    Abkürzungen der Länder und Abschlüsse sowie zentrale Begriffe wie Lehrplan, curriculares Element, Leitperspektive, Niveaustufe und Bildungsgangniveau.

    [:octicons-arrow-right-24: Glossar](glossar.md)

-   :material-account-group-outline:{ .lg .middle } **Über uns**

    ---

    Die Menschen und Einrichtungen hinter der Lehrplan-Ontologie, ihre Anfänge, Dank und Kontakt.

    [:octicons-arrow-right-24: Über uns](about.md)

</div>


## Metadaten der Ontologie

|                     |                                                                                                                       |
|---------------------|-----------------------------------------------------------------------------------------------------------------------|
| Titel               | **Lehrplan-Ontologie** (engl. *Curriculum Ontology*)                                                                  |
| Abkürzung / Präfix  | **LP** / `lp:`                                                                                                        |
| Namespace           | [https://w3id.org/lehrplan/ontology/](https://w3id.org/lehrplan/ontology/)                                            |
| Sprache             | [OWL 2](https://www.w3.org/TR/owl2-overview/)                                                                         |
| Aktuelle Version    | 1.0.0rc6                                                                                                              |
| Lizenz              | [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)                                                       |
| Repository          | [https://github.com/FWU-DE/lehrplan-ontologie](https://github.com/FWU-DE/lehrplan-ontologie)                          |
| Ersteller           | Steffen Rörtgen, Jörg Waitelonis, Almut Steinlein, Cindy Bloes, Johann Bergh, Laura Junghanns                          |
| Zitiervorschlag     | Lehrplan Ontology. Version 1.0.0rc6, https://w3id.org/lehrplan/ontology                                               |

Verwandte Ontologien und Vokabulare:

- [Schulfach-Ontologie](https://github.com/FWU-DE/schulfach-ontologie) – Schulfächer aller 16 Länder
- [Schulart-Ontologie](https://github.com/FWU-DE/schulart-ontologie) – Schularten aller 16 Länder
- [KIM-Vokabulare](https://github.com/dini-ag-kim/kmk-vocabs) – bundesweite Referenzvokabulare der Arbeitsgruppe KIM der Deutschen Initiative für Netzwerkinformation (DINI)


## Kontakt

Die Lehrplan-Ontologie wird im Projekt [MEM (Metadata for Educational Media)](https://mem.schule) des [FWU Institut für Film und Bild in Wissenschaft und Unterricht](https://fwu.de) entwickelt. Fragen und Rückmeldungen richten Sie bitte an [redaktion@mem.schule](mailto:redaktion@mem.schule). Fehler und Änderungswünsche können Sie auch als [Issue im Repository](https://github.com/FWU-DE/lehrplan-ontologie/issues) melden.
