# Patterns

Patterns (Anwendungsmuster) show how recurring situations are modeled with the Curriculum Ontology (Lehrplan-Ontologie). They are reusable building blocks that ensure a uniform representation in the curriculum data, and they can serve as the basis for SHACL shapes (SHACL: Shapes Constraint Language) with which the data can be validated.

Each pattern contains a visualization, the RDF data (RDF: Resource Description Framework) and an explanation. The examples refer to version **1.0.0rc6** of the ontology. Resources with the prefix `ex:` are invented examples; in the actual curriculum data they have Internationalized Resource Identifiers (IRIs) of the form `https://w3id.org/lehrplan/resource/by/…`. To keep the examples readable, every ontology term used gets its own prefix, named after its German label (see [Notation of the queries](sparql.en.md#notation-of-the-queries)). Prefixes of classes start with an uppercase letter (`Lehrplan:`, `CE_Bereich:`), prefixes of properties and individuals of the ontology with a lowercase letter (`hat_teil:`, `sachsen:`). The invented example instances are written in lowercase and numbered (`ex:lehrplan_1`, `ex:titel_2`).


## Pattern 1 - Curriculum of a federal state

```ontoink
source: patterns/pattern1.ttl
shape: ../shapes/auto-shapes/auto-shapes-open.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern1.ttl"
```

**Explanation**:

**Curriculum** (**Lehrplan**, `LP_0000438`) is the common superclass of all curricula. Each state-specific designation is a subclass of it: *LehrplanPLUS (BY)*, *Bildungsplan (BW, HB, HH)*, *Kernlehrplan (NW)*, *Kerncurriculum (NI, HE)*, *Rahmenlehrplan (BE, BB)*, *Rahmenplan (MV)*, *Fachanforderung (SH)* and *Lehrplan (RP, SL, SN, ST, TH)* (the curriculum types of the individual states, e.g. framework curriculum or core curriculum).

**Contextualization information**

A curriculum carries the information that describes its institutional scope:

- **of federal state** (**von Bundesland**, `LP_0000029`) → the issuing state, e.g. *Bayern* (Bavaria, `LP_3000051`)
- **for type of school** (**für Schulart**, `LP_0000812`) → the school type for which the curriculum applies, e.g. *Grundschule* (primary school, `schulart:BY_0000001`)
- **has educational track level** (**hat Bildungsgangniveau**, `LP_0000833`) → alternatively or additionally the educational track level, e.g. *Realschulniveau (BY)* (Realschule level, Bavaria, `LP_0000030`)
- **has school subject** (**hat Schulfach**, `LP_0000537`) → the school subject, e.g. *Sport* (physical education, `schulfach:BY_0000013`)
- **has class level** (**hat Jahrgangsstufe**, `LP_0000026`) → the class levels for which the curriculum applies
- **has educational level** (**hat Schulstufe**, `LP_0000047`) → alternatively or additionally the superordinate educational level, e.g. *Primarbereich* (primary level, `LP_0000036`)

Together, this information makes a curriculum uniquely identifiable: *„Bayern – Grundschule – Sport – Jahrgangsstufen 1 und 2“* (Bavaria – primary school – physical education – class levels 1 and 2).

**Further information**

- **has title** (**hat Titel**, `LP_0030056`) → the official title as a title individual (see Pattern 2)
- **has description** (**hat Beschreibung**, `LP_0030051`) → an explanatory text as a description individual
- **uri** (`LP_0000463`) → the Uniform Resource Locator (URL) of the original document at the publisher, e.g. on the state's school portal
- **has direct part** (**hat direkten Teil**, `LP_0000565`) → the top structural level of the curriculum (see Pattern 6)
- **veröffentlicht am** (published on) and **has validity scope** (**hat Gültigkeitsbereich**) → temporal information (see Pattern 13)


## Pattern 2 - Title, description and ID number

```ontoink
source: patterns/pattern2.ttl
shape: ../shapes/auto-shapes/auto-shapes-open.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern2.ttl"
```

**Explanation**:

The texts of a curriculum are not attached to the elements as simple literals but modeled as separate information units. The actual text is attached to this individual via **has value** (**hat Wert**, `LP_0000344`).

**Title** (**Titel**, `LP_0000346`) – property: **has title** (`LP_0030056`)

A title carries the designation of an element as it appears in the printed or digital curriculum. It is not identical to the `rdfs:label` of the element: the label is a caption for display, whereas the title reproduces the original text of the document. *has title* can be used on curricula and on curricular elements (domain: *curricular element* (*Curriculares Element*) or *curriculum*). For a *competency specification* (*CE-Kompetenzspezifikation*), a title is part of the definition.

**Description** (**Beschreibung**, `LP_0030003`) – property: **has description** (`LP_0030051`)

The description carries longer, explanatory texts: explanations of competence areas, methodological notes, didactic comments, examples of concretization or texts on the educational mission. *has description* can also be used on curricula and curricular elements.

**ID number** (**Identifikationsnummer**, `LP_0000347`) – property: **has number** (**hat Nummer**, `LP_0030057`)

The ID number preserves the numbering of the original document, e.g. *„3.1“*, *„LB 2“* or *„A.1“*. It is intended only for curricular elements (domain: *curricular element*). Since the IRIs of the elements are unique but not human-readable (e.g. `https://w3id.org/lehrplan/resource/by/a0010229-…`), the number establishes the link to the corresponding place in the original document.

**Structure and order**

The example also shows how elements are nested within each other: via **has direct part** (`LP_0000565`) an element refers to its immediate parts, and via **hat Position** (has position, `LP_0000460`) the order of the parts within their parent element is recorded.

```text
Curriculares Element
  ├─[hat Titel]──────────▶ Titel                  → Name des Elements im Dokument
  ├─[hat Nummer]─────────▶ Identifikationsnummer  → z. B. "3.1" oder "LB 2"
  ├─[hat Beschreibung]───▶ Beschreibung           → erläuternder Text
  └─[hat Position]───────▶ 1, 2, 3 …              → Reihenfolge im Elternelement
```


## Pattern 3 - School subject and school subject property

```ontoink
source: patterns/pattern3.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern3.ttl"
```

**Explanation**:

The example shows two curricula: one is directly assigned a school subject, the other a school subject property.

**School subject** (**Schulfach**, `LP_0000001`) is the class of all school subjects. For frequently queried groups of subjects there are subclasses:

- **MINT-Fach** (STEM subject, `LP_0000002`; MINT: Mathematik, Informatik, Naturwissenschaften und Technik, i.e. mathematics, computer science, natural sciences and technology) with the subclass **Naturwissenschaftsfach** (natural science subject, `LP_0000003`)
- **Fremdsprachenfach** (foreign language subject, `LP_0000004`)
- **Gesellschaftswissenschaftsfach** (social science subject, `LP_0000005`)
- **BistaFach** (`LP_0000039`) for the subjects for which there are KMK educational standards (KMK: Standing Conference of the Ministers of Education and Cultural Affairs, Kultusministerkonferenz)

The concrete subjects come from the school subject ontology (`https://w3id.org/schulfach`): 898 subjects, one per state and subject name, e.g. `schulfach:BY_0000001` (Deutsch/German), `schulfach:HH_0000004` (Deutsch), `schulfach:SN_0000001` (Deutsch). The fact that the same subject is a separate individual in each state reflects reality: the names differ from one another, e.g. *Arbeit-Wirtschaft-Technik*, *AWT* or *Arbeitslehre* (variants of a work/economics/technology subject). For 733 subjects there is a `skos:exactMatch` and for 51 a `skos:closeMatch` to the nationwide **KIM school subject vocabulary** (KIM-Schulfachvokabular; KIM: Kompetenzzentrum Interoperable Metadaten, competence center for interoperable metadata), which serves as a common reference point for cross-state queries.

In the curriculum data, a subject is linked to a curriculum via **has school subject** (`LP_0000537`).

**School subject property** (**Schulfachbezug**, `LP_0000540`) describes the status of a subject in a particular context:

- **Pflichtfach** (compulsory subject, `LP_0000544`): mandatory for all students
- **Wahlpflichtfach** (compulsory elective subject, `LP_0000545`): mandatory choice from a fixed offering
- **Wahlfach** (elective subject, `LP_0000551`): optional
- **Erste**, **Zweite** and **Dritte Fremdsprache** (first, second and third foreign language, `LP_0000541`, `LP_0000542`, `LP_0000543`)

A school subject property in turn refers to the subject via *has school subject*. Therefore *has school subject* allows both *school subject* and *school subject property* as its range. This is particularly important for foreign languages: depending on the state and educational track, English can be the first, second or third foreign language – each with different requirements. This makes it possible, for example, to query all curricula for "English as a second foreign language" nationwide.


## Pattern 4 - School type and educational track level

```ontoink
source: patterns/pattern4.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern4.ttl"
```

**Explanation**:

**School type** (**Schulart**, `LP_0000111`) describes a form of school. The school type ontology comprises 89 school types from all 16 states – one for each state-specifically named form of school. A school type is an information unit; the role that a concrete school has as a school of this type is the *school type role* (*Schulartfunktion*).

Only **Grundschule** (primary school) and **Gymnasium** (academic secondary school) exist under the same name in all states. The other school types differ in part considerably: the **Mittelschule** in Bavaria corresponds, for example, to the **Regelschule** in Thuringia, the **Regionale Schule** in Mecklenburg-Western Pomerania, the **Oberschule** in Saxony or the **Hauptschule** in Lower Saxony. As an integrated form of school, Hamburg has only the **Stadtteilschule**, Schleswig-Holstein the **Gemeinschaftsschule**, while North Rhine-Westphalia distinguishes between **Gesamtschule** and **Sekundarschule**.

Each school type is assigned to a state via **of federal state** (`LP_0000029`) and has a state-specific IRI, e.g. `schulart:RP_0000002` (Integrierte Gesamtschule, integrated comprehensive school in Rhineland-Palatinate). Curricula refer via **for type of school** (`LP_0000812`) to the school type for which they apply.

### School type and educational track level

Via **has educational track level** (`LP_0000833`), each school type specifies which **educational track levels** (**Bildungsgangniveaus**, `LP_0000028`) are taught at it. The Gymnasium in Bavaria (`schulart:BY_0000005`), for example, has the *Gymnasialniveau Sek I (BY)* (Gymnasium level, lower secondary, Bavaria) and the *Gymnasialniveau Sek II (BY)* (Gymnasium level, upper secondary, Bavaria).

School types that combine several educational tracks under one roof accordingly have several levels. The **Gemeinschaftsschule** in Saxony (`schulart:SN_0000002`) comprises six: *Grundschulniveau (SN)*, *Hauptschulbildungsgangniveau (SN)*, *Realschulbildungsgangniveau (SN)*, *Oberschulniveau (SN)*, *Gymnasialniveau Sek I (SN)* and *Gymnasialniveau Sek II (SN)*. It thus ranges from primary school to the upper level of the Gymnasium.

### Federal diversity of the educational track levels

Like the school types, the educational track levels are named state-specifically. The Hauptschule level, for example, is called *G Niveau* in Baden-Württemberg, *Mittelschulniveau* in Bavaria and *Grundlegendes Kompetenzniveau* (basic competence level) in Rhineland-Palatinate. The ontology adopts the names used by the states and maps them to each other via the generic level classes (see Pattern 9).

### Significance for the curriculum data

Curricular elements, such as competence expectations, can also be assigned to one or more levels via **has educational track level**. This results in the link

**School type → has educational track level ← Curricular element**

This makes it possible to determine at which school types a requirement applies without the school type having to be specified on the curricular element itself. The school type provides the institutional context, the educational track level the subject-related standard.


## Pattern 5 - Class level/educational level and phases of upper secondary level

```ontoink
source: patterns/pattern5.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern5.ttl"
```

**Explanation**:

**Class levels** (**Jahrgangsstufen**, `LP_0000009`)

The ontology defines 13 class levels (`LP_2000001` to `LP_2000013`). They are state-independent – class level 6 is the same IRI `LP_2000006` in every state. Curricula and curricular elements are bound to one or more class levels via **has class level** (`LP_0000026`). This is the most frequent and most direct assignment: a requirement for class level 8 carries `has class level → LP_2000008`.

**Educational level** (**Schulstufe**, `LP_0000020`)

The educational level groups several class levels into one educational stage and is assigned via **has educational level** (`LP_0000047`):

- **Primarbereich** (primary level, `LP_0000036`) – class levels 1–4 (1–6 in Berlin and Brandenburg)
- **Sekundarbereich I** (lower secondary level, `LP_0000045`) – class levels 5–9/10 (7–10 in Berlin and Brandenburg)
- **Sekundarbereich II** (upper secondary level, `LP_0000046`) – class levels (10/)11–12/13
- **Orientierungsstufe (MV)** (orientation stage, `LP_0000032`) – specific to Mecklenburg-Western Pomerania, class levels 5 and 6

The educational level is used when an element is assigned not to a single class level but to an entire educational stage – e.g. a *Kerncurriculum* (core curriculum) that applies to the entire lower secondary level.

**Upper secondary phases**

The class **secondary phase** (**Oberstufenphase**, `LP_0000043`) divides the upper level of the Gymnasium with the subclasses **Einführungsphase** (introductory phase, `LP_0000056`) and **Qualifikationsphase** (qualification phase, `LP_0000057`). The phases are assigned via **has secondary phase** (**hat Oberstufensphase**, `LP_0000556`).

Since there are eight-year (G8) and nine-year (G9) Gymnasien, the phases fall in different class levels. Both variants are recorded as separate individuals that specify their class levels via *has class level*:

- **G8 Einführungsphase** (`LP_0000051`): class level 10
- **G8 Qualifikationsphase** (`LP_0000050`): class levels 11–12
- **G9 Einführungsphase** (`LP_0000055`): class level 11
- **G9 Qualifikationsphase** (`LP_0000052`): class levels 12–13


## Pattern 6 - Hierarchy of curricular elements

```ontoink
source: patterns/pattern6.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern6.ttl"
```

**Explanation**:

**Curricular elements** (**Curriculare Elemente**, `LP_0000261`) are the building blocks from which a curriculum is constructed. Every information unit of a curriculum – a chapter, a competence area, an individual requirement, a learning content – is a curricular element. The generic subclasses carry the prefix *CE-* in their German labels:

**Fragment** (**CE-Fragment**) is a purely structuring component: chapters, sections and headings that structure a curriculum without themselves describing competences or content. Each state has its own class for this, e.g. *Lehrplanfragment (BY)* (curriculum fragment, Bavaria).

**Area** (**CE-Bereich**) groups competences and learning content under a common subject-related focus and can be superordinate or subordinate to other areas. The names used by the states range from *Kompetenzbereich* (competence area) via *Lernbereich* (learning area), *Leitidee* (guiding idea) and *Themenfeld* (topic area) to *Inhaltsfeld* (content field).

**Competency specification** (**CE-Kompetenzspezifikation**) describes a concrete competence – typically as a sentence with an operator that begins with "Die Schülerinnen und Schüler …" ("Students …"). The ontology distinguishes between **Fachbezogene** (subject-specific) and **Fachübergreifende Kompetenzspezifikation** (cross-subject competency specification). By definition, a competency specification is part of an area and has a title.

**Learning content** (**CE-Lerninhalt**) names concrete topics and subject matter through which competences are acquired. A learning content is part of an area or of another learning content.

**Note** (**CE-Hinweis**) contains supplementary, recommending information: methodological suggestions, proposals for differentiation or ideas for deepening. A note is part of a competency specification, a learning content or an area.

**Reference** (**CE-Verweis**, see Pattern 7) establishes a reference from one element to another.

**Guiding perspective** (**CE-Leitperspektive**) describes overarching educational goals such as sustainability or media education that run through several subjects and class levels.

**The part-whole relationship**

The elements are linked to each other via **has direct part** (`LP_0000565`) or its inverse **direct part of** (**direkt Teil von**, `LP_0000566`): an element refers to its immediately subordinate elements. The order is given by **hat Position** (`LP_0000460`). Since *has direct part* is a sub-property of the transitive relation **has part** (**hat Teil**, `BFO_0000051`), all indirect parts can be derived from it – for example, all competency specifications of a curriculum, regardless of the depth of the structure.

Typical hierarchies are:

- CE-Fragment → CE-Bereich → CE-Kompetenzspezifikation → CE-Hinweis
- CE-Fragment → CE-Bereich → CE-Bereich → CE-Kompetenzspezifikation
- CE-Fragment → CE-Bereich → CE-Lerninhalt → CE-Lerninhalt → CE-Hinweis

A Bavarian curriculum, for example, is divided into elements of the class *Lernbereich (BY)* (learning area, Bavaria; an area), which contain elements of the classes *Kompetenzerwartung (BY)* (competence expectation, Bavaria; a competency specification) and *Inhalt zu den Kompetenzen (BY)* (content for the competences, Bavaria; a learning content). A Hamburg *Bildungsplan* uses *Kompetenzbereich (HH)* (competence area, Hamburg) and *Anforderung (HH)* (requirement, Hamburg) instead.


## Pattern 7 - Reference

```ontoink
source: patterns/pattern7.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern7.ttl"
```

**Explanation**:

A **reference** (**CE-Verweis**, `LP_0030065`) is a curricular element that establishes a link from one element to another or to an external resource. The reference is not the target itself but the pointer to it: the source element carries the reference via **has reference** (**hat Verweis**, `LP_0030071`), the reference points to the target via **refers to** (**verweist auf**, `LP_0030072`) and can have its own description.

A reference can point

- **within the same curriculum**, e.g. from one competence area to another ("see also learning area 3"),
- **into another curriculum**, e.g. across subjects from the German to the history curriculum,
- **to external resources**, e.g. educational standards of the KMK or materials.

In the curriculum data, references appear as state-specific classes – in rc6 there are 47, e.g. *Verweis auf standardillustrierende Aufgaben (BE)* (reference to tasks illustrating the standards, Berlin), *Verweis auf vernetzte Kompetenzen (BE)* (reference to interlinked competences, Berlin) or *Verweis auf Lernbereich des gleichen Faches einer anderen Klassenstufe (SN)* (reference to a learning area of the same subject in another class level, Saxony). They carry the *Verweisbeschreibungsfunktion* (reference description function) and are therefore derived as subclasses of *reference* (see Pattern 8); in the example, this derived subclass relationship is drawn directly.

Since cross-references are modeled not as free text but as typed elements, they can be analyzed: Which competence areas are linked to each other? How densely interlinked is a curriculum internally? Which subjects refer to each other?

**Provenance of references**

References do not always come from the curriculum document itself. They can also be added subsequently, for example by an AI system (AI: artificial intelligence) that automatically identifies elements with related content, or by an editorial team that defines links manually. For the assessment and maintenance of such references, it is important to record where they come from.

This can be represented with the means of Basic Formal Ontology (BFO) and the Relation Ontology (RO), which the Curriculum Ontology already reuses: a reference is the output of a process (`BFO_0000015`, *process*), via **output of** (`RO_0002353`) or inversely **has output** (`RO_0002234`). The actor who created the reference participates in this process via **has participant** (`RO_0000057`): a *person* (*Person*, `LP_0000010`) or a technical system on which an AI method is executed.

```turtle
@prefix ex:             <https://www.example.org/> .
@prefix CE_Verweis:     <https://w3id.org/lehrplan/ontology/LP_0030065> .
@prefix Person:         <https://w3id.org/lehrplan/ontology/LP_0000010> .
@prefix Process:        <http://purl.obolibrary.org/obo/BFO_0000015> .
@prefix Object:         <http://purl.obolibrary.org/obo/BFO_0000030> .
@prefix output_of:      <http://purl.obolibrary.org/obo/RO_0002353> .
@prefix hat_teilnehmer: <http://purl.obolibrary.org/obo/RO_0000057> .

# automatisch durch ein KI-System ermittelter Verweis
ex:verweis_2 a CE_Verweis: ;
             output_of: ex:zuordnung_1 .
ex:zuordnung_1 a Process: ;
             hat_teilnehmer: ex:ki_system_1 .
ex:ki_system_1 a Object: .

# von einer Person angegebener Verweis
ex:verweis_3 a CE_Verweis: ;
             output_of: ex:zuordnung_2 .
ex:zuordnung_2 a Process: ;
             hat_teilnehmer: ex:redakteurin_1 .
ex:redakteurin_1 a Person: .
```

On this basis, references from the curriculum itself can be distinguished from subsequently added ones, automatically identified references can be checked before they are adopted, and they can be filtered selectively if needed.

In version rc6, the Curriculum Ontology does not yet contain specific classes for such processes. For a simple distinction in the data, separate subclasses of *process* suggest themselves, for example for automatic and editorial assignments. It is also still open how the time and reliability of an automatic assignment, such as a confidence value, are to be specified.


## Pattern 8 - Functions

```ontoink
source: patterns/pattern8.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern8.ttl"
```

**Explanation**:

**The problem: many names, one meaning**

The states have structured their curricula very differently and use their own terms. What is called *Lernbereich* in Bavaria is called *Kompetenzbereich* in Hamburg, *Kompetenzbereich*, *Leitidee* or *Thema* in Rhineland-Palatinate, and likewise *Lernbereich* in Saxony. Without a mapping mechanism, a nationwide query would require knowing each of the more than 400 state-specific classes.

**The solution: function specifications**

In rc6, each state-specific class is defined as a subclass of an intersection: of the *Element (XX)* class of its state and a fixed function, which refers via **has function specification** (**hat Funktion**, `LP_0000483`) to an individual of the class **function specification** (**Funktionsspezifikation**, `LP_0000478`). There are three kinds of functions:

The **Strukturierungsfunktion** (structuring function, `LP_0000482`) describes how an element structures the curriculum:

- **Fragmentfunktion** (fragment function) – purely structuring component (chapter, section). This function is carried by the 16 classes *Lehrplanfragment (XX)*.
- **Bereichsfunktion** (area function) – division into subject-related coherent areas. 119 classes carry this function, including *Kompetenzbereich (HH)*, *Lernbereich (BY)*, *Leitidee (BE)* and *Inhaltsfeld (HE)*.

The **Beschreibungsfunktion** (description function, `LP_0000493`) describes what an element accomplishes in terms of content:

- **Kompetenzbeschreibungsfunktion** (competence description function) – formulates a competence to be acquired, e.g. *Anforderung (HH)*, *Kompetenzerwartung (BY)*, *Kompetenz (RP)*, *Standard (BE)* → competency specification
- **Lerninhaltsbeschreibungsfunktion** (learning content description function) – names a learning subject matter → learning content
- **Hinweisbeschreibungsfunktion** (note description function) – contains a methodological or didactic note, e.g. *Bemerkung (SN)* (remark, Saxony), *Hinweis und Anregung (MV)* (note and suggestion, Mecklenburg-Western Pomerania) → note
- **Verweisbeschreibungsfunktion** (reference description function) – refers to another element → reference
- **Leitperspektivenbeschreibungsfunktion** (guiding perspective description function) – describes an overarching guiding perspective → guiding perspective
- **Materialbeschreibungsfunktion** (material description function) – describes learning or additional material, e.g. *learning material (BE)* (*Lernmaterial (BE)*)

The **Bezugsfunktion** (relation function, `LP_0000499`) additionally specifies what an element relates to in terms of content. It always occurs in combination with one of the other functions:

- **Prozessbezugsfunktion** (process relation function) – process-related competences (how learning or acting takes place), e.g. *Prozessbezogene Kompetenz (NI)* (process-related competence, Lower Saxony)
- **Inhaltsbezugsfunktion** (content relation function) – content-related competences (what is learned), e.g. *Leitidee (BW)* (guiding idea, Baden-Württemberg)
- **Domänenbezugsfunktion** (domain relation function) – relation to a subject domain

In addition, the class *function specification* contains the individuals **Verbindlich** (mandatory) and **Optional** (optional).

**How the mapping works technically**

```turtle
@prefix rdfs:                 <http://www.w3.org/2000/01/rdf-schema#> .
@prefix owl:                  <http://www.w3.org/2002/07/owl#> .
@prefix Lernbereich_BY:       <https://w3id.org/lehrplan/ontology/LP_0002046> .
@prefix Element_BY:           <https://w3id.org/lehrplan/ontology/LP_0000434> .
@prefix CE_Bereich:           <https://w3id.org/lehrplan/ontology/LP_0000349> .
@prefix Curriculares_Element: <https://w3id.org/lehrplan/ontology/LP_0000261> .
@prefix hat_funktion:         <https://w3id.org/lehrplan/ontology/LP_0000483> .
@prefix bereichsfunktion:     <https://w3id.org/lehrplan/ontology/LP_0000497> .

Lernbereich_BY:
  rdfs:subClassOf [
    owl:intersectionOf (
      Element_BY:
      [ owl:onProperty hat_funktion: ;
        owl:hasValue   bereichsfunktion: ]
    )
  ] .

CE_Bereich:
  owl:equivalentClass [
    owl:intersectionOf (
      Curriculares_Element:
      [ owl:onProperty hat_funktion: ;
        owl:hasValue   bereichsfunktion: ]
    )
  ] .
```

Every instance of *Lernbereich (BY)* thus automatically has the area function – without an explicit *has function specification* triple having to be present in the curriculum data. Since *area* is defined as exactly this combination, a reasoner classifies *Lernbereich (BY)* as a subclass of *area*.

For *competency specification*, *learning content* and *note*, the definition additionally requires embedding in the structure (see Pattern 6). These classes are therefore derived not at class level but for each individual element in the data. The example shows the result: the element is at the same time *Kompetenzerwartung (NW)* (competence expectation, North Rhine-Westphalia) and *competency specification* and carries the competence description function.

**What this means for queries**

In the SPARQL endpoint (SPARQL: SPARQL Protocol and RDF Query Language), the triples derived by the reasoner are available in separate graphs (see [SPARQL queries](sparql.en.md)). This makes it possible to query nationwide without knowing the state-specific classes:

- *"All competence areas from all states"* → all instances of *area* or with *has function specification* → *Bereichsfunktion*
- *"All requirements from the Hamburg German curriculum"* → all instances with *has function specification* → *Kompetenzbeschreibungsfunktion*, filtered on Hamburg
- *"All notes"* → all instances with *has function specification* → *Hinweisbeschreibungsfunktion*

The function specifications are thus the central bridge between the terminology of the states and a uniform, nationwide semantics.


## Pattern 9 - Levels

```ontoink
source: patterns/pattern9.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern9.ttl"
```

**Explanation**:

**Niveau** (*niveau*, level; `LP_0000037`) is the superclass of all performance and requirement levels. It is divided into four subclasses.

The **educational track level** (`LP_0000028`) describes the performance standard with which content and competences are formulated for a particular learning group – and thus toward which school-leaving qualification teaching is directed. There are five generic level classes: **Grundschulniveau** (primary school level), **Hauptschulniveau** (Hauptschule level), **Realschulniveau** (Realschule level), **Gymnasialniveau Sek I** (Gymnasium level, lower secondary) and **Gymnasialniveau Sek II** (Gymnasium level, upper secondary). For each state there is also a class *Bildungsgangniveau (XX)* (educational track level of state XX), defined as an educational track level with *of federal state* = XX. The concrete levels of the states are individuals that belong to one or more generic classes and to the class of their state.

The names vary considerably: the Hauptschule level is called *Mittelschulniveau* in Bavaria and *Mindestanforderungen* (minimum requirements) in Hamburg; the *Regelschulniveau (TH)* and the *Sekundarstufenniveau (SH)* cover several levels at once. The Gymnasium level Sek I is called *Erweitertes Anforderungsniveau* (extended requirement level) in Bremen, *Erhöhtes Kompetenzniveau* (increased competence level) in Rhineland-Palatinate and *Erweiterungskurs* (extension course) in North Rhine-Westphalia. Berlin and Brandenburg differentiate by qualification and niveau stage, e.g. *MSA A–G* for the mittlerer Schulabschluss (MSA, intermediate school-leaving certificate) or *Gymnasialniveau Sek I A–H* (see Pattern 11).

The **Fachniveau Sek II** (subject level, upper secondary, `LP_0000265`) describes the course type in the upper level of the Gymnasium. It has the generic subclasses **Grundkursniveau** (basic course level) and **Leistungskursniveau** (advanced course level). The course types of the states are individuals of these classes and of the class *Fachniveau Sek II (XX)* of their state, e.g. *Grundlegendes Anforderungsniveau (ST)* (basic requirement level, Saxony-Anhalt) or *Leistungskursfach (BB)* (advanced course subject, Brandenburg).

The **Anforderungsbereich** (requirement area, `LP_0000802`) comes from the KMK educational standards and classifies the cognitive demand of a task or competence. The three individuals are **Anforderungsbereich 1 (Reproduktion)** (requirement area 1, reproduction), **Anforderungsbereich 2 (Reorganisation und Transfer)** (requirement area 2, reorganization and transfer) and **Anforderungsbereich 3 (Reflexion und Problemlösung)** (requirement area 3, reflection and problem solving). Unlike educational track levels and subject levels, it describes not organizational conditions but the cognitive depth of a learning objective – independent of school type or state.

The **Fremdsprachenniveau** (foreign language level, `LP_0010001`) represents the six levels of the **Common European Framework of Reference for Languages** (Gemeinsamer Europäischer Referenzrahmen für Sprachen, GER), from *A1 Anfänger* (A1 beginner, `LP_0030317`) to *C2 Annähernd muttersprachliche Kenntnisse* (C2 near-native proficiency, `LP_0030313`). These levels are uniform nationwide and make it possible to link curriculum elements from foreign language subjects to the GER.


## Pattern 10 - Educational track levels, educational tracks and qualifications

```ontoink
source: patterns/pattern10.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern10.ttl"
```

**Explanation**:

Educational tracks, educational track levels and qualifications together describe the framework within which curriculum content applies: at which level of demand learning takes place and what the school career is aimed at. As everywhere in the ontology, a distinction is made between the real-world entity and the information unit that describes it.

**Educational track specification** (**Bildungsgangspezifikation**, `LP_0000816`) describes a school career that leads to a particular qualification. The three generic subclasses *Gymnasium track* (*Gymnasialer Bildungsgang*), *Realschule track* (*Realschulbildungsgang*) and *Hauptschule track* (*Hauptschulbildungsgang*) are defined via their educational track level – a *Realschule track* is exactly an educational track specification with Realschule level. The **educational track** (**Bildungsgang**, `LP_0000567`) itself is the process that a person goes through according to this specification. An educational track is not the same as a school type: the Gymnasium track can also be completed at a *Gesamtschule* (comprehensive school) or *Gemeinschaftsschule*.

**Educational track level** (`LP_0000028`) describes the performance standard within an educational track (see Pattern 9). In the curriculum data, it is attached to curricula and individual elements via **has educational track level** (`LP_0000833`) to specify for which learning group a competence applies.

**School-leaving qualification specification** (**Schulabschlussspezifikation**, `LP_0000019`) describes a school-leaving qualification and the requirements for its award. The generic subclasses are defined via the required level:

- **Erster Schulabschluss** (first school-leaving qualification) – *requires level* (*benötigt Niveau*) some Hauptschulniveau
- **Mittlerer Schulabschluss** (intermediate school-leaving qualification) – *requires level* some Realschulniveau
- **Allgemeine Hochschulreife** (general higher education entrance qualification) – *requires level* some Gymnasialniveau Sek II

For each state there are subclasses such as *Mittlerer Abschluss (RP)* (intermediate qualification, Rhineland-Palatinate), whose individuals are the concrete qualifications, e.g. *Qualifizierter Sekundarabschluss I (RP)* (qualified lower secondary qualification, Rhineland-Palatinate). The **school-leaving qualification role** (**Schulabschluss**, `LP_0000008`) itself is the role that a person receives upon attaining it. An educational track specification refers via **leads to qualification** (**ermöglicht Abschluss**, `LP_0000021`) to the attainable school-leaving qualification specification.

The concepts form a chain:

```text
Realschulbildungsgang
   ──[hat Bildungsgangniveau]──▶ Realschulniveau
   ──[ermöglicht Abschluss]────▶ Mittlerer Schulabschluss
                                    ──[benötigt Niveau]──▶ Realschulniveau
```

In the example, the required level is specified directly on the Rhineland-Palatinate qualification. In rc6, it is fixed as a class axiom on *Mittlerer Schulabschluss* and thus applies to all intermediate qualifications.

For curriculum data this means: a competency specification with `has educational track level → Gymnasialniveau Sek I` applies to learners in the Gymnasium track of lower secondary level – regardless of whether they attend a Gymnasium or a Gesamtschule.


## Pattern 11 - Niveau stages BE/BB

```ontoink
source: patterns/pattern11.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern11.ttl"
```

**Explanation**:

Berlin and Brandenburg work with joint *Rahmenlehrpläne* (framework curricula). These structure competences not primarily by class levels but along eight **niveau stages A to H** (Niveaustufen), which represent different degrees of competence development. In the ontology, they are individuals of the class **Niveaustufe BE/BB** (niveau stage, Berlin/Brandenburg, `LP_0000443`).

Competency specifications, e.g. *standard (BE)* (*Standard (BE)*), are assigned to a niveau stage via **has niveau stage** (**hat Niveaustufe**, `LP_0000578`); the inverse is **is niveau stage of** (**ist Niveaustufe von**, `LP_0000580`). However, the niveau stage alone is not sufficient for comparability, because a competence must always be read in the context of the targeted qualification.

The concretization is therefore done via **educational track levels** that combine niveau stage and qualification: in Berlin there is a series of levels for each qualification type – *BOA A–E*, *BBR A–F*, *EBBR A–G*, *MSA A–G* and *Gymnasialniveau Sek I A–H* –, and in Brandenburg correspondingly *EBR A–G*, *FOR A–G* and *FOR-Q A–H*. The abbreviations denote the targeted qualifications: in Berlin the berufsorientierender Abschluss (BOA, career-oriented qualification), the Berufsbildungsreife (BBR, basic vocational qualification), the erweiterte Berufsbildungsreife (EBBR, extended basic vocational qualification) and the mittlerer Schulabschluss (MSA); in Brandenburg the erweiterte Berufsbildungsreife (EBR, extended basic vocational qualification), the Fachoberschulreife (FOR, entrance qualification for upper vocational school) and the Fachoberschulreife mit Berechtigung zum Besuch der gymnasialen Oberstufe (FOR-Q, FOR with entitlement to attend the upper secondary level of the *Gymnasium*). Each of these levels refers via **is niveau of** (**ist Niveau von**, `LP_0000086`) to its niveau stage; conversely, the niveau stage has all associated levels via **has niveau** (**hat Niveau**, `LP_0000840`). The levels are individuals of classes such as *MSA Niveau* (MSA level), which are defined both as an educational track level of the state and as a generic level (*MSA Niveau* as Realschulniveau in Berlin).

To make the BE/BB levels comparable with the other states, each level carries via **has class level** (`LP_0000026`) the class levels in which it is typically reached. The assignment deliberately overlaps, because the *Rahmenlehrplan* provides for individual learning development instead of rigid boundaries. Across all qualification types, the following ranges result in rc6:

| Niveau stage | Class levels |
|-------------|-----------------|
| A           | 1–2             |
| B           | 1–3             |
| C           | 2–7             |
| D           | 4–9             |
| E           | 6–10            |
| F           | 7–10            |
| G           | 9–10            |
| H           | 10              |

The exact class levels depend on the qualification type; *MSA E*, for example, lies in class levels 6–8.

In summary: the BE/BB *Rahmenlehrplan* links **competency specifications** with **niveau stages**. The combination of niveau stage and targeted qualification yields the educational track level, via which in turn the class levels can be determined. Comparability with the other states rests on two mechanisms:

1. **Generic educational track levels**: the qualification-specific levels (e.g. *MSA*) belong to the generic level classes (e.g. *Realschulniveau*).
2. **Common class levels**: since all states use the same class level IRIs, requirements can be compared nationwide.


## Pattern 12 - Time specifications

```ontoink
source: patterns/pattern12.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern12.ttl"
```

**Explanation**:

Time specifications anchor curriculum elements not only in terms of content but also temporally – e.g. the number of lessons allotted to a learning area.

The **temporal specification** (**Zeitspezifikation**, `LP_0000508`) bundles a time specification consisting of value and unit, e.g. "6 lessons" or "45 minutes". It is a *data item* (`IAO_0000027`) from the Information Artifact Ontology, i.e. an information unit that carries a measured value. By definition, each temporal specification has a decimal value via **has value** (`LP_0000344`) and a unit via **hat Einheit** (has unit, `qudt:hasUnit`).

The units are individuals of the class **Unit** from the vocabulary **Quantities, Units, Dimensions and Types (QUDT)**. Available are *Stunde* (hour, `qudt:HR`), *Minute* (minute, `qudt:MIN`) and the ontology's own unit *Unterrichtsstunde* (lesson, `LP_0000535`).

A curricular element refers to its temporal specification via **described by** (**wird beschrieben von**, `LP_0000024`).

```text
Zeitspezifikation
  ├─[hat Wert]────▶ 6                    (xsd:decimal)
  └─[hat Einheit]─▶ Unterrichtsstunde    (qudt:Unit)
```

Instead of free text such as *„ca. 6 Stunden“* (approx. 6 hours), value and unit are recorded separately in machine-readable form. This enables analyses, e.g. the total number of lessons in a curriculum or the comparison of time allocations between states.


## Pattern 13 - Validity scope

```ontoink
source: patterns/pattern13.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern13.ttl"
```

**Explanation**:

Curricula apply for a certain period: they come into force at the start of a school year and are later replaced by new versions. Two mechanisms are available for this information:

- **veröffentlicht am** (published on, `LP_0000553`) specifies the publication date of a curriculum.
- **has validity scope** (`LP_0000550`) refers to a **validity scope** (**Gültigkeitsbereich**, `LP_0000547`), which describes the temporal scope. It carries the start and end of validity via **von Datum** (from date, `LP_0000548`) and **to date** (**bis Datum**, `LP_0000549`).

All dates have the data type `xsd:dateTimeStamp` and are sub-properties of *has value*.

A validity scope is a separate information unit and can therefore be shared by several curricula. This is the usual case when a state puts the curricula of several subjects or class levels into force on the same date. In the example, the curricula for German and mathematics refer to the same validity scope. If the period changes, for example because a transition period is extended, an adjustment in one place is sufficient.

!!! note "Not yet in the curriculum data"

    The classes and properties are defined in rc6 but are not yet used in the curriculum data.


## Pattern 14 - The learning process

```ontoink
source: patterns/pattern14.ttl
namespaces: false
```

**RDF data**:

```text
--8<-- "docs/patterns/pattern14.ttl"
```

**Explanation**:

The previous patterns describe curricula as information units: they specify which competences are to be acquired. This pattern shows how actual teaching and the learning of individual persons can be connected to them. It takes up the distinction between real-world entities and the information units that describe them (see [Basic ontological understanding](structure.en.md#basic-ontological-understanding)).

**Persons and roles**

Students and teachers are instances of the class **person** (**Person**, `LP_0000010`). Their function in teaching is not a separate kind of person but a role that a person bears: the **student role** (**Schüler Rolle**, `LP_0000012`) or the **teacher role** (**Lehrer Rolle**, `LP_0000011`). Person and role are connected via **has role** (`RO_0000087`). The same person can thus take on different roles over time.

**Teaching process and learning process**

The **teaching process** (**Lehrprozess**, `LP_0000006`) is a planned process in which persons participate in the role of teachers and learners, such as a lesson. The **learning process** (**Lernprozess**, `LP_0000007`), by contrast, takes place in the learning person themselves; this is expressed via **occurs in** (`BFO_0000066`). It can be triggered by a teaching process but is not identical to it: not all teaching leads to learning, and learning also takes place outside of teaching. Persons participate in both processes via **has participant** (`RO_0000057`). The relation *occurs in* is not yet included in rc6 and must be imported into the Curriculum Ontology from BFO or the Relation Ontology for this pattern.

**Competence as a result**

The result of a successful learning process is a **competence** (**Kompetenz**, `LP_0000013`). It is a characteristic of the learning person, not information: the person bears it via **has characteristic** (`RO_0000053`). In the example, the competence is specified as the result of the learning process via **has output** (`RO_0002234`). The connection to the curriculum is established by **described by** (`LP_0000024`): the competence of a concrete person is described by a *competency specification* in the curriculum, such as a competence expectation. According to the definition in rc6, every competence is described by at least one competency specification.

**Embedding in the educational track**

Teaching is part of an **educational track** (`LP_0000567`) via **ist Teil von** (part of, `BFO_0000050`), i.e. of the school career that a person goes through. The learning process, by contrast, is not part of the educational track: it takes place in the learning person and is not bound to the organizational framework of the school career. The educational track is described by an *educational track specification*, in the example a *Realschule track* (see [Pattern 10](#pattern-10-educational-track-levels-educational-tracks-and-qualifications)).

```text
Lehrplan ──[hat Teil]──▶ CE-Kompetenzspezifikation
                                  ▲
                      [wird beschrieben von]
                                  │
Person ──[has characteristic]──▶ Kompetenz ◀──[has output]── Lernprozess
```

!!! note "Not yet in the curriculum data"

    The classes and relations of this pattern are defined in rc6 but are not used in the curriculum data: the curriculum data describe requirements, not actual teaching. The pattern shows how data on teaching, learning progress or educational trajectories, for example from learning platforms, can be connected to the curriculum data. Personal data are subject to data protection requirements.


## Outlook on the following chapters

Using concrete examples, the patterns have shown how curricula, curricular elements, educational context, levels, references and time specifications are modeled and how actual teaching can be connected to them. The following chapters show how to work with the data modeled in this way:

- The chapter [SPARQL queries](sparql.en.md) shows how the curriculum data can be queried, from listing the curricula of a state through searching for terms to analyzing the structure of a curriculum.
- The chapter [Usage](usage.en.md) describes the available release files, access to the data and their validation with SHACL shapes, which are based on the patterns described here.
