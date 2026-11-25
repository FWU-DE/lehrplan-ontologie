---
hide:
  - navigation
  - toc
---

<div class="lp-hero" markdown>

![](logo.png){ .lp-hero-logo }

# Curriculum Ontology

<p class="lp-tagline">An ontology for school curricula in Germany</p>

The **Curriculum Ontology** (Lehrplan-Ontologie, LP) is a structured and machine-readable knowledge representation of school curricula at the primary and secondary levels. It represents competences, learning contents and educational standards as well as their embedding in subjects, class levels and school types within a uniform semantic framework.

[Get started :material-arrow-right:](ontology.en.md){ .md-button .md-button--primary }
[Ontology model](structure.en.md){ .md-button }
[Patterns](patterns.en.md){ .md-button }
[:material-github: GitHub](https://github.com/FWU-DE/lehrplan-ontologie){ .md-button }

</div>

Against the background of the federal diversity of the German education system, the ontology harmonizes different terminologies and curriculum structures without losing state-specific characteristics. By transforming heterogeneous curriculum data into an interoperable knowledge base, it lays the foundation for analysis, comparability and the development of data-driven educational applications.


## Who is this documentation for?

The documentation is intended for everyone who wants to work with, understand or further develop the Curriculum Ontology. Depending on the background, different entry points are recommended:

| You are …                                                                          | Recommended entry point                                                                         |
|------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| new to ontologies                                                                  | [Introduction to ontologies](ontology.en.md) → [Conceptual foundations](introduction.en.md)     |
| working in education administration, as a subject editor or as a curriculum expert | [Conceptual foundations](introduction.en.md) → [Ontology model](structure.en.md)                |
| a developer who wants to integrate curriculum data                                 | [Ontology model](structure.en.md) → [Patterns](patterns.en.md) → [Usage](usage.en.md)           |
| a researcher or data analyst                                                       | [Patterns](patterns.en.md) → [SPARQL queries](sparql.en.md)                                     |


## Structure of the documentation

<div class="grid cards" markdown>

-   :material-book-open-variant:{ .lg .middle } **Introduction to ontologies**

    ---

    The concept and benefits of ontologies, how they differ from databases and approaches based on large language models, the languages RDF (Resource Description Framework) and OWL (Web Ontology Language), tools and further reading.

    [:octicons-arrow-right-24: Introduction to ontologies](ontology.en.md)

-   :material-lightbulb-on-outline:{ .lg .middle } **Conceptual foundations**

    ---

    Initial situation, goals and application scenarios, scope and key terms, the choice of the Basic Formal Ontology (BFO) and the competency questions for the ontology.

    [:octicons-arrow-right-24: Conceptual foundations](introduction.en.md)

-   :material-graph-outline:{ .lg .middle } **Ontology model**

    ---

    Layers and design principle, a common core with state-specific specializations, reused vocabularies, classes and properties, and the integration of the educational standards of the Standing Conference of the Ministers of Education and Cultural Affairs (Kultusministerkonferenz, KMK).

    [:octicons-arrow-right-24: Ontology model](structure.en.md)

-   :material-puzzle-outline:{ .lg .middle } **Patterns**

    ---

    Fourteen modeling patterns for curricula and their elements, each with a diagram, explanation and example data.

    [:octicons-arrow-right-24: Patterns](patterns.en.md)

-   :material-database-search-outline:{ .lg .middle } **SPARQL queries**

    ---

    Example queries on curricula, subjects, school types, contents and structure as well as on the competency questions, each with a direct link to the SPARQL endpoint (SPARQL: SPARQL Protocol and RDF Query Language).

    [:octicons-arrow-right-24: SPARQL queries](sparql.en.md)

-   :material-tools:{ .lg .middle } **Usage**

    ---

    Release artifacts and versions, programmatic access, integration into other ontologies, creating curriculum data, reasoning and validation.

    [:octicons-arrow-right-24: Usage](usage.en.md)

-   :material-hub-outline:{ .lg .middle } **Knowledge graph**

    ---

    The curriculum data in the SPARQL endpoint: data per federal state, data sources, special features and limitations.

    [:octicons-arrow-right-24: Knowledge graph](knowledge-graph.en.md)

-   :material-scale-balance:{ .lg .middle } **Governance and further development**

    ---

    Responsibilities, assignment of identifiers, versioning, deprecation of terms, modeling rules and contributing.

    [:octicons-arrow-right-24: Governance](governance.en.md)

-   :material-book-alphabet:{ .lg .middle } **Glossary**

    ---

    Abbreviations of the federal states and school-leaving qualifications as well as key terms such as curriculum, curricular element, guiding perspective, niveau stage and educational track level.

    [:octicons-arrow-right-24: Glossary](glossar.en.md)

-   :material-account-group-outline:{ .lg .middle } **About us**

    ---

    The people and institutions behind the Curriculum Ontology, its beginnings, acknowledgments and contact.

    [:octicons-arrow-right-24: About us](about.en.md)

</div>


## Ontology metadata

|                       |                                                                                                                       |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------|
| Title                 | **Lehrplan-Ontologie** (English: *Curriculum Ontology*)                                                               |
| Abbreviation / prefix | **LP** / `lp:`                                                                                                        |
| Namespace             | [https://w3id.org/lehrplan/ontology/](https://w3id.org/lehrplan/ontology/)                                            |
| Language              | [OWL 2](https://www.w3.org/TR/owl2-overview/)                                                                         |
| Current version       | 1.0.0rc6                                                                                                              |
| License               | [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)                                                       |
| Repository            | [https://github.com/FWU-DE/lehrplan-ontologie](https://github.com/FWU-DE/lehrplan-ontologie)                          |
| Creators              | Steffen Rörtgen, Jörg Waitelonis, Almut Steinlein, Cindy Bloes, Johann Bergh, Laura Junghanns                          |
| Suggested citation    | Lehrplan Ontology. Version 1.0.0rc6, https://w3id.org/lehrplan/ontology                                               |

Related ontologies and vocabularies:

- [Schulfach-Ontologie](https://github.com/FWU-DE/schulfach-ontologie) (school subject ontology) – school subjects of all 16 federal states
- [Schulart-Ontologie](https://github.com/FWU-DE/schulart-ontologie) (school type ontology) – school types of all 16 federal states
- [KIM vocabularies](https://github.com/dini-ag-kim/kmk-vocabs) – nationwide reference vocabularies of the KIM working group of the Deutsche Initiative für Netzwerkinformation (DINI, German Initiative for Network Information)


## Contact

The Curriculum Ontology is developed in the project [MEM (Metadata for Educational Media)](https://mem.schule) of the [FWU Institut für Film und Bild in Wissenschaft und Unterricht](https://fwu.de). Please send questions and feedback to [redaktion@mem.schule](mailto:redaktion@mem.schule). Errors and change requests can also be reported as an [issue in the repository](https://github.com/FWU-DE/lehrplan-ontologie/issues).
