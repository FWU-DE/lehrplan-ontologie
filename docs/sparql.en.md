# SPARQL queries

The curriculum data of the Curriculum Ontology (Lehrplan-Ontologie, LP) can be queried via the [SPARQL endpoint](https://mem.bmi.fwu.de/sparql) (SPARQL: SPARQL Protocol and RDF Query Language; RDF: Resource Description Framework). The examples on this page show typical queries; each can be run directly via the link "Direct link to the SPARQL endpoint".

## Structure of the endpoint

The data reside in named graphs, one per federal state or data source:

| Graph                                    | Content                                                 |
|------------------------------------------|---------------------------------------------------------|
| `https://w3id.org/lehrplan/by`           | Bavaria (BY)                                            |
| `https://w3id.org/lehrplan/sn`           | Saxony (SN)                                             |
| `https://w3id.org/lehrplan/rp`           | Rhineland-Palatinate (RP)                               |
| `https://w3id.org/lehrplan/graph/be`     | Berlin and Brandenburg (BE/BB, joint *Rahmenlehrpläne*, framework curricula) |
| `https://w3id.org/lehrplan/graph/bista`  | KMK educational standards                               |

In addition to the curriculum data, each of these graphs also contains the ontology itself as well as the school subjects and school types from the school subject and school type ontologies. Each graph has two subgraphs: `…/data` contains the recorded curriculum data, `…/inferences` the triples derived by a reasoner. The graph without a suffix (e.g. `…/by`) contains both. For most queries this combined graph is the right choice, because only through the derived triples

- is every element also an instance of its generic class (e.g. *area* (*CE-Bereich*, `LP_0000349`)) and carries its function (*has function specification* (*hat Funktion*)),
- is the transitive relation *has part* (*hat Teil*, `hat_teil:`) fully present – the data themselves only contain the direct structure via *has direct part* (*hat direkten Teil*, `hat_direkten_teil:`) or *direct part of* (*direkt Teil von*, `direkt_teil_von:`),
- are all curricula instances of the class *curriculum* (*Lehrplan*, `Lehrplan:`), regardless of their state-specific designation.

Since a triple in the combined graph can originate both from the data and from the inferences, `SELECT DISTINCT` is recommended.

## Notation of the queries

The classes, properties and individuals of the Curriculum Ontology have non-descriptive Internationalized Resource Identifiers (IRIs) such as `https://w3id.org/lehrplan/ontology/LP_0000438`. To keep the queries readable nonetheless, each IRI used is given its own prefix, which is named after its label and contains the complete IRI:

```sparql
PREFIX Lehrplan:       <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>
PREFIX sachsen:        <https://w3id.org/lehrplan/ontology/LP_3000047>
```

In the query text, the prefix then appears without a local name, e.g. `?lp a Lehrplan: .` or `?lp von_bundesland: sachsen: .`. The prefix names follow the same convention as on the page [Patterns](patterns.en.md): prefixes of classes begin with a capital letter, like their labels (`Lehrplan:`, `CE_Kompetenzspezifikation:`), prefixes of properties and individuals are written in lowercase (`von_bundesland:`, `sachsen:`). Umlauts are spelled out (`fuer_schulart:`), and for state-specific school subjects, school types and classes the state abbreviation is appended (`gymnasium_sn:`, `Lernbereich_SN:`). For custom queries, further terms can be added in the same way; the IRIs are listed in the [reference documentation](https://fwu-de.github.io/lehrplan-ontologie/index-en.html) and in the chapter [Ontology model](structure.en.md#relations-properties).


## Queries about the curricula

### Which curricula exist in Saxony?

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan%3A+++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+von_bundesland%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000029%3E%0APREFIX+sachsen%3A++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_3000047%3E%0A%0ASELECT+DISTINCT+%3Flehrplan+%3Ftitel%0AWHERE+%7B%0A%3Flehrplan+a+Lehrplan%3A+.%0A%3Flehrplan+von_bundesland%3A+sachsen%3A+.%0A%3Flehrplan+rdfs%3Alabel+%3Ftitel+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX Lehrplan:       <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>
PREFIX sachsen:        <https://w3id.org/lehrplan/ontology/LP_3000047>

SELECT DISTINCT ?lehrplan ?titel
WHERE {
?lehrplan a Lehrplan: .
?lehrplan von_bundesland: sachsen: .
?lehrplan rdfs:label ?titel .
}
```
or

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan_SN%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000818%3E%0A%0ASELECT+DISTINCT+%3Flehrplan+%3Ftitel%0AWHERE+%7B%0A%3Flehrplan+a+Lehrplan_SN%3A+.%0A%3Flehrplan+rdfs%3Alabel+%3Ftitel+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX Lehrplan_SN: <https://w3id.org/lehrplan/ontology/LP_0000818>

SELECT DISTINCT ?lehrplan ?titel
WHERE {
?lehrplan a Lehrplan_SN: .
?lehrplan rdfs:label ?titel .
}
```

### How many curricula exist in Saxony?

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan_SN%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000818%3E%0A%0ASELECT+%28COUNT%28DISTINCT+%3Flehrplan%29+AS+%3Fanzahl%29%0AWHERE+%7B%0A%3Flehrplan+a+Lehrplan_SN%3A+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX Lehrplan_SN: <https://w3id.org/lehrplan/ontology/LP_0000818>

SELECT (COUNT(DISTINCT ?lehrplan) AS ?anzahl)
WHERE {
?lehrplan a Lehrplan_SN: .
}
```

### How many curricula exist in Rhineland-Palatinate?

Counts all instances of the class curriculum in the RP graph: [Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdf%3A++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0A%0ASELECT+%28COUNT%28DISTINCT+%3Flp%29+AS+%3Fanzahl%29%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0AWHERE+%7B%0A++%3Flp+rdf%3Atype+Lehrplan%3A+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX Lehrplan: <https://w3id.org/lehrplan/ontology/LP_0000438>

SELECT (COUNT(DISTINCT ?lp) AS ?anzahl)
FROM <https://w3id.org/lehrplan/rp>
WHERE {
  ?lp rdf:type Lehrplan: .
}
```

### How many curricula exist in BY, SN, RP and BE/BB?

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdf%3A++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0A%0ASELECT+%3Fbundesland+%28COUNT%28DISTINCT+%3Flp%29+AS+%3Fanzahl%29%0AWHERE+%7B%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%7B%0A++++++%3Flp+rdf%3Atype+Lehrplan%3A+.+%7D%0A++++BIND%28%22Bayern%22+AS+%3Fbundesland%29+%7D%0A++UNION%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%7B%0A++++++%3Flp+rdf%3Atype+Lehrplan%3A+.+%7D%0A++++BIND%28%22Sachsen%22+AS+%3Fbundesland%29+%7D%0A++UNION%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E+%7B%0A++++++%3Flp+rdf%3Atype+Lehrplan%3A+.+%7D%0A++++BIND%28%22Rheinland-Pfalz%22+AS+%3Fbundesland%29+%7D%0A++UNION%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E+%7B%0A++++++%3Flp+rdf%3Atype+Lehrplan%3A+.+%7D%0A++++BIND%28%22Berlin%2FBrandenburg%22+AS+%3Fbundesland%29+%7D%0A%7D%0AGROUP+BY+%3Fbundesland%0AORDER+BY+DESC%28%3Fanzahl%29&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX Lehrplan: <https://w3id.org/lehrplan/ontology/LP_0000438>

SELECT ?bundesland (COUNT(DISTINCT ?lp) AS ?anzahl)
WHERE {
  { GRAPH <https://w3id.org/lehrplan/by> {
      ?lp rdf:type Lehrplan: . }
    BIND("Bayern" AS ?bundesland) }
  UNION
  { GRAPH <https://w3id.org/lehrplan/sn> {
      ?lp rdf:type Lehrplan: . }
    BIND("Sachsen" AS ?bundesland) }
  UNION
  { GRAPH <https://w3id.org/lehrplan/rp> {
      ?lp rdf:type Lehrplan: . }
    BIND("Rheinland-Pfalz" AS ?bundesland) }
  UNION
  { GRAPH <https://w3id.org/lehrplan/graph/be> {
      ?lp rdf:type Lehrplan: . }
    BIND("Berlin/Brandenburg" AS ?bundesland) }
}
GROUP BY ?bundesland
ORDER BY DESC(?anzahl)
```

## Queries about subjects

### Which subjects exist in Saxony?

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Schulfach%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000001%3E%0APREFIX+von_bundesland%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000029%3E%0APREFIX+sachsen%3A++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_3000047%3E%0A%0ASELECT+DISTINCT+%3Fschulfach%0AWHERE+%7B%0A++++%3Fs+a+Schulfach%3A+.%0A++++%3Fs+von_bundesland%3A+sachsen%3A+.%0A++++%3Fs+rdfs%3Alabel+%3Fschulfach+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX Schulfach:      <https://w3id.org/lehrplan/ontology/LP_0000001>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>
PREFIX sachsen:        <https://w3id.org/lehrplan/ontology/LP_3000047>

SELECT DISTINCT ?schulfach
WHERE {
    ?s a Schulfach: .
    ?s von_bundesland: sachsen: .
    ?s rdfs:label ?schulfach .
}
```

