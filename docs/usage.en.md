# Usage

This chapter describes how the Curriculum Ontology (Lehrplan-Ontologie) and the curriculum data can be used in practice: which files are available, how the ontology and the data are accessed, how custom curriculum data are created and validated, and under which conditions the ontology may be used.


## Release artifacts

The ontology is developed with the [Ontology Development Kit (ODK)](https://github.com/INCATools/ontology-development-kit) and provided in several variants in the [GitHub repository](https://github.com/FWU-DE/lehrplan-ontologie). The files are available in the Web Ontology Language (OWL) in the [RDF/XML](https://www.w3.org/TR/rdf-syntax-grammar/) format (RDF: Resource Description Framework; XML: Extensible Markup Language) and, in some cases, additionally in the [Turtle](https://www.w3.org/TR/turtle/) format:

| File | Content | Suitable for |
|-------|--------|--------------|
| `lp.owl` / `lp.ttl` | current version; corresponds to `lp-full` | most applications |
| `lp-full.owl` / `lp-full.ttl` | complete ontology: all classes, properties and axioms of the Curriculum Ontology, the terms used from the Basic Formal Ontology (BFO), the Relation Ontology (RO), the Information Artifact Ontology (IAO) and the QUDT vocabulary (Quantities, Units, Dimensions and Types), as well as the school subjects and school types of the federal states | queries, reasoning, validation |
| `lp-base.owl` / `lp-base.ttl` | only the classes, properties and individuals of the Curriculum Ontology itself; reused terms are only referenced, school subjects and school types are not included | import into custom ontologies |
| `lp-simple.owl` / `lp-simple.ttl` | simplified variant without equivalence axioms (`owl:equivalentClass`) | applications that only need the class hierarchy |
| `lp-land-XX-full.owl` | state-specific modules, one per federal state (e.g. `lp-land-BY-full.owl`) | working with the terms of a single state |
| `lp-bista-full.owl` | module for the educational standards of the Standing Conference of the Ministers of Education and Cultural Affairs (Kultusministerkonferenz, KMK) | working with the KMK educational standards |

!!! note "Limitation of `lp-simple`"

    Since `lp-simple` contains no equivalence axioms, a reasoner cannot use it to assign the state-specific classes to the shared classes such as *area* (*CE-Bereich*, `LP_0000349`) (see [design principle](structure.en.md#modeling-design-principle)). For cross-state analyses, `lp-full` must therefore be used.


## Versions

The versions are published as [releases in the repository](https://github.com/FWU-DE/lehrplan-ontologie/releases). The version numbers follow the scheme `1.0.0rcN`; "rc" stands for *release candidate*, i.e. a pre-release before the first stable version 1.0.0.

| Version | Date | Main changes |
|---------|-------|------------------------|
| 1.0.0rc6 | 2026-10-25 | separation of specification and real-world entity for school-leaving qualification and educational track, direct part relation, units from QUDT, extended school subject mappings |
| 1.0.0rc5 | 2026-09-21 | added missing general axiom for the upper secondary level (Sekundarstufe II) |
| 1.0.0rc4 | 2026-09-14 | cleaned up axioms of *note* (*CE-Hinweis*) and other classes |
| 1.0.0rc3 | 2026-07-28 | revised documentation and patterns, introduced temporal information |
| 1.0.0rc2 | 2026-02-24 | import of properties from SKOS (Simple Knowledge Organization System), numerous minor improvements |
| 1.0.0rc1 | 2026-01-07 | first pre-release |

### Changes in version 1.0.0rc6

Version rc6 contains changes that may affect existing data:

- **School-leaving qualifications**: `LP_0000019` now stands for the *school-leaving qualification specification* (*Schulabschlussspezifikation*). The new class `LP_0000008` *school-leaving qualification role* (*Schulabschluss*) describes the role that a person obtains with the qualification.
- **Educational tracks**: `LP_0000816` now stands for the *educational track specification* (*Bildungsgangspezifikation*). The new class `LP_0000567` *educational track* (*Bildungsgang*) describes the process that a person goes through.
- **School types**: The *school type role* (*Schulartfunktion*, `LP_0000475`) is now a role instead of a function in the sense of BFO.
- **Roles and competences**: The teacher role and the student role require a person as bearer; a competence requires a person and a competency specification.
- **Structure**: The new properties *has direct part* (*hat direkten Teil*, `LP_0000565`) and *direct part of* (*direkt Teil von*, `LP_0000566`) represent the immediate structure.
- **Units**: Temporal specifications refer to their unit via `qudt:hasUnit`.

Migrating existing data to rc6 requires the following steps:

1. Check data that use the reinterpreted IRIs (Internationalized Resource Identifiers) for school-leaving qualifications (`LP_0000019`), educational tracks (`LP_0000816`) and school types (`LP_0000475`).
2. Replace references to units via `LP_0000041` with `qudt:hasUnit`.
3. Replace references via `LP_0000477` (*konkretisiert Schulart*, concretizes school type) with `LP_0000024` (*described by*, *wird beschrieben von*).


## Access

### IRIs of the ontology

The ontology IRI `https://w3id.org/lehrplan/ontology/` is permanently redirected to the current version via the [w3id.org](https://w3id.org/) service. Which format is delivered depends on the requested content type (*content negotiation*):

| Requested content type | Result |
|------------------------|----------|
| `text/turtle` | ontology in Turtle format |
| `application/rdf+xml` | ontology in RDF/XML format |
| `text/html` (web browser) | reference documentation |

The version IRI (e.g. `https://w3id.org/lehrplan/ontology/1.0.0rc6`) and the IRIs of the individual terms (e.g. `https://w3id.org/lehrplan/ontology/LP_0000438`) currently also point to the current version of the ontology. Older versions can be retrieved via the releases in the repository.

### SPARQL endpoint

The curriculum data of the federal states can be queried together with the ontology via the [SPARQL endpoint](https://mem.bmi.fwu.de/sparql) (SPARQL: SPARQL Protocol and RDF Query Language). The endpoint follows the [SPARQL 1.1 protocol](https://www.w3.org/TR/sparql11-protocol/) and can be used in a web browser, from the command line or from within programs. How the data are organized in graphs there and what typical queries look like is described in the chapter [SPARQL queries](sparql.en.md).

Query with `curl` on the command line, with the result in CSV format (Comma-Separated Values):

```bash
curl -s -G "https://mem.bmi.fwu.de/sparql" \
     -H "Accept: text/csv" \
     --data-urlencode "query=
PREFIX Lehrplan:       <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>
PREFIX sachsen:        <https://w3id.org/lehrplan/ontology/LP_3000047>
SELECT (COUNT(DISTINCT ?lehrplan) AS ?anzahl)
WHERE { ?lehrplan a Lehrplan: ; von_bundesland: sachsen: . }"
```

The same query in Python, using only the standard library and with the result in JSON format (JavaScript Object Notation):

```python
import json
import urllib.parse
import urllib.request

abfrage = """
PREFIX Lehrplan:       <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>
PREFIX sachsen:        <https://w3id.org/lehrplan/ontology/LP_3000047>
SELECT (COUNT(DISTINCT ?lehrplan) AS ?anzahl)
WHERE { ?lehrplan a Lehrplan: ; von_bundesland: sachsen: . }
"""
url = "https://mem.bmi.fwu.de/sparql?" + urllib.parse.urlencode({"query": abfrage})
anfrage = urllib.request.Request(url, headers={"Accept": "application/sparql-results+json"})
with urllib.request.urlopen(anfrage, timeout=60) as antwort:
    ergebnis = json.load(antwort)

for zeile in ergebnis["results"]["bindings"]:
    print(zeile["anzahl"]["value"])
```

### Processing the ontology locally

The ontology can also be loaded directly and queried locally, for example with the Python library [rdflib](https://rdflib.readthedocs.io/). The following example lists the state-specific names for curricula:

```python
import rdflib

g = rdflib.Graph()
g.parse("https://w3id.org/lehrplan/ontology/")

abfrage = """
PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Lehrplan: <https://w3id.org/lehrplan/ontology/LP_0000438>
SELECT ?klasse ?bezeichnung
WHERE {
  ?klasse rdfs:subClassOf Lehrplan: ;
          rdfs:label ?bezeichnung .
  FILTER(LANG(?bezeichnung) = "de")
}
ORDER BY ?bezeichnung
"""
for zeile in g.query(abfrage):
    print(zeile.bezeichnung)
```


## Integration into custom ontologies

Custom ontologies that use or extend terms of the Curriculum Ontology usually import `lp-base`. In this way, only the terms of the Curriculum Ontology itself are included; the reused ontologies such as BFO and IAO are imported independently. Since the ontology and version IRIs point to the complete ontology, `lp-base` is imported via the file of a specific release:

```turtle
@prefix owl: <http://www.w3.org/2002/07/owl#> .

<https://www.example.org/meine-ontologie> a owl:Ontology ;
    owl:imports <https://raw.githubusercontent.com/FWU-DE/lehrplan-ontologie/v1.0.0rc6/lp-base.owl> .
```

If the complete ontology is needed, importing it via the version IRI `https://w3id.org/lehrplan/ontology/1.0.0rc6` is sufficient.

The Curriculum Ontology deliberately uses opaque (non-descriptive) IRIs such as `LP_0000438`. New terms in custom extensions should be given their own namespace and not be created in the namespace of the Curriculum Ontology. Proposals for new terms in the Curriculum Ontology itself are accepted by the project via the repository (see [Contributing](#contributing)).


## Creating custom curriculum data

Curriculum data are created according to the patterns from the chapter [Patterns](patterns.en.md). For data that are to be used together with the existing curriculum data, the following rules apply:

1. **Use state-specific classes**: Each element receives the class from the terminology of its federal state, e.g. *Lernbereich (SN)* (learning area, Saxony) or *Kompetenzerwartung (BY)* (expected competence, Bavaria). The assignment to the shared classes such as *area* follows from reasoning (see [Pattern 8](patterns.en.md#pattern-8-functions)).
2. **Specify the context**: The curriculum carries the federal state, school type, school subject and, where applicable, class level and educational level (see [Pattern 1](patterns.en.md#pattern-1-curriculum-of-a-federal-state)). For school subjects and school types, the IRIs from the school subject ontology (Schulfach-Ontologie) and the school type ontology (Schulart-Ontologie) are used.
3. **Represent the structure**: Elements are linked to each other via *has direct part*; the order is given by *hat Position* (has position) (see [Pattern 6](patterns.en.md#pattern-6-hierarchy-of-curricular-elements)).
4. **Title as an information entity**: The text of an element is given as a *title* (*Titel*, `LP_0000346`) with *has value* (*hat Wert*, `LP_0000344`). The `rdfs:label` of the element corresponds to the value of its title (see [Pattern 2](patterns.en.md#pattern-2-title-description-and-id-number)).
5. **Assign stable IRIs**: Each element receives an IRI that remains unchanged in later updates of the data, so that other systems can refer to it permanently. Deriving the IRI from an identifier in the source data has proven effective.

The following example shows a minimal Saxon curriculum with one learning area (*Lernbereich*) and one learning objective (*Lernziel*):

```turtle
@prefix rdfs:                       <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex:                         <https://www.example.org/> .
@prefix Lehrplan_SN:                <https://w3id.org/lehrplan/ontology/LP_0000818> .
@prefix Lernbereich_SN:             <https://w3id.org/lehrplan/ontology/LP_0002113> .
@prefix Lernziel_und_Lerninhalt_SN: <https://w3id.org/lehrplan/ontology/LP_0002115> .
@prefix Titel:                      <https://w3id.org/lehrplan/ontology/LP_0000346> .
@prefix von_bundesland:             <https://w3id.org/lehrplan/ontology/LP_0000029> .
@prefix sachsen:                    <https://w3id.org/lehrplan/ontology/LP_3000047> .
@prefix fuer_schulart:              <https://w3id.org/lehrplan/ontology/LP_0000812> .
@prefix oberschule_sn:              <https://w3id.org/schulart/SN_0000003> .
@prefix hat_schulfach:              <https://w3id.org/lehrplan/ontology/LP_0000537> .
@prefix mathematik_sn:              <https://w3id.org/schulfach/SN_0000012> .
@prefix hat_jahrgangsstufe:         <https://w3id.org/lehrplan/ontology/LP_0000026> .
@prefix jahrgangsstufe_5:           <https://w3id.org/lehrplan/ontology/LP_2000005> .
@prefix hat_direkten_teil:          <https://w3id.org/lehrplan/ontology/LP_0000565> .
@prefix hat_position:               <https://w3id.org/lehrplan/ontology/LP_0000460> .
@prefix hat_titel:                  <https://w3id.org/lehrplan/ontology/LP_0030056> .
@prefix hat_wert:                   <https://w3id.org/lehrplan/ontology/LP_0000344> .

# Lehrplan mit Kontextangaben
ex:lehrplan_1 a Lehrplan_SN: ;
    rdfs:label "Oberschule Mathematik" ;
    hat_titel: ex:titel_1 ;
    von_bundesland: sachsen: ;
    fuer_schulart: oberschule_sn: ;
    hat_schulfach: mathematik_sn: ;
    hat_direkten_teil: ex:lernbereich_1 .

# Lernbereich als erste Gliederungsebene
ex:lernbereich_1 a Lernbereich_SN: ;
    rdfs:label "Arbeiten mit natürlichen Zahlen" ;
    hat_titel: ex:titel_2 ;
    von_bundesland: sachsen: ;
    hat_jahrgangsstufe: jahrgangsstufe_5: ;
    hat_position: 1 ;
    hat_direkten_teil: ex:lernziel_1 .

# Lernziel innerhalb des Lernbereichs
ex:lernziel_1 a Lernziel_und_Lerninhalt_SN: ;
    rdfs:label "Kennen der Darstellung natürlicher Zahlen im Zehnersystem" ;
    hat_titel: ex:titel_3 ;
    von_bundesland: sachsen: ;
    hat_position: 1 .

# Titel als eigene Informationseinheiten; der Wert entspricht dem rdfs:label
ex:titel_1 a Titel: ; hat_wert: "Oberschule Mathematik" .
ex:titel_2 a Titel: ; hat_wert: "Arbeiten mit natürlichen Zahlen" .
ex:titel_3 a Titel: ; hat_wert: "Kennen der Darstellung natürlicher Zahlen im Zehnersystem" .
```

If the source data are available in structured form, for example as tables or in a custom data format, they can be transformed into this form with mapping languages such as RML (RDF Mapping Language) or YARRRML (see [Tools](ontology.en.md#tools)).


## Reasoning

Many analyses require that a reasoner has processed the data together with the ontology. Only then are, for example, the state-specific elements assigned to the shared classes such as *area*, the transitive relation *hat Teil* (has part) derived from *has direct part*, and inverse relations added. The SPARQL endpoint already holds these derived triples in separate graphs (see [Structure of the endpoint](sparql.en.md#structure-of-the-endpoint)).

For custom data, it is recommended to compute the inferences once and store them together with the data (materialization). Suitable reasoners are those that fully support the OWL 2 DL variant (DL: Description Logics), for example [Konclude](https://github.com/konclude/Konclude) or HermiT, which can be used together with the [ROBOT](https://robot.obolibrary.org/reason) tool. Konclude classifies the ontology in version rc6 in a fraction of a second; HermiT may take considerably longer because of the numerous value restrictions (`owl:hasValue`) in the class definitions.


## Validation

The [`shapes/`](https://github.com/FWU-DE/lehrplan-ontologie/tree/main/shapes) directory of the repository contains shapes in the [Shapes Constraint Language (SHACL)](https://www.w3.org/TR/shacl/) that can be used to check curriculum data for conformance with the patterns:

| Shape | Checks whether … |
|-------|-------------|
| `auto-shapes` | the properties are used with values of the intended classes (generated automatically from the ontology) |
| `bereich` | every area and every competency specification is part of a superordinate element |
| `lehrplan bundesland` | every curriculum is assigned to a federal state |
| `titles` | every curriculum and every curricular element has a title and the `rdfs:label` corresponds to the value of the title |
| `textual entity` | every title and every description has a text value and refers to an element |
| `verweis` | every reference is assigned to an element and points to a target |
| `nonull` | no `rdfs:label` has the value "null" |

Since several shapes refer to derived classes and relations, the data are merged with the ontology and materialized before validation. The procedure corresponds to the script `test.sh` in the `shapes/` directory:

1. Merge ontology and data, e.g. with `robot merge`.
2. Compute the inferences with a reasoner, e.g. with Konclude or with `robot reason`, and add them to the data.
3. Validate the result against the shapes with [pySHACL](https://github.com/RDFLib/pySHACL), e.g. `python3 -m pyshacl -s shapes/bereich/shape.ttl daten-materialisiert.ttl`.


## Technical reference

A complete list of all classes and properties with their definitions is provided by the [reference documentation](https://fwu-de.github.io/lehrplan-ontologie/index-en.html) generated with Widoco.


## License and citation

The Curriculum Ontology is licensed under [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/deed.en). It may be used, modified and redistributed, provided that authorship is credited and modifications are published under the same license.

Suggested citation:

> Lehrplan Ontology. Version 1.0.0rc6, https://w3id.org/lehrplan/ontology


## Contributing

Errors, questions and proposals for new terms can be reported as an [issue in the repository](https://github.com/FWU-DE/lehrplan-ontologie/issues). The [contribution guidelines](https://github.com/FWU-DE/lehrplan-ontologie/blob/main/CONTRIBUTING.md) describe how bug reports and change proposals should be structured; the project's [code of conduct](https://github.com/FWU-DE/lehrplan-ontologie/blob/main/CODE_OF_CONDUCT.md) applies to all collaboration. Subject-matter questions about the curriculum data are answered by the editorial team of the MEM project (Metadata for Educational Media) at [redaktion@mem.schule](mailto:redaktion@mem.schule). How identifiers are assigned, versions are published and changes are coordinated is described in the chapter [Governance and further development](governance.en.md).


## Outlook on the following chapters

- The chapter [Knowledge graph](knowledge-graph.en.md) describes which curriculum data are available in the SPARQL endpoint, where they come from and what particularities the data of the individual federal states have.
- The chapter [Governance and further development](governance.en.md) explains how the ontology is maintained and versioned and how federal states and experts can contribute.
- The [Glossary](glossar.en.md) summarizes the most important terms and abbreviations.
