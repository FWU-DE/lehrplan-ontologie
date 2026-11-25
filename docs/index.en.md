# Curriculum Ontology

***An ontology for school curricula in Germany***

The **Curriculum Ontology** (Lehrplan-Ontologie, LP) is a **structured** and **machine-readable** **knowledge representation** of **school curricula** at the primary and secondary levels. It models both the content-related and the structural components of curricular documents – including **competences**, **learning contents** and **educational standards** as well as their embedding in **subjects**, **class levels** and **school types** – within a uniform semantic framework.

Against the background of the federal diversity of the German education system, the ontology harmonizes different terminologies and curriculum structures without losing state-specific characteristics. By transforming heterogeneous curriculum data into an interoperable knowledge base, it lays the foundation for analysis, comparability and the development of data-driven educational applications.


## Who is this documentation for?

The documentation is intended for everyone who wants to work with, understand or further develop the Curriculum Ontology. Depending on the background, different entry points are recommended:

| You are …                                                                  | Recommended entry point                                                                                                                          |
|----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| new to ontologies                                                          | [Introduction to ontologies](ontology.en.md) → [Conceptual foundations](introduction.en.md)                                                      |
| working in education administration, as a subject editor or as a curriculum expert | [Conceptual foundations](introduction.en.md) → [Ontology model](structure.en.md)                                                        |
| a developer who wants to integrate curriculum data                         | [Ontology model](structure.en.md) → [Examples / patterns](patterns.en.md) → [Usage](usage.en.md)                                                 |
| a researcher or data analyst                                               | [Examples / patterns](patterns.en.md) → [SPARQL queries](sparql.en.md)                                                                           |


## Structure of the documentation

### 1. Introduction to ontologies

[Introduction to ontologies](ontology.en.md): the concept and benefits of ontologies and how they differ from databases, metadata schemas and approaches based on large language models (LLMs). Also: Resource Description Framework (RDF), RDF Schema (RDFS) and Web Ontology Language (OWL), ontology levels, tools and further reading.

### 2. Conceptual foundations

[Conceptual foundations](introduction.en.md): domain understanding and scope.

- [Initial situation](introduction.en.md#initial-situation) and [goals](introduction.en.md#objectives-and-applications)
- [Application scenarios](introduction.en.md#application-scenarios): indexing of educational media, curriculum-based search, cross-state analysis
- [Subject and scope](introduction.en.md#subject-matter-and-scope): which curricula and contents are covered and what is not included
- [Key terms](introduction.en.md#central-terms): curriculum, curricular element, competence and competency specification, educational track, niveau, and others
- [Approach](introduction.en.md#approach): comparative analysis of the curricula, collaboration with the working group of the federal states (Fachgruppe der Länder) and with ontology experts
- [Choice of the top-level ontology](introduction.en.md#choice-of-the-top-level-ontology): reasons for the Basic Formal Ontology (BFO)
- [Competency questions](introduction.en.md#competency-questions): which questions the ontology should be able to answer

### 3. Ontology model

[Ontology model](structure.en.md): how the knowledge is structured.

- [Basic ontological understanding](structure.en.md#basic-ontological-understanding): information entities and the real-world entities they describe
- [The five layers](structure.en.md#structure-of-the-curriculum-ontology): educational context, curricular elements, temporal classification, niveaus, relations
- [Design principle](structure.en.md#modeling-design-principle): shared core ontology with state-specific specializations
- [Reused ontologies and vocabularies](structure.en.md#reused-ontologiesvocabularies): BFO, Relation Ontology (RO), Information Artifact Ontology (IAO), school subject and school type ontologies, Kompetenzzentrum Interoperable Metadaten (KIM, Competence Center for Interoperable Metadata), Quantities, Units, Dimensions and Types (QUDT)
- [Classes, individuals and relations](structure.en.md#overview-of-classes-relations-hierarchies)
- [Mapping of the terminologies of the federal states](structure.en.md#mapping-the-different-terminologies-of-the-states) and [integration of the KMK educational standards](structure.en.md#integration-of-the-educational-standards) (KMK: Standing Conference of the Ministers of Education and Cultural Affairs, Kultusministerkonferenz)

### 4. Patterns and SPARQL queries

- [Patterns](patterns.en.md): concrete modeling of curriculum elements, each with a diagram, an explanation and RDF data
- [SPARQL queries](sparql.en.md) (SPARQL: SPARQL Protocol and RDF Query Language): example queries on curricula, subjects, school types, contents and structure as well as queries for the [competency questions](introduction.en.md#competency-questions) – each with a direct link to the endpoint

### 5. Usage

[Usage](usage.en.md): how to work with the ontology and the curriculum data.

- [Release artifacts](usage.en.md#release-artifacts) and [versions](usage.en.md#versions), including the changes in version 1.0.0rc6
- [Access](usage.en.md#access): resolution of the Internationalized Resource Identifiers (IRIs), [SPARQL endpoint](https://mem.bmi.fwu.de/sparql) and examples of programmatic use
- [Integration into your own ontologies](usage.en.md#integration-into-custom-ontologies) and [creating your own curriculum data](usage.en.md#creating-custom-curriculum-data)
- [Reasoning](usage.en.md#reasoning) and [validation](usage.en.md#validation) with SHACL shapes (SHACL: Shapes Constraint Language)
- [Technical reference](usage.en.md#technical-reference), [license and citation](usage.en.md#license-and-citation) and [contributing](usage.en.md#contributing)
- Application examples (comparison of curricula between federal states, linking with educational media, curriculum analysis, recommender systems) – *in preparation*

### 6. Knowledge graph

[Knowledge graph](knowledge-graph.en.md): the curriculum data in the SPARQL endpoint.

- [Data inventory](knowledge-graph.en.md#data-holdings): curricula and curricular elements of Bavaria, Saxony, Rhineland-Palatinate, Berlin/Brandenburg and the KMK educational standards
- [Origin of the data](knowledge-graph.en.md#origin-of-the-data) and [particularities of the federal states](knowledge-graph.en.md#particularities-of-the-federal-states)
- [Limitations](knowledge-graph.en.md#limitations) of the current data inventory

### 7. Governance and further development

[Governance and further development](governance.en.md): rules for the maintenance and further development of the ontology.

- [Responsibility](governance.en.md#responsibility) and [development environment](governance.en.md#development-environment)
- [Identifiers](governance.en.md#identifiers): structure and assignment of the `LP_` numbers
- [Versioning](governance.en.md#versioning) and [deprecation of terms](governance.en.md#deprecating-terms)
- [Modeling rules](governance.en.md#modeling-rules) and [contributing](governance.en.md#contributing), also for the federal states

### 8. Glossary

[Glossary](glossar.en.md): abbreviations of the federal states and of the Berlin and Brandenburg school-leaving qualifications as well as key terms such as curriculum, curricular element, guiding perspective, niveau stage and educational track level.

### 9. About us

[About us](about.en.md): the people and institutions behind the Curriculum Ontology, acknowledgments and contact.


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