Lists all school subjects with their IRI, filtered by the prefix SN_:
[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+schulfaecher_sachsen%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2FSN_0000000%3E%0A%0ASELECT+DISTINCT+%3Ffach+%3Flabel%0AWHERE+%7B%0A++%3Ffach+rdf%3Atype+%3Ftype+%3B%0A++++++++rdfs%3Alabel+%3Flabel+.%0A++FILTER%28+STRSTARTS%28STR%28%3Ffach%29%2C+%22https%3A%2F%2Fw3id.org%2Fschulfach%2FSN%22%29+%29%0A++FILTER%28+%3Ffach+%21%3D+schulfaecher_sachsen%3A+%29+%23+Root-Knoten+ausblenden%0A%7D%0AORDER+BY+%3Flabel&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                 <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:                  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX schulfaecher_sachsen: <https://w3id.org/schulfach/SN_0000000>

SELECT DISTINCT ?fach ?label
WHERE {
  ?fach rdf:type ?type ;
        rdfs:label ?label .
  FILTER( STRSTARTS(STR(?fach), "https://w3id.org/schulfach/SN") )
  FILTER( ?fach != schulfaecher_sachsen: ) # Root-Knoten ausblenden
}
ORDER BY ?label
```

### Which subjects exist in BY, SN, RP and BE/BB?

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Schulfach%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000001%3E%0A%0ASELECT+DISTINCT+%3Fbundesland+%3Flabel%0AWHERE+%7B%0A++VALUES+%28%3Fprefix+%3Fbundesland%29+%7B%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FBY%22+%22Bayern%22%29%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FSN%22+%22Sachsen%22%29%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FRP%22+%22Rheinland-Pfalz%22%29%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FBB%22+%22Brandenburg%22%29%0A++%7D%0A++%3Ffach+a+Schulfach%3A+%3B%0A++++++++rdfs%3Alabel+%3Flabel+.%0A++FILTER%28+STRSTARTS%28STR%28%3Ffach%29%2C+%3Fprefix%29+%29%0A++FILTER%28+%21REGEX%28%3Flabel%2C+%22%5ESchulf%C3%A4cher%22%29+%29%0A%7D%0AORDER+BY+%3Fbundesland+%3Flabel&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:      <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Schulfach: <https://w3id.org/lehrplan/ontology/LP_0000001>

SELECT DISTINCT ?bundesland ?label
WHERE {
  VALUES (?prefix ?bundesland) {
    ("https://w3id.org/schulfach/BY" "Bayern")
    ("https://w3id.org/schulfach/SN" "Sachsen")
    ("https://w3id.org/schulfach/RP" "Rheinland-Pfalz")
    ("https://w3id.org/schulfach/BB" "Brandenburg")
  }
  ?fach a Schulfach: ;
        rdfs:label ?label .
  FILTER( STRSTARTS(STR(?fach), ?prefix) )
  FILTER( !REGEX(?label, "^Schulfächer") )
}
ORDER BY ?bundesland ?label
```
## Queries about the school types

### Which school types exist in Saxony?

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Schulart%3A+++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000111%3E%0APREFIX+sachsen%3A++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_3000047%3E%0APREFIX+von_bundesland%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000029%3E%0A%0ASELECT+DISTINCT+%3Fschulart%0AWHERE+%7B%0A++++%3Fs+a+Schulart%3A+.%0A++++%3Fs+von_bundesland%3A+sachsen%3A+.%0A++++%3Fs+rdfs%3Alabel+%3Fschulart+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX Schulart:       <https://w3id.org/lehrplan/ontology/LP_0000111>
PREFIX sachsen:        <https://w3id.org/lehrplan/ontology/LP_3000047>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>

SELECT DISTINCT ?schulart
WHERE {
    ?s a Schulart: .
    ?s von_bundesland: sachsen: .
    ?s rdfs:label ?schulart .
}
```

## Queries about the contents of the curricula

### In which curricula does the term "Zelle" (cell) occur?

Searches all four graphs for labels containing the term and returns the corresponding curriculum and the state. Since *has part* (`hat_teil:`) is already fully inferred in the combined graph, the query thereby reaches all levels of the structure. A property path with `+` is therefore not necessary and considerably slower on large graphs.
[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_teil%3A+%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0A%0ASELECT+DISTINCT+%3Fbundesland+%3FlpLabel+%3Ftreffer%0AWHERE+%7B%0A++VALUES+%28%3Fg+%3Fbundesland%29+%7B%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%22Bayern%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%22Sachsen%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E+%22Rheinland-Pfalz%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E+%22Berlin%2FBrandenburg%22%29%0A++%7D%0A++GRAPH+%3Fg+%7B%0A++++%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++++hat_teil%3A+%3Fnode+.+++++++%23+hat+Teil+%28alle+Ebenen%29%0A++++%3Fnode+rdfs%3Alabel+%3Ftreffer+.%0A++++FILTER%28CONTAINS%28LCASE%28%3Ftreffer%29%2C+%22zelle%22%29%29%0A++%7D%0A%7D%0AORDER+BY+%3Fbundesland+%3FlpLabel+%3Ftreffer&format=text%2Fhtml&timeout=0&signal_void=on)

```sparql
PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX Lehrplan: <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX hat_teil: <http://purl.obolibrary.org/obo/BFO_0000051>

SELECT DISTINCT ?bundesland ?lpLabel ?treffer
WHERE {
  VALUES (?g ?bundesland) {
    (<https://w3id.org/lehrplan/by> "Bayern")
    (<https://w3id.org/lehrplan/sn> "Sachsen")
    (<https://w3id.org/lehrplan/rp> "Rheinland-Pfalz")
    (<https://w3id.org/lehrplan/graph/be> "Berlin/Brandenburg")
  }
  GRAPH ?g {
    ?lp rdf:type Lehrplan: ;
        rdfs:label ?lpLabel ;
        hat_teil: ?node .       # hat Teil (alle Ebenen)
    ?node rdfs:label ?treffer .
    FILTER(CONTAINS(LCASE(?treffer), "zelle"))
  }
}
ORDER BY ?bundesland ?lpLabel ?treffer
```

### In which description texts does a term occur?

Also includes description literals (lp:LP_0030051 = *has description* (*hat Beschreibung*)) – returns more hits than a pure label search. Bavaria and Saxony are used here as examples.
[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A+++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_teil%3A+++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_beschreibung%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0030051%3E%0A%0ASELECT+DISTINCT+%3Fbundesland+%3FlpLabel+%3Ftext%0AWHERE+%7B%0A++VALUES+%28%3Fg+%3Fbundesland%29+%7B%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%22Bayern%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%22Sachsen%22%29%0A++%7D%0A++GRAPH+%3Fg+%7B%0A++++%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++++hat_teil%3A+%3Fnode+.%0A++++%3Fnode+%28+rdfs%3Alabel+%7C+hat_beschreibung%3A+%29+%3Ftext+.%0A++++FILTER%28+CONTAINS%28LCASE%28STR%28%3Ftext%29%29%2C+%22zelle%22%29+%29%0A++%7D%0A%7D%0AORDER+BY+%3Fbundesland+%3FlpLabel%0ALIMIT+50&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:             <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:              <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX Lehrplan:         <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX hat_teil:         <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX hat_beschreibung: <https://w3id.org/lehrplan/ontology/LP_0030051>

SELECT DISTINCT ?bundesland ?lpLabel ?text
WHERE {
  VALUES (?g ?bundesland) {
    (<https://w3id.org/lehrplan/by> "Bayern")
    (<https://w3id.org/lehrplan/sn> "Sachsen")
  }
  GRAPH ?g {
    ?lp rdf:type Lehrplan: ;
        rdfs:label ?lpLabel ;
        hat_teil: ?node .
    ?node ( rdfs:label | hat_beschreibung: ) ?text .
    FILTER( CONTAINS(LCASE(STR(?text)), "zelle") )
  }
}
ORDER BY ?bundesland ?lpLabel
LIMIT 50
```

### Which learning areas does mathematics have in class level 5 at the Gymnasium in Saxony?

Finds all learning areas (*Lernbereich (SN)* (learning area, Saxony), `Lernbereich_SN:`) of class level 5 from the mathematics curricula for the *Gymnasium* (academic secondary school). In Saxony, the learning areas are the subject-specific structural level below the curriculum.

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A+++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+fuer_schulart%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+gymnasium_sn%3A+++++++%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2FSN_0000005%3E%0APREFIX+hat_teil%3A+++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+Lernbereich_SN%3A+++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0002113%3E%0APREFIX+hat_jahrgangsstufe%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+jahrgangsstufe_5%3A+++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000005%3E%0A%0ASELECT+DISTINCT+%3FlpLabel+%3FbereichLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++fuer_schulart%3A+gymnasium_sn%3A+%3B%0A++++++hat_teil%3A+%3Fbereich+.%0A%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28CONTAINS%28LCASE%28%3FfachLabel%29%2C+%22mathematik%22%29%29%0A%0A++%3Fbereich+rdf%3Atype+Lernbereich_SN%3A+%3B%0A+++++++++++hat_jahrgangsstufe%3A+jahrgangsstufe_5%3A+%3B%0A+++++++++++rdfs%3Alabel+%3FbereichLabel+.%0A%7D%0AORDER+BY+%3FlpLabel+%3FbereichLabel&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:               <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:                <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX Lehrplan:           <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX hat_schulfach:      <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX fuer_schulart:      <https://w3id.org/lehrplan/ontology/LP_0000812>
PREFIX gymnasium_sn:       <https://w3id.org/schulart/SN_0000005>
PREFIX hat_teil:           <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX Lernbereich_SN:     <https://w3id.org/lehrplan/ontology/LP_0002113>
PREFIX hat_jahrgangsstufe: <https://w3id.org/lehrplan/ontology/LP_0000026>
PREFIX jahrgangsstufe_5:   <https://w3id.org/lehrplan/ontology/LP_2000005>

SELECT DISTINCT ?lpLabel ?bereichLabel
FROM <https://w3id.org/lehrplan/sn>
WHERE {
  ?lp rdf:type Lehrplan: ;
      rdfs:label ?lpLabel ;
      hat_schulfach: ?fach ;
      fuer_schulart: gymnasium_sn: ;
      hat_teil: ?bereich .

  ?fach rdfs:label ?fachLabel .
  FILTER(CONTAINS(LCASE(?fachLabel), "mathematik"))

  ?bereich rdf:type Lernbereich_SN: ;
           hat_jahrgangsstufe: jahrgangsstufe_5: ;
           rdfs:label ?bereichLabel .
}
ORDER BY ?lpLabel ?bereichLabel
```

### <a id="abfrage-cq-11"></a>Which competence areas does mathematics have in Rhineland-Palatinate?

Competency question [CQ 11](introduction.en.md#cq-11).

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A+++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A+++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_teil%3A++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+Kompetenzbereich_RP%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000431%3E%0A%0ASELECT+DISTINCT+%3FlpLabel+%3FkbLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0AWHERE+%7B%0A++%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++hat_teil%3A+%3Fkb+.%0A%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28CONTAINS%28LCASE%28%3FfachLabel%29%2C+%22mathematik%22%29%29%0A%0A++%3Fkb+rdf%3Atype+Kompetenzbereich_RP%3A+%3B%0A++++++rdfs%3Alabel+%3FkbLabel+.%0A%7D%0AORDER+BY+%3FlpLabel+%3FkbLabel&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX Lehrplan:            <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX hat_schulfach:       <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX hat_teil:            <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX Kompetenzbereich_RP: <https://w3id.org/lehrplan/ontology/LP_0000431>

SELECT DISTINCT ?lpLabel ?kbLabel
FROM <https://w3id.org/lehrplan/rp>
WHERE {
  ?lp rdf:type Lehrplan: ;
      rdfs:label ?lpLabel ;
      hat_schulfach: ?fach ;
      hat_teil: ?kb .

  ?fach rdfs:label ?fachLabel .
  FILTER(CONTAINS(LCASE(?fachLabel), "mathematik"))

  ?kb rdf:type Kompetenzbereich_RP: ;
      rdfs:label ?kbLabel .
}
ORDER BY ?lpLabel ?kbLabel
```

## Queries about the structure of the curricula

### Which elements form the first structural level of a curriculum?

Cross-state: returns all direct sub-elements (*has direct part*) of a curriculum in their order (*hat Position*, has position) – independent of the concrete class name.

```sparql
PREFIX rdfs:              <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:               <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX hat_direkten_teil: <https://w3id.org/lehrplan/ontology/LP_0000565>
PREFIX hat_position:      <https://w3id.org/lehrplan/ontology/LP_0000460>

# <LEHRPLAN-URI> durch die konkrete URI ersetzen,
# <GRAPH-URI>    durch den passenden Graphen
SELECT DISTINCT ?position ?elementLabel ?typ
FROM <GRAPH-URI>
WHERE {
  <LEHRPLAN-URI> hat_direkten_teil: ?element .
  ?element rdfs:label ?elementLabel .
  OPTIONAL { ?element hat_position: ?position }
  OPTIONAL { ?element rdf:type ?typ .
             FILTER(STRSTARTS(STR(?typ),
               "https://w3id.org/lehrplan/ontology/")) }
}
ORDER BY ?position ?elementLabel
```
[Direct link to example with a Bavarian curriculum in the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A+++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+hat_direkten_teil%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000565%3E%0APREFIX+hat_position%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000460%3E%0A%0ASELECT+DISTINCT+%3Fposition+%3FelementLabel+%3Ftyp%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E%0AWHERE+%7B%0A++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flehrplanplus-lis_live_isb.c.117097.de%3E+hat_direkten_teil%3A+%3Felement+.%0A++%3Felement+rdfs%3Alabel+%3FelementLabel+.%0A++OPTIONAL+%7B+%3Felement+hat_position%3A+%3Fposition+%7D%0A++OPTIONAL+%7B+%3Felement+rdf%3Atype+%3Ftyp+.%0A+++++++++++++FILTER%28STRSTARTS%28STR%28%3Ftyp%29%2C%0A+++++++++++++++%22https%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%22%29%29+%7D%0A%7D%0AORDER+BY+%3Fposition+%3FelementLabel&format=text%2Fhtml&timeout=0&signal_void=on)
[Direct link to example with a Saxon curriculum in the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A+++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+hat_direkten_teil%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000565%3E%0APREFIX+hat_position%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000460%3E%0A%0ASELECT+DISTINCT+%3Fposition+%3FelementLabel+%3Ftyp%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fsn%2Flehrplan-935-1%3E+hat_direkten_teil%3A+%3Felement+.%0A++%3Felement+rdfs%3Alabel+%3FelementLabel+.%0A++OPTIONAL+%7B+%3Felement+hat_position%3A+%3Fposition+%7D%0A++OPTIONAL+%7B+%3Felement+rdf%3Atype+%3Ftyp+.%0A+++++++++++++FILTER%28STRSTARTS%28STR%28%3Ftyp%29%2C%0A+++++++++++++++%22https%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%22%29%29+%7D%0A%7D%0AORDER+BY+%3Fposition+%3FelementLabel&format=text%2Fhtml&timeout=0&signal_void=on)

### <a id="abfrage-cq-1"></a>Which connection exists between element X and element Y?

Competency question [CQ 1](introduction.en.md#cq-1).

Direct relation X → Y or Y → X:

[Direct link to example in the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3Fvon+%3Fpraedikat+%3Fnach%0AWHERE+%7B%0A++GRAPH+%3Fg+%7B%0A++++%7B+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+%3Fpraedikat+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_live_isb.c.1182.de%3E+.%0A++++++BIND%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+AS+%3Fvon%29++BIND%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_live_isb.c.1182.de%3E+AS+%3Fnach%29+%7D%0A++++UNION%0A++++%7B+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_live_isb.c.1182.de%3E+%3Fpraedikat+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+.%0A++++++BIND%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_live_isb.c.1182.de%3E+AS+%3Fvon%29++BIND%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+AS+%3Fnach%29+%7D%0A++%7D%0A%7D%0AORDER+BY+%3Fvon+%3Fpraedikat&format=text%2Fhtml&timeout=0&signal_void=on)

```sparql
SELECT DISTINCT ?von ?praedikat ?nach
WHERE {
  GRAPH ?g {
    { <URI-VON-X> ?praedikat <URI-VON-Y> .
      BIND(<URI-VON-X> AS ?von)  BIND(<URI-VON-Y> AS ?nach) }
    UNION
    { <URI-VON-Y> ?praedikat <URI-VON-X> .
      BIND(<URI-VON-Y> AS ?von)  BIND(<URI-VON-X> AS ?nach) }
  }
}
ORDER BY ?von ?praedikat
```

Indirect path via intermediate node Z (X→Z→Y):

[Direct link to example in the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3Fp1+%3Fz+%3FzLabel+%3Fp2%0AWHERE+%7B%0A++GRAPH+%3Fg+%7B%0A++++%7B+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+%3Fp1+%3Fz+.+%3Fz+%3Fp2+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.347.de%3E+.+%7D%0A++++UNION%0A++++%7B+%3Fz+%3Fp1+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+.+%3Fz+%3Fp2+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.347.de%3E+.+%7D%0A++%7D%0A++OPTIONAL+%7B+%3Fz+rdfs%3Alabel+%3FzLabel+%7D%0A++FILTER%28+%3Fz+%21%3D+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+%26%26+%3Fz+%21%3D+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.347.de%3E+%29%0A%7D%0ALIMIT+50&format=text%2Fhtml&timeout=0&signal_void=on)

```sparql
SELECT DISTINCT ?p1 ?z ?zLabel ?p2
WHERE {
  GRAPH ?g {
    { <URI-VON-X> ?p1 ?z . ?z ?p2 <URI-VON-Y> . }
    UNION
    { ?z ?p1 <URI-VON-X> . ?z ?p2 <URI-VON-Y> . }
  }
  OPTIONAL { ?z rdfs:label ?zLabel }
  FILTER( ?z != <URI-VON-X> && ?z != <URI-VON-Y> )
}
LIMIT 50
```

All neighbors and properties of an element (context dump):

[Direct link to example in the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3Frichtung+%3Fpraedikat+%3FpraedikatLabel+%3Fnachbar+%3FnachbarLabel%0AWHERE+%7B%0A++GRAPH+%3Fg+%7B%0A++++%7B+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+%3Fpraedikat+%3Fnachbar+.+BIND%28%22%E2%86%92%22+AS+%3Frichtung%29+%7D%0A++++UNION%0A++++%7B+%3Fnachbar+%3Fpraedikat+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+.+BIND%28%22%E2%86%90%22+AS+%3Frichtung%29+%7D%0A++%7D%0A++OPTIONAL+%7B+%3Fpraedikat+rdfs%3Alabel+%3FpraedikatLabel+%7D%0A++OPTIONAL+%7B+%3Fnachbar+++rdfs%3Alabel+%3FnachbarLabel++%7D%0A%7D%0AORDER+BY+%3Frichtung+%3Fpraedikat&format=text%2Fhtml&timeout=0&signal_void=on)

```sparql
SELECT DISTINCT ?richtung ?praedikat ?praedikatLabel ?nachbar ?nachbarLabel
WHERE {
  GRAPH ?g {
    { <URI-VON-X> ?praedikat ?nachbar . BIND("→" AS ?richtung) }
    UNION
    { ?nachbar ?praedikat <URI-VON-X> . BIND("←" AS ?richtung) }
  }
  OPTIONAL { ?praedikat rdfs:label ?praedikatLabel }
  OPTIONAL { ?nachbar   rdfs:label ?nachbarLabel  }
}
ORDER BY ?richtung ?praedikat
```

## Further queries about competences and contents

### <a id="abfrage-cq-5"></a>Which competency specifications does mathematics have in class level 7 per school type in Saxony?

Competency question [CQ 5](introduction.en.md#cq-5).

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan%3A+++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_jahrgangsstufe%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+fuer_schulart%3A++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_funktion%3A+++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0APREFIX+kompetenzbeschreibungsfunktion%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000479%3E%0A%0ASELECT+DISTINCT+%3FschulartLabel+%3FlpLabel+%3FelementLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++hat_jahrgangsstufe%3A+%3Fjg+%3B%0A++++++fuer_schulart%3A+%3Fschulart+%3B%0A++++++hat_teil%3A%2B++%3Felement+.++%23+transitiv%0A%0A++%3Felement+hat_funktion%3A+kompetenzbeschreibungsfunktion%3A+.%0A%0A++%3Ffach+++++rdfs%3Alabel+%3FfachLabel+.%0A++%3Fjg+++++++rdfs%3Alabel+%3FjgLabel+.%0A++%3Fschulart+rdfs%3Alabel+%3FschulartLabel+.%0A++%3Felement++rdfs%3Alabel+%3FelementLabel+.%0A%0A++FILTER%28+CONTAINS%28LCASE%28STR%28%3FfachLabel%29%29%2C+%22mathematik%22%29+%29%0A++FILTER%28+CONTAINS%28STR%28%3FjgLabel%29%2C+%227%22%29+%29%0A%7D%0AORDER+BY+%3FschulartLabel+%3FlpLabel+%3FelementLabel&format=text%2Fhtml&timeout=0&signal_void=on)

```sparql
PREFIX Lehrplan:                       <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX hat_schulfach:                  <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX hat_jahrgangsstufe:             <https://w3id.org/lehrplan/ontology/LP_0000026>
PREFIX fuer_schulart:                  <https://w3id.org/lehrplan/ontology/LP_0000812>
PREFIX hat_teil:                       <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX hat_funktion:                   <https://w3id.org/lehrplan/ontology/LP_0000483>
PREFIX kompetenzbeschreibungsfunktion: <https://w3id.org/lehrplan/ontology/LP_0000479>

SELECT DISTINCT ?schulartLabel ?lpLabel ?elementLabel
FROM <https://w3id.org/lehrplan/sn>
WHERE {
  ?lp rdf:type Lehrplan: ;
      rdfs:label ?lpLabel ;
      hat_schulfach: ?fach ;
      hat_jahrgangsstufe: ?jg ;
      fuer_schulart: ?schulart ;
      hat_teil:+  ?element .  # transitiv

  ?element hat_funktion: kompetenzbeschreibungsfunktion: .

  ?fach     rdfs:label ?fachLabel .
  ?jg       rdfs:label ?jgLabel .
  ?schulart rdfs:label ?schulartLabel .
  ?element  rdfs:label ?elementLabel .

  FILTER( CONTAINS(LCASE(STR(?fachLabel)), "mathematik") )
  FILTER( CONTAINS(STR(?jgLabel), "7") )
}
ORDER BY ?schulartLabel ?lpLabel ?elementLabel
```

### Which niveau stages are assigned to the elements in Berlin/Brandenburg?

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_teil%3A+++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_niveaustufe%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000578%3E%0APREFIX+wird_beschrieben_von%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000024%3E%0APREFIX+hat_wert%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000344%3E%0A%0ASELECT+DISTINCT+%3FlpLabel+%3FniveauLabel+%3FelemLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E%0AWHERE+%7B%0A%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++hat_teil%3A%2B++++%3Felem+.%0A%0A%3Felem+hat_niveaustufe%3A+%3Fniveau+.%0A%0A%3Felem+wird_beschrieben_von%3A+%3FelemTitel+.%0A%3FelemTitel+hat_wert%3A+%3FelemLabel+.%0A%0A%3Fniveau+rdfs%3Alabel+%3FniveauLabel+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)

```sparql
PREFIX Lehrplan:             <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX hat_teil:             <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX hat_niveaustufe:      <https://w3id.org/lehrplan/ontology/LP_0000578>
PREFIX wird_beschrieben_von: <https://w3id.org/lehrplan/ontology/LP_0000024>
PREFIX hat_wert:             <https://w3id.org/lehrplan/ontology/LP_0000344>

SELECT DISTINCT ?lpLabel ?niveauLabel ?elemLabel
FROM <https://w3id.org/lehrplan/graph/be>
WHERE {
?lp rdf:type Lehrplan: ;
      rdfs:label ?lpLabel ;
      hat_teil:+    ?elem .

?elem hat_niveaustufe: ?niveau .

?elem wird_beschrieben_von: ?elemTitel .
?elemTitel hat_wert: ?elemLabel .

?niveau rdfs:label ?niveauLabel .
}
```

### <a id="abfrage-cq-2"></a>Which area from Rhineland-Palatinate corresponds to an element from Bavaria?

Competency question [CQ 2](introduction.en.md#cq-2).


Concrete BY element as starting point:

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_teil%3A+%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0A%0ASELECT+DISTINCT+%3FrpLpLabel+%3FrpElementLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0AWHERE+%7B%0A++%3FrpLp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++++rdfs%3Alabel+%3FrpLpLabel+%3B%0A++++++++hat_teil%3A%2B+%3FrpEl+.%0A++%3FrpEl+rdfs%3Alabel+%3FrpElementLabel+.%0A%0A++BIND%28%22Nat%C3%BCrliche+Zahlen%22+AS+%3Fsuchbegriff%29++%23+%E2%86%90+BY-Label+hier+eintragen%0A++FILTER%28+CONTAINS%28LCASE%28STR%28%3FrpElementLabel%29%29%2C+LCASE%28%3Fsuchbegriff%29%29+%29%0A%7D%0AORDER+BY+%3FrpLpLabel+%3FrpElementLabel&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX Lehrplan: <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX hat_teil: <http://purl.obolibrary.org/obo/BFO_0000051>

SELECT DISTINCT ?rpLpLabel ?rpElementLabel
FROM <https://w3id.org/lehrplan/rp>
WHERE {
  ?rpLp rdf:type Lehrplan: ;
        rdfs:label ?rpLpLabel ;
        hat_teil:+ ?rpEl .
  ?rpEl rdfs:label ?rpElementLabel .

  BIND("Natürliche Zahlen" AS ?suchbegriff)  # ← BY-Label hier eintragen
  FILTER( CONTAINS(LCASE(STR(?rpElementLabel)), LCASE(?suchbegriff)) )
}
ORDER BY ?rpLpLabel ?rpElementLabel
```

### <a id="abfrage-cq-3"></a>Which learning contents are assigned to an area?

Competency question [CQ 3](introduction.en.md#cq-3), approximated via the learning contents that belong to the same area as a competence.

Example: all learning contents in Saxony that are assigned to an area with the keyword "schreiben" (writing):
[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+hat_funktion%3A+++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0APREFIX+bereichsfunktion%3A+++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000497%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+lerninhaltsbeschreibungsfunktion%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000480%3E%0APREFIX+Lehrplan%3A+++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0A%0ASELECT+DISTINCT%0A++%3FlpLabel+%3FbereichLabel+%3FlerninhaltLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Fbereich+hat_funktion%3A%0A+++++++++++++bereichsfunktion%3A+%3B%0A+++++++++++++rdfs%3Alabel+%3FbereichLabel+%3B%0A+++++++++++++hat_teil%3A+%3Flerninhalt+.%0A%0A++%3Flerninhalt+hat_funktion%3A%0A++++++++++++++lerninhaltsbeschreibungsfunktion%3A+%3B%0A++++++++++++++rdfs%3Alabel+%3FlerninhaltLabel+.%0A%0A++%23+Lehrplan-Zuordnung+f%C3%BCr+Kontext%0A++%3Flp+a+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++hat_teil%3A%2B+%3Fbereich+.%0A%0A++FILTER%28+CONTAINS%28LCASE%28STR%28%3FbereichLabel%29%29%2C+%22schreiben%22%29+%29%0A%7D%0AORDER+BY+%3FlpLabel+%3FbereichLabel+%3FlerninhaltLabel&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX hat_funktion:                     <https://w3id.org/lehrplan/ontology/LP_0000483>
PREFIX bereichsfunktion:                 <https://w3id.org/lehrplan/ontology/LP_0000497>
PREFIX hat_teil:                         <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX lerninhaltsbeschreibungsfunktion: <https://w3id.org/lehrplan/ontology/LP_0000480>
PREFIX Lehrplan:                         <https://w3id.org/lehrplan/ontology/LP_0000438>

SELECT DISTINCT
  ?lpLabel ?bereichLabel ?lerninhaltLabel
FROM <https://w3id.org/lehrplan/sn>
WHERE {
  ?bereich hat_funktion:
             bereichsfunktion: ;
             rdfs:label ?bereichLabel ;
             hat_teil: ?lerninhalt .

  ?lerninhalt hat_funktion:
              lerninhaltsbeschreibungsfunktion: ;
              rdfs:label ?lerninhaltLabel .

  # Lehrplan-Zuordnung für Kontext
  ?lp a Lehrplan: ;
      rdfs:label ?lpLabel ;
      hat_teil:+ ?bereich .

  FILTER( CONTAINS(LCASE(STR(?bereichLabel)), "schreiben") )
}
ORDER BY ?lpLabel ?bereichLabel ?lerninhaltLabel
```


### How do the mathematics contents of class level 10 differ per school type in Saxony?

Competency question [CQ 5](introduction.en.md#cq-5), as a variant for the learning contents of class level 10 in Saxony.

Lists the learning contents of the learning areas for class level 10 by school type, so that *Gymnasium* and *Oberschule* (secondary school, Saxony) can be compared.

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A+++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+fuer_schulart%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+hat_jahrgangsstufe%3A+++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+jahrgangsstufe_10%3A++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000010%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_funktion%3A+++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0APREFIX+lerninhaltsbeschreibungsfunktion%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000480%3E%0A%0ASELECT+DISTINCT+%3Fschulart+%3Flernbereich+%3Flerninhalt%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+a+Lehrplan%3A+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++fuer_schulart%3A+%3Fsa+%3B%0A++++++hat_teil%3A+%3Fbereich+.%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28LCASE%28STR%28%3FfachLabel%29%29+%3D+%22mathematik%22%29%0A++%3Fsa+rdfs%3Alabel+%3Fschulart+.%0A++%3Fbereich+hat_jahrgangsstufe%3A+jahrgangsstufe_10%3A+%3B%0A+++++++++++rdfs%3Alabel+%3Flernbereich+%3B%0A+++++++++++hat_teil%3A+%3Finhalt+.%0A++%3Finhalt+hat_funktion%3A+lerninhaltsbeschreibungsfunktion%3A+%3B%0A++++++++++rdfs%3Alabel+%3Flerninhalt+.%0A%7D%0AORDER+BY+%3Fschulart+%3Flernbereich+%3Flerninhalt&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                             <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Lehrplan:                         <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX hat_schulfach:                    <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX fuer_schulart:                    <https://w3id.org/lehrplan/ontology/LP_0000812>
PREFIX hat_jahrgangsstufe:               <https://w3id.org/lehrplan/ontology/LP_0000026>
PREFIX jahrgangsstufe_10:                <https://w3id.org/lehrplan/ontology/LP_2000010>
PREFIX hat_teil:                         <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX hat_funktion:                     <https://w3id.org/lehrplan/ontology/LP_0000483>
PREFIX lerninhaltsbeschreibungsfunktion: <https://w3id.org/lehrplan/ontology/LP_0000480>

SELECT DISTINCT ?schulart ?lernbereich ?lerninhalt
FROM <https://w3id.org/lehrplan/sn>
WHERE {
  ?lp a Lehrplan: ;
      hat_schulfach: ?fach ;
      fuer_schulart: ?sa ;
      hat_teil: ?bereich .
  ?fach rdfs:label ?fachLabel .
  FILTER(LCASE(STR(?fachLabel)) = "mathematik")
  ?sa rdfs:label ?schulart .
  ?bereich hat_jahrgangsstufe: jahrgangsstufe_10: ;
           rdfs:label ?lernbereich ;
           hat_teil: ?inhalt .
  ?inhalt hat_funktion: lerninhaltsbeschreibungsfunktion: ;
          rdfs:label ?lerninhalt .
}
ORDER BY ?schulart ?lernbereich ?lerninhalt
```

### <a id="abfrage-cq-7"></a>Which physics competences are added in the advanced course in Bavaria?

Competency question [CQ 7](introduction.en.md#cq-7).

In Bavaria, separate subject curricula for the basic and the increased requirement level exist for class levels 12 and 13; via *has niveau* (*hat Niveau*) they are assigned to the basic course level or the advanced course level, respectively. The query lists the competence expectations of the increased level that do not occur in the basic level of the same class level.

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Fachlehrplan_BY%3A+++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0002043%3E%0APREFIX+Leistungskursniveau%3A+++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000531%3E%0APREFIX+Grundkursniveau%3A+++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000530%3E%0APREFIX+CE_Kompetenzspezifikation%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000263%3E%0APREFIX+hat_schulfach%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_niveau%3A++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000840%3E%0APREFIX+hat_jahrgangsstufe%3A++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+hat_teil%3A++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0A%0ASELECT+DISTINCT+%3Fjahrgangsstufe+%3Fkompetenz%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E%0AWHERE+%7B%0A++%23+Fachlehrplan+mit+erh%C3%B6htem+Anforderungsniveau+%28Leistungskursniveau%29%0A++%3Flk+a+Fachlehrplan_BY%3A+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++hat_niveau%3A+%3FniveauLk+%3B%0A++++++hat_jahrgangsstufe%3A+%3Fjg+%3B%0A++++++hat_teil%3A+%3Fks+.%0A++%3FniveauLk+a+Leistungskursniveau%3A+.%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28LCASE%28STR%28%3FfachLabel%29%29+%3D+%22physik%22%29%0A++%3Fks+a+CE_Kompetenzspezifikation%3A+%3B%0A++++++rdfs%3Alabel+%3Fkompetenz+.%0A++%3Fjg+rdfs%3Alabel+%3Fjahrgangsstufe+.%0A++FILTER%28LANG%28%3Fjahrgangsstufe%29+%3D+%22de%22%29%0A++%23+ohne+wortgleiche+Kompetenz+im+Fachlehrplan+mit+grundlegendem+Anforderungsniveau%0A++FILTER+NOT+EXISTS+%7B%0A++++%3Fgk+a+Fachlehrplan_BY%3A+%3B%0A++++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++++hat_niveau%3A+%3FniveauGk+%3B%0A++++++++hat_jahrgangsstufe%3A+%3Fjg+%3B%0A++++++++hat_teil%3A+%3Fks2+.%0A++++%3FniveauGk+a+Grundkursniveau%3A+.%0A++++%3Fks2+a+CE_Kompetenzspezifikation%3A+%3B%0A+++++++++rdfs%3Alabel+%3Fkompetenz+.%0A++%7D%0A%7D%0AORDER+BY+%3Fjahrgangsstufe+%3Fkompetenz&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                      <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Fachlehrplan_BY:           <https://w3id.org/lehrplan/ontology/LP_0002043>
PREFIX Leistungskursniveau:       <https://w3id.org/lehrplan/ontology/LP_0000531>
PREFIX Grundkursniveau:           <https://w3id.org/lehrplan/ontology/LP_0000530>
PREFIX CE_Kompetenzspezifikation: <https://w3id.org/lehrplan/ontology/LP_0000263>
PREFIX hat_schulfach:             <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX hat_niveau:                <https://w3id.org/lehrplan/ontology/LP_0000840>
PREFIX hat_jahrgangsstufe:        <https://w3id.org/lehrplan/ontology/LP_0000026>
PREFIX hat_teil:                  <http://purl.obolibrary.org/obo/BFO_0000051>

SELECT DISTINCT ?jahrgangsstufe ?kompetenz
FROM <https://w3id.org/lehrplan/by>
WHERE {
  # Fachlehrplan mit erhöhtem Anforderungsniveau (Leistungskursniveau)
  ?lk a Fachlehrplan_BY: ;
      hat_schulfach: ?fach ;
      hat_niveau: ?niveauLk ;
      hat_jahrgangsstufe: ?jg ;
      hat_teil: ?ks .
  ?niveauLk a Leistungskursniveau: .
  ?fach rdfs:label ?fachLabel .
  FILTER(LCASE(STR(?fachLabel)) = "physik")
  ?ks a CE_Kompetenzspezifikation: ;
      rdfs:label ?kompetenz .
  ?jg rdfs:label ?jahrgangsstufe .
  FILTER(LANG(?jahrgangsstufe) = "de")
  # ohne wortgleiche Kompetenz im Fachlehrplan mit grundlegendem Anforderungsniveau
  FILTER NOT EXISTS {
    ?gk a Fachlehrplan_BY: ;
        hat_schulfach: ?fach ;
        hat_niveau: ?niveauGk ;
        hat_jahrgangsstufe: ?jg ;
        hat_teil: ?ks2 .
    ?niveauGk a Grundkursniveau: .
    ?ks2 a CE_Kompetenzspezifikation: ;
         rdfs:label ?kompetenz .
  }
}
ORDER BY ?jahrgangsstufe ?kompetenz
```

The comparison is based on the wording of the competence expectations. Competences that are equivalent in content but worded differently are therefore reported as additional.

### <a id="abfrage-cq-12"></a>Which competences does "Mathematisch modellieren" (mathematical modeling) comprise in Berlin in class level 7?

Competency question [CQ 12](introduction.en.md#cq-12).

Lists the standards of the competence area "Mathematisch modellieren" in the *Rahmenlehrplan* (framework curriculum) for mathematics together with their niveau stage.

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+CE_Bereich%3A++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000349%3E%0APREFIX+CE_Kompetenzspezifikation%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000263%3E%0APREFIX+hat_teil%3A++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_niveaustufe%3A+++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000578%3E%0A%0ASELECT+DISTINCT+%3Fkompetenz+%3Fniveaustufe%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E%0AWHERE+%7B%0A++%3Flp+a+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%22Mathematik%22+%3B%0A++++++hat_teil%3A+%3Fbereich+.%0A++%3Fbereich+a+CE_Bereich%3A+%3B%0A+++++++++++rdfs%3Alabel+%22Mathematisch+modellieren%22+%3B%0A+++++++++++hat_teil%3A+%3Fks+.%0A++%3Fks+a+CE_Kompetenzspezifikation%3A+%3B%0A++++++rdfs%3Alabel+%3Fkompetenz+.%0A++OPTIONAL+%7B+%3Fks+hat_niveaustufe%3A+%3Fstufe+.%0A+++++++++++++%3Fstufe+rdfs%3Alabel+%3Fniveaustufe+%7D%0A%7D%0AORDER+BY+%3Fkompetenz&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                      <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Lehrplan:                  <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX CE_Bereich:                <https://w3id.org/lehrplan/ontology/LP_0000349>
PREFIX CE_Kompetenzspezifikation: <https://w3id.org/lehrplan/ontology/LP_0000263>
PREFIX hat_teil:                  <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX hat_niveaustufe:           <https://w3id.org/lehrplan/ontology/LP_0000578>

SELECT DISTINCT ?kompetenz ?niveaustufe
FROM <https://w3id.org/lehrplan/graph/be>
WHERE {
  ?lp a Lehrplan: ;
      rdfs:label "Mathematik" ;
      hat_teil: ?bereich .
  ?bereich a CE_Bereich: ;
           rdfs:label "Mathematisch modellieren" ;
           hat_teil: ?ks .
  ?ks a CE_Kompetenzspezifikation: ;
      rdfs:label ?kompetenz .
  OPTIONAL { ?ks hat_niveaustufe: ?stufe .
             ?stufe rdfs:label ?niveaustufe }
}
ORDER BY ?kompetenz
```

The question can currently be answered only to a limited extent: in the data, the competence area contains only two overarching standards without a niveau stage. An assignment to class level 7, which in Berlin and Brandenburg is made via the niveau stages (see [Pattern 11](patterns.en.md#pattern-11-niveau-stages-bebb)), is not possible for them.

### <a id="abfrage-cq-13"></a>Which learning contents does biology have in class level 5 in Bavaria?

Competency question [CQ 13](introduction.en.md#cq-13).

In Bavaria, school subject, class level and school type are specified on the *Fachlehrplan (BY)* (subject curriculum, Bavaria), not on the curriculum itself. The query lists the learning contents of the matching subject curricula.

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Fachlehrplan_BY%3A++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0002043%3E%0APREFIX+hat_schulfach%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_jahrgangsstufe%3A+++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+jahrgangsstufe_5%3A+++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000005%3E%0APREFIX+fuer_schulart%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_funktion%3A+++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0APREFIX+lerninhaltsbeschreibungsfunktion%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000480%3E%0A%0ASELECT+DISTINCT+%3Fschulart+%3Ffachlehrplan+%3Flerninhalt%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E%0AWHERE+%7B%0A++%3Fflp+a+Fachlehrplan_BY%3A+%3B%0A+++++++rdfs%3Alabel+%3Ffachlehrplan+%3B%0A+++++++hat_schulfach%3A+%3Ffach+%3B%0A+++++++hat_jahrgangsstufe%3A+jahrgangsstufe_5%3A+%3B%0A+++++++fuer_schulart%3A+%3Fsa+%3B%0A+++++++hat_teil%3A+%3Finhalt+.%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28CONTAINS%28LCASE%28STR%28%3FfachLabel%29%29%2C+%22biologie%22%29%29%0A++%3Fsa+rdfs%3Alabel+%3Fschulart+.%0A++%3Finhalt+hat_funktion%3A+lerninhaltsbeschreibungsfunktion%3A+%3B%0A++++++++++rdfs%3Alabel+%3Flerninhalt+.%0A%7D%0AORDER+BY+%3Fschulart+%3Ffachlehrplan+%3Flerninhalt&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                             <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Fachlehrplan_BY:                  <https://w3id.org/lehrplan/ontology/LP_0002043>
PREFIX hat_schulfach:                    <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX hat_jahrgangsstufe:               <https://w3id.org/lehrplan/ontology/LP_0000026>
PREFIX jahrgangsstufe_5:                 <https://w3id.org/lehrplan/ontology/LP_2000005>
PREFIX fuer_schulart:                    <https://w3id.org/lehrplan/ontology/LP_0000812>
PREFIX hat_teil:                         <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX hat_funktion:                     <https://w3id.org/lehrplan/ontology/LP_0000483>
PREFIX lerninhaltsbeschreibungsfunktion: <https://w3id.org/lehrplan/ontology/LP_0000480>

SELECT DISTINCT ?schulart ?fachlehrplan ?lerninhalt
FROM <https://w3id.org/lehrplan/by>
WHERE {
  ?flp a Fachlehrplan_BY: ;
       rdfs:label ?fachlehrplan ;
       hat_schulfach: ?fach ;
       hat_jahrgangsstufe: jahrgangsstufe_5: ;
       fuer_schulart: ?sa ;
       hat_teil: ?inhalt .
  ?fach rdfs:label ?fachLabel .
  FILTER(CONTAINS(LCASE(STR(?fachLabel)), "biologie"))
  ?sa rdfs:label ?schulart .
  ?inhalt hat_funktion: lerninhaltsbeschreibungsfunktion: ;
          rdfs:label ?lerninhalt .
}
ORDER BY ?schulart ?fachlehrplan ?lerninhalt
```

In class level 5, biology is a separate subject only at the *Realschule* (intermediate secondary school); at the *Gymnasium* and the *Mittelschule* (lower secondary school, Bavaria), biological contents are taught in other subjects.

### <a id="abfrage-cq-14"></a>Which competence areas does French have in Rhineland-Palatinate per class level?

Competency question [CQ 14](introduction.en.md#cq-14).

Lists the competence areas of all French curricula, sorted by the first class level for which the respective curriculum applies.

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+xsd%3A++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+rdfs%3A+++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A+++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+CE_Bereich%3A+++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000349%3E%0APREFIX+hat_schulfach%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_jahrgangsstufe%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+hat_teil%3A+++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0A%0ASELECT+%3Fab_jahrgangsstufe+%3Flehrplan+%3Fkompetenzbereich%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0AWHERE+%7B%0A++%7B%0A++++SELECT+%3Flp+%28MIN%28%3Fn%29+AS+%3Fab_jahrgangsstufe%29%0A++++WHERE+%7B%0A++++++%3Flp+a+Lehrplan%3A+%3B%0A++++++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++++++hat_jahrgangsstufe%3A+%3Fjg+.%0A++++++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++++++FILTER%28CONTAINS%28LCASE%28STR%28%3FfachLabel%29%29%2C+%22franz%C3%B6sisch%22%29%29%0A++++++%3Fjg+rdfs%3Alabel+%3FjgLabel+.%0A++++++FILTER%28LANG%28%3FjgLabel%29+%3D+%22de%22%29%0A++++++BIND%28xsd%3Ainteger%28STRAFTER%28%3FjgLabel%2C+%22+%22%29%29+AS+%3Fn%29%0A++++%7D%0A++++GROUP+BY+%3Flp%0A++%7D%0A++%3Flp+rdfs%3Alabel+%3Flehrplan+%3B%0A++++++hat_teil%3A+%3Fbereich+.%0A++%3Fbereich+a+CE_Bereich%3A+%3B%0A+++++++++++rdfs%3Alabel+%3Fkompetenzbereich+.%0A%7D%0AORDER+BY+%3Fab_jahrgangsstufe+%3Flehrplan+%3Fkompetenzbereich&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX xsd:                <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs:               <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Lehrplan:           <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX CE_Bereich:         <https://w3id.org/lehrplan/ontology/LP_0000349>
PREFIX hat_schulfach:      <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX hat_jahrgangsstufe: <https://w3id.org/lehrplan/ontology/LP_0000026>
PREFIX hat_teil:           <http://purl.obolibrary.org/obo/BFO_0000051>

SELECT ?ab_jahrgangsstufe ?lehrplan ?kompetenzbereich
FROM <https://w3id.org/lehrplan/rp>
WHERE {
  {
    SELECT ?lp (MIN(?n) AS ?ab_jahrgangsstufe)
    WHERE {
      ?lp a Lehrplan: ;
          hat_schulfach: ?fach ;
          hat_jahrgangsstufe: ?jg .
      ?fach rdfs:label ?fachLabel .
      FILTER(CONTAINS(LCASE(STR(?fachLabel)), "französisch"))
      ?jg rdfs:label ?jgLabel .
      FILTER(LANG(?jgLabel) = "de")
      BIND(xsd:integer(STRAFTER(?jgLabel, " ")) AS ?n)
    }
    GROUP BY ?lp
  }
  ?lp rdfs:label ?lehrplan ;
      hat_teil: ?bereich .
  ?bereich a CE_Bereich: ;
           rdfs:label ?kompetenzbereich .
}
ORDER BY ?ab_jahrgangsstufe ?lehrplan ?kompetenzbereich
```

For the primary level, there is no French curriculum in Rhineland-Palatinate. Curricula without a class level, such as those structured by years of learning, do not appear in the query.

### <a id="abfrage-cq-15"></a>Which competency specifications belong to "Lesen" (reading) in German at the primary level?

Competency question [CQ 15](introduction.en.md#cq-15).

Searches in all states for areas whose label begins with "Lesen" in German curricula for the primary level. The subject is recognized across states via the KIM school subject vocabulary (KIM: Kompetenzzentrum Interoperable Metadaten, competence center for interoperable metadata).

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+skos%3A++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0APREFIX+CE_Bereich%3A++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000349%3E%0APREFIX+CE_Kompetenzspezifikation%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000263%3E%0APREFIX+hat_schulfach%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_schulstufe%3A++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000047%3E%0APREFIX+primarbereich%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000036%3E%0APREFIX+hat_teil%3A++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+deutsch_kim%3A+++++++++++++++%3Chttp%3A%2F%2Fw3id.org%2Fkim%2Fschulfaecher%2Fs1005%3E%0A%0ASELECT+DISTINCT+%3Fland+%3Flehrplan+%3Fkompetenzbereich+%3Fkompetenz%0AWHERE+%7B%0A++VALUES+%28%3Fg+%3Fland%29+%7B%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%22Bayern%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%22Sachsen%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E+%22Rheinland-Pfalz%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E+%22Berlin%2FBrandenburg%22%29%0A++%7D%0A++GRAPH+%3Fg+%7B%0A++++%3Fkontext+hat_schulfach%3A+%3Ffach+%3B%0A+++++++++++++hat_schulstufe%3A+primarbereich%3A+%3B%0A+++++++++++++rdfs%3Alabel+%3Flehrplan+%3B%0A+++++++++++++hat_teil%3A+%3Fbereich+.%0A++++%3Ffach+skos%3AexactMatch+deutsch_kim%3A+.%0A++++%3Fbereich+a+CE_Bereich%3A+%3B%0A+++++++++++++rdfs%3Alabel+%3Fkompetenzbereich+%3B%0A+++++++++++++hat_teil%3A+%3Fks+.%0A++++FILTER%28REGEX%28%3Fkompetenzbereich%2C+%22%5ELesen%22%2C+%22i%22%29%29%0A++++%3Fks+a+CE_Kompetenzspezifikation%3A+%3B%0A++++++++rdfs%3Alabel+%3Fkompetenz+.%0A++%7D%0A%7D%0AORDER+BY+%3Fland+%3Flehrplan+%3Fkompetenzbereich+%3Fkompetenz&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                      <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos:                      <http://www.w3.org/2004/02/skos/core#>
PREFIX CE_Bereich:                <https://w3id.org/lehrplan/ontology/LP_0000349>
PREFIX CE_Kompetenzspezifikation: <https://w3id.org/lehrplan/ontology/LP_0000263>
PREFIX hat_schulfach:             <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX hat_schulstufe:            <https://w3id.org/lehrplan/ontology/LP_0000047>
PREFIX primarbereich:             <https://w3id.org/lehrplan/ontology/LP_0000036>
PREFIX hat_teil:                  <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX deutsch_kim:               <http://w3id.org/kim/schulfaecher/s1005>

SELECT DISTINCT ?land ?lehrplan ?kompetenzbereich ?kompetenz
WHERE {
  VALUES (?g ?land) {
    (<https://w3id.org/lehrplan/by> "Bayern")
    (<https://w3id.org/lehrplan/sn> "Sachsen")
    (<https://w3id.org/lehrplan/rp> "Rheinland-Pfalz")
    (<https://w3id.org/lehrplan/graph/be> "Berlin/Brandenburg")
  }
  GRAPH ?g {
    ?kontext hat_schulfach: ?fach ;
             hat_schulstufe: primarbereich: ;
             rdfs:label ?lehrplan ;
             hat_teil: ?bereich .
    ?fach skos:exactMatch deutsch_kim: .
    ?bereich a CE_Bereich: ;
             rdfs:label ?kompetenzbereich ;
             hat_teil: ?ks .
    FILTER(REGEX(?kompetenzbereich, "^Lesen", "i"))
    ?ks a CE_Kompetenzspezifikation: ;
        rdfs:label ?kompetenz .
  }
}
ORDER BY ?land ?lehrplan ?kompetenzbereich ?kompetenz
```

For Berlin and Brandenburg, the query returns no results, since the *Rahmenlehrpläne* there do not specify a school level but are structured by niveau stages.

### <a id="abfrage-cq-8"></a>Which competences and learning contents does biology 8 have in Saxony per educational track?

Competency question [CQ 8](introduction.en.md#cq-8).

Lists the competences and learning contents of the learning areas for class level 8 by school type.

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A+++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+fuer_schulart%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+hat_jahrgangsstufe%3A+++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+jahrgangsstufe_8%3A+++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000008%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_funktion%3A+++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0APREFIX+kompetenzbeschreibungsfunktion%3A+++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000479%3E%0APREFIX+lerninhaltsbeschreibungsfunktion%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000480%3E%0A%0ASELECT+DISTINCT+%3Fschulart+%3Fart+%3Felement%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+a+Lehrplan%3A+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++fuer_schulart%3A+%3Fsa+%3B%0A++++++hat_teil%3A+%3Fbereich+.%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28LCASE%28STR%28%3FfachLabel%29%29+%3D+%22biologie%22%29%0A++%3Fsa+rdfs%3Alabel+%3Fschulart+.%0A++%3Fbereich+hat_jahrgangsstufe%3A+jahrgangsstufe_8%3A+%3B%0A+++++++++++hat_teil%3A+%3Fe+.%0A++%3Fe+rdfs%3Alabel+%3Felement+.%0A++%7B+%3Fe+hat_funktion%3A+kompetenzbeschreibungsfunktion%3A+.+++BIND%28%22Kompetenz%22+AS+%3Fart%29+%7D%0A++UNION%0A++%7B+%3Fe+hat_funktion%3A+lerninhaltsbeschreibungsfunktion%3A+.+BIND%28%22Lerninhalt%22+AS+%3Fart%29+%7D%0A%7D%0AORDER+BY+%3Fschulart+%3Fart+%3Felement&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                             <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Lehrplan:                         <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX hat_schulfach:                    <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX fuer_schulart:                    <https://w3id.org/lehrplan/ontology/LP_0000812>
PREFIX hat_jahrgangsstufe:               <https://w3id.org/lehrplan/ontology/LP_0000026>
PREFIX jahrgangsstufe_8:                 <https://w3id.org/lehrplan/ontology/LP_2000008>
PREFIX hat_teil:                         <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX hat_funktion:                     <https://w3id.org/lehrplan/ontology/LP_0000483>
PREFIX kompetenzbeschreibungsfunktion:   <https://w3id.org/lehrplan/ontology/LP_0000479>
PREFIX lerninhaltsbeschreibungsfunktion: <https://w3id.org/lehrplan/ontology/LP_0000480>

SELECT DISTINCT ?schulart ?art ?element
FROM <https://w3id.org/lehrplan/sn>
WHERE {
  ?lp a Lehrplan: ;
      hat_schulfach: ?fach ;
      fuer_schulart: ?sa ;
      hat_teil: ?bereich .
  ?fach rdfs:label ?fachLabel .
  FILTER(LCASE(STR(?fachLabel)) = "biologie")
  ?sa rdfs:label ?schulart .
  ?bereich hat_jahrgangsstufe: jahrgangsstufe_8: ;
           hat_teil: ?e .
  ?e rdfs:label ?element .
  { ?e hat_funktion: kompetenzbeschreibungsfunktion: .   BIND("Kompetenz" AS ?art) }
  UNION
  { ?e hat_funktion: lerninhaltsbeschreibungsfunktion: . BIND("Lerninhalt" AS ?art) }
}
ORDER BY ?schulart ?art ?element
```

The Saxon biology curricula do not specify an educational track level. A distinction by educational track is therefore only possible via the school type: the *Gymnasium* corresponds to the academic educational track, the *Oberschule* comprises the *Hauptschule* and the *Realschule* educational tracks.

### <a id="abfrage-cq-10"></a><a id="abfrage-cq-6"></a>How do mathematics competences develop from the primary level to lower secondary level (Sek I)?

Competency question [CQ 10](introduction.en.md#cq-10); the overview also gives a first indication regarding [CQ 6](introduction.en.md#cq-6).

Gives an overview for Saxony of the number of learning areas and competency specifications per class level and school type, from the *Grundschule* (primary school) up to class level 10 at the *Oberschule* and the *Gymnasium*.

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+CE_Kompetenzspezifikation%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000263%3E%0APREFIX+hat_schulfach%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+fuer_schulart%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+hat_jahrgangsstufe%3A++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+jahrgangsstufe_1%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000001%3E%0APREFIX+jahrgangsstufe_2%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000002%3E%0APREFIX+jahrgangsstufe_3%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000003%3E%0APREFIX+jahrgangsstufe_4%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000004%3E%0APREFIX+jahrgangsstufe_5%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000005%3E%0APREFIX+jahrgangsstufe_6%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000006%3E%0APREFIX+jahrgangsstufe_7%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000007%3E%0APREFIX+jahrgangsstufe_8%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000008%3E%0APREFIX+jahrgangsstufe_9%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000009%3E%0APREFIX+jahrgangsstufe_10%3A+++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000010%3E%0APREFIX+hat_teil%3A++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0ASELECT+%3Fstufe+%3Fschulart+%28COUNT%28DISTINCT+%3Fbereich%29+AS+%3Flernbereiche%29+%28COUNT%28DISTINCT+%3Fks%29+AS+%3Fkompetenzen%29%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+a+Lehrplan%3A+%3B+hat_schulfach%3A+%3Ffach+%3B+fuer_schulart%3A+%3Fsa+%3B+hat_teil%3A+%3Fbereich+.%0A++%3Ffach+rdfs%3Alabel+%3Ffl+.+FILTER%28LCASE%28STR%28%3Ffl%29%29%3D%22mathematik%22%29%0A++%3Fsa+rdfs%3Alabel+%3Fschulart+.%0A++%3Fbereich+hat_jahrgangsstufe%3A+%3Fjg+%3B+hat_teil%3A+%3Fks+.%0A++%3Fks+a+CE_Kompetenzspezifikation%3A+.%0A++VALUES+%28%3Fjg+%3Fstufe%29+%7B+%28jahrgangsstufe_1%3A+1%29+%28jahrgangsstufe_2%3A+2%29+%28jahrgangsstufe_3%3A+3%29+%28jahrgangsstufe_4%3A+4%29+%28jahrgangsstufe_5%3A+5%29%0A++++++++++++++++++++++++%28jahrgangsstufe_6%3A+6%29+%28jahrgangsstufe_7%3A+7%29+%28jahrgangsstufe_8%3A+8%29+%28jahrgangsstufe_9%3A+9%29+%28jahrgangsstufe_10%3A+10%29+%7D%0A%7D%0AGROUP+BY+%3Fstufe+%3Fschulart%0AORDER+BY+%3Fstufe+%3Fschulart&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                      <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Lehrplan:                  <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX CE_Kompetenzspezifikation: <https://w3id.org/lehrplan/ontology/LP_0000263>
PREFIX hat_schulfach:             <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX fuer_schulart:             <https://w3id.org/lehrplan/ontology/LP_0000812>
PREFIX hat_jahrgangsstufe:        <https://w3id.org/lehrplan/ontology/LP_0000026>
PREFIX jahrgangsstufe_1:          <https://w3id.org/lehrplan/ontology/LP_2000001>
PREFIX jahrgangsstufe_2:          <https://w3id.org/lehrplan/ontology/LP_2000002>
PREFIX jahrgangsstufe_3:          <https://w3id.org/lehrplan/ontology/LP_2000003>
PREFIX jahrgangsstufe_4:          <https://w3id.org/lehrplan/ontology/LP_2000004>
PREFIX jahrgangsstufe_5:          <https://w3id.org/lehrplan/ontology/LP_2000005>
PREFIX jahrgangsstufe_6:          <https://w3id.org/lehrplan/ontology/LP_2000006>
PREFIX jahrgangsstufe_7:          <https://w3id.org/lehrplan/ontology/LP_2000007>
PREFIX jahrgangsstufe_8:          <https://w3id.org/lehrplan/ontology/LP_2000008>
PREFIX jahrgangsstufe_9:          <https://w3id.org/lehrplan/ontology/LP_2000009>
PREFIX jahrgangsstufe_10:         <https://w3id.org/lehrplan/ontology/LP_2000010>
PREFIX hat_teil:                  <http://purl.obolibrary.org/obo/BFO_0000051>
SELECT ?stufe ?schulart (COUNT(DISTINCT ?bereich) AS ?lernbereiche) (COUNT(DISTINCT ?ks) AS ?kompetenzen)
FROM <https://w3id.org/lehrplan/sn>
WHERE {
  ?lp a Lehrplan: ; hat_schulfach: ?fach ; fuer_schulart: ?sa ; hat_teil: ?bereich .
  ?fach rdfs:label ?fl . FILTER(LCASE(STR(?fl))="mathematik")
  ?sa rdfs:label ?schulart .
  ?bereich hat_jahrgangsstufe: ?jg ; hat_teil: ?ks .
  ?ks a CE_Kompetenzspezifikation: .
  VALUES (?jg ?stufe) { (jahrgangsstufe_1: 1) (jahrgangsstufe_2: 2) (jahrgangsstufe_3: 3) (jahrgangsstufe_4: 4) (jahrgangsstufe_5: 5)
                        (jahrgangsstufe_6: 6) (jahrgangsstufe_7: 7) (jahrgangsstufe_8: 8) (jahrgangsstufe_9: 9) (jahrgangsstufe_10: 10) }
}
GROUP BY ?stufe ?schulart
ORDER BY ?stufe ?schulart
```

The query shows the scope per class level and school type. How individual competences develop in content cannot currently be queried, since competences are not linked with each other across class levels in the data.

### <a id="abfrage-cq-18"></a>Which class levels does niveau stage C comprise at the Gymnasium in Berlin?

Competency question [CQ 18](introduction.en.md#cq-18).

Determines, via niveau stage C, the corresponding level for the academic (*Gymnasium*) educational track and its class levels.

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+niveaustufe_c%3A+++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000466%3E%0APREFIX+hat_niveau%3A++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000840%3E%0APREFIX+hat_jahrgangsstufe%3A++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+Gymnasialniveau_Sek_I%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000069%3E%0ASELECT+DISTINCT+%3Fniveau+%3Fjahrgangsstufe%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E%0AWHERE+%7B%0A++niveaustufe_c%3A+hat_niveau%3A+%3Fn+.%0A++%3Fn+a+Gymnasialniveau_Sek_I%3A+%3B%0A+++++rdfs%3Alabel+%3Fniveau+%3B%0A+++++hat_jahrgangsstufe%3A+%3Fj+.%0A++%3Fj+rdfs%3Alabel+%3Fjahrgangsstufe+.%0A++FILTER%28LANG%28%3Fjahrgangsstufe%29+%3D+%22de%22%29%0A%7D%0AORDER+BY+%3Fjahrgangsstufe&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                  <http://www.w3.org/2000/01/rdf-schema#>
PREFIX niveaustufe_c:         <https://w3id.org/lehrplan/ontology/LP_0000466>
PREFIX hat_niveau:            <https://w3id.org/lehrplan/ontology/LP_0000840>
PREFIX hat_jahrgangsstufe:    <https://w3id.org/lehrplan/ontology/LP_0000026>
PREFIX Gymnasialniveau_Sek_I: <https://w3id.org/lehrplan/ontology/LP_0000069>
SELECT DISTINCT ?niveau ?jahrgangsstufe
FROM <https://w3id.org/lehrplan/graph/be>
WHERE {
  niveaustufe_c: hat_niveau: ?n .
  ?n a Gymnasialniveau_Sek_I: ;
     rdfs:label ?niveau ;
     hat_jahrgangsstufe: ?j .
  ?j rdfs:label ?jahrgangsstufe .
  FILTER(LANG(?jahrgangsstufe) = "de")
}
ORDER BY ?jahrgangsstufe
```

### <a id="abfrage-cq-9"></a>Which English competency specifications does Bavaria have that Brandenburg does not?

Competency question [CQ 9](introduction.en.md#cq-9).

This question cannot currently be answered meaningfully. A comparison based on wording shows that none of the Bavarian competence expectations occurs verbatim in the *Rahmenlehrplan* of Berlin and Brandenburg, since the states formulate their competences differently. A comparison by content would require the competences of the states to be linked with each other, for instance via the educational standards of the KMK (KMK: Standing Conference of the Ministers of Education and Cultural Affairs, Kultusministerkonferenz); the curriculum data do not yet contain such links.

### <a id="abfrage-cq-16"></a>In which subjects does Saxony address "Bildung für nachhaltige Entwicklung" (education for sustainable development)?

Competency question [CQ 16](introduction.en.md#cq-16).

The Saxon curricula refer in numerous places to cross-curricular educational and pedagogical goals. The query counts, per subject, the curricula and references that relate to "Bildung für nachhaltige Entwicklung".

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A+++++++++++++++++++++++++++++++++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A++++++++++++++++++++++++++++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++++++++++++++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_verweis%3A++++++++++++++++++++++++++++++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0030071%3E%0APREFIX+Verweis_auf_ein_ueberfachliches_Bildungs_und_Erziehungsziel_SN%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0030191%3E%0ASELECT+%3Ffach+%28COUNT%28DISTINCT+%3Flp%29+AS+%3Flehrplaene%29+%28COUNT%28DISTINCT+%3Fverweis%29+AS+%3Fverweise%29%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+a+Lehrplan%3A+%3B%0A++++++hat_schulfach%3A+%3Ff+%3B%0A++++++hat_teil%3A+%3Felement+.%0A++%3Felement+hat_verweis%3A+%3Fverweis+.%0A++%3Ff+rdfs%3Alabel+%3Ffach+.%0A++%3Fverweis+a+Verweis_auf_ein_ueberfachliches_Bildungs_und_Erziehungsziel_SN%3A+%3B%0A+++++++++++rdfs%3Alabel+%3Fziel+.%0A++FILTER%28CONTAINS%28LCASE%28%3Fziel%29%2C+%22nachhaltige+entwicklung%22%29%29%0A%7D%0AGROUP+BY+%3Ffach%0AORDER+BY+DESC%28%3Fverweise%29+%3Ffach&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdfs:                                                           <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Lehrplan:                                                       <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX hat_schulfach:                                                  <https://w3id.org/lehrplan/ontology/LP_0000537>
PREFIX hat_teil:                                                       <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX hat_verweis:                                                    <https://w3id.org/lehrplan/ontology/LP_0030071>
PREFIX Verweis_auf_ein_ueberfachliches_Bildungs_und_Erziehungsziel_SN: <https://w3id.org/lehrplan/ontology/LP_0030191>
SELECT ?fach (COUNT(DISTINCT ?lp) AS ?lehrplaene) (COUNT(DISTINCT ?verweis) AS ?verweise)
FROM <https://w3id.org/lehrplan/sn>
WHERE {
  ?lp a Lehrplan: ;
      hat_schulfach: ?f ;
      hat_teil: ?element .
  ?element hat_verweis: ?verweis .
  ?f rdfs:label ?fach .
  ?verweis a Verweis_auf_ein_ueberfachliches_Bildungs_und_Erziehungsziel_SN: ;
           rdfs:label ?ziel .
  FILTER(CONTAINS(LCASE(?ziel), "nachhaltige entwicklung"))
}
GROUP BY ?fach
ORDER BY DESC(?verweise) ?fach
```

### <a id="abfrage-cq-17"></a>How are the niveau stages in Berlin and Brandenburg related to the class levels?

Competency question [CQ 17](introduction.en.md#cq-17).

For each niveau stage, lists the associated qualification-related levels together with the first and last class level in which they are typically reached (see [Pattern 11](patterns.en.md#pattern-11-niveau-stages-bebb)).

[Direct link to the SPARQL endpoint](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+xsd%3A++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+rdfs%3A+++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Niveaustufe_BE_BB%3A++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000443%3E%0APREFIX+hat_niveau%3A+++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000840%3E%0APREFIX+hat_jahrgangsstufe%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0ASELECT+%3Fniveaustufe+%3Fniveau+%28MIN%28%3Fn%29+AS+%3Fvon_jahrgangsstufe%29+%28MAX%28%3Fn%29+AS+%3Fbis_jahrgangsstufe%29%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E%0AWHERE+%7B%0A++%3Fstufe+a+Niveaustufe_BE_BB%3A+%3B%0A+++++++++rdfs%3Alabel+%3Fniveaustufe+%3B%0A+++++++++hat_niveau%3A+%3Fnv+.%0A++%3Fnv+rdfs%3Alabel+%3Fniveau+%3B%0A++++++hat_jahrgangsstufe%3A+%3Fjg+.%0A++%3Fjg+rdfs%3Alabel+%3FjgLabel+.%0A++FILTER%28LANG%28%3FjgLabel%29+%3D+%22de%22%29%0A++BIND%28xsd%3Ainteger%28STRAFTER%28%3FjgLabel%2C+%22+%22%29%29+AS+%3Fn%29%0A%7D%0AGROUP+BY+%3Fniveaustufe+%3Fniveau%0AORDER+BY+%3Fniveaustufe+%3Fniveau&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX xsd:                <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs:               <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Niveaustufe_BE_BB:  <https://w3id.org/lehrplan/ontology/LP_0000443>
PREFIX hat_niveau:         <https://w3id.org/lehrplan/ontology/LP_0000840>
PREFIX hat_jahrgangsstufe: <https://w3id.org/lehrplan/ontology/LP_0000026>
SELECT ?niveaustufe ?niveau (MIN(?n) AS ?von_jahrgangsstufe) (MAX(?n) AS ?bis_jahrgangsstufe)
FROM <https://w3id.org/lehrplan/graph/be>
WHERE {
  ?stufe a Niveaustufe_BE_BB: ;
         rdfs:label ?niveaustufe ;
         hat_niveau: ?nv .
  ?nv rdfs:label ?niveau ;
      hat_jahrgangsstufe: ?jg .
  ?jg rdfs:label ?jgLabel .
  FILTER(LANG(?jgLabel) = "de")
  BIND(xsd:integer(STRAFTER(?jgLabel, " ")) AS ?n)
}
GROUP BY ?niveaustufe ?niveau
ORDER BY ?niveaustufe ?niveau
```

The query currently returns only the Berlin levels for the *berufsorientierender Abschluss* (BOA, career-oriented qualification), the *Berufsbildungsreife* (BBR, basic vocational qualification), the *erweiterte Berufsbildungsreife* (EBBR, extended basic vocational qualification), the *mittlerer Schulabschluss* (MSA, intermediate school-leaving certificate) and the *Gymnasialniveau Sek I* (academic level, lower secondary). The Brandenburg levels for the *erweiterte Berufsbildungsreife* (EBR, extended basic vocational qualification), the *Fachoberschulreife* (FOR, entrance qualification for upper vocational school) and the *Fachoberschulreife* with entitlement to attend the upper secondary level of the *Gymnasium* (FOR-Q) are included in the ontology in version rc6, but not yet in the SPARQL endpoint.

### <a id="abfrage-cq-4"></a>Which competences are prerequisites for acquiring competence X?

Competency question [CQ 4](introduction.en.md#cq-4).

This question cannot currently be answered. The ontology does contain classes for prerequisites, for example *Eingangsvoraussetzung (BE)* and *Eingangsvoraussetzung (BB)* (entry prerequisite, Berlin/Brandenburg), but they are not used in the curriculum data. References to learning areas of earlier class levels, which could be evaluated as an indication of prior knowledge, do not occur in the data either.

### <a id="abfrage-cq-19"></a>How can learning contents be filtered by language level?

Competency question [CQ 19](introduction.en.md#cq-19).

This question cannot currently be answered. The ontology contains the six levels A1 to C2 of the Common European Framework of Reference for Languages (CEFR; German: Gemeinsamer Europäischer Referenzrahmen für Sprachen, GER) as *Fremdsprachenniveau* (foreign language level) (see [Pattern 9](patterns.en.md#pattern-9-levels)), but in the curriculum data learning contents and competences are not assigned to these levels.


## Outlook on the following chapters

The queries in this chapter have shown how the curriculum data can be evaluated via the SPARQL endpoint, from simple overviews and term searches to answering the competency questions. At the same time, they show where the data still have gaps and which questions can only be answered with further data.

The chapter [Usage](usage.en.md) describes how the Curriculum Ontology can be used beyond the queries: which release files are available, how the versions are structured, and how curriculum data can be validated against the ontology with SHACL shapes (SHACL: Shapes Constraint Language).
