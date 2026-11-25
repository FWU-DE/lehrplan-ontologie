# Ontology model

This page describes the model of the Curriculum Ontology (Lehrplan-Ontologie) in version **1.0.0rc6**: the basic ontological assumptions, the layered structure, the design principle of a shared core with state-specific concretizations, and the reused ontologies. It concludes with an overview of the most important classes, individuals and relations.


## Basic ontological understanding

Ontologically, a curriculum is not to be understood as a document but as an **information content entity**. The document – for example a Portable Document Format (PDF) file, a web page or a book – is merely the bearer of this information.

A curriculum is a systematic compilation of curricular elements. It specifies bindingly which competences and content students are to acquire in a particular subject, class level, school type or educational track of a federal state. Depending on the state, it is called *Bildungsplan*, *Fachanforderungen*, *Kerncurriculum*, *Kernlehrplan*, *LehrplanPLUS*, *Rahmenlehrplan*, *Rahmenplan* or simply *Lehrplan*. It must be distinguished from the cross-state **educational standards** of the Standing Conference of the Ministers of Education and Cultural Affairs (Kultusministerkonferenz, KMK), which serve as the basis for the curricula of the states.

A curriculum does not describe the teaching that actually takes place; it specifies how teaching and learning processes should ideally be designed. From an ontological point of view, the **teaching process** and the **learning process** must be clearly distinguished: the teaching process is shaped by teachers or the education system, while the learning process takes place in the learner. The result of a successful learning process can be a **competence** – ontologically not information, but a disposition of a person to act successfully in a class of situations.

The curriculum therefore does not contain competences itself; it describes them in the form of **competency specifications**. This separation between a **real-world entity** and the **information content entity that describes it** runs through the entire ontology as a basic principle:

| Real-world entity                                | is described by (information content entity)                  |
|--------------------------------------------------|---------------------------------------------------------------|
| **Competence** (*Kompetenz*; disposition of a person) | **Competency specification** (*CE-Kompetenzspezifikation*)  |
| **Educational track** (*Bildungsgang*; process a person goes through) | **Educational track specification** (*Bildungsgangspezifikation*; e.g. *Gymnasium track*) |
| **School-leaving qualification role** (*Schulabschluss*; role of a person) | **School-leaving qualification specification** (*Schulabschlussspezifikation*; e.g. *Mittlerer Schulabschluss*) |
| **School type role** (*Schulartfunktion*; role of a school) | **School type** (*Schulart*; e.g. *Gymnasium*)           |

The curriculum data almost exclusively use the information content entities. The real-world entities – persons, schools, teaching and learning processes, competences and roles – are provided in the ontology so that the curriculum data can later be linked with data about actual teaching.


## Structure of the Curriculum Ontology

The Curriculum Ontology is implemented as an OWL 2 ontology (OWL: Web Ontology Language). In terms of content, it can be divided into five layers that represent different aspects of the curriculum system – from the institutional educational context through the curricular structure to the relations between the elements.

### 1. Educational context: state, school type and school subject

*Where and for whom does the curriculum apply?*

The federal character of the education system is represented by the class **state designation** (*Bundesland Bezeichnung*, `LP_0000040`). It is defined as a closed enumeration of the 16 federal states, which are modeled as individuals. The subclass **Berlin-Brandenburg** (`LP_0000053`) groups the two states with joint framework curricula, **Ohne-Berlin-Brandenburg** (`LP_0000054`, "without Berlin-Brandenburg") the remaining 14.

