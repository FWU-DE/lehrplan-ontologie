# Conceptual Foundations

This chapter describes the conceptual foundations of the Curriculum Ontology (Lehrplan-Ontologie): the initial situation from which it emerged, its objectives and application scenarios, its subject matter and scope, the central terms, the approach taken in its development including the choice of the top-level ontology, and the questions it is intended to answer. The Curriculum Ontology is being developed in the project [MEM (Metadata for Educational Media)](https://mem.schule/) of the [FWU Institut für Film und Bild in Wissenschaft und Unterricht](https://fwu.de/), the media institute of the federal states.


## Initial situation

The German education system is organized federally. Designing curricula is the responsibility of the 16 federal states, each of which develops its own subject structures, terms and school-type-specific requirements. Accordingly, the curricula are diverse: they differ in structure, designations, scope and didactic orientation.

This heterogeneity makes cross-state analyses and comparisons considerably more difficult. In addition, the degree of digitization varies greatly: while some states provide their curricula as structured digital data, in many cases they are available only as documents in PDF (Portable Document Format). Currently, only about half of the states have systematically digitized curriculum data. For the remaining states, the content has to be extracted manually, interpreted and converted into digital structures.

The initial situation is thus characterized by great diversity of content, little technical standardization and, in part, a lack of machine readability.


## Objectives and applications

The objective of the Curriculum Ontology is to represent the curricula of all federal states in a uniform, machine-processable structure. The formal modeling of the central curricular elements creates a shared conceptual framework that systematically captures and at the same time preserves the differences between the states: different designations are mapped to shared higher-level terms without losing the particularities of the individual curricula. For example, a competence that is named or structured differently in two states can nevertheless be captured and compared unambiguously.

Curriculum data thereby become interoperable, comparable and reusable. This enables, among others, the following applications:

- digital tools for teaching and school administration,
- linking curricula with learning materials and educational media,
- data-based analyses and cross-state overviews of curricular requirements,
- recommender systems as well as search and comparison tools for teachers.

In the long term, the Curriculum Ontology is intended to serve as an infrastructure on which such educational services can build.

### Application scenarios

The starting point is the project context of MEM: the project extends the joint educational media infrastructure of the federal states, [SODIX](https://www.sodix.de/), which holds teaching materials centrally and provides them via interfaces to the media libraries of the states. The educational media are described there with metadata; MEM supplements these descriptions with references to the competences and content of the curricula. This results in, among others, the following scenarios:

**Indexing educational media**: An editorial team or a media provider assigns a teaching material to the competency specifications and learning content it covers, for example a specific competence expectation (*Kompetenzerwartung*) in the Bavarian *LehrplanPLUS* (the Bavarian curriculum). Since the curriculum elements are uniquely identified, this assignment is precise and machine-processable.

**Curriculum-based search**: A teacher searches for material on a competence from the curriculum of their state. Instead of a long list of results filtered only by keywords, the teacher receives hits that are assigned to this competence. Via the shared reference points of the ontology, i.e. subject, class level, requirement level and the cross-state element types, suitable materials that were indexed on the basis of the curricula of other states can, in the future, also be found.

**Cross-state analysis**: Education administrations or researchers compare curricula of different states, for example which competence areas a subject comprises at a particular class level or how requirements differ between educational tracks. For this purpose, the curriculum data can be queried via a [SPARQL endpoint](https://mem.bmi.fwu.de/sparql) in the query language SPARQL (SPARQL Protocol and RDF Query Language; RDF: Resource Description Framework); examples are shown in the chapter [SPARQL queries](sparql.en.md).

**Integration into third-party systems**: Learning management systems, education portals or lesson-planning tools can retrieve the curriculum data via interfaces and display or evaluate curriculum references without having to capture the curricula themselves.


## Subject matter and scope

### Curricula covered

The Curriculum Ontology serves the structured knowledge representation of curricula in the broader sense for general-education schools at primary and secondary level. These include *Kerncurricula* (core curricula), *Rahmenpläne* and *Rahmenlehrpläne* (framework curricula), *Bildungspläne* (education plans), *Fachlehrpläne* (subject curricula), *Curricula* and *Bildungs- und Erziehungspläne* (education and upbringing plans). In addition, the cross-state educational standards of the [Standing Conference of the Ministers of Education and Cultural Affairs (Kultusministerkonferenz, KMK)](https://www.kmk.org/) are represented, which serve as a shared frame of reference for the curricula of the states (see [Integration of the educational standards](structure.en.md#integration-of-the-educational-standards)).

### Content components

The ontology represents both the subject-related and the structural elements of the curricula:

- the **structure** of the curricula into sections and subject-related areas such as competence areas, learning areas or topic areas,
- **competency specifications**, i.e. the competence expectations and standards formulated in the curriculum,
- **learning content** through which competences are acquired,
- **supplementary elements** such as didactic notes, references to other elements as well as cross-cutting educational objectives and guiding perspectives,
- the **school context** in which these elements apply: federal state, school type, school subject, class level, educational track and requirement level.

How these components are modeled is described in the chapter [Ontology model](structure.en.md).

### Nationwide and state-specific structures

The Curriculum Ontology represents both cross-state structures and the particularities of the individual federal states. It thus enables both nationwide analyses and detailed comparisons and evaluations that take into account the respective regulations of a state.

### Delimitation

Vocational education and special-needs education are currently not within the scope of the Curriculum Ontology. An exception is the curriculum data from Saxony, which also include curricula of vocational schools. Furthermore, the ontology itself does not create links to educational media or learning materials; it does, however, form the basis on which applications can create such links.


## Central terms

The Curriculum Ontology uses some terms in a precise meaning that may differ from general usage. Fundamental here is the distinction between a thing and its description: a curriculum does not contain competences but describes them. The following explanations provide an overview; the formal definitions are given in the chapter [Ontology model](structure.en.md).

**Curriculum** (*Lehrplan*): A systematic compilation of curricular elements that specifies bindingly which competences and content students are to acquire in a subject, a class level, a school type or an educational track of a federal state. Depending on the state, a curriculum is called, for example, *Bildungsplan*, *Kerncurriculum*, *LehrplanPLUS* or *Rahmenlehrplan*.

**Educational standard** (*Bildungsstandard*): A cross-state specification of the KMK that defines which competences learners are to have acquired by a particular school-leaving qualification. Educational standards serve the states as the basis for their curricula.

**Curricular element** (*Curriculares Element*): A component of a curriculum or educational standard, for example a chapter, a competence area, an individual competence expectation or a learning content. In the ontology, the German labels of the cross-state kinds of curricular elements carry the prefix *CE-* (CE: *Curriculares Element*, curricular element), e.g. *CE-Bereich* (*area*) or *CE-Kompetenzspezifikation* (*competency specification*).

**Function** (*Funktion*): The purpose that a curricular element fulfills in the curriculum, for example structuring into areas, describing a competence or a didactic note. Via their function, the differently named elements of the states are assigned to the shared *CE-* kinds: a *Lernbereich* (learning area) in Bavaria and a *Kompetenzbereich* (competence area) in Hamburg fulfill the same function.

**Competence and competency specification** (*Kompetenz* and *Kompetenzspezifikation*): A competence is the ability of a person to apply knowledge and skills to solve problems. It is a quality of the learning person. A competency specification, by contrast, is the description of such a competence in the curriculum, typically a sentence such as "Die Schülerinnen und Schüler …" ("Students …"). Curriculum data contain the descriptions of competences, i.e. competency specifications, not the competences themselves.

**Learning content** (*Lerninhalt*): A concrete topic or a concrete subject matter through which competences are acquired, and thus the content-related basis of teaching.

**Educational track and educational track specification** (*Bildungsgang* and *Bildungsgangspezifikation*): An educational track is the school career that a person actually goes through, for example up to the *Mittlerer Schulabschluss* (MSA, intermediate school-leaving certificate). The educational track specification describes this career, i.e. its duration, its requirements and the intended school-leaving qualification. An educational track is not tied to a school type: the *Gymnasium* track (academic track), for example, can also be completed at a *Gesamtschule* (comprehensive school).

**School type** (*Schulart*): A form of school such as *Grundschule* (primary school), *Gymnasium* (academic secondary school) or *Gemeinschaftsschule* (community school), characterized by its organization, pedagogical orientation and the qualifications that can be obtained. The school types are recorded per state with their official designations.

**School-leaving qualification and school-leaving qualification specification** (*Schulabschluss* and *Schulabschlussspezifikation*): A school-leaving qualification is the status that a person acquires by successfully completing an educational track. The school-leaving qualification specification describes the qualification and the requirements for awarding it, e.g. the *Mittlerer Schulabschluss* or the *Allgemeine Hochschulreife* (general higher-education entrance qualification).

**Level and educational track level** (*Niveau* and *Bildungsgangniveau*): A level describes the standard of demand at which content and competences are formulated in a curriculum. The educational track level is the level within an educational track; across states, the ontology distinguishes *Grundschule*, *Hauptschule* and *Realschule* level as well as *Gymnasium* level for lower and upper secondary level (Sek I and II). The designations of the states, for example *Mittelschulniveau* (*Mittelschule* level) in Bavaria or *Erhöhte Anforderungen* (increased requirements) in Hamburg, are assigned to these levels.


## Approach

The Curriculum Ontology was developed in an iterative, closely supervised process. The basis was a systematic review and comparative analysis of the curricula of all federal states by domain experts. In several iterations, content components were identified that occur in all curricula, even if they are named or structured differently. These commonalities formed the starting point for the cross-state terms, which were subsequently matched against and supplemented with the particularities of the states.

A central part of the approach is the continuous collaboration with a working group of curriculum experts from the federal states (Fachgruppe der Länder). The working group contributes the subject-related perspectives of the states and supports the clarification of content-related questions and the classification of curricular structures. In the early project phases, exchanges took place at short intervals in order to agree on fundamental requirements and differences at an early stage. In the further course, too, the working group remains an essential advisory body for feedback, discussion and subject-matter validation.

## Choice of the top-level ontology

The Curriculum Ontology builds on the [Basic Formal Ontology (BFO)](https://basic-formal-ontology.org/) as its top-level ontology. A top-level ontology specifies the most general categories, such as object, process or quality, on which the domain-specific terms build (see [Levels of ontologies](ontology.en.md#levels-of-ontologies)). Several reasons speak in favor of choosing BFO:

- **Standardization**: BFO is standardized as the international standard [ISO/IEC 21838-2](https://www.iso.org/standard/74572.html) of the [International Organization for Standardization (ISO)](https://www.iso.org/) and the [International Electrotechnical Commission (IEC)](https://www.iec.ch/) and is maintained in a stable manner.
- **Adoption**: BFO forms the shared basis of numerous ontologies, especially in the environment of the [OBO Foundry](https://obofoundry.org/) (OBO: Open Biological and Biomedical Ontologies), a community that develops ontologies according to shared principles. The Curriculum Ontology is thus compatible with these ontologies and can directly reuse established building blocks such as the [Relation Ontology (RO)](https://oborel.github.io/) and the [Information Artifact Ontology (IAO)](https://github.com/information-artifact-ontology/IAO).
- **Leanness**: BFO comprises only about 35 very general classes and contains no domain-specific content. It thus provides a clear framework without restricting the modeling of the domain.
- **Clear fundamental distinctions**: BFO consistently distinguishes between continuant entities (e.g. persons, qualities, information) and processes. This distinction is central for curricula: a curriculum is an information content entity, teaching is a process and a competence is a quality of a person. The ontology keeps these levels cleanly apart (see [Basic ontological understanding](structure.en.md#basic-ontological-understanding)).


## Competency questions

Competency questions (CQ) describe which questions an ontology should be able to answer. They serve as requirements for the modeling and as a touchstone for whether the model fulfills its purpose. For the Curriculum Ontology, the following competency questions, among others, were formulated. The queries in the chapter [SPARQL queries](sparql.en.md) refer to these questions with the numbers CQ 1 to CQ 19.

**Structure and links**

- <a id="cq-1"></a>**CQ 1:** What link exists between element X and element Y? ([to the query](sparql.en.md#abfrage-cq-1))
- <a id="cq-2"></a>**CQ 2:** Which area from Rhineland-Palatinate corresponds to an element from Bavaria? ([to the query](sparql.en.md#abfrage-cq-2))
- <a id="cq-3"></a>**CQ 3:** Through which learning content can a competence be acquired? ([to the query](sparql.en.md#abfrage-cq-3))
- <a id="cq-4"></a>**CQ 4:** Which competences are prerequisites for acquiring competence X? ([to the query](sparql.en.md#abfrage-cq-4))

**Comparisons between school types, educational tracks and federal states**

- <a id="cq-5"></a>**CQ 5:** What differences exist in the competency specifications for the subject mathematics at class level 7 between the school types in Saxony? ([to the query](sparql.en.md#abfrage-cq-5))
- <a id="cq-6"></a>**CQ 6:** How does progression in the subject mathematics proceed in the different school types in Saxony? ([to the query](sparql.en.md#abfrage-cq-6))
- <a id="cq-7"></a>**CQ 7:** Which competences are to be acquired in the advanced course in physics in Bavaria in addition to the basic course? ([to the query](sparql.en.md#abfrage-cq-7))
- <a id="cq-8"></a>**CQ 8:** Which competency specifications apply in Saxony in the subject biology at class level 8, distinguished by educational track? ([to the query](sparql.en.md#abfrage-cq-8))
- <a id="cq-9"></a>**CQ 9:** Which competency specifications in the subject English for class levels 1 to 9 occur in Bavaria but not in Brandenburg? ([to the query](sparql.en.md#abfrage-cq-9))
- <a id="cq-10"></a>**CQ 10:** Which competences are acquired in the subject mathematics at primary level, and how do they develop further at lower secondary level (Sek I) depending on the educational track? ([to the query](sparql.en.md#abfrage-cq-10))

**Content of a subject or area**

- <a id="cq-11"></a>**CQ 11:** Which competence areas does the subject mathematics comprise in Rhineland-Palatinate? ([to the query](sparql.en.md#abfrage-cq-11))
- <a id="cq-12"></a>**CQ 12:** Which competency specifications belong in Berlin to the competence area "Mathematisch modellieren" (mathematical modeling) at class level 7? ([to the query](sparql.en.md#abfrage-cq-12))
- <a id="cq-13"></a>**CQ 13:** Which learning content is provided for in the subject biology at class level 5 in Bavaria? ([to the query](sparql.en.md#abfrage-cq-13))
- <a id="cq-14"></a>**CQ 14:** Which competence areas does the subject French comprise in Rhineland-Palatinate from primary level through lower secondary level (Sek I) to upper secondary level (Sek II), structured by class level? ([to the query](sparql.en.md#abfrage-cq-14))
- <a id="cq-15"></a>**CQ 15:** Which competency specifications belong to the competence area "Lesen" (reading) in the subject German at primary level? ([to the query](sparql.en.md#abfrage-cq-15))
- <a id="cq-16"></a>**CQ 16:** In which subjects in Saxony is the cross-curricular educational objective "Bildung für nachhaltige Entwicklung" (education for sustainable development) taken up? ([to the query](sparql.en.md#abfrage-cq-16))

**Levels**

- <a id="cq-17"></a>**CQ 17:** How are the niveau stages (*Niveaustufen*) in Berlin and Brandenburg related to the class levels? ([to the query](sparql.en.md#abfrage-cq-17))
- <a id="cq-18"></a>**CQ 18:** Which class levels does niveau stage C comprise at the *Gymnasium* in Berlin? ([to the query](sparql.en.md#abfrage-cq-18))
- <a id="cq-19"></a>**CQ 19:** How can learning content be filtered by the language levels of the Common European Framework of Reference for Languages (CEFR; German: GER)? ([to the query](sparql.en.md#abfrage-cq-19))

Some of these questions can already be answered with the existing curriculum data; others describe requirements for the further development of the ontology and for the capture of the data.


## Outlook on the following chapters

This chapter has set out the initial situation from which the Curriculum Ontology emerged, which objectives it pursues, what it represents and which terms underlie it. The following chapters describe how these foundations are implemented:

- The chapter [Ontology model](structure.en.md) explains the formal structure of the ontology: the layers from the educational context to the relations, the interplay of the shared core and state-specific terms, and the reused ontologies.
- The chapter [Patterns](patterns.en.md) uses concrete modeling patterns to show how curriculum elements are represented in the data.
- The chapter [SPARQL queries](sparql.en.md) shows how the curriculum data can be queried and how competency questions such as those above can be answered.
- The chapter [Usage](usage.en.md) describes the available release files, access to the data and their validation.
