# Governance and further development

An ontology on which data and applications rely needs reliable rules for its maintenance: Who decides on changes? How are new terms and identifiers created? How are versions published, and what happens to terms that are no longer needed? This chapter describes the rules according to which the Curriculum Ontology (Lehrplan-Ontologie, LP) is maintained and further developed.


## Responsibility

The Curriculum Ontology is developed and maintained in the project [MEM (Metadata for Educational Media)](https://mem.schule/) at the [FWU Institut für Film und Bild in Wissenschaft und Unterricht](https://fwu.de/). Decisions on content, in particular on the representation of the curricula of the federal states, are coordinated with the **working group of the federal states (Fachgruppe der Länder)**, in which curriculum experts of the federal states are represented. The ontological modeling is carried out in cooperation with ontology experts of yovisto GmbH (see [About us](about.en.md)).


## Development environment

The ontology is developed in the public [GitHub repository](https://github.com/FWU-DE/lehrplan-ontologie) with the [Ontology Development Kit (ODK)](https://github.com/INCATools/ontology-development-kit). Only the editor file `src/ontology/lp-edit.owl` is edited, for example with [Protégé](https://protege.stanford.edu/). From it, the ODK generates the published variants with every release (see [Release artifacts](usage.en.md#release-artifacts)) and runs automatic checks in the process. In addition, the patterns and example data are validated with the SHACL shapes (SHACL: Shapes Constraint Language) of the repository (see [Validation](usage.en.md#validation)).


## Identifiers

### Structure

All classes, properties and fixed individuals of the ontology have an Internationalized Resource Identifier (IRI) of the form

```text
https://w3id.org/lehrplan/ontology/LP_NNNNNNN
```

with a seven-digit number, e.g. `LP_0000438` for *curriculum* (*Lehrplan*). The identifiers are deliberately **opaque**: they contain neither the name nor the position of a term in the hierarchy. As a result, an identifier remains valid when the label, the definition or the classification of a term changes. The human-readable labels are given in `rdfs:label`.

An identifier, once published, is not deleted and not reused for another term.

### Assignment

So that several people can work on the ontology at the same time without identifiers being assigned twice, each editor receives their own number range. The ranges are defined in the file [`src/ontology/lp-idranges.owl`](https://github.com/FWU-DE/lehrplan-ontologie/blob/main/src/ontology/lp-idranges.owl), from which Protégé assigns new identifiers automatically:

| Range                        | Use                                        |
|------------------------------|--------------------------------------------|
| `LP_0000001` – `LP_0009999`  | editor range 1                             |
| `LP_0010000` – `LP_0019999`  | editor range 2                             |
| `LP_0020000` – `LP_0029999`  | editor range 3                             |
| `LP_0030000` – `LP_0039999`  | editor range 4                             |
| `LP_0040000` – `LP_0049999`  | editor range 5                             |
| `LP_0050000` – `LP_0069999`  | editor range 6                             |
| `LP_0070000` – `LP_0999999`  | not yet assigned                           |

In addition, there are fixed blocks for individuals that are frequently referenced in the curriculum data: the class levels 1 to 13 are in the block `LP_2000xxx`, the sixteen federal states in the block `LP_3000xxx` (e.g. `LP_3000047` for Saxony).

Anyone who newly joins work on the ontology receives their own range before creating new terms.

### Identifiers of the data

The IRIs of the curricula and curricular elements in the curriculum data do not belong to the ontology and follow their own namespaces per data source (see [Knowledge graph](knowledge-graph.en.md#origin-of-the-data)). School subjects and school types are maintained in the [school subject ontology (Schulfach-Ontologie)](https://github.com/FWU-DE/schulfach-ontologie) and the [school type ontology (Schulart-Ontologie)](https://github.com/FWU-DE/schulart-ontologie).


## Versioning

The version numbers follow the `MAJOR.MINOR.PATCH` scheme of [semantic versioning](https://semver.org/). Until the first stable version 1.0.0, pre-releases are published with the suffix `rcN` (*release candidate*), currently **1.0.0rc6**.

Each version is identified in three ways:

- by the version IRI (`owl:versionIRI`), e.g. `https://w3id.org/lehrplan/ontology/1.0.0rc6`,
- by the version information (`owl:versionInfo`), e.g. `1.0.0rc6`,
- by a tag of the same name with a release in the repository, e.g. `v1.0.0rc6`.

The ontology IRI `https://w3id.org/lehrplan/ontology/` always points to the current version. Anyone who wants to use a specific version imports the files of the corresponding release (see [Integration into custom ontologies](usage.en.md#integration-into-custom-ontologies)). The previous versions and the changes in rc6 are listed in the section [Versions](usage.en.md#versions).

After the stable version 1.0.0, the following applies:

- **PATCH** (e.g. 1.0.1): corrections to labels, definitions or comments without effect on data,
- **MINOR** (e.g. 1.1.0): new terms or axioms that do not invalidate existing data,
- **MAJOR** (e.g. 2.0.0): changes that require an adaptation of existing data or queries, such as the reinterpretation or deprecation of terms.


## Deprecating terms

Terms that should no longer be used are not deleted but marked as obsolete according to the conventions of the [OBO Foundry](https://obofoundry.org/) (OBO: Open Biological and Biomedical Ontologies):

- The term receives `owl:deprecated true`.
- The label is given the prefix "obsolete", and the definition is supplemented with the reason.
- If there is a successor, *term replaced by* (`IAO_0100001`) points to it; otherwise, *consider* (`oboInOwl:consider`) can point to possible alternatives.
- Axioms that connect the term with other terms are removed so that obsolete terms no longer influence inferences.

The identifier is retained and remains resolvable, so that existing data remain understandable. Version 1.0.0rc6 contains no terms marked as obsolete.

If the meaning of an existing identifier is changed, as in rc6 with the separation of specification and real-world entity, this is described in the release notes together with the necessary migration steps (see [Changes in version 1.0.0rc6](usage.en.md#changes-in-version-100rc6)).


## Modeling rules

New terms follow the conventions that have become established in the ontology:

- **Classification under BFO and IAO.** Every class is placed under a class of the Basic Formal Ontology (BFO) or the Information Artifact Ontology (IAO); curricula and their components are information entities (see [Basic ontological understanding](structure.en.md#basic-ontological-understanding)).
- **Labels and definitions.** Every term receives a German `rdfs:label`; definitions are given as `skos:definition`, preferably in German and English and following the pattern "An X is a Y that …". So far, definitions exist mainly for the core classes; adding them for the remaining classes is part of the ongoing work.
- **State-specific terms.** Terms from the terminology of a federal state carry the state abbreviation in parentheses, e.g. *Lernbereich (BY)* (learning area, Bavaria). They are created as a subclass of the state's *Element (XX)* (element of state XX) with a fixed *function*, so that a reasoner can assign them to the generic CE classes (see [design principle](structure.en.md#modeling-design-principle)).
- **Properties.** New properties are created as sub-properties of the base relations of BFO, the Relation Ontology (RO) or the IAO; descriptive properties are usually placed under *described by* (*wird beschrieben von*, `LP_0000024`).
- **Reuse before creation.** If a suitable term exists in a reused ontology or vocabulary, it is used instead of creating a new one (see [Reused ontologies and vocabularies](structure.en.md#reused-ontologiesvocabularies)).
- **Patterns and validation.** Changes to the model are reflected in the [patterns](patterns.en.md) and checked with the SHACL shapes and a reasoner before they are included in a release.


## Contributing

### Reporting errors and proposing terms

Errors, questions and proposals for new terms are submitted as an [issue in the repository](https://github.com/FWU-DE/lehrplan-ontologie/issues). A good proposal for a new term contains:

- a label in German and, if possible, in English,
- a definition and, if available, a source, for example the curriculum in which the term is used,
- the proposed classification, e.g. a similar existing term,
- an example from the curriculum data.

Before a proposal is submitted, it is worth searching the [reference documentation](https://fwu-de.github.io/lehrplan-ontologie/index-en.html) to see whether the term already exists.

### Contributing changes

Changes to the ontology are submitted as a pull request: fork the repository, create a separate branch, edit the editor file `src/ontology/lp-edit.owl` and open the pull request with a reference to the associated issue. The [contribution guidelines](https://github.com/FWU-DE/lehrplan-ontologie/blob/main/CONTRIBUTING.md) describe the procedure in detail; the [code of conduct](https://github.com/FWU-DE/lehrplan-ontologie/blob/main/CODE_OF_CONDUCT.md) applies to all collaboration.

### Participation of the federal states

The federal states contribute their perspective via the **working group of the federal states**. Federal states whose curricula are to be included in the knowledge graph, or whose terminology is to be added to or corrected in the ontology, contact the MEM editorial team at [redaktion@mem.schule](mailto:redaktion@mem.schule). For the inclusion of new curriculum data, the section [Creating custom curriculum data](usage.en.md#creating-custom-curriculum-data) describes how data are structured according to the model of the ontology.


## Outlook on the following chapters

- The [Glossary](glossar.en.md) explains the most important terms and abbreviations of the Curriculum Ontology.
- The chapter [About us](about.en.md) introduces the people and institutions behind the ontology.