The class **school type** (*Schulart*, `LP_0000111`) describes a type of school such as *Gymnasium* (academic secondary school) or *Stadtteilschule* (comprehensive school, Hamburg). A school type is an information content entity; the actual role that a concrete school assumes as a school of this type is the **school type role** (*Schulartfunktion*, `LP_0000475`). The 89 school types of the states come from the [school type ontology](#school-type-ontology).

The class **school subject** (*Schulfach*, `LP_0000001`) comprises the teaching subjects and is divided into **MINT-Fach** (STEM subject; MINT: Mathematik, Informatik, Naturwissenschaften und Technik – mathematics, computer science, natural sciences and technology; with the subclass **Naturwissenschaftsfach**, natural science subject), **Fremdsprachenfach** (foreign language subject), **Gesellschaftswissenschaftsfach** (social science subject) and **BistaFach** (subjects of the KMK educational standards). The subjects of the states come from the [school subject ontology](#school-subject-ontology). The class **school subject property** (*Schulfachbezug*, `LP_0000540`) describes the status of a subject in a particular context: *Pflichtfach* (compulsory subject), *Wahlpflichtfach* (compulsory elective subject), *Wahlfach* (elective subject) as well as *Erste*, *Zweite* and *Dritte Fremdsprache* (first, second and third foreign language).

The **educational track specification** (*Bildungsgangspezifikation*, `LP_0000816`) describes a school career that leads to a particular qualification. Its subclasses **Gymnasium track** (*Gymnasialer Bildungsgang*), **Realschule track** (*Realschulbildungsgang*) and **Hauptschule track** (*Hauptschulbildungsgang*) are defined via the respective educational track level – a *Gymnasium track* is exactly an educational track specification with Gymnasialniveau Sek I or Sek II. The **educational track** (*Bildungsgang*, `LP_0000567`) itself is the process that a person goes through according to this specification.

### 2. Curricular elements as the semantic core of the ontology

*What does a curriculum consist of?*

The class **curriculum** (*Lehrplan*, `LP_0000438`) is the common superclass for the curricula of all states. Its 16 state-specific subclasses bear the respective designation used by the state, e.g. *LehrplanPLUS (BY)*, *Bildungsplan (BW)*, *Rahmenlehrplan (BE)* or *Lehrplan (RP)*.

The class **curricular element** (*Curriculares Element*, `LP_0000261`) is the superclass of all content building blocks of a curriculum or of the educational standards. The cross-state subclasses bear the prefix *CE-*:

| Class                                    | Meaning                                                                                                              |
|------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| **fragment** (*CE-Fragment*, `LP_0001015`) | structuring component without subject-specific meaning of its own, e.g. chapter or section                         |
| **area** (*CE-Bereich*, `LP_0000349`)    | area that structures the subject matter, e.g. competence area, learning area, guiding idea, topic field, content field |
| **competency specification** (*CE-Kompetenzspezifikation*, `LP_0000263`) | description of a competence to be acquired, e.g. *Kompetenzerwartung (BY)* (expected competence), *Standard (BE)*, *Anforderung (HH)* (requirement) |
| **learning content** (*CE-Lerninhalt*, `LP_0000332`) | subject content or object of learning                                                                   |
| **note** (*CE-Hinweis*, `LP_0000852`)    | supplementary didactic, methodological or organizational information                                                 |
| **reference** (*CE-Verweis*, `LP_0030065`) | reference to another element, another curriculum or an external resource                                          |
| **guiding perspective** (*CE-Leitperspektive*, `LP_0030325`) | overarching educational goal such as sustainability or media education                          |

The CE classes are defined via the **function** that an element fulfills in the curriculum. How this works is described in the section [Design principle](#modeling-design-principle).

### 3. Temporal and level-related classification

*When does something apply?*

The class **class level** (*Jahrgangsstufe*, `LP_0000009`) contains 13 state-independent individuals (class level 1 to 13) that all curriculum data share. The **educational level** (*Schulstufe*, `LP_0000020`) groups larger stages: *Primarbereich* (primary level), *Sekundarbereich I* (lower secondary level), *Sekundarbereich II* (upper secondary level) and the *Orientierungsstufe (MV)* (orientation stage, Mecklenburg-Western Pomerania). The **secondary phase** (*Oberstufenphase*, `LP_0000043`) divides the upper secondary level of the Gymnasium into **Einführungsphase** (introductory phase) and **Qualifikationsphase** (qualification phase), each in a G8 and a G9 variant.

The **school-leaving qualification specification** (*Schulabschlussspezifikation*, `LP_0000019`) describes a school-leaving qualification and the requirements for awarding it. The generic subclasses are defined via the required level:

- **Erster Schulabschluss** (first school-leaving certificate) – requires Hauptschulniveau
- **Mittlerer Schulabschluss** (intermediate school-leaving certificate) – requires Realschulniveau
- **Allgemeine Hochschulreife** (general higher education entrance qualification) – requires Gymnasialniveau Sek II

For each state there are separate subclasses such as *Mittlerer Abschluss (BY)*, whose individuals are the concrete qualifications of the state (e.g. *Mittlerer Schulabschluss der Realschule (BY)*). The **school-leaving qualification role** (*Schulabschluss*, `LP_0000008`) itself is the role that a person receives upon obtaining the qualification.

For the temporal validity of a curriculum, the **validity scope** (*Gültigkeitsbereich*, `LP_0000547`) with the dates *von Datum* (from date) and *to date* (*bis Datum*) as well as the date *veröffentlicht am* (published on) are available. Time allotments such as lessons are specified as a **temporal specification** (*Zeitspezifikation*, `LP_0000508`) consisting of value and unit (see [Pattern 12](patterns.en.md#pattern-12-time-specifications)).

### 4. Level system

*For which level of demand does something apply?*

The class **niveau** (*Niveau*, `LP_0000037`) is the superclass of all performance and requirement levels:

- **Educational track level** (*Bildungsgangniveau*, `LP_0000028`) describes the level of demand within an educational track. The five generic subclasses are **Grundschulniveau** (primary school level), **Hauptschulniveau** (Hauptschule level), **Realschulniveau** (Realschule level), **Gymnasialniveau Sek I** (Gymnasium level, lower secondary) and **Gymnasialniveau Sek II** (Gymnasium level, upper secondary). The levels of the states are individuals of these classes, e.g. *Mittelschulniveau (BY)* as Hauptschulniveau or *Erhöhte Anforderungen (HH)* (increased requirements) as Realschulniveau and Gymnasialniveau Sek I. For Brandenburg there are additionally the classes *EBR Niveau*, *FOR Niveau* and *FOR-Q Niveau* for the targeted qualifications erweiterte Berufsbildungsreife (EBR, extended basic vocational qualification), Fachoberschulreife (FOR, entrance qualification for upper vocational school) and Fachoberschulreife mit Berechtigung zum Besuch der gymnasialen Oberstufe (FOR-Q, FOR with entitlement to attend the upper secondary level of the Gymnasium).
- **Fachniveau Sek II** (`LP_0000265`, subject level, upper secondary) describes the course type in the upper secondary level of the Gymnasium, with the subclasses **Grundkursniveau** (basic course level) and **Leistungskursniveau** (advanced course level).
- **Anforderungsbereich** (`LP_0000802`, requirement area) contains the three requirement areas of the KMK.
- **Fremdsprachenniveau** (`LP_0010001`, foreign language level) contains the six levels A1 to C2 of the Common European Framework of Reference for Languages.

Independently of this, there is the **Niveaustufe BE/BB** (`LP_0000443`, niveau stage BE/BB) with the eight niveau stages A to H of the joint framework curricula of Berlin and Brandenburg (see [Pattern 11](patterns.en.md#pattern-11-niveau-stages-bebb)).

### 5. Relations and functions

*How are the elements related?*

The ontology uses relations from Basic Formal Ontology (BFO), Relation Ontology (RO) and Information Artifact Ontology (IAO) as well as its own properties, which are classified as sub-properties of these base relations. The most important ones are:

- **has direct part** (*hat direkten Teil*, `LP_0000565`) represents the structure of a curriculum: an element is a direct part of its parent element. The order of the parts is given by **hat Position** (`LP_0000460`, has position). *has direct part* is a sub-property of the transitive relation **has part** (*hat Teil*, `BFO_0000051`), so that all indirect parts can be inferred.
- **of federal state** (*von Bundesland*), **for type of school** (*für Schulart*), **has school subject** (*hat Schulfach*), **has class level** (*hat Jahrgangsstufe*), **has educational level** (*hat Schulstufe*) and **has educational track level** (*hat Bildungsgangniveau*) place curricula and curricular elements in the educational context.
- **has title** (*hat Titel*), **has description** (*hat Beschreibung*) and **has number** (*hat Nummer*) connect an element with its textual components (title, description, ID number).
- **has function specification** (*hat Funktion*, `LP_0000483`) connects a curricular element with its **function specification** (*Funktionsspezifikation*, `LP_0000478`).

Almost all descriptive properties are sub-properties of **described by** (*wird beschrieben von*, `LP_0000024`), the inverse of **is about** (*beschreibt*, `IAO_0000136`). A complete list can be found in the section [Relations](#relations-properties).


## Modeling / design principle

The basic principle of the ontology can be summarized as follows: **one shared abstraction with diverse state-specific concretizations**. All states use the same generic classes (*curriculum*, *area*, *competency specification*, etc.) and the same relations. At the same time, the terminology of each state is preserved in its own classes.

This model enables both cross-state evaluations (e.g. "all competence areas on topic X in all states") and state-specific analyses (e.g. "all learning areas in the LehrplanPLUS of Bavaria").

```d2
Core ontology: {
  style: {
    font-color: white
    fill: "#9F0E21"
    stroke: white
  }
}
BW: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
BY: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
BE: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
"…": { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }

Core ontology -> BW: { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
Core ontology -> BY: { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
Core ontology -> BE: { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
Core ontology -> "…": { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
```

### How the state classes are linked to the core

The linking takes place in three steps:

1. **Element of the state.** For each state there is a class *Element (XX)*, defined as a *curricular element* with *of federal state* = XX. *Element (BY)* (`LP_0000434`) thus comprises exactly the curricular elements of Bavaria.
2. **State-specific class with function.** Each class from the terminology of a state is a subclass of its state element and carries a fixed function. *Lernbereich (BY)* (learning area, Bavaria), for example, is an *Element (BY)* with *has function specification* = *Bereichsfunktion* (area function).
3. **Generic class via the function.** The CE classes are specified as *defined classes* (`owl:equivalentClass`) via this function: *area* is exactly a *curricular element* with *has function specification* = *Bereichsfunktion*.

A reasoner thus automatically classifies *Lernbereich (BY)* as a subclass of *area* – without this having to be modeled by hand. How the functions are structured is shown in [Pattern 8](patterns.en.md#pattern-8-functions).

!!! note "Competency specification, learning content and note are only classified at the data level"

    Besides the function, the definitions of *competency specification*, *learning content* and *note* also require embedding in the structure: a competency specification is part of an area and has a title, a learning content is part of an area or a learning content, a note is part of a competency specification, a learning content or an area. These conditions are not specified on the state classes. Therefore a reasoner does not classify, for example, *Kompetenzerwartung (BY)* as a subclass of *competency specification*, but it does classify each individual element in the data that meets the conditions. For *area*, *fragment*, *reference* and *guiding perspective* the function suffices; here the classification already takes place at class level.

### Typical structure of a curriculum

A *curriculum* is divided into *fragments*, which in turn contain *areas* such as competence areas or topic fields. The structure is recursive: areas can be further subdivided down to the level of *competency specifications* or *learning content*, to which *notes* can be attached.

```d2
Lehrplan: {
  style: {
    font-color: white
    fill: "#9F0E21"
    stroke: white
  }
}
CE-Fragment: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
CE-Bereich: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
CE-Kompetenzspezifikation: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
CE-Lerninhalt: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
CE-Hinweis: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }

Lehrplan -> CE-Fragment: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Fragment -> CE-Bereich: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Bereich -> CE-Bereich: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Bereich -> CE-Kompetenzspezifikation: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Bereich -> CE-Lerninhalt: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Kompetenzspezifikation -> CE-Hinweis: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Lerninhalt -> CE-Hinweis: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
```

Besides this hierarchy, curricula are also linked in a network-like manner: via *references*, an element can refer to other elements of the same or another curriculum.

### Modularity

The state-specific classes are clearly separated from the core ontology: each state class depends only on its state element and on a function. New state classes can therefore be added without changing the core ontology or the classes of other states. In the future, the state parts can thus be maintained as independent modules.


---

## Reused ontologies/vocabularies

The Curriculum Ontology uses established ontologies where they provide suitable concepts, and introduces its own classes and properties only where the German curriculum system requires it. This increases interoperability with other knowledge graphs and reduces the modeling effort.

### Basic Formal Ontology (BFO)

The basic structure follows the Basic Formal Ontology (BFO), an internationally widespread top-level ontology. In the Curriculum Ontology, curricula, curricular elements, school types, niveaus and class levels are information content entities; teaching and learning processes as well as educational tracks are processes; competences are dispositions, school-leaving qualifications and school type roles are roles.

??? info " ... learn more about BFO as a top-level ontology? "

	## BFO as a top-level ontology

	The Basic Formal Ontology (BFO) is a **top-level ontology** that provides a structured framework for organizing entities according to their fundamental properties. It contains no domain-specific content, but defines **highly abstract categories** that support the development of specialized ontologies such as the Curriculum Ontology.

	BFO distinguishes entities according to whether they persist through time or unfold in time, and divides them into **continuants** and **occurrents**.
	
	### **Continuants (Endurants)**

	Continuants are entities that **exist at any given point in time** and retain their identity over time. There are three kinds of continuants: *independent continuants*, *generically dependent continuants* and *specifically dependent continuants*.

	#### **Independent Continuants (IC)**

	These are entities that **exist independently** and do not require any other entity in order to exist.
	
	- **Material entities** – physical objects with spatial extension (e.g. organisms, buildings, tools)
	- **Immaterial entities** – boundaries or parts of objects defined by human convention (e.g. the equator, the upper half of a sphere).
	
	#### **Generically Dependent Continuants (GDC)**
	
	These entities **depend for their existence on independent continuants**. Generically dependent continuants can exist in multiple instances or be replicated in different places. *Examples*:
	
	  - The content of a book (as opposed to a single physical copy)
	  - A software program (which can be installed on several computers)
	  - A musical composition (which can be played on different instruments)
	  - A dataset and individual data items
	  - Information content entities
	
	#### **Specifically Dependent Continuants (SDC)**
	
	Specifically dependent continuants are **qualities, roles or dispositions** that **exist only in relation to a particular independent continuant**. They cannot exist independently and must always **inhere** in something else.
	
	- **Qualities** – intrinsic characteristics of an independent continuant. They describe **what an entity is like at a particular point in time**. *Examples*: the color of a leaf, the weight of a person, the temperature of a liquid.
	
	- **Roles** – situational characteristics that an entity has **due to context or social convention**. *Examples*: the role of a teacher, the status of a patient in a hospital, the role of a machine during maintenance.
	
	- **Dispositions and functions** – potential behaviors or tendencies that an entity possesses even if they are not currently realized. Functions are dispositions that represent the specific purpose of something. *Examples*: the fragility of glass (it can break when dropped), the solubility of salt (it dissolves in water), a person's ability to speak several languages, the function of an oven to heat, the function of a screwdriver to drive screws in and out.
	
	### **Occurrents (Perdurants)**
	
	An occurrent is an entity that **unfolds in time**, or the beginning or end of such an entity.
	
	#### **Processes**
	
	Processes are dynamic activities with a temporal duration. *Examples*: a running event, a chemical reaction, cell division.
	
	#### **Temporal Regions**
	
	These represent temporal segments. *Examples*: a second, an hour, a historical period.
	
	#### **Spatiotemporal Regions**
	
	These combine space and time into a single entity. *Examples*: the path of a moving object, the trajectory of a planet.
	
	### **Relations in BFO**
	
	BFO defines formal **relations** between entities in order to ensure consistency. Some central relations are:
	
	- **continuant part of** – describes compositional relationships. *Example: a wheel is part of a car.*
	- **occurrent part of** – a process is part of another process. *Example: a conference comprises several workshop events.*
	- **located in** – describes spatial containment. *Example: a book is `located_in` a library.*
	- **characteristic of** – assigns specifically dependent continuants to independent continuants. *Example: `educator role` is a characteristic of a teacher.*
	- **has participant** – assigns continuants to processes. *Example: a student participates in a lecture.*
	
Repository: [https://github.com/bfo-ontology/BFO-2020](https://github.com/bfo-ontology/BFO-2020)

Documentation: [https://bfo-ontology.github.io/bfo-2020.html](https://bfo-ontology.github.io/bfo-2020.html)

### Relation Ontology (RO)

The Relation Ontology (RO) supplements BFO with further relations. The Curriculum Ontology uses it primarily for the real-world entities: *has characteristic* connects a competence with a person, *has role* and *role of* connect roles such as the school type role with their bearer, and *is concretized as* connects a school type with the school type role.

### Information Artifact Ontology (IAO)

Since curricula, curricular elements and most other concepts are information content entities, they are modeled as subclasses of *information content entity* (`IAO_0000030`). Title and description are *textual entities*, the ID number is a *symbol*, the temporal specification a *data item*.

Central is the IAO relation **is about** (`IAO_0000136`) and its inverse **described by** (`LP_0000024`): almost all properties used to describe curricula and curricular elements are classified as their sub-properties.

### School subject and school type ontologies

The school subject ontology and the school type ontology provide controlled vocabularies for the school subjects and school types of all 16 states. They are maintained as independent ontologies and reused by the Curriculum Ontology; their individuals are included in the release file of the Curriculum Ontology.

#### School subject ontology

The school subject ontology (Schulfach-Ontologie, `https://w3id.org/schulfach`) comprises 16 Simple Knowledge Organization System (SKOS) concept schemes – one per state, e.g. *Schulfächer (Hamburg)* – with a total of 898 school subjects. Each school subject is at the same time an instance of the class **school subject** (`LP_0000001`) and a `skos:Concept`, and is assigned to its state via **of federal state** (`LP_0000029`). The designations used by the states are preserved even if the subjects are comparable in content, such as *Sachunterricht*, *Heimat- und Sachunterricht* or *Mensch, Natur und Technik* (all variants of general studies in primary school).

Via `skos:exactMatch` and `skos:closeMatch`, the subjects are linked to the nationwide [KIM school subject vocabulary](https://w3id.org/kim/schulfaecher/) (KIM: Kompetenzzentrum Interoperable Metadaten, competence center for interoperable metadata), which serves as a common reference vocabulary. For example, the Hamburg subject *Deutsch* (German) is connected via `skos:exactMatch` to the KIM concept *Deutsch* and, through it, to the German subjects of all other states.

Repository: [https://github.com/FWU-DE/schulfach-ontologie](https://github.com/FWU-DE/schulfach-ontologie)

SKOS vocabularies: [https://fwu-de.github.io/mem-skos-vocabs/](https://fwu-de.github.io/mem-skos-vocabs/)

#### School type ontology

The school type ontology (Schulart-Ontologie, `https://w3id.org/schulart`) follows the same structure: 16 concept schemes with a total of 89 school types, which are at the same time instances of the class **school type** (`LP_0000111`) and `skos:Concept`. They too are linked to the [KIM school type vocabulary](https://w3id.org/kim/schularten/).

In addition, each school type is connected via **has educational track level** (`LP_0000833`) to the educational track levels taught in it. In Hamburg, for example, the **Gymnasium** (`HH_0000003`) is linked to *Gymnasialniveau Sek I (HH)* and *Studienstufenniveau (HH)* (upper secondary level, Hamburg), the **Stadtteilschule** (`HH_0000002`) to six levels from *Mindestanforderungen (HH)* (minimum requirements) to *Studienstufenniveau (HH)*.

The school type ontology thus becomes the link between school types, educational track levels and the curricular elements: if a curriculum element carries a particular educational track level, it can be inferred in which school types it is relevant – and vice versa.

Repository: [https://github.com/FWU-DE/schulart-ontologie](https://github.com/FWU-DE/schulart-ontologie)

#### Use of SKOS

The **Simple Knowledge Organization System (SKOS)** is a W3C standard for controlled vocabularies, thesauri and classifications. The school subject and school type ontologies use SKOS for labels and concept schemes as well as the mapping properties `skos:exactMatch` and `skos:closeMatch` for linking with the KIM vocabularies.

### KIM vocabularies

The **KIM vocabularies** of the KIM working group of the German Initiative for Network Information (Deutsche Initiative für Netzwerkinformation, DINI) provide nationwide uniform reference concepts for school subjects, school types and school-leaving qualifications. In the Curriculum Ontology they serve as a common point of reference: the state-specific subjects and school types are linked to the KIM concepts via SKOS mappings. Applications can either work with the concepts of the states or query nationwide via the KIM concepts without having to know the different designations used by the states.

Repository: [https://github.com/dini-ag-kim/kmk-vocabs](https://github.com/dini-ag-kim/kmk-vocabs)

### QUDT

For units of measurement, the vocabulary **QUDT** (Quantities, Units, Dimensions and Types) is reused. The class *Unit* and the property *has unit* (*hat Einheit*, `qudt:hasUnit`) come from QUDT; available units are *hour* and *minute* from QUDT as well as the ontology's own unit *Unterrichtsstunde* (`LP_0000535`, lesson).

Documentation: [https://qudt.org/](https://qudt.org/)


---

## Overview of classes, relations, hierarchies

The complete reference of all classes and properties with their definitions is provided by the [Widoco documentation](https://fwu-de.github.io/lehrplan-ontologie/index-en.html). The following overviews show the most important generic classes; the state-specific classes are not listed.

### Classes

**Real-world entities:**

- independent continuant (BFO)
    - material entity (BFO)
        - object (BFO)
            - person
        - organization
            - school
            - school class
- specifically dependent continuant (BFO)
    - realizable entity (BFO)
        - disposition (BFO)
            - competence
        - role (BFO)
            - student role
            - teacher role
            - school type role
            - school-leaving qualification role
- process (BFO)
    - teaching process
    - learning process
    - educational track

**Information content entities on the education system:**

- information content entity (IAO)
    - state designation
        - Berlin-Brandenburg
        - Ohne-Berlin-Brandenburg
    - school type
    - school subject
        - MINT-Fach
            - Naturwissenschaftsfach
        - Fremdsprachenfach
        - Gesellschaftswissenschaftsfach
        - BistaFach
    - school subject property
    - educational track specification
        - Gymnasium track
        - Realschule track
        - Hauptschule track
    - school-leaving qualification specification
        - Erster Schulabschluss
        - Mittlerer Schulabschluss
        - Allgemeine Hochschulreife
    - class level
    - educational level
    - secondary phase
        - Einführungsphase
        - Qualifikationsphase
    - niveau
        - educational track level
            - Grundschulniveau
            - Hauptschulniveau
            - Realschulniveau
            - Gymnasialniveau Sek I
            - Gymnasialniveau Sek II
        - Fachniveau Sek II
            - Grundkursniveau
            - Leistungskursniveau
        - Anforderungsbereich
        - Fremdsprachenniveau
    - Niveaustufe BE/BB

**Information content entities on curricula:**

- information content entity (IAO)
    - curriculum
    - educational standard (KMK)
    - curricular element
        - fragment
        - area
        - competency specification
            - Fachbezogene Kompetenzspezifikation (subject-specific competency specification)
            - Fachübergreifende Kompetenzspezifikation (cross-subject competency specification)
        - learning content
        - note
        - reference
        - guiding perspective
        - Element (XX) – one class per state and one for the educational standards
    - function specification
        - Strukturierungsfunktion (structuring function)
        - Beschreibungsfunktion (description function)
        - Bezugsfunktionen (reference functions)
    - validity scope
    - progression
    - textual entity (IAO)
        - title
        - description
        - subject area
    - symbol (IAO)
        - ID number
    - data item (IAO)
        - temporal specification
- Unit (QUDT)

### Individuals

Individuals are the concrete, fixed instances to which the curriculum data refer directly via Internationalized Resource Identifier (IRI).

**1. States** (`LP_0000040`)

The 16 federal states; every curriculum element refers to one of them via *of federal state*.

| IRI          | State                  | IRI          | State                  |
|--------------|------------------------|--------------|------------------------|
| `LP_3000049` | Baden-Württemberg      | `LP_3000043` | Niedersachsen (Lower Saxony) |
| `LP_3000051` | Bayern (Bavaria)       | `LP_3000044` | Nordrhein-Westfalen (North Rhine-Westphalia) |
| `LP_3000048` | Berlin                 | `LP_3000046` | Rheinland-Pfalz (Rhineland-Palatinate) |
| `LP_3000057` | Brandenburg            | `LP_3000055` | Saarland               |
| `LP_3000056` | Bremen                 | `LP_3000047` | Sachsen (Saxony)       |
| `LP_3000045` | Hamburg                | `LP_3000053` | Sachsen-Anhalt (Saxony-Anhalt) |
| `LP_3000050` | Hessen (Hesse)         | `LP_3000054` | Schleswig-Holstein     |
| `LP_3000052` | Mecklenburg-Vorpommern (Mecklenburg-Western Pomerania) | `LP_3000031` | Thüringen (Thuringia) |

**2. Class levels** (`LP_0000009`)

13 state-independent individuals: `LP_2000001` (class level 1) to `LP_2000013` (class level 13). Since all curriculum data use the same IRIs, curricula can be compared across states by class level.

**3. Educational levels** (`LP_0000020`) **and secondary phases** (`LP_0000043`)

- `LP_0000036` Primarbereich (primary level)
- `LP_0000045` Sekundarbereich I (lower secondary level)
- `LP_0000046` Sekundarbereich II (upper secondary level)
- `LP_0000032` Orientierungsstufe (MV) (orientation stage)
- `LP_0000051` G8 Einführungsphase, `LP_0000050` G8 Qualifikationsphase
- `LP_0000055` G9 Einführungsphase, `LP_0000052` G9 Qualifikationsphase

**4. Educational track levels** (`LP_0000028`)

The levels of the states are individuals of the five generic level classes and at the same time of the class *Bildungsgangniveau (XX)* (educational track level of state XX). A level can belong to several generic classes if it covers several levels of demand. Examples:

| IRI          | Level                              | generic class(es)                            |
|--------------|------------------------------------|----------------------------------------------|
| `LP_0000025` | Mittelschulniveau (BY)             | Hauptschulniveau                             |
| `LP_0000030` | Realschulniveau (BY)               | Realschulniveau                              |
| `LP_0000023` | Gymnasialniveau Sek I (BY)         | Gymnasialniveau Sek I                        |
| `LP_0000016` | G Niveau (BW)                      | Hauptschulniveau                             |
| `LP_0000014` | E Niveau (BW)                      | Gymnasialniveau Sek I                        |
| `LP_0000147` | Grundlegendes Kompetenzniveau (RP) | Hauptschulniveau                             |
| `LP_0000143` | Erhöhtes Kompetenzniveau (RP)      | Gymnasialniveau Sek I                        |
| `LP_0000093` | Erhöhte Anforderungen (HH)         | Realschulniveau, Gymnasialniveau Sek I       |
| `LP_0000294` | Oberschulniveau (SN)               | Hauptschulniveau, Realschulniveau            |

**5. Niveau stages BE/BB** (`LP_0000443`)

The eight niveau stages of the framework curricula of Berlin and Brandenburg: `LP_0000464` (A), `LP_0000465` (B), `LP_0000466` (C), `LP_0000467` (D), `LP_0000468` (E), `LP_0000469` (F), `LP_0000470` (G) and `LP_0000616` (H).

**6. Requirement areas** (`LP_0000802`)

- `LP_0000803` Anforderungsbereich 1: Reproduktion (requirement area 1: reproduction)
- `LP_0000804` Anforderungsbereich 2: Reorganisation und Transfer (requirement area 2: reorganization and transfer)
- `LP_0000805` Anforderungsbereich 3: Reflexion und Problemlösung (requirement area 3: reflection and problem solving)

**7. Foreign language levels** (`LP_0010001`)

- `LP_0030317` A1 Anfänger (beginner)
- `LP_0030316` A2 Grundlegende Kenntnisse (basic knowledge)
- `LP_0030315` B1 Fortgeschrittene Sprachverwendung (advanced language use)
- `LP_0030314` B2 Selbständige Sprachverwendung (independent language use)
- `LP_0030312` C1 Fachkundige Sprachkenntnisse (proficient language skills)
- `LP_0030313` C2 Annähernd muttersprachliche Kenntnisse (near-native proficiency)

**8. Function specifications** (`LP_0000478`)

The functions via which the state-specific classes are linked to the CE classes (see [Design principle](#modeling-design-principle) and [Pattern 8](patterns.en.md#pattern-8-functions)):

| Function type               | IRI          | Function                              |
|-----------------------------|--------------|---------------------------------------|
| Strukturierungsfunktion (structuring function) | `LP_0000627` | Fragmentfunktion (fragment function) |
|                             | `LP_0000497` | Bereichsfunktion (area function)      |
| Beschreibungsfunktion (description function) | `LP_0000479` | Kompetenzbeschreibungsfunktion (competence description function) |
|                             | `LP_0000480` | Lerninhaltsbeschreibungsfunktion (learning content description function) |
|                             | `LP_0001014` | Hinweisbeschreibungsfunktion (note description function) |
|                             | `LP_0002158` | Verweisbeschreibungsfunktion (reference description function) |
|                             | `LP_0030326` | Leitperspektivenbeschreibungsfunktion (guiding perspective description function) |
|                             | `LP_0000481` | Materialbeschreibungsfunktion (material description function) |
| Bezugsfunktion (reference function) | `LP_0000500` | Prozessbezugsfunktion (process reference function) |
|                             | `LP_0000501` | Inhaltsbezugsfunktion (content reference function) |
|                             | `LP_0002171` | Domänenbezugsfunktion (domain reference function) |
| Verbindlichkeit (bindingness) | `LP_0000533` | Verbindlich (binding)               |
|                             | `LP_0000532` | Optional (optional)                   |

**9. School subjects and school types**

See [school subject ontology](#school-subject-ontology) and [school type ontology](#school-type-ontology).

**10. Units** (`qudt:Unit`)

*Hour* (`qudt:HR`), *minute* (`qudt:MIN`) and *Unterrichtsstunde* (`LP_0000535`, lesson).

### Relations (properties)

The table lists the object and datatype properties of the Curriculum Ontology as well as the reused relations that are used in the curriculum data. A dash means that no domain or range is specified.

**Structure**

| Property                     | IRI           | Domain        | Range | Superproperty / inverse                     |
|------------------------------|---------------|---------------|-------|---------------------------------------------|
| **has direct part** (*hat direkten Teil*) | `LP_0000565`  | –             | –     | sub-property of *has part*; inverse: *direct part of* (*direkt Teil von*, `LP_0000566`) |
| **has part** (*hat Teil*)    | `BFO_0000051` | –             | –     | transitive; inverse: *part of* (*ist Teil von*, `BFO_0000050`) |
| **hat Position** (has position) | `LP_0000460`  | –             | xsd:int | order of a part within its parent element |
| **has reference** (*hat Verweis*) | `LP_0030071`  | –             | reference | sub-property of *described by* |
| **refers to** (*verweist auf*) | `LP_0030072`  | reference     | –     | sub-property of *is about*                  |
| **has function specification** (*hat Funktion*) | `LP_0000483`  | –             | function specification | sub-property of *described by*; inverse: *is function specification of* (*ist Funktion von*, `LP_0000495`) |

**Educational context**

| Property                     | IRI           | Domain        | Range | Superproperty / inverse                     |
|------------------------------|---------------|---------------|-------|---------------------------------------------|
| **of federal state** (*von Bundesland*) | `LP_0000029`  | –             | state designation | sub-property of *described by* |
| **for type of school** (*für Schulart*) | `LP_0000812`  | –             | school type | sub-property of *described by* |
| **has school subject** (*hat Schulfach*) | `LP_0000537`  | –             | school subject or school subject property | sub-property of *described by* |
| **has class level** (*hat Jahrgangsstufe*) | `LP_0000026`  | –             | class level | sub-property of *described by* |
| **has educational level** (*hat Schulstufe*) | `LP_0000047`  | –             | educational level | sub-property of *described by* |
| **has secondary phase** (*hat Oberstufensphase*) | `LP_0000556`  | –             | secondary phase | sub-property of *described by* |
| **for educational track** (*für Bildungsgangabschnitt*) | `LP_0000440` | curriculum      | –     | sub-property of *described by*     |
| **concretizes curriculum** (*konkretisiert Lehrplan*) | `LP_0000017`  | –             | curriculum | sub-property of *concretizes* (RO)      |

**Levels and qualifications**

| Property                     | IRI           | Domain        | Range | Superproperty / inverse                     |
|------------------------------|---------------|---------------|-------|---------------------------------------------|
| **has educational track level** (*hat Bildungsgangniveau*) | `LP_0000833`  | school type, curricular element, curriculum, educational standard (KMK) or educational track specification | educational track level | sub-property of *described by* |
| **has niveau** (*hat Niveau*) | `LP_0000840`  | school type, curricular element, curriculum or educational standard (KMK) | niveau | sub-property of *described by*; inverse: *is niveau of* (*ist Niveau von*, `LP_0000086`) |
| **has niveau stage** (*hat Niveaustufe*) | `LP_0000578`  | curricular element | Niveaustufe BE/BB | sub-property of *described by*; inverse: *is niveau stage of* (*ist Niveaustufe von*, `LP_0000580`) |
| **requires level** (*benötigt Niveau*) | `LP_0000071`  | –             | –     | sub-property of *described by*     |
| **leads to qualification** (*ermöglicht Abschluss*) | `LP_0000021`  | –             | school-leaving qualification specification | sub-property of *described by* |
| **has school type function** (*hat Schulartfunktion*) | `LP_0000343`  | –             | school type role | sub-property of *has role* (RO); inverse: *ist Schulartrolle von* (is school type role of, `LP_0000555`) |

**Text, identification and time**

| Property                     | IRI           | Domain        | Range | Superproperty / inverse                     |
|------------------------------|---------------|---------------|-------|---------------------------------------------|
| **has title** (*hat Titel*)  | `LP_0030056`  | curricular element or curriculum | title | sub-property of *described by* |
| **has description** (*hat Beschreibung*) | `LP_0030051`  | curricular element or curriculum | description | sub-property of *described by* |
| **has number** (*hat Nummer*) | `LP_0030057`  | curricular element | ID number | sub-property of *described by* |
| **uri**                      | `LP_0000463`  | –             | –     | URL of the original document at the publisher |
| **has validity scope** (*hat Gültigkeitsbereich*) | `LP_0000550`  | –             | validity scope | sub-property of *described by* |
| **von Datum** (from date)    | `LP_0000548`  | validity scope | xsd:dateTimeStamp | sub-property of *has value* |
| **to date** (*bis Datum*)    | `LP_0000549`  | validity scope | xsd:dateTimeStamp | sub-property of *has value* |
| **veröffentlicht am** (published on) | `LP_0000553`  | curriculum      | xsd:dateTimeStamp | sub-property of *has value*  |
| **has value** (*hat Wert*)   | `LP_0000344`  | –             | –     | general datatype property for values        |
| **has unit** (*hat Einheit*) | `qudt:hasUnit` | –            | –     | from QUDT                                   |

**Base relations**

| Property                     | IRI           | Domain        | Range | Superproperty / inverse                     |
|------------------------------|---------------|---------------|-------|---------------------------------------------|
| **is about** (*beschreibt*)  | `IAO_0000136` | information content entity | – | inverse: *described by* |
| **described by** (*wird beschrieben von*) | `LP_0000024`  | –             | –     | inverse: *is about*; superproperty of almost all descriptive properties |


## Mapping the different terminologies of the states

Just as the education systems of the states differ, so do their curricula. Each state structures its curricula in its own way and in part uses different vocabulary for the same or similar concepts. Even within a state, structure and terms differ from subject to subject. In addition, there are peculiarities of individual states, such as concrete teaching examples or detailed time specifications, which do not exist in other curricula.

In the analysis of the curricula of all states – initially for the subjects German, mathematics, English (or first foreign language) and physics (or general studies or natural sciences) – the core content components that occur in almost all curricula were identified. They form the generic **curricular elements**. The terms used by the states are assigned to these via their function. The following table shows how many state-specific classes (including the classes of the educational standards) carry each function in rc6, with some examples:

| Function                              | generic class             |       Classes | Examples                                                                    |
|---------------------------------------|---------------------------|--------------:|-----------------------------------------------------------------------------|
| Fragmentfunktion                      | fragment                  | 16            | *Lehrplanfragment (BY)*, *Lehrplanfragment (HH)*                            |
| Bereichsfunktion                      | area                      | 119           | *Lernbereich (BY)*, *Kompetenzbereich (HH)*, *Leitidee (BW)*, *Inhaltsfeld (HE)* |
| Kompetenzbeschreibungsfunktion        | competency specification  | 73            | *Kompetenzerwartung (BY)*, *Standard (BE)*, *Anforderung (HH)*, *Lernziel (RP)* |
| Lerninhaltsbeschreibungsfunktion      | learning content          | 82            | *Inhalt zu den Kompetenzen (BY)*, *Kerninhalt (NI)*, *Gegenstand (BE)*      |
| Hinweisbeschreibungsfunktion          | note                      | 91            | *Bemerkung (SN)*, *Hinweis und Anregung (MV)*, *Unterrichtsanregung (BE)*   |
| Verweisbeschreibungsfunktion          | reference                 | 47            | *Verweis auf vernetzte Kompetenzen (BE)*, *Verweis auf Basiskonzept (NW)*   |
| Leitperspektivenbeschreibungsfunktion | guiding perspective       | 12            | *Leitperspektive (HH)*, *Querschnittsthema (MV)*, *Bildungs- und Erziehungsziel (SN)* |
| Materialbeschreibungsfunktion         | –                         | 4             | *learning material (BE)* (*Lernmaterial (BE)*), *additional material (BB)* (*Zusatzmaterial (BB)*) |

For some of the classes, the reference functions (*Prozessbezug* – process reference, *Inhaltsbezug* – content reference, *Domänenbezug* – domain reference) are added as a second function and indicate what an element relates to in terms of content – e.g. *Prozessbezogene Kompetenz (NI)* (process-related competence) or *Leitidee (BW)* (guiding idea) with content reference.

### Integration of the educational standards

**The role of the Standing Conference of the Ministers of Education and Cultural Affairs (KMK) and the use of its educational standards in the ontology**

The Standing Conference of the Ministers of Education and Cultural Affairs (Kultusministerkonferenz, KMK) is the central body of the 16 states for education, science and culture. Since education is the responsibility of the states, the KMK ensures that important aspects are coordinated nationwide – among other things through common framework requirements, the coordination of school-leaving qualifications and nationally binding [educational standards](https://www.kmk.org/themen/qualitaetssicherung-in-schulen/bildungsstandards.html).

For many educational standards, the IQB (Institut zur Qualitätsentwicklung im Bildungswesen, Institute for Educational Quality Improvement) provides [machine-readable data](https://iqb-vocabs.github.io/vokabulare/bildungsstandards.html), for example for German, mathematics, the first foreign language (English/French) and the natural sciences (biology, chemistry, physics).

In the ontology, the educational standards are modeled according to the same principle as the curricula of the states:

- The class **educational standard (KMK)** (*Bildungsstandard (KMK)*, `LP_0000571`) corresponds to the curriculum at state level.
- **element (Bista)** (*Element (Bista)*, `LP_0000536`) groups the curricular elements of the educational standards, analogous to *Element (XX)* for the states.
- Dedicated classes such as *Kompetenzbereich (Bistas)* (competence area), *Standard (Bistas)*, *Leitidee (Bista)* (guiding idea) or *Basiskonzept (Bistas)* (basic concept) carry functions like the state classes and are thus assigned to the CE classes.
- The subjects of the educational standards are grouped in the class **BistaFach**, the levels as separate individuals such as *Grundschulniveau (Bista)* or *Gymnasialniveau Sek II (Bista)*.

The elements of the educational standards thus serve as reference points with which curriculum components of the states can be linked.

However, the educational standards refer to entire educational stages – the end of primary school, the Erster and Mittlerer Schulabschluss and the Allgemeine Hochschulreife – whereas the curricula are mostly structured by class level. Moreover, educational standards exist only for the subjects mentioned. They are therefore not sufficient as a common denominator of all curricula, but they are an important reference source.


## Outlook on the following chapters

This chapter has described the structure of the Curriculum Ontology: the basic ontological assumptions, the layers from the educational context to the relations, the linking of the state-specific terms to the shared core via functions, and the reused ontologies and vocabularies. The following chapters show how this model is used in practice:

- The chapter [Patterns](patterns.en.md) illustrates with concrete modeling patterns how curricula, curricular elements, levels and time specifications are represented in the data.
- The chapter [SPARQL queries](sparql.en.md) (SPARQL: SPARQL Protocol and RDF Query Language; RDF: Resource Description Framework) shows how the curriculum data can be queried across states, for example via the functions and the shared classes.
- The chapter [Usage](usage.en.md) describes the available release files, access to the data and their validation.
