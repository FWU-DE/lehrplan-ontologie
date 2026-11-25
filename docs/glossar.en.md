# Glossary

The glossary explains the most important terms and abbreviations of the Curriculum Ontology (Lehrplan-Ontologie, LP) in version **1.0.0rc6**. The explanations summarize the definitions of the ontology; the chapter [Ontology model](structure.en.md) covers them in more detail. Ontology terms are set in *italics* when they refer to a class name. Since the ontology describes German curricula, many entries are German concepts; their German name is given alongside the English term.


## Abbreviations

### Federal states (Länder)

Classes and individuals that apply to only one federal state carry the state's abbreviation in parentheses, e.g. *Lernbereich (SN)* (learning area, Saxony).

| Abbreviation | Federal state          | Abbreviation | Federal state          |
|--------------|------------------------|--------------|------------------------|
| BW           | Baden-Württemberg      | NI           | Niedersachsen          |
| BY           | Bayern                 | NW           | Nordrhein-Westfalen    |
| BE           | Berlin                 | RP           | Rheinland-Pfalz        |
| BB           | Brandenburg            | SL           | Saarland               |
| HB           | Bremen                 | SN           | Sachsen                |
| HH           | Hamburg                | ST           | Sachsen-Anhalt         |
| HE           | Hessen                 | SH           | Schleswig-Holstein     |
| MV           | Mecklenburg-Vorpommern | TH           | Thüringen              |

*BE/BB* denotes the joint framework curricula (*Rahmenlehrpläne*) of Berlin and Brandenburg.

### School-leaving qualifications in Berlin and Brandenburg

