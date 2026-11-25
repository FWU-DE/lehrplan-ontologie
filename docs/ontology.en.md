# Introduction to Ontologies

This section provides an overview of the concept, benefits and technical implementation of ontologies. It introduces the most important basic terms as orientation for understanding the Curriculum Ontology (Lehrplan-Ontologie) and, where appropriate, relates them to it. It cannot replace a thorough study of the subject; for this, see the [further reading](#further-reading-and-materials) at the end of the section.


## Concept

An ontology is a formal, logic-based representation of knowledge in a particular subject area (domain). It specifies which terms are used in this subject area, what they mean and how they relate to one another. These specifications are formulated so precisely that they are both understandable to humans and machine-processable.

Everything an ontology makes statements about is called an **entity**: physical objects such as persons or schools as well as processes, qualities, roles or information such as a curriculum.

Ontologies typically consist of **classes** (categories), **properties** (relations and attributes) and **axioms** (rules) that determine how the terms are related. Data described on the basis of an ontology can be interpreted uniformly, linked with one another and exchanged between applications, databases and subject areas.


## Benefits of ontologies

Ontologies provide a shared conceptual framework for data from different sources. In particular, they support:

- **Interoperability**: Systems that use the same ontology can correctly interpret each other's data, even if they are structured differently internally.
- **Integration and search**: Heterogeneous datasets can be merged, searched and analyzed via shared terms.
- **Quality assurance**: Unambiguous definitions and logical rules make it possible to detect contradictions and gaps in the data automatically.
- **Reusability**: Ontologies are a central building block of the [FAIR principles](https://www.go-fair.org/fair-principles/) (Findable, Accessible, Interoperable, Reusable), since they record the meaning of data explicitly and permanently.

Without such a framework, data often remain confined to individual systems and can only be reused or exchanged with considerable effort.

### Ontologies versus databases

Databases primarily serve the structured storage and efficient querying of data. They specify *how* data are organized, for example in tables and columns. Ontologies additionally specify *what* the data mean and how the terms are logically related. This meaning is formalized according to standardized methods and thereby enables automated reasoning, consistency checks and semantic interoperability between systems. Ontologies and databases are not mutually exclusive: the data of the Curriculum Ontology, for example, are held in a graph database (triple store).

### Ontologies versus metadata schemas

Metadata schemas describe which information about data is recorded, such as author, creation date or file format, and define uniform fields for it. They standardize the description of data but generally contain no formal logic about the meaning of the terms described. Ontologies go further: they define terms and relations explicitly and link them logically, so that relationships can be interpreted by machines, conclusions can be drawn and consistency can be checked. A metadata schema can usually be derived from an ontology; the reverse is possible only to a limited extent.

### Ontologies versus large language models (LLMs)

Ontologies and the knowledge graphs built on them represent knowledge **explicitly**: terms, entities and their relationships are formally defined and stored as verifiable statements. Inferences result from logical procedures whose results are reproducible and traceable.

Large language models (LLMs), by contrast, represent knowledge **implicitly** in the form of statistical patterns. Their answers are based on probabilities rather than on stored facts or formal rules. They process natural language as well as incomplete or ambiguous information very flexibly, but guarantee neither consistency nor a verifiable knowledge base.

The two approaches complement each other: ontologies are suited to traceability, quality assurance and reliable data integration, LLMs to interpretation, exploration and natural-language interaction. Ontologies can serve LLMs as a reliable frame of reference for interpreting terms unambiguously, reducing hallucinations and backing answers with verifiable facts.


## Benefits of an ontology for curricula

The German education system is organized federally. Each federal state develops its own curricula with its own structures, terms and document formats. An ontology provides a shared model for this that unambiguously describes and links competences, content, subjects, class levels and educational objectives. This results in the following advantages:

- **Comparability between the federal states**: Different designations, structures and levels of detail are mapped to a shared level of meaning. This makes it traceable which requirements in different states correspond to one another.
- **Interoperability of digital education platforms**: Learning management systems, textbook platforms, task databases and education portals can exchange content on a shared basis and make it findable across systems.
- **Improved search and recommendations**: Learning materials can be found not only by keywords but by competences and curricular relationships. For example, a material on fractions can be assigned to a specific mathematical competence even if that competence is named differently in the material.
- **Transparency for education governance and evaluation**: Educational standards, examination requirements and learning resources can be linked unambiguously. This facilitates analyses of competence development and curricular coverage.
- **Reliable use of artificial intelligence (AI)**: AI systems can classify and generate content more reliably if they can draw on an explicit knowledge structure with clearly defined pedagogical terms.

The objectives and scope of the Curriculum Ontology are described in detail in the section [Conceptual foundations](introduction.en.md).


## Basic concepts

Ontologies describe knowledge with a manageable number of central building blocks.

### Classes

Classes represent general terms or categories of a domain, for example:

- person
- school
- curriculum
- competence

Classes can be arranged hierarchically. All statements about a superclass also apply to its subclasses:

```text
Every teacher is a person.     (Teacher is a subclass of Person)
```

### Individuals

Individuals (instances) are the concrete entities that belong to a class:

```text
"Max Müller" is an instance of the class Person.
"Mathematics Grade 7 Gymnasium" is an instance of the class Curriculum.
```

### Properties

Properties connect individuals with one another or with values. The ontology language OWL ([Web Ontology Language](https://www.w3.org/TR/owl2-overview/), see [below](#owl-the-ontology-language)) distinguishes three kinds:

**Object properties** connect two individuals:

```text
Max teaches Class7b
Curriculum hasPart LearningArea1
```

**Datatype properties** connect an individual with a value, such as a number, a text or a date:

```text
Max hasName "Max Mustermann"
Max hasDateOfBirth "1970-01-01"
```

**Annotation properties** contain information for human readers, such as labels, definitions or comments. They have no logical meaning and are not taken into account in reasoning:

```text
SchoolSubject hasLabel "school subject"
SchoolSubject hasDefinition "A school subject is a field of study taught at schools …"
SchoolSubject hasComment "The definition still needs to be revised."
```

### Axioms

Axioms are formal statements about classes and properties. They form the logical core of an ontology and can be checked by machines:

```text
Every teacher is a person.
Every course is taught by at least one teacher.
Nothing can be both a student and a teacher.   (disjoint classes)
```

### Reasoning

Programs for automated reasoning (reasoners, see [Tools](#tools)) evaluate the axioms. They can

- derive new facts,
- automatically place classes in the hierarchy,
- detect contradictions (inconsistencies),
- make implicit knowledge explicit.

Example: if it is specified that only persons can have competences, and X has the competence "reading", the reasoner infers that X is a person:

```text
Only persons have competences.     (axiom)
X hasCompetence Reading            (fact)
→ X is a person.                   (inferred)
```

The Curriculum Ontology uses this mechanism to classify the terms of the federal states: since the Bavarian *Lernbereich (BY)* (learning area, Bavaria) bears the area function and *area* (*CE-Bereich*; CE: curricular element) is defined as a "curricular element with area function", the reasoner automatically classifies *Lernbereich (BY)* as a subclass of *area* (see [Pattern 8](patterns.en.md#pattern-8-functions)).


## Ontologies and knowledge graphs

In many applications, ontologies form the basis of knowledge graphs:

- The **ontology** specifies which kinds of entities exist and how they are related (schema level, also called *T-Box* for "terminological box").
- The **knowledge graph** contains the concrete entities and facts (data level, also called *A-Box* for "assertional box", i.e. the set of factual statements).

Only the interplay of both creates a semantic network that enables data integration and automated reasoning. In the case of the Curriculum Ontology, the curriculum data of the federal states form the knowledge graph; they can be queried via a [SPARQL endpoint](https://mem.bmi.fwu.de/sparql), an interface for queries in the standardized query language [SPARQL (SPARQL Protocol and RDF Query Language)](https://www.w3.org/TR/sparql11-overview/).


## RDF, RDFS and OWL

For machine processing, ontologies are stored in standardized formats of the [World Wide Web Consortium (W3C)](https://www.w3.org/):

| Standard | Purpose |
|----------|---------|
| [RDF (Resource Description Framework)](https://www.w3.org/TR/rdf11-concepts/) | data model: statements as triples of subject, predicate and object |
| [RDFS (RDF Schema)](https://www.w3.org/TR/rdf11-schema/) | simple schema: classes, subclasses, properties |
| OWL | expressive ontology language with logical semantics |

### RDF – the data model

RDF describes data as triples of the form `subject – predicate – object`, e.g. `Max – unterrichtetAn – SchuleA` (Max – teachesAt – SchoolA). Subject and predicate, and usually also the object, are denoted by an **IRI** ([Internationalized Resource Identifier](https://www.rfc-editor.org/rfc/rfc3987)). An IRI is a globally unique identifier, comparable to a web address. It rules out confusion and makes it possible to merge data from different sources.

RDF can be written in various syntaxes. This documentation mainly uses the easily readable [**Turtle**](https://www.w3.org/TR/turtle/) syntax. The following example describes a curriculum from Saxony:

```turtle
@prefix lp:   <https://w3id.org/lehrplan/ontology/> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex:   <https://www.example.org/> .

ex:lehrplan-mathe a lp:LP_0000438 ;           # is a curriculum
    rdfs:label "Gymnasium Mathematik" ;
    lp:LP_0000029 lp:LP_3000047 .             # of federal state: Saxony
```

Like many established ontologies, the Curriculum Ontology deliberately uses "opaque" (non-descriptive) IRIs such as `LP_0000438`. The human-readable label ("Lehrplan", curriculum) is stored as `rdfs:label` on the class. The IRI thus remains stable even if the label changes or is available in several languages.

### RDFS – the schema

RDFS extends RDF with the ability to define classes and properties and to arrange them hierarchically (`rdfs:subClassOf`, `rdfs:subPropertyOf`), as well as to specify labels (`rdfs:label`) and comments. RDFS forms the basis for OWL.

### OWL – the ontology language

OWL is the language for ontologies standardized by the W3C. It makes it possible to define classes via conditions, to characterize properties more precisely (e.g. as transitive or as inverse of one another) and to declare classes as disjoint.

In principle, ontologies can be formulated in various logics, such as first-order predicate logic, rule-based logics or description logics. The authoritative variant OWL 2 DL is based on **description logics** (DL), since these offer a balanced compromise between expressiveness and computability. Full predicate logic is more expressive, but reasoning in it is in general undecidable, i.e. there is no guarantee that a corresponding reasoning algorithm will actually terminate. Description logics are sufficient for class hierarchies, relations and restrictions and at the same time ensure that reasoners can reliably derive facts, detect contradictions and classify classes.

Two basic assumptions are essential for understanding OWL:

- **Open world assumption**: A statement that is not given is not considered false but unknown. If, for example, only the subject mathematics is recorded for a teacher, it does not follow that the teacher teaches no other subject. To the question "Does the teacher teach physics?", a conventional database would usually answer "no" (closed world assumption); from the perspective of OWL, the answer is "unknown".
- **Monotonicity**: New statements do not invalidate conclusions already drawn; further conclusions can only be added.

These properties make OWL particularly suitable for distributed, incomplete knowledge from different sources. To check whether data are complete – for example, whether every element has a title – the [Shapes Constraint Language (SHACL)](https://www.w3.org/TR/shacl/) is used in addition.

For applications with very large amounts of data, OWL 2 also defines three [profiles](https://www.w3.org/TR/owl2-profiles/) that restrict the means of expression so that reasoning can be implemented particularly efficiently: OWL 2 EL (named after the description logic *EL*) for ontologies with very many classes, OWL 2 QL (*Query Language*) for queries over large datasets and OWL 2 RL (*Rule Language*) for rule-based systems.


## Levels of ontologies

Ontologies can be divided by their degree of abstraction into levels that build on one another.

**Top-level ontologies** describe very general, domain-independent categories such as object, process, quality or time. They establish shared basic assumptions on which different ontologies can build. A well-known example is the [Basic Formal Ontology (BFO)](https://basic-formal-ontology.org/), which is widely used above all in scientific and biomedical applications.

**Mid-level ontologies** mediate between these general categories and specific subject areas. They provide reusable building blocks, for example for organizations, persons or information objects.

**Domain ontologies** describe the knowledge of a subject area, for example education, medicine, law or engineering, with precise domain-specific terms, definitions and axioms.

**Application ontologies** are tailored to a specific context of use and specialize domain ontologies for the requirements of a system, a project or a dataset.

### Significance of the classification

Instead of developing an ontology in isolation from individual datasets ("bottom-up"), it should ideally build on the higher levels ("top-down"):

1. A top-level ontology provides the fundamental categories.
2. Mid-level ontologies provide reusable patterns.
3. Domain ontologies describe the domain knowledge.
4. Application ontologies adapt the model to specific systems.

This layered structure improves consistency, reusability and interoperability. The Curriculum Ontology, for example, builds on BFO as its top-level ontology and uses relations from the [Relation Ontology (RO)](https://oborel.github.io/) as well as the [Information Artifact Ontology (IAO)](https://github.com/information-artifact-ontology/IAO) for information content entities (see [Reused ontologies](structure.en.md#reused-ontologiesvocabularies)).

The reasons for choosing BFO are described in the section [Choice of the top-level ontology](introduction.en.md#choice-of-the-top-level-ontology).

## Ontology development in practice

Developing an ontology is not a purely technical process; it combines domain modeling, logical formalization and continuous coordination with domain experts. The goal is not a complete ontology in the first draft, but a gradually growing, shared understanding of a field of knowledge. Development typically comprises the following steps:

1. **Domain analysis**: Defining the field of knowledge to be modeled (scope) and the questions the ontology is to answer. These *competency questions* determine which terms are actually needed (see [Competency questions of the Curriculum Ontology](introduction.en.md#competency-questions)).
2. **Term elicitation**: Identifying the central terms, relationships and properties, for example by analyzing existing documents and data models or through interviews with experts.
3. **Modeling**: Formalizing the terms as classes, properties and axioms and placing them in a hierarchy.
4. **Formalization**: Converting the model into OWL/RDF.
5. **Evaluation**: Checking with reasoners for contradictions and for the desired inferences, and checking with sample data whether the competency questions can be answered.
6. **Further development**: Adapting to new requirements, data or insights and publishing new versions. Ontologies are not finished artifacts but are developed continuously.

### Modeling principles

The quality of an ontology depends less on the tools used than on well-founded modeling decisions. The following principles have proven effective:

- **Unambiguous definitions**: Every term is defined clearly and comprehensibly.
- **Separation of class and individual**: Classes describe general categories, individuals concrete entities.
- **Reuse**: Established ontologies are reused instead of modeling terms anew.
- **Appropriate complexity**: An understandable ontology is generally more valuable than a maximally expressive one.
- **Explicit assumptions**: Implicit domain knowledge is formalized so that it can be evaluated by machines.
- **Stable identifiers**: Terms remain unambiguously referenceable over the long term via their IRIs.

What matters, therefore, is not the complexity of an ontology but its comprehensibility for humans and its reliable usability by machines.


## Tools

**Modeling and development**

- [Protégé](https://protege.stanford.edu/): widely used ontology editor for OWL 2 with visualization and integrated reasoners
- [Ontology Development Kit (ODK)](https://github.com/INCATools/ontology-development-kit): collection of tools and workflows for the entire life cycle of an ontology, including quality control, releases and imports; the Curriculum Ontology is developed with the ODK
- [ROBOT](https://robot.obolibrary.org/): command-line tool for typical tasks such as merging, checking and converting ontologies
- [OTTR (Reasonable Ontology Templates)](https://ottr.xyz/): language for reusable modeling patterns from which RDF and OWL data are generated
- [rdflib](https://github.com/RDFLib/rdflib) and [Owlready2](https://owlready2.readthedocs.io/): Python libraries for processing RDF data and ontologies
- Version control with Git, e.g. via [GitHub](https://github.com/): tracking changes, discussion and collaborative development

**Data integration**

- [RML (RDF Mapping Language)](https://rml.io/specs/rml/): language for the declarative mapping of structured data such as [CSV (Comma-Separated Values)](https://www.rfc-editor.org/rfc/rfc4180), [JSON (JavaScript Object Notation)](https://www.json.org/json-en.html), [XML (Extensible Markup Language)](https://www.w3.org/XML/) or relational databases to RDF; it is being further developed in the W3C Community Group [*Knowledge Graph Construction*](https://www.w3.org/community/kg-construct/) ([RML-Core](https://kg-construct.github.io/rml-core/spec/docs/))
- [YARRRML](https://rml.io/yarrrml/): compact notation for RML mappings based on [YAML (YAML Ain’t Markup Language)](https://yaml.org/) that is easier to read and write and is automatically translated into RML

**Checking and reasoning**

- Reasoners such as [HermiT](http://www.hermit-reasoner.com/), [Pellet](https://github.com/stardog-union/pellet) or [Konclude](https://github.com/konclude/Konclude): logical checking and automatic classification
- SHACL: W3C standard for checking whether data conform to specified constraints
- [OOPS! (Ontology Pitfall Scanner)](https://oops.linkeddata.es/): web service for detecting typical modeling errors

**Storage, querying and presentation**

- Triple stores such as [Virtuoso](https://vos.openlinksw.com/owiki/wiki/VOS) or [GraphDB](https://graphdb.ontotext.com/): databases for RDF data
- SPARQL: query language for RDF data and knowledge graphs
- [Widoco](https://github.com/dgarijo/Widoco): generation of documentation in web format [HTML (Hypertext Markup Language)](https://html.spec.whatwg.org/) from an ontology
- [RDF Grapher](https://www.ldf.fi/service/rdf-grapher): web service for displaying RDF data as a graph


## Repositories and terminology services

Ontologies are generally not searched for via general search engines but via ontology repositories and terminology services, for example:

- [TIB Terminology Service](https://terminology.tib.eu/ts) of the [TIB – Leibniz Information Centre for Science and Technology](https://www.tib.eu/)
- [Ontobee](https://ontobee.org/)
- [Linked Open Vocabularies (LOV)](https://lov.linkeddata.es/)
- [BioPortal](https://bioportal.bioontology.org/)


## Further reading and materials

**Tutorials and courses**

- [Pizza tutorial](https://www.michaeldebellis.com/post/new-protege-pizza-tutorial): practice-oriented introduction to creating OWL ontologies with Protégé
- [Ontology Development 101](https://protege.stanford.edu/publications/ontology_development/ontology101.pdf): methodological guide from Stanford University to developing a first ontology
- [OBO Academy – Ontology Design](https://oboacademy.github.io/obook/lesson/ontology-design/): freely accessible online course by the Open Biological and Biomedical Ontologies (OBO) community on the structure, reasoning and design principles of ontologies
- ["Knowledge Graphs – Foundations and Applications"](https://www.youtube.com/watch?v=CiU1sMbL3k4&list=PLNXdQl4kBgzubTOfY5cbtxZCgg9UTe-uF): lecture series by the Information Service Engineering (ISE) department at [FIZ Karlsruhe – Leibniz Institute for Information Infrastructure](https://www.fiz-karlsruhe.de/) on YouTube
- [YouTube channel of Barry Smith](https://www.youtube.com/channel/UCDYw4LTZfK27Q0lJ8pxQC8Q): talks on BFO and applied ontology

**Blogs**

- [Maria Keet](https://keet.wordpress.com/)
- [Michael DeBellis](https://www.michaeldebellis.com/)
- [Chris Mungall](https://douroucouli.wordpress.com/)

**Books**

- C. Maria Keet: [*An Introduction to Ontology Engineering*](https://people.cs.uct.ac.za/~mkeet/OEbook/). College Publications, 2018. Freely available under the Creative Commons license [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en) (Attribution – NonCommercial – ShareAlike).
- Pascal Hitzler, Markus Krötzsch, Sebastian Rudolph, York Sure: [*Semantic Web: Grundlagen*](https://www.semantic-web-grundlagen.de/) (in German). Springer, 2008.
- Robert Arp, Barry Smith, Andrew D. Spear: [*Building Ontologies with Basic Formal Ontology*](https://mitpress.mit.edu/9780262527811/building-ontologies-with-basic-formal-ontology/). MIT Press, 2015.
- Nicola Guarino, Daniel Oberle, Steffen Staab: "What Is an Ontology?" In: Steffen Staab, Rudi Studer (eds.): *Handbook on Ontologies*. Springer, 2009.


## Outlook on the following chapters

This section has introduced the general foundations: what ontologies are, which building blocks they consist of, how they are implemented with RDF, RDFS and OWL and according to which principles they are developed. The following chapters apply these foundations to curricula:

- The chapter [Conceptual foundations](introduction.en.md) describes the initial situation, objectives and scope of the Curriculum Ontology, introduces its central terms and explains the choice of BFO as top-level ontology.
- The chapter [Ontology model](structure.en.md) shows how classes, properties and axioms are concretely used in the Curriculum Ontology, for example to make the different terms of the federal states comparable via a shared core.
