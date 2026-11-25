# Knowledge graph

The Curriculum Ontology (Lehrplan-Ontologie, LP) describes *how* curricula are structured. The curricula themselves are available as curriculum data in a knowledge graph that is built according to the classes and properties of the ontology. This chapter describes which data the graph contains, where they come from and which particularities must be observed when using them.


## Access

The knowledge graph can be queried publicly via the [SPARQL endpoint](https://mem.bmi.fwu.de/sparql) (SPARQL: SPARQL Protocol and RDF Query Language; RDF: Resource Description Framework) of the MEM project (Metadata for Educational Media). The data are stored in named graphs, one per federal state or data source. Each graph is divided into the curriculum data (`…/data`) and the statements derived from them (`…/inferences`); the graph without a suffix contains both. How the graphs are structured and which statements are derived is described in the section [Structure of the endpoint](sparql.en.md#structure-of-the-endpoint); example queries are given in the chapter [SPARQL queries](sparql.en.md).


## Data holdings

The knowledge graph currently contains the curricula of four federal states as well as the educational standards of the Standing Conference of the Ministers of Education and Cultural Affairs (Kultusministerkonferenz, KMK):

| State or source                 | Graph                                   | Curricula | Curricular elements  | Triples (`…/data`) |
|---------------------------------|-----------------------------------------|----------:|---------------------:|------------------:|
| Bavaria (BY)                    | `https://w3id.org/lehrplan/by`          |     1,707 |               99,390 |         1,310,435 |
| Saxony (SN)                     | `https://w3id.org/lehrplan/sn`          |       532 |              223,975 |         2,486,657 |
| Rhineland-Palatinate (RP)       | `https://w3id.org/lehrplan/rp`          |       229 |               25,409 |           328,355 |
| Berlin and Brandenburg (BE/BB)  | `https://w3id.org/lehrplan/graph/be`    |        46 |               12,164 |           304,005 |
| KMK educational standards       | `https://w3id.org/lehrplan/graph/bista` |        46¹ |                2,036 |            46,522 |

¹ Partial documents of the educational standards (instances of *educational standard (KMK)* (*Bildungsstandard (KMK)*, `LP_0000571`)) for the subjects biology, chemistry, German, English, French, mathematics and physics.

Figures as of November 25, 2026, determined via the SPARQL endpoint. All instances of *curricular element* (*Curriculares Element*, `LP_0000261`) are counted as curricular elements, including the derived typings. The figures change when curricula are updated or new data are added; the current figures can be determined with the query [How many curricula are there in BY, SN, RP and BE/BB?](sparql.en.md#how-many-curricula-exist-in-by-sn-rp-and-bebb).


## Origin of the data

The curriculum data are based on the curricula that the federal states publish on their own portals. They were transformed into the model of the Curriculum Ontology; the publication of the federal state remains authoritative for the wording and the binding nature of a curriculum.

| State or source       | Publication of the curricula                                                                                     | IRI namespace of the data                    |
|-----------------------|------------------------------------------------------------------------------------------------------------------|----------------------------------------------|
| Bavaria               | [LehrplanPLUS](https://www.lehrplanplus.bayern.de/)                                                              | `https://w3id.org/lehrplan/resource/by/`     |
| Saxony                | [Curriculum database in the Saxony school portal (Lehrplandatenbank im Schulportal Sachsen)](https://www.schulportal.sachsen.de/lplandb/) | `https://w3id.org/lehrplan/resource/sn/`     |
| Rhineland-Palatinate  | [Curricula of Rhineland-Palatinate (Lehrpläne Rheinland-Pfalz)](https://lehrplaene.bildung-rp.de/)              | `https://w3id.org/lehrplan/resource/rp/`     |
| Berlin and Brandenburg | [Rahmenlehrplan online](https://bildungsserver.berlin-brandenburg.de/rlp-online/)                               | `https://w3id.org/lehrplan/data/be/`         |
| KMK educational standards | [machine-readable educational standards](https://iqb-vocabs.github.io/vokabulare/bildungsstandards.html) of the Institute for Educational Quality Improvement (Institut zur Qualitätsentwicklung im Bildungswesen, IQB) | `https://w3id.org/iqb/` |

The Internationalized Resource Identifiers (IRIs) of the curricula and elements belong to the data, not to the ontology. The classes, properties and fixed individuals of the ontology, by contrast, have identifiers of the form `https://w3id.org/lehrplan/ontology/LP_…` (see [Governance and further development](governance.en.md#identifiers)).


## Particularities of the federal states

All data follow the same core model but reflect the structure of the respective curricula. For queries across several federal states, the generic classes (*area* (*CE-Bereich*, `LP_0000349`), *competency specification* (*CE-Kompetenzspezifikation*, `LP_0000263`), etc.) and the properties of the core model are therefore the appropriate starting point (see [Ontology model](structure.en.md)).

**Bavaria.** A *LehrplanPLUS (BY)* (Bavarian curriculum) is divided into *Fachlehrpläne (BY)* (subject curricula, Bavaria). School subject, class level and school type are specified on the subject curriculum, not on the curriculum itself. Queries by subject or class level in Bavaria therefore start at the subject curriculum (see [CQ 13](sparql.en.md#abfrage-cq-13), CQ: competency question).

**Saxony.** The Saxon curricula are divided into *Lernbereiche (SN)* (learning areas, Saxony). Learning objectives and learning contents are combined in a single element *Lernziel und Lerninhalt (SN)* (learning objective and learning content, Saxony); these elements are therefore both *competency specification* and *learning content* (*CE-Lerninhalt*, `LP_0000332`). Remarks on the learning objectives are represented as *note* (*CE-Hinweis*, `LP_0000852`), references to cross-curricular educational goals as *reference* (*CE-Verweis*, `LP_0030065`).

**Rhineland-Palatinate.** The curricula are structured by *Kompetenzbereiche (RP)* (competence areas, Rhineland-Palatinate), to which competency specifications are assigned.

**Berlin and Brandenburg.** The joint *Rahmenlehrpläne* (framework curricula) are stored in one graph. Competency specifications are assigned to niveau stages A to H (Niveaustufen) instead of class levels; the assignment to class levels results from the educational track levels (see [Pattern 11](patterns.en.md#pattern-11-niveau-stages-bebb) and the [Glossary](glossar.en.md#niveau-stage-and-educational-track-level-niveaustufe-und-bildungsgangniveau)).

**KMK educational standards.** The educational standards are adopted with the IRIs of the IQB and typed via the classes of the Curriculum Ontology, for example as *Kompetenzbereich (Bistas)* (competence area, educational standards) or *Verbindlicher inhaltlicher Aspekt (Bistas)* (mandatory content aspect, educational standards) (see [Integration of the educational standards](structure.en.md#integration-of-the-educational-standards)).


## Limitations

- So far, the knowledge graph contains the curricula of four of the sixteen federal states. The ontology itself covers the terminology of all federal states, so that further states can be added without changing the model.
- Information on the validity scope, the publication date and the address of the original document is provided for in the model but not yet included in the current data.
- The curriculum data represent the published curricula in structured form but do not replace them. In case of discrepancies, the version published by the federal state applies.


## Outlook on the following chapters

- The chapter [Governance and further development](governance.en.md) describes how the ontology is maintained, versioned and further developed and how federal states and experts can participate.
- The [Glossary](glossar.en.md) explains the most important terms and abbreviations.