The educational track levels of Berlin and Brandenburg are named after the school-leaving qualification they lead to (see [Niveau stage and educational track level](#niveau-stage-and-educational-track-level-niveaustufe-und-bildungsgangniveau)).

| Abbreviation | Qualification                                                                                                                         | Federal state | Levels |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------|---------------|--------|
| BOA          | berufsorientierender Abschluss (career-oriented qualification)                                                                        | Berlin        | A–E    |
| BBR          | Berufsbildungsreife (basic vocational qualification)                                                                                       | Berlin        | A–F    |
| EBBR         | erweiterte Berufsbildungsreife (extended basic vocational qualification)                                                                         | Berlin        | A–G    |
| MSA          | mittlerer Schulabschluss (intermediate school-leaving certificate)                                                                    | Berlin        | A–G    |
| EBR          | erweiterte Berufsbildungsreife (extended basic vocational qualification)                                                                         | Brandenburg   | A–G    |
| FOR          | Fachoberschulreife (entrance qualification for upper vocational school)                                                               | Brandenburg   | A–G    |
| FOR-Q        | Fachoberschulreife mit Berechtigung zum Besuch der gymnasialen Oberstufe (FOR with entitlement to attend the upper secondary level of the *Gymnasium*) | Brandenburg   | A–H    |

In addition, both states have the *Gymnasialniveau Sek I* (*Gymnasium* level, lower secondary) with stages A–H.

### Other abbreviations

| Abbreviation | Meaning                                                                                                          |
|--------------|------------------------------------------------------------------------------------------------------------------|
| CE           | Curricular element (German *Curriculares Element*), prefix of the generic element classes such as *CE-Bereich* (*area*) |
| CQ           | Competency question (German *Kompetenzfrage*) posed to the ontology (see [Competency questions](introduction.en.md#competency-questions)) |
| ESA          | erster Schulabschluss (first school-leaving certificate), qualification reference in the educational standards   |
| GER          | Gemeinsamer Europäischer Referenzrahmen für Sprachen, the [Common European Framework of Reference for Languages](https://www.coe.int/en/web/common-european-framework-reference-languages) (CEFR) |
| IQB          | [Institut zur Qualitätsentwicklung im Bildungswesen](https://www.iqb.hu-berlin.de/) (Institute for Educational Quality Improvement) |
| KIM          | [Kompetenzzentrum Interoperable Metadaten](https://dini.de/ag/kim/) (Competence Center for Interoperable Metadata), working group of the Deutsche Initiative für Netzwerkinformation (DINI, German Initiative for Network Information) |
| KMK          | [Kultusministerkonferenz](https://www.kmk.org/) (Standing Conference of the Ministers of Education and Cultural Affairs) |
| LP           | Lehrplan-Ontologie (Curriculum Ontology); also the prefix of its identifiers (`LP_0000438`)                      |
| Sek I        | Sekundarstufe I (lower secondary level), usually class levels 5 to 10                                            |
| Sek II       | Sekundarstufe II (upper secondary level), the upper stage of the *Gymnasium* (*gymnasiale Oberstufe*)            |


## Terms

### Requirement area (Anforderungsbereich)

One of the three levels by which the KMK classifies tasks and learning objectives according to the degree of independence required: *Anforderungsbereich 1: Reproduktion* (requirement area 1: reproduction), *Anforderungsbereich 2: Reorganisation und Transfer* (requirement area 2: reorganization and transfer) and *Anforderungsbereich 3: Reflexion und Problemlösung* (requirement area 3: reflection and problem solving).

### Educational track (Bildungsgang)

The process in which a person goes through a structured school career, e.g. the *Gymnasium* track. The educational track is a real-world process; the regulations that govern it are represented by the **educational track specification** (*Bildungsgangspezifikation*) as an information entity. The learning process of an individual person is not part of the educational track (see [Pattern 14](patterns.en.md#pattern-14-the-learning-process)).

### Educational track level (Bildungsgangniveau)

A *niveau* (*Niveau*) that describes the level of demand within an educational track. The generic educational track levels are *Grundschulniveau* (primary school level), *Hauptschulniveau* (*Hauptschule* level), *Realschulniveau* (*Realschule* level), *Gymnasialniveau Sek I* (*Gymnasium* level, lower secondary) and *Gymnasialniveau Sek II* (*Gymnasium* level, upper secondary). The levels of the federal states are mapped to them, e.g. *Mittelschulniveau (BY)* (*Mittelschule* level, Bavaria) as *Hauptschulniveau* (see [Pattern 10](patterns.en.md#pattern-10-educational-track-levels-educational-tracks-and-qualifications)).

### Educational standards (Bildungsstandards)

The [educational standards](https://www.kmk.org/themen/qualitaetssicherung-in-schulen/bildungsstandards.html) adopted by the KMK and binding across all federal states specify which competences students should have acquired by a particular school-leaving qualification. They form the common frame of reference for the curricula of the federal states. In the ontology they are instances of the class *educational standard (KMK)* (*Bildungsstandard (KMK)*, `LP_0000571`) (see [Integration of the educational standards](structure.en.md#integration-of-the-educational-standards)).

### Curricular element (Curriculares Element)

An information entity that describes a component of a curriculum or of educational standards. Curricular elements are nested via *has part* (*hat Teil*) and, through their **function**, receive one of the following generic classes:

- *fragment* (*CE-Fragment*, `LP_0001015`): structuring section without its own subject-specific meaning, e.g. a chapter,
- *area* (*CE-Bereich*, `LP_0000349`): subject-specific level of organization such as a competence area, learning area or topic field,
- *competency specification* (*CE-Kompetenzspezifikation*, `LP_0000263`): description of a competence, e.g. "Die Schülerinnen und Schüler …" ("The students …"),
- *learning content* (*CE-Lerninhalt*, `LP_0000332`): concrete topic through which competences are acquired,
- *note* (*CE-Hinweis*, `LP_0000852`): supplementary information of a recommendatory nature, e.g. a methodological suggestion,
- *reference* (*CE-Verweis*, `LP_0030065`): reference to another element, another curriculum or an external resource,
- *guiding perspective* (*CE-Leitperspektive*, `LP_0030325`): overarching educational goal (see [Guiding perspective](#guiding-perspective-leitperspektive)).

### Subject level Sek II (Fachniveau Sek II)

A *niveau* that specifies the course type of a subject at the upper secondary level: *Grundkursniveau* (basic course level, basic level of demand) or *Leistungskursniveau* (advanced course level, increased level of demand). Unlike the educational track level, it refers to a single subject.

### Foreign language level (Fremdsprachenniveau)

A *niveau* according to the GER (CEFR) with the six levels A1 to C2.

### Function (Funktion)

The role that a curricular element fulfills within a curriculum, e.g. *Bereichsfunktion* (area function) or *Kompetenzbeschreibungsfunktion* (competence description function). Through the function, the differently named elements of the federal states are mapped to the generic CE classes (see [Pattern 8](patterns.en.md#pattern-8-functions)).

### Validity scope (Gültigkeitsbereich)

The period during which a curriculum is in force, specified via *from date* (*von Datum*) and *to date* (*bis Datum*). Several curricula can share the same validity scope (see [Pattern 13](patterns.en.md#pattern-13-validity-scope)).

### Class level (Jahrgangsstufe)

A stage of the school career that usually corresponds to one school year. The ontology contains class levels 1 to 13 as fixed individuals.

### Competence (Kompetenz)

The ability of a person to apply knowledge and skills to solve problems. A competence is not information but a characteristic of the learner. A curriculum describes competences through **competency specifications**: the *competency specification* (*CE-Kompetenzspezifikation*) is part of the curriculum, and the competence is described by it.

### Competency question (Kompetenzfrage)

A question that the ontology, together with the curriculum data, should be able to answer, e.g. "Which learning contents does biology have in class level 5 in Bavaria?". The competency questions serve as requirements for the model and as a touchstone for the data (see [Competency questions](introduction.en.md#competency-questions) and the corresponding [SPARQL queries](sparql.en.md)).

### Federal state (Land)

One of the sixteen federal states (*Länder*) of the Federal Republic of Germany, each responsible for its own curricula. In the ontology, the federal states are fixed individuals to which curricula and elements refer via *of federal state* (*von Bundesland*).

### Curriculum (Lehrplan)

A systematic compilation of curricular elements that specifies bindingly which competences and contents are to be acquired in a subject, a class level, a school type or an educational track of a federal state. The federal states use different names, which are represented in the ontology as subclasses of *curriculum* (*Lehrplan*, `LP_0000438`):

| Name              | Federal states         |
|-------------------|------------------------|
| Bildungsplan      | BW, HB, HH             |
| Fachanforderungen | SH                     |
| Kerncurriculum    | HE, NI                 |
| Kernlehrplan      | NW                     |
| Lehrplan          | RP, SL, SN, ST, TH     |
| LehrplanPLUS      | BY                     |
| Rahmenlehrplan    | BE, BB                 |
| Rahmenplan        | MV                     |

In Bavaria, a *LehrplanPLUS* is additionally divided into **subject curricula** (*Fachlehrplan (BY)*), for which the school subject, class level and school type are specified.

### Guiding perspective (Leitperspektive)

An overarching educational goal such as education for sustainable development or media education that runs through several subjects and class levels. The federal states use different names for it, such as *Leitperspektive* (BW, HH), *Querschnittsthema* (cross-cutting topic, MV) or *überfachliches Bildungs- und Erziehungsziel* (interdisciplinary educational goal, SN). In the ontology they are *guiding perspectives* (*CE-Leitperspektive*); elements of the subject curricula refer to them via *references* (*CE-Verweis*).

### Level (Niveau)

The superclass of all levels of demand and performance. A *niveau* (level) describes the depth and the level of demand at which contents and competences are treated. Subclasses are *educational track level* (*Bildungsgangniveau*), *Fachniveau Sek II*, *Anforderungsbereich* and *Fremdsprachenniveau*.

### Niveau stage and educational track level (Niveaustufe und Bildungsgangniveau)

The joint framework curricula of Berlin and Brandenburg do not arrange competences by class levels but by eight **niveau stages A to H** (*Niveaustufe BE/BB*). A niveau stage describes a stage in the development of the competence, independent of school type and school-leaving qualification.

An **educational track level**, by contrast, describes the level of demand of an educational track. In Berlin and Brandenburg, the educational track levels combine both: *MSA E* is the level of niveau stage E on the way to the *mittlerer Schulabschluss* (intermediate school-leaving certificate). Through these levels, niveau stages can be mapped to class levels and to the levels of other federal states (see [Pattern 11](patterns.en.md#pattern-11-niveau-stages-bebb)).

### School type and school subject (Schulart und Schulfach)

The school types and school subjects of the federal states are taken from the [Schulart-Ontologie](https://github.com/FWU-DE/schulart-ontologie) (school type ontology) and the [Schulfach-Ontologie](https://github.com/FWU-DE/schulfach-ontologie) (school subject ontology). Both are linked to the nationwide vocabularies of KIM, so that, for example, *Gymnasium (SN)* and *Gymnasium (BY)* can be assigned to the same school type.

### Title (Titel)

The human-readable name of a curricular element or curriculum, specified via *has title* (*hat Titel*). In the data, the `rdfs:label` of an element corresponds to the value of its title.


## Outlook on the following chapters

The chapter [About us](about.en.md) introduces the people and institutions who develop the Curriculum Ontology and names contacts for questions and feedback.
