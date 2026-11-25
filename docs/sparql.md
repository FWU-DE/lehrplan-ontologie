# SPARQL-Abfragen

Die Lehrplandaten sind über den [SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql) (SPARQL: SPARQL Protocol and RDF Query Language; RDF: Resource Description Framework) abfragbar. Die Beispiele auf dieser Seite zeigen typische Abfragen; jede kann über den Link „Direkter Link zum SPARQL-Endpunkt“ direkt ausgeführt werden.

## Aufbau des Endpunkts

Die Daten liegen in benannten Graphen, je einer pro Land bzw. Datenquelle:

| Graph                                    | Inhalt                                                  |
|------------------------------------------|---------------------------------------------------------|
| `https://w3id.org/lehrplan/by`           | Bayern (BY)                                             |
| `https://w3id.org/lehrplan/sn`           | Sachsen (SN)                                            |
| `https://w3id.org/lehrplan/rp`           | Rheinland-Pfalz (RP)                                    |
| `https://w3id.org/lehrplan/graph/be`     | Berlin und Brandenburg (BE/BB, gemeinsame Rahmenlehrpläne) |
| `https://w3id.org/lehrplan/graph/bista`  | KMK-Bildungsstandards                                   |

Jeder dieser Graphen enthält neben den Lehrplandaten auch die Ontologie selbst sowie die Schulfächer und Schularten aus der Schulfach- und Schulart-Ontologie. Zu jedem Graphen gibt es zwei Teilgraphen: `…/data` enthält die erfassten Lehrplandaten, `…/inferences` die von einem Reasoner abgeleiteten Tripel. Der Graph ohne Zusatz (z. B. `…/by`) enthält beides. Für die meisten Abfragen ist dieser Gesamtgraph die richtige Wahl, denn erst durch die abgeleiteten Tripel

- ist jedes Element auch Instanz seiner generischen Klasse (z. B. *CE-Bereich*) und trägt seine Funktion (*hat Funktion*),
- ist die transitive Relation *hat Teil* (`hat_teil:`) vollständig vorhanden – in den Daten selbst steht nur die direkte Gliederung über *hat direkten Teil* (`hat_direkten_teil:`) bzw. *direkt Teil von* (`direkt_teil_von:`),
- sind alle Lehrpläne Instanzen der Klasse *Lehrplan* (`Lehrplan:`), unabhängig von ihrer länderspezifischen Bezeichnung.

Da ein Tripel im Gesamtgraphen sowohl aus den Daten als auch aus den Ableitungen stammen kann, empfiehlt sich `SELECT DISTINCT`.

## Schreibweise der Abfragen

Die Klassen, Properties und Individuen der Lehrplan-Ontologie haben nicht sprechende Internationalized Resource Identifiers (IRIs) wie `https://w3id.org/lehrplan/ontology/LP_0000438`. Damit die Abfragen trotzdem lesbar bleiben, erhält jede verwendete IRI einen eigenen Prefix, der nach ihrer Bezeichnung benannt ist und die vollständige IRI enthält:

```sparql
PREFIX Lehrplan:       <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>
PREFIX sachsen:        <https://w3id.org/lehrplan/ontology/LP_3000047>
```

Im Abfragetext steht dann der Prefix ohne lokalen Namen, z. B. `?lp a Lehrplan: .` oder `?lp von_bundesland: sachsen: .`. Die Prefix-Namen folgen derselben Konvention wie auf der Seite [Patterns](patterns.md): Prefixe von Klassen beginnen wie deren Bezeichnung mit einem Großbuchstaben (`Lehrplan:`, `CE_Kompetenzspezifikation:`), Prefixe von Properties und Individuen werden kleingeschrieben (`von_bundesland:`, `sachsen:`). Umlaute sind ausgeschrieben (`fuer_schulart:`), und bei länderspezifischen Schulfächern, Schularten und Klassen ist das Länderkürzel angehängt (`gymnasium_sn:`, `Lernbereich_SN:`). Für eigene Abfragen lassen sich weitere Begriffe auf dieselbe Weise ergänzen; die IRIs sind in der [Referenzdokumentation](https://fwu-de.github.io/lehrplan-ontologie/index-de.html) und im Kapitel [Ontologie-Modell](structure.md#beziehungen-properties) aufgeführt.


## Abfragen zu den Lehrplänen

### Welche Lehrpläne gibt es in Sachsen?

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan%3A+++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+von_bundesland%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000029%3E%0APREFIX+sachsen%3A++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_3000047%3E%0A%0ASELECT+DISTINCT+%3Flehrplan+%3Ftitel%0AWHERE+%7B%0A%3Flehrplan+a+Lehrplan%3A+.%0A%3Flehrplan+von_bundesland%3A+sachsen%3A+.%0A%3Flehrplan+rdfs%3Alabel+%3Ftitel+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
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
oder

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan_SN%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000818%3E%0A%0ASELECT+DISTINCT+%3Flehrplan+%3Ftitel%0AWHERE+%7B%0A%3Flehrplan+a+Lehrplan_SN%3A+.%0A%3Flehrplan+rdfs%3Alabel+%3Ftitel+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX Lehrplan_SN: <https://w3id.org/lehrplan/ontology/LP_0000818>

SELECT DISTINCT ?lehrplan ?titel
WHERE {
?lehrplan a Lehrplan_SN: .
?lehrplan rdfs:label ?titel .
}
```

### Wie viele Lehrpläne gibt es in Sachsen?

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan_SN%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000818%3E%0A%0ASELECT+%28COUNT%28DISTINCT+%3Flehrplan%29+AS+%3Fanzahl%29%0AWHERE+%7B%0A%3Flehrplan+a+Lehrplan_SN%3A+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX Lehrplan_SN: <https://w3id.org/lehrplan/ontology/LP_0000818>

SELECT (COUNT(DISTINCT ?lehrplan) AS ?anzahl)
WHERE {
?lehrplan a Lehrplan_SN: .
}
```

### Wie viele Lehrpläne gibt es in Rheinland-Pfalz?

Zählt alle Instanzen der Klasse Lehrplan im RP-Graphen: [Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdf%3A++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0A%0ASELECT+%28COUNT%28DISTINCT+%3Flp%29+AS+%3Fanzahl%29%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0AWHERE+%7B%0A++%3Flp+rdf%3Atype+Lehrplan%3A+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```sparql
PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX Lehrplan: <https://w3id.org/lehrplan/ontology/LP_0000438>

SELECT (COUNT(DISTINCT ?lp) AS ?anzahl)
FROM <https://w3id.org/lehrplan/rp>
WHERE {
  ?lp rdf:type Lehrplan: .
}
```

### Wie viele Lehrpläne gibt es in BY, SN, RP und BE/BB?

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdf%3A++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0A%0ASELECT+%3Fbundesland+%28COUNT%28DISTINCT+%3Flp%29+AS+%3Fanzahl%29%0AWHERE+%7B%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%7B%0A++++++%3Flp+rdf%3Atype+Lehrplan%3A+.+%7D%0A++++BIND%28%22Bayern%22+AS+%3Fbundesland%29+%7D%0A++UNION%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%7B%0A++++++%3Flp+rdf%3Atype+Lehrplan%3A+.+%7D%0A++++BIND%28%22Sachsen%22+AS+%3Fbundesland%29+%7D%0A++UNION%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E+%7B%0A++++++%3Flp+rdf%3Atype+Lehrplan%3A+.+%7D%0A++++BIND%28%22Rheinland-Pfalz%22+AS+%3Fbundesland%29+%7D%0A++UNION%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E+%7B%0A++++++%3Flp+rdf%3Atype+Lehrplan%3A+.+%7D%0A++++BIND%28%22Berlin%2FBrandenburg%22+AS+%3Fbundesland%29+%7D%0A%7D%0AGROUP+BY+%3Fbundesland%0AORDER+BY+DESC%28%3Fanzahl%29&format=text%2Fhtml&timeout=0&signal_void=on)
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

## Abfragen zu Fächern

### Welche Fächer gibt es in Sachsen?

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Schulfach%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000001%3E%0APREFIX+von_bundesland%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000029%3E%0APREFIX+sachsen%3A++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_3000047%3E%0A%0ASELECT+DISTINCT+%3Fschulfach%0AWHERE+%7B%0A++++%3Fs+a+Schulfach%3A+.%0A++++%3Fs+von_bundesland%3A+sachsen%3A+.%0A++++%3Fs+rdfs%3Alabel+%3Fschulfach+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
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

Listet alle Schulfächer mit ihrer IRI, gefiltert auf das Präfix SN_:
[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+schulfaecher_sachsen%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2FSN_0000000%3E%0A%0ASELECT+DISTINCT+%3Ffach+%3Flabel%0AWHERE+%7B%0A++%3Ffach+rdf%3Atype+%3Ftype+%3B%0A++++++++rdfs%3Alabel+%3Flabel+.%0A++FILTER%28+STRSTARTS%28STR%28%3Ffach%29%2C+%22https%3A%2F%2Fw3id.org%2Fschulfach%2FSN%22%29+%29%0A++FILTER%28+%3Ffach+%21%3D+schulfaecher_sachsen%3A+%29+%23+Root-Knoten+ausblenden%0A%7D%0AORDER+BY+%3Flabel&format=text%2Fhtml&timeout=0&signal_void=on)
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

### Welche Fächer gibt es in BY, SN, RP und BE/BB?

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Schulfach%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000001%3E%0A%0ASELECT+DISTINCT+%3Fbundesland+%3Flabel%0AWHERE+%7B%0A++VALUES+%28%3Fprefix+%3Fbundesland%29+%7B%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FBY%22+%22Bayern%22%29%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FSN%22+%22Sachsen%22%29%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FRP%22+%22Rheinland-Pfalz%22%29%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FBB%22+%22Brandenburg%22%29%0A++%7D%0A++%3Ffach+a+Schulfach%3A+%3B%0A++++++++rdfs%3Alabel+%3Flabel+.%0A++FILTER%28+STRSTARTS%28STR%28%3Ffach%29%2C+%3Fprefix%29+%29%0A++FILTER%28+%21REGEX%28%3Flabel%2C+%22%5ESchulf%C3%A4cher%22%29+%29%0A%7D%0AORDER+BY+%3Fbundesland+%3Flabel&format=text%2Fhtml&timeout=0&signal_void=on)
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
## Abfragen zu den Schularten

### Welche Schularten gibt es in Sachsen?

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Schulart%3A+++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000111%3E%0APREFIX+sachsen%3A++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_3000047%3E%0APREFIX+von_bundesland%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000029%3E%0A%0ASELECT+DISTINCT+%3Fschulart%0AWHERE+%7B%0A++++%3Fs+a+Schulart%3A+.%0A++++%3Fs+von_bundesland%3A+sachsen%3A+.%0A++++%3Fs+rdfs%3Alabel+%3Fschulart+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
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

## Abfragen zu Inhalten der Lehrpläne

### In welchen Lehrplänen kommt der Begriff "Zelle" vor?

Sucht über alle vier Graphen nach Labels, die den Begriff enthalten, und gibt den zugehörigen Lehrplan sowie das Land zurück. Da *hat Teil* (`hat_teil:`) im Gesamtgraphen bereits vollständig abgeleitet ist, erreicht die Abfrage damit alle Ebenen der Gliederung. Ein Property-Pfad mit `+` ist daher nicht nötig und bei großen Graphen deutlich langsamer.
[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_teil%3A+%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0A%0ASELECT+DISTINCT+%3Fbundesland+%3FlpLabel+%3Ftreffer%0AWHERE+%7B%0A++VALUES+%28%3Fg+%3Fbundesland%29+%7B%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%22Bayern%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%22Sachsen%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E+%22Rheinland-Pfalz%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E+%22Berlin%2FBrandenburg%22%29%0A++%7D%0A++GRAPH+%3Fg+%7B%0A++++%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++++hat_teil%3A+%3Fnode+.+++++++%23+hat+Teil+%28alle+Ebenen%29%0A++++%3Fnode+rdfs%3Alabel+%3Ftreffer+.%0A++++FILTER%28CONTAINS%28LCASE%28%3Ftreffer%29%2C+%22zelle%22%29%29%0A++%7D%0A%7D%0AORDER+BY+%3Fbundesland+%3FlpLabel+%3Ftreffer&format=text%2Fhtml&timeout=0&signal_void=on)

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

### In welchen Beschreibungstexten kommt ein Begriff vor?

Schließt auch Beschreibungsliteral (lp:LP_0030051 = hat Beschreibung) ein – liefert mehr Treffer als reine Label-Suche. Bayern und Sachsen wurden hier beispielhaft verwendet.
[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A+++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_teil%3A+++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_beschreibung%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0030051%3E%0A%0ASELECT+DISTINCT+%3Fbundesland+%3FlpLabel+%3Ftext%0AWHERE+%7B%0A++VALUES+%28%3Fg+%3Fbundesland%29+%7B%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%22Bayern%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%22Sachsen%22%29%0A++%7D%0A++GRAPH+%3Fg+%7B%0A++++%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++++hat_teil%3A+%3Fnode+.%0A++++%3Fnode+%28+rdfs%3Alabel+%7C+hat_beschreibung%3A+%29+%3Ftext+.%0A++++FILTER%28+CONTAINS%28LCASE%28STR%28%3Ftext%29%29%2C+%22zelle%22%29+%29%0A++%7D%0A%7D%0AORDER+BY+%3Fbundesland+%3FlpLabel%0ALIMIT+50&format=text%2Fhtml&timeout=0&signal_void=on)
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

### Welche Lernbereiche hat Mathematik in Klasse 5 am Gymnasium in Sachsen?

Findet alle Lernbereiche (*Lernbereich (SN)*, `Lernbereich_SN:`) der Jahrgangsstufe 5 aus den Mathematik-Lehrplänen für das Gymnasium. In Sachsen sind die Lernbereiche die fachliche Gliederungsebene unterhalb des Lehrplans.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A+++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+fuer_schulart%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+gymnasium_sn%3A+++++++%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2FSN_0000005%3E%0APREFIX+hat_teil%3A+++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+Lernbereich_SN%3A+++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0002113%3E%0APREFIX+hat_jahrgangsstufe%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+jahrgangsstufe_5%3A+++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000005%3E%0A%0ASELECT+DISTINCT+%3FlpLabel+%3FbereichLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++fuer_schulart%3A+gymnasium_sn%3A+%3B%0A++++++hat_teil%3A+%3Fbereich+.%0A%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28CONTAINS%28LCASE%28%3FfachLabel%29%2C+%22mathematik%22%29%29%0A%0A++%3Fbereich+rdf%3Atype+Lernbereich_SN%3A+%3B%0A+++++++++++hat_jahrgangsstufe%3A+jahrgangsstufe_5%3A+%3B%0A+++++++++++rdfs%3Alabel+%3FbereichLabel+.%0A%7D%0AORDER+BY+%3FlpLabel+%3FbereichLabel&format=text%2Fhtml&timeout=0&signal_void=on)
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

### <a id="abfrage-cq-11"></a>Welche Kompetenzbereiche hat Mathematik in Rheinland-Pfalz?

Kompetenzfrage [CQ 11](introduction.md#cq-11).

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A+++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+Lehrplan%3A++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A+++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_teil%3A++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+Kompetenzbereich_RP%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000431%3E%0A%0ASELECT+DISTINCT+%3FlpLabel+%3FkbLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0AWHERE+%7B%0A++%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++hat_teil%3A+%3Fkb+.%0A%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28CONTAINS%28LCASE%28%3FfachLabel%29%2C+%22mathematik%22%29%29%0A%0A++%3Fkb+rdf%3Atype+Kompetenzbereich_RP%3A+%3B%0A++++++rdfs%3Alabel+%3FkbLabel+.%0A%7D%0AORDER+BY+%3FlpLabel+%3FkbLabel&format=text%2Fhtml&timeout=0&signal_void=on)
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

## Abfragen zur Struktur der Lehrpläne

### Welche Elemente bilden die erste Strukturebene eines Lehrplans?

Länderübergreifend: Gibt alle direkten Teilelemente (*hat direkten Teil*) eines Lehrplans in ihrer Reihenfolge (*hat Position*) zurück – unabhängig vom konkreten Klassennamen.

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
[Direkter Link zu Beispiel mit bayrischem Lehrplan im SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A+++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+hat_direkten_teil%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000565%3E%0APREFIX+hat_position%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000460%3E%0A%0ASELECT+DISTINCT+%3Fposition+%3FelementLabel+%3Ftyp%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E%0AWHERE+%7B%0A++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flehrplanplus-lis_live_isb.c.117097.de%3E+hat_direkten_teil%3A+%3Felement+.%0A++%3Felement+rdfs%3Alabel+%3FelementLabel+.%0A++OPTIONAL+%7B+%3Felement+hat_position%3A+%3Fposition+%7D%0A++OPTIONAL+%7B+%3Felement+rdf%3Atype+%3Ftyp+.%0A+++++++++++++FILTER%28STRSTARTS%28STR%28%3Ftyp%29%2C%0A+++++++++++++++%22https%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%22%29%29+%7D%0A%7D%0AORDER+BY+%3Fposition+%3FelementLabel&format=text%2Fhtml&timeout=0&signal_void=on)
[Direkter Link zu Beispiel mit einem sächsischen Lehrplan im SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+rdf%3A+++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+hat_direkten_teil%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000565%3E%0APREFIX+hat_position%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000460%3E%0A%0ASELECT+DISTINCT+%3Fposition+%3FelementLabel+%3Ftyp%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fsn%2Flehrplan-935-1%3E+hat_direkten_teil%3A+%3Felement+.%0A++%3Felement+rdfs%3Alabel+%3FelementLabel+.%0A++OPTIONAL+%7B+%3Felement+hat_position%3A+%3Fposition+%7D%0A++OPTIONAL+%7B+%3Felement+rdf%3Atype+%3Ftyp+.%0A+++++++++++++FILTER%28STRSTARTS%28STR%28%3Ftyp%29%2C%0A+++++++++++++++%22https%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%22%29%29+%7D%0A%7D%0AORDER+BY+%3Fposition+%3FelementLabel&format=text%2Fhtml&timeout=0&signal_void=on)

### <a id="abfrage-cq-1"></a>Welche Verknüpfung besteht zwischen Element X und Element Y?

Kompetenzfrage [CQ 1](introduction.md#cq-1).

Direkte Relation X → Y oder Y → X:

[Direkter Link zu Beispiel im SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3Fvon+%3Fpraedikat+%3Fnach%0AWHERE+%7B%0A++GRAPH+%3Fg+%7B%0A++++%7B+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+%3Fpraedikat+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_live_isb.c.1182.de%3E+.%0A++++++BIND%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+AS+%3Fvon%29++BIND%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_live_isb.c.1182.de%3E+AS+%3Fnach%29+%7D%0A++++UNION%0A++++%7B+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_live_isb.c.1182.de%3E+%3Fpraedikat+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+.%0A++++++BIND%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_live_isb.c.1182.de%3E+AS+%3Fvon%29++BIND%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+AS+%3Fnach%29+%7D%0A++%7D%0A%7D%0AORDER+BY+%3Fvon+%3Fpraedikat&format=text%2Fhtml&timeout=0&signal_void=on)

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

Indirekter Pfad über Zwischenknoten Z (X→Z→Y):

[Direkter Link zu Beispiel im SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3Fp1+%3Fz+%3FzLabel+%3Fp2%0AWHERE+%7B%0A++GRAPH+%3Fg+%7B%0A++++%7B+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+%3Fp1+%3Fz+.+%3Fz+%3Fp2+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.347.de%3E+.+%7D%0A++++UNION%0A++++%7B+%3Fz+%3Fp1+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+.+%3Fz+%3Fp2+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.347.de%3E+.+%7D%0A++%7D%0A++OPTIONAL+%7B+%3Fz+rdfs%3Alabel+%3FzLabel+%7D%0A++FILTER%28+%3Fz+%21%3D+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+%26%26+%3Fz+%21%3D+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.347.de%3E+%29%0A%7D%0ALIMIT+50&format=text%2Fhtml&timeout=0&signal_void=on)

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

Alle Nachbarn und Properties eines Elements (Kontext-Dump):

[Direkter Link zu Beispiel im SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3Frichtung+%3Fpraedikat+%3FpraedikatLabel+%3Fnachbar+%3FnachbarLabel%0AWHERE+%7B%0A++GRAPH+%3Fg+%7B%0A++++%7B+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+%3Fpraedikat+%3Fnachbar+.+BIND%28%22%E2%86%92%22+AS+%3Frichtung%29+%7D%0A++++UNION%0A++++%7B+%3Fnachbar+%3Fpraedikat+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fresource%2Fby%2Flis_01.c.348.de%3E+.+BIND%28%22%E2%86%90%22+AS+%3Frichtung%29+%7D%0A++%7D%0A++OPTIONAL+%7B+%3Fpraedikat+rdfs%3Alabel+%3FpraedikatLabel+%7D%0A++OPTIONAL+%7B+%3Fnachbar+++rdfs%3Alabel+%3FnachbarLabel++%7D%0A%7D%0AORDER+BY+%3Frichtung+%3Fpraedikat&format=text%2Fhtml&timeout=0&signal_void=on)

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

## Weitere Abfragen zu Kompetenzen und Inhalten

### <a id="abfrage-cq-5"></a>Welche Kompetenzspezifikationen hat Mathematik in Klasse 7 je Schulart in Sachsen?

Kompetenzfrage [CQ 5](introduction.md#cq-5).

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan%3A+++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_jahrgangsstufe%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+fuer_schulart%3A++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_funktion%3A+++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0APREFIX+kompetenzbeschreibungsfunktion%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000479%3E%0A%0ASELECT+DISTINCT+%3FschulartLabel+%3FlpLabel+%3FelementLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++hat_jahrgangsstufe%3A+%3Fjg+%3B%0A++++++fuer_schulart%3A+%3Fschulart+%3B%0A++++++hat_teil%3A%2B++%3Felement+.++%23+transitiv%0A%0A++%3Felement+hat_funktion%3A+kompetenzbeschreibungsfunktion%3A+.%0A%0A++%3Ffach+++++rdfs%3Alabel+%3FfachLabel+.%0A++%3Fjg+++++++rdfs%3Alabel+%3FjgLabel+.%0A++%3Fschulart+rdfs%3Alabel+%3FschulartLabel+.%0A++%3Felement++rdfs%3Alabel+%3FelementLabel+.%0A%0A++FILTER%28+CONTAINS%28LCASE%28STR%28%3FfachLabel%29%29%2C+%22mathematik%22%29+%29%0A++FILTER%28+CONTAINS%28STR%28%3FjgLabel%29%2C+%227%22%29+%29%0A%7D%0AORDER+BY+%3FschulartLabel+%3FlpLabel+%3FelementLabel&format=text%2Fhtml&timeout=0&signal_void=on)

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

### Welche Niveaustufen sind den Elementen in Berlin/Brandenburg zugeordnet?

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_teil%3A+++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_niveaustufe%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000578%3E%0APREFIX+wird_beschrieben_von%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000024%3E%0APREFIX+hat_wert%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000344%3E%0A%0ASELECT+DISTINCT+%3FlpLabel+%3FniveauLabel+%3FelemLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E%0AWHERE+%7B%0A%3Flp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++hat_teil%3A%2B++++%3Felem+.%0A%0A%3Felem+hat_niveaustufe%3A+%3Fniveau+.%0A%0A%3Felem+wird_beschrieben_von%3A+%3FelemTitel+.%0A%3FelemTitel+hat_wert%3A+%3FelemLabel+.%0A%0A%3Fniveau+rdfs%3Alabel+%3FniveauLabel+.%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)

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

### <a id="abfrage-cq-2"></a>Welcher Bereich aus Rheinland-Pfalz entspricht einem Element aus Bayern?

Kompetenzfrage [CQ 2](introduction.md#cq-2).


Konkretes BY-Element als Ausgangspunkt: 

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+Lehrplan%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_teil%3A+%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0A%0ASELECT+DISTINCT+%3FrpLpLabel+%3FrpElementLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0AWHERE+%7B%0A++%3FrpLp+rdf%3Atype+Lehrplan%3A+%3B%0A++++++++rdfs%3Alabel+%3FrpLpLabel+%3B%0A++++++++hat_teil%3A%2B+%3FrpEl+.%0A++%3FrpEl+rdfs%3Alabel+%3FrpElementLabel+.%0A%0A++BIND%28%22Nat%C3%BCrliche+Zahlen%22+AS+%3Fsuchbegriff%29++%23+%E2%86%90+BY-Label+hier+eintragen%0A++FILTER%28+CONTAINS%28LCASE%28STR%28%3FrpElementLabel%29%29%2C+LCASE%28%3Fsuchbegriff%29%29+%29%0A%7D%0AORDER+BY+%3FrpLpLabel+%3FrpElementLabel&format=text%2Fhtml&timeout=0&signal_void=on)
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

### <a id="abfrage-cq-3"></a>Welche Lerninhalte sind einem Bereich zugeordnet?

Kompetenzfrage [CQ 3](introduction.md#cq-3), näherungsweise über die Lerninhalte, die demselben Bereich angehören wie eine Kompetenz.

Beispiel: Alle Lerninhalte in Sachsen, die einem Bereich mit dem Stichwort "schreiben" zugeordnet sind:
[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+hat_funktion%3A+++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0APREFIX+bereichsfunktion%3A+++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000497%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+lerninhaltsbeschreibungsfunktion%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000480%3E%0APREFIX+Lehrplan%3A+++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0A%0ASELECT+DISTINCT%0A++%3FlpLabel+%3FbereichLabel+%3FlerninhaltLabel%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Fbereich+hat_funktion%3A%0A+++++++++++++bereichsfunktion%3A+%3B%0A+++++++++++++rdfs%3Alabel+%3FbereichLabel+%3B%0A+++++++++++++hat_teil%3A+%3Flerninhalt+.%0A%0A++%3Flerninhalt+hat_funktion%3A%0A++++++++++++++lerninhaltsbeschreibungsfunktion%3A+%3B%0A++++++++++++++rdfs%3Alabel+%3FlerninhaltLabel+.%0A%0A++%23+Lehrplan-Zuordnung+f%C3%BCr+Kontext%0A++%3Flp+a+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0A++++++hat_teil%3A%2B+%3Fbereich+.%0A%0A++FILTER%28+CONTAINS%28LCASE%28STR%28%3FbereichLabel%29%29%2C+%22schreiben%22%29+%29%0A%7D%0AORDER+BY+%3FlpLabel+%3FbereichLabel+%3FlerninhaltLabel&format=text%2Fhtml&timeout=0&signal_void=on)
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


### Wie unterscheiden sich die Mathematikinhalte der Jahrgangsstufe 10 je Schulart in Sachsen?

Kompetenzfrage [CQ 5](introduction.md#cq-5), als Variante für die Lerninhalte der Jahrgangsstufe 10 in Sachsen.

Listet die Lerninhalte der Lernbereiche für die Jahrgangsstufe 10 nach Schulart auf, sodass sich Gymnasium und Oberschule gegenüberstellen lassen.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A+++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+fuer_schulart%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+hat_jahrgangsstufe%3A+++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+jahrgangsstufe_10%3A++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000010%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_funktion%3A+++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0APREFIX+lerninhaltsbeschreibungsfunktion%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000480%3E%0A%0ASELECT+DISTINCT+%3Fschulart+%3Flernbereich+%3Flerninhalt%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+a+Lehrplan%3A+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++fuer_schulart%3A+%3Fsa+%3B%0A++++++hat_teil%3A+%3Fbereich+.%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28LCASE%28STR%28%3FfachLabel%29%29+%3D+%22mathematik%22%29%0A++%3Fsa+rdfs%3Alabel+%3Fschulart+.%0A++%3Fbereich+hat_jahrgangsstufe%3A+jahrgangsstufe_10%3A+%3B%0A+++++++++++rdfs%3Alabel+%3Flernbereich+%3B%0A+++++++++++hat_teil%3A+%3Finhalt+.%0A++%3Finhalt+hat_funktion%3A+lerninhaltsbeschreibungsfunktion%3A+%3B%0A++++++++++rdfs%3Alabel+%3Flerninhalt+.%0A%7D%0AORDER+BY+%3Fschulart+%3Flernbereich+%3Flerninhalt&format=text%2Fhtml&timeout=0&signal_void=on)
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

### <a id="abfrage-cq-7"></a>Welche Physikkompetenzen kommen in Bayern im Leistungskurs hinzu?

Kompetenzfrage [CQ 7](introduction.md#cq-7).

In Bayern liegen für die Jahrgangsstufen 12 und 13 eigene Fachlehrpläne für das grundlegende und das erhöhte Anforderungsniveau vor; sie sind über *hat Niveau* dem Grundkurs- bzw. Leistungskursniveau zugeordnet. Die Abfrage listet die Kompetenzerwartungen des erhöhten Niveaus, die im grundlegenden Niveau derselben Jahrgangsstufe nicht vorkommen.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Fachlehrplan_BY%3A+++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0002043%3E%0APREFIX+Leistungskursniveau%3A+++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000531%3E%0APREFIX+Grundkursniveau%3A+++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000530%3E%0APREFIX+CE_Kompetenzspezifikation%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000263%3E%0APREFIX+hat_schulfach%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_niveau%3A++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000840%3E%0APREFIX+hat_jahrgangsstufe%3A++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+hat_teil%3A++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0A%0ASELECT+DISTINCT+%3Fjahrgangsstufe+%3Fkompetenz%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E%0AWHERE+%7B%0A++%23+Fachlehrplan+mit+erh%C3%B6htem+Anforderungsniveau+%28Leistungskursniveau%29%0A++%3Flk+a+Fachlehrplan_BY%3A+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++hat_niveau%3A+%3FniveauLk+%3B%0A++++++hat_jahrgangsstufe%3A+%3Fjg+%3B%0A++++++hat_teil%3A+%3Fks+.%0A++%3FniveauLk+a+Leistungskursniveau%3A+.%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28LCASE%28STR%28%3FfachLabel%29%29+%3D+%22physik%22%29%0A++%3Fks+a+CE_Kompetenzspezifikation%3A+%3B%0A++++++rdfs%3Alabel+%3Fkompetenz+.%0A++%3Fjg+rdfs%3Alabel+%3Fjahrgangsstufe+.%0A++FILTER%28LANG%28%3Fjahrgangsstufe%29+%3D+%22de%22%29%0A++%23+ohne+wortgleiche+Kompetenz+im+Fachlehrplan+mit+grundlegendem+Anforderungsniveau%0A++FILTER+NOT+EXISTS+%7B%0A++++%3Fgk+a+Fachlehrplan_BY%3A+%3B%0A++++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++++hat_niveau%3A+%3FniveauGk+%3B%0A++++++++hat_jahrgangsstufe%3A+%3Fjg+%3B%0A++++++++hat_teil%3A+%3Fks2+.%0A++++%3FniveauGk+a+Grundkursniveau%3A+.%0A++++%3Fks2+a+CE_Kompetenzspezifikation%3A+%3B%0A+++++++++rdfs%3Alabel+%3Fkompetenz+.%0A++%7D%0A%7D%0AORDER+BY+%3Fjahrgangsstufe+%3Fkompetenz&format=text%2Fhtml&timeout=0&signal_void=on)
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

Der Vergleich erfolgt über den Wortlaut der Kompetenzerwartungen. Inhaltlich gleiche, aber anders formulierte Kompetenzen werden daher als zusätzlich ausgewiesen.

### <a id="abfrage-cq-12"></a>Welche Kompetenzen umfasst „Mathematisch modellieren“ in Berlin in Jahrgangsstufe 7?

Kompetenzfrage [CQ 12](introduction.md#cq-12).

Listet die Standards des Kompetenzbereichs „Mathematisch modellieren“ im Rahmenlehrplan Mathematik mit ihrer Niveaustufe auf.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+CE_Bereich%3A++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000349%3E%0APREFIX+CE_Kompetenzspezifikation%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000263%3E%0APREFIX+hat_teil%3A++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_niveaustufe%3A+++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000578%3E%0A%0ASELECT+DISTINCT+%3Fkompetenz+%3Fniveaustufe%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E%0AWHERE+%7B%0A++%3Flp+a+Lehrplan%3A+%3B%0A++++++rdfs%3Alabel+%22Mathematik%22+%3B%0A++++++hat_teil%3A+%3Fbereich+.%0A++%3Fbereich+a+CE_Bereich%3A+%3B%0A+++++++++++rdfs%3Alabel+%22Mathematisch+modellieren%22+%3B%0A+++++++++++hat_teil%3A+%3Fks+.%0A++%3Fks+a+CE_Kompetenzspezifikation%3A+%3B%0A++++++rdfs%3Alabel+%3Fkompetenz+.%0A++OPTIONAL+%7B+%3Fks+hat_niveaustufe%3A+%3Fstufe+.%0A+++++++++++++%3Fstufe+rdfs%3Alabel+%3Fniveaustufe+%7D%0A%7D%0AORDER+BY+%3Fkompetenz&format=text%2Fhtml&timeout=0&signal_void=on)
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

Die Frage lässt sich derzeit nur eingeschränkt beantworten: Der Kompetenzbereich enthält in den Daten nur zwei übergreifende Standards ohne Niveaustufe. Eine Zuordnung zur Jahrgangsstufe 7, die in Berlin und Brandenburg über die Niveaustufen erfolgt (siehe [Pattern 11](patterns.md#pattern-11-niveaustufen-bebb)), ist für sie nicht möglich.

### <a id="abfrage-cq-13"></a>Welche Lerninhalte hat Biologie in Jahrgangsstufe 5 in Bayern?

Kompetenzfrage [CQ 13](introduction.md#cq-13).

In Bayern sind Schulfach, Jahrgangsstufe und Schulart am *Fachlehrplan (BY)* angegeben, nicht am Lehrplan selbst. Die Abfrage listet die Lerninhalte der passenden Fachlehrpläne auf.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Fachlehrplan_BY%3A++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0002043%3E%0APREFIX+hat_schulfach%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_jahrgangsstufe%3A+++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+jahrgangsstufe_5%3A+++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000005%3E%0APREFIX+fuer_schulart%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_funktion%3A+++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0APREFIX+lerninhaltsbeschreibungsfunktion%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000480%3E%0A%0ASELECT+DISTINCT+%3Fschulart+%3Ffachlehrplan+%3Flerninhalt%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E%0AWHERE+%7B%0A++%3Fflp+a+Fachlehrplan_BY%3A+%3B%0A+++++++rdfs%3Alabel+%3Ffachlehrplan+%3B%0A+++++++hat_schulfach%3A+%3Ffach+%3B%0A+++++++hat_jahrgangsstufe%3A+jahrgangsstufe_5%3A+%3B%0A+++++++fuer_schulart%3A+%3Fsa+%3B%0A+++++++hat_teil%3A+%3Finhalt+.%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28CONTAINS%28LCASE%28STR%28%3FfachLabel%29%29%2C+%22biologie%22%29%29%0A++%3Fsa+rdfs%3Alabel+%3Fschulart+.%0A++%3Finhalt+hat_funktion%3A+lerninhaltsbeschreibungsfunktion%3A+%3B%0A++++++++++rdfs%3Alabel+%3Flerninhalt+.%0A%7D%0AORDER+BY+%3Fschulart+%3Ffachlehrplan+%3Flerninhalt&format=text%2Fhtml&timeout=0&signal_void=on)
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

In der Jahrgangsstufe 5 ist Biologie nur an der Realschule ein eigenes Fach; an Gymnasium und Mittelschule werden biologische Inhalte in anderen Fächern unterrichtet.

### <a id="abfrage-cq-14"></a>Welche Kompetenzbereiche hat Französisch in Rheinland-Pfalz je Jahrgangsstufe?

Kompetenzfrage [CQ 14](introduction.md#cq-14).

Listet die Kompetenzbereiche aller Französisch-Lehrpläne auf, sortiert nach der ersten Jahrgangsstufe, für die der jeweilige Lehrplan gilt.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+xsd%3A++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+rdfs%3A+++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A+++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+CE_Bereich%3A+++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000349%3E%0APREFIX+hat_schulfach%3A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_jahrgangsstufe%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+hat_teil%3A+++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0A%0ASELECT+%3Fab_jahrgangsstufe+%3Flehrplan+%3Fkompetenzbereich%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0AWHERE+%7B%0A++%7B%0A++++SELECT+%3Flp+%28MIN%28%3Fn%29+AS+%3Fab_jahrgangsstufe%29%0A++++WHERE+%7B%0A++++++%3Flp+a+Lehrplan%3A+%3B%0A++++++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++++++hat_jahrgangsstufe%3A+%3Fjg+.%0A++++++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++++++FILTER%28CONTAINS%28LCASE%28STR%28%3FfachLabel%29%29%2C+%22franz%C3%B6sisch%22%29%29%0A++++++%3Fjg+rdfs%3Alabel+%3FjgLabel+.%0A++++++FILTER%28LANG%28%3FjgLabel%29+%3D+%22de%22%29%0A++++++BIND%28xsd%3Ainteger%28STRAFTER%28%3FjgLabel%2C+%22+%22%29%29+AS+%3Fn%29%0A++++%7D%0A++++GROUP+BY+%3Flp%0A++%7D%0A++%3Flp+rdfs%3Alabel+%3Flehrplan+%3B%0A++++++hat_teil%3A+%3Fbereich+.%0A++%3Fbereich+a+CE_Bereich%3A+%3B%0A+++++++++++rdfs%3Alabel+%3Fkompetenzbereich+.%0A%7D%0AORDER+BY+%3Fab_jahrgangsstufe+%3Flehrplan+%3Fkompetenzbereich&format=text%2Fhtml&timeout=0&signal_void=on)
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

Für die Primarstufe liegt in Rheinland-Pfalz kein Französisch-Lehrplan vor. Lehrpläne ohne Angabe einer Jahrgangsstufe, etwa die nach Lernjahren gegliederten, erscheinen in der Abfrage nicht.

### <a id="abfrage-cq-15"></a>Welche Kompetenzspezifikationen gehören zu „Lesen“ in Deutsch in der Primarstufe?

Kompetenzfrage [CQ 15](introduction.md#cq-15).

Sucht in allen Ländern nach Bereichen, deren Bezeichnung mit „Lesen“ beginnt, in Deutsch-Lehrplänen für den Primarbereich. Das Fach wird über das KIM-Schulfachvokabular (KIM: Kompetenzzentrum Interoperable Metadaten) länderübergreifend erkannt.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+skos%3A++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0APREFIX+CE_Bereich%3A++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000349%3E%0APREFIX+CE_Kompetenzspezifikation%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000263%3E%0APREFIX+hat_schulfach%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_schulstufe%3A++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000047%3E%0APREFIX+primarbereich%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000036%3E%0APREFIX+hat_teil%3A++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+deutsch_kim%3A+++++++++++++++%3Chttp%3A%2F%2Fw3id.org%2Fkim%2Fschulfaecher%2Fs1005%3E%0A%0ASELECT+DISTINCT+%3Fland+%3Flehrplan+%3Fkompetenzbereich+%3Fkompetenz%0AWHERE+%7B%0A++VALUES+%28%3Fg+%3Fland%29+%7B%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%22Bayern%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%22Sachsen%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E+%22Rheinland-Pfalz%22%29%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E+%22Berlin%2FBrandenburg%22%29%0A++%7D%0A++GRAPH+%3Fg+%7B%0A++++%3Fkontext+hat_schulfach%3A+%3Ffach+%3B%0A+++++++++++++hat_schulstufe%3A+primarbereich%3A+%3B%0A+++++++++++++rdfs%3Alabel+%3Flehrplan+%3B%0A+++++++++++++hat_teil%3A+%3Fbereich+.%0A++++%3Ffach+skos%3AexactMatch+deutsch_kim%3A+.%0A++++%3Fbereich+a+CE_Bereich%3A+%3B%0A+++++++++++++rdfs%3Alabel+%3Fkompetenzbereich+%3B%0A+++++++++++++hat_teil%3A+%3Fks+.%0A++++FILTER%28REGEX%28%3Fkompetenzbereich%2C+%22%5ELesen%22%2C+%22i%22%29%29%0A++++%3Fks+a+CE_Kompetenzspezifikation%3A+%3B%0A++++++++rdfs%3Alabel+%3Fkompetenz+.%0A++%7D%0A%7D%0AORDER+BY+%3Fland+%3Flehrplan+%3Fkompetenzbereich+%3Fkompetenz&format=text%2Fhtml&timeout=0&signal_void=on)
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

Für Berlin und Brandenburg liefert die Abfrage keine Ergebnisse, da die Rahmenlehrpläne dort keine Schulstufe angeben, sondern über Niveaustufen gegliedert sind.

### <a id="abfrage-cq-8"></a>Welche Kompetenzen und Lerninhalte hat Biologie 8 in Sachsen je Bildungsgang?

Kompetenzfrage [CQ 8](introduction.md#cq-8).

Listet die Kompetenzen und Lerninhalte der Lernbereiche für die Jahrgangsstufe 8 nach Schulart auf.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A+++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+fuer_schulart%3A++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+hat_jahrgangsstufe%3A+++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+jahrgangsstufe_8%3A+++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000008%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_funktion%3A+++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0APREFIX+kompetenzbeschreibungsfunktion%3A+++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000479%3E%0APREFIX+lerninhaltsbeschreibungsfunktion%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000480%3E%0A%0ASELECT+DISTINCT+%3Fschulart+%3Fart+%3Felement%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+a+Lehrplan%3A+%3B%0A++++++hat_schulfach%3A+%3Ffach+%3B%0A++++++fuer_schulart%3A+%3Fsa+%3B%0A++++++hat_teil%3A+%3Fbereich+.%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0A++FILTER%28LCASE%28STR%28%3FfachLabel%29%29+%3D+%22biologie%22%29%0A++%3Fsa+rdfs%3Alabel+%3Fschulart+.%0A++%3Fbereich+hat_jahrgangsstufe%3A+jahrgangsstufe_8%3A+%3B%0A+++++++++++hat_teil%3A+%3Fe+.%0A++%3Fe+rdfs%3Alabel+%3Felement+.%0A++%7B+%3Fe+hat_funktion%3A+kompetenzbeschreibungsfunktion%3A+.+++BIND%28%22Kompetenz%22+AS+%3Fart%29+%7D%0A++UNION%0A++%7B+%3Fe+hat_funktion%3A+lerninhaltsbeschreibungsfunktion%3A+.+BIND%28%22Lerninhalt%22+AS+%3Fart%29+%7D%0A%7D%0AORDER+BY+%3Fschulart+%3Fart+%3Felement&format=text%2Fhtml&timeout=0&signal_void=on)
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

Die sächsischen Biologie-Lehrpläne geben kein Bildungsgangniveau an. Die Unterscheidung nach Bildungsgang ist deshalb nur über die Schulart möglich: Das Gymnasium entspricht dem gymnasialen Bildungsgang, die Oberschule umfasst den Haupt- und den Realschulbildungsgang.

### <a id="abfrage-cq-10"></a><a id="abfrage-cq-6"></a>Wie entwickeln sich Mathematikkompetenzen von der Primarstufe bis zur Sekundarstufe I?

Kompetenzfrage [CQ 10](introduction.md#cq-10); die Übersicht gibt zugleich einen ersten Anhaltspunkt zu [CQ 6](introduction.md#cq-6).

Gibt für Sachsen eine Übersicht über die Zahl der Lernbereiche und Kompetenzspezifikationen je Jahrgangsstufe und Schulart, von der Grundschule bis zur Jahrgangsstufe 10 an Oberschule und Gymnasium.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+CE_Kompetenzspezifikation%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000263%3E%0APREFIX+hat_schulfach%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+fuer_schulart%3A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E%0APREFIX+hat_jahrgangsstufe%3A++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+jahrgangsstufe_1%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000001%3E%0APREFIX+jahrgangsstufe_2%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000002%3E%0APREFIX+jahrgangsstufe_3%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000003%3E%0APREFIX+jahrgangsstufe_4%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000004%3E%0APREFIX+jahrgangsstufe_5%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000005%3E%0APREFIX+jahrgangsstufe_6%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000006%3E%0APREFIX+jahrgangsstufe_7%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000007%3E%0APREFIX+jahrgangsstufe_8%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000008%3E%0APREFIX+jahrgangsstufe_9%3A++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000009%3E%0APREFIX+jahrgangsstufe_10%3A+++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_2000010%3E%0APREFIX+hat_teil%3A++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0ASELECT+%3Fstufe+%3Fschulart+%28COUNT%28DISTINCT+%3Fbereich%29+AS+%3Flernbereiche%29+%28COUNT%28DISTINCT+%3Fks%29+AS+%3Fkompetenzen%29%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+a+Lehrplan%3A+%3B+hat_schulfach%3A+%3Ffach+%3B+fuer_schulart%3A+%3Fsa+%3B+hat_teil%3A+%3Fbereich+.%0A++%3Ffach+rdfs%3Alabel+%3Ffl+.+FILTER%28LCASE%28STR%28%3Ffl%29%29%3D%22mathematik%22%29%0A++%3Fsa+rdfs%3Alabel+%3Fschulart+.%0A++%3Fbereich+hat_jahrgangsstufe%3A+%3Fjg+%3B+hat_teil%3A+%3Fks+.%0A++%3Fks+a+CE_Kompetenzspezifikation%3A+.%0A++VALUES+%28%3Fjg+%3Fstufe%29+%7B+%28jahrgangsstufe_1%3A+1%29+%28jahrgangsstufe_2%3A+2%29+%28jahrgangsstufe_3%3A+3%29+%28jahrgangsstufe_4%3A+4%29+%28jahrgangsstufe_5%3A+5%29%0A++++++++++++++++++++++++%28jahrgangsstufe_6%3A+6%29+%28jahrgangsstufe_7%3A+7%29+%28jahrgangsstufe_8%3A+8%29+%28jahrgangsstufe_9%3A+9%29+%28jahrgangsstufe_10%3A+10%29+%7D%0A%7D%0AGROUP+BY+%3Fstufe+%3Fschulart%0AORDER+BY+%3Fstufe+%3Fschulart&format=text%2Fhtml&timeout=0&signal_void=on)
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

Die Abfrage zeigt den Umfang je Jahrgangsstufe und Schulart. Wie sich einzelne Kompetenzen inhaltlich weiterentwickeln, lässt sich derzeit nicht abfragen, da Kompetenzen über Jahrgangsstufen hinweg in den Daten nicht miteinander verknüpft sind.

### <a id="abfrage-cq-18"></a>Welche Jahrgangsstufen umfasst die Niveaustufe C am Gymnasium in Berlin?

Kompetenzfrage [CQ 18](introduction.md#cq-18).

Ermittelt über die Niveaustufe C das zugehörige Niveau für den gymnasialen Bildungsgang und dessen Jahrgangsstufen.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+niveaustufe_c%3A+++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000466%3E%0APREFIX+hat_niveau%3A++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000840%3E%0APREFIX+hat_jahrgangsstufe%3A++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0APREFIX+Gymnasialniveau_Sek_I%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000069%3E%0ASELECT+DISTINCT+%3Fniveau+%3Fjahrgangsstufe%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E%0AWHERE+%7B%0A++niveaustufe_c%3A+hat_niveau%3A+%3Fn+.%0A++%3Fn+a+Gymnasialniveau_Sek_I%3A+%3B%0A+++++rdfs%3Alabel+%3Fniveau+%3B%0A+++++hat_jahrgangsstufe%3A+%3Fj+.%0A++%3Fj+rdfs%3Alabel+%3Fjahrgangsstufe+.%0A++FILTER%28LANG%28%3Fjahrgangsstufe%29+%3D+%22de%22%29%0A%7D%0AORDER+BY+%3Fjahrgangsstufe&format=text%2Fhtml&timeout=0&signal_void=on)
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

### <a id="abfrage-cq-9"></a>Welche Englisch-Kompetenzspezifikationen hat Bayern, Brandenburg aber nicht?

Kompetenzfrage [CQ 9](introduction.md#cq-9).

Diese Frage lässt sich derzeit nicht sinnvoll beantworten. Ein Abgleich über den Wortlaut zeigt, dass keine der bayerischen Kompetenzerwartungen wortgleich im Rahmenlehrplan von Berlin und Brandenburg vorkommt, da die Länder ihre Kompetenzen unterschiedlich formulieren. Für einen inhaltlichen Vergleich müssten die Kompetenzen der Länder miteinander verknüpft sein, etwa über die KMK-Bildungsstandards (KMK: Kultusministerkonferenz); solche Verknüpfungen enthalten die Lehrplandaten bisher nicht.

### <a id="abfrage-cq-16"></a>In welchen Fächern greift Sachsen „Bildung für nachhaltige Entwicklung“ auf?

Kompetenzfrage [CQ 16](introduction.md#cq-16).

Die sächsischen Lehrpläne verweisen an zahlreichen Stellen auf überfachliche Bildungs- und Erziehungsziele. Die Abfrage zählt je Fach die Lehrpläne und Verweise, die sich auf „Bildung für nachhaltige Entwicklung“ beziehen.

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+rdfs%3A+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Lehrplan%3A+++++++++++++++++++++++++++++++++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0APREFIX+hat_schulfach%3A++++++++++++++++++++++++++++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E%0APREFIX+hat_teil%3A+++++++++++++++++++++++++++++++++++++++++++++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%0APREFIX+hat_verweis%3A++++++++++++++++++++++++++++++++++++++++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0030071%3E%0APREFIX+Verweis_auf_ein_ueberfachliches_Bildungs_und_Erziehungsziel_SN%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0030191%3E%0ASELECT+%3Ffach+%28COUNT%28DISTINCT+%3Flp%29+AS+%3Flehrplaene%29+%28COUNT%28DISTINCT+%3Fverweis%29+AS+%3Fverweise%29%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0AWHERE+%7B%0A++%3Flp+a+Lehrplan%3A+%3B%0A++++++hat_schulfach%3A+%3Ff+%3B%0A++++++hat_teil%3A+%3Felement+.%0A++%3Felement+hat_verweis%3A+%3Fverweis+.%0A++%3Ff+rdfs%3Alabel+%3Ffach+.%0A++%3Fverweis+a+Verweis_auf_ein_ueberfachliches_Bildungs_und_Erziehungsziel_SN%3A+%3B%0A+++++++++++rdfs%3Alabel+%3Fziel+.%0A++FILTER%28CONTAINS%28LCASE%28%3Fziel%29%2C+%22nachhaltige+entwicklung%22%29%29%0A%7D%0AGROUP+BY+%3Ffach%0AORDER+BY+DESC%28%3Fverweise%29+%3Ffach&format=text%2Fhtml&timeout=0&signal_void=on)
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

### <a id="abfrage-cq-17"></a>Wie hängen die Niveaustufen in Berlin und Brandenburg mit den Jahrgangsstufen zusammen?

Kompetenzfrage [CQ 17](introduction.md#cq-17).

Listet für jede Niveaustufe die zugehörigen abschlussbezogenen Niveaus mit der ersten und letzten Jahrgangsstufe auf, in der sie typischerweise erreicht werden (siehe [Pattern 11](patterns.md#pattern-11-niveaustufen-bebb)).

[Direkter Link zum SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql?default-graph-uri=&qtxt=PREFIX+xsd%3A++++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+rdfs%3A+++++++++++++++%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+Niveaustufe_BE_BB%3A++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000443%3E%0APREFIX+hat_niveau%3A+++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000840%3E%0APREFIX+hat_jahrgangsstufe%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E%0ASELECT+%3Fniveaustufe+%3Fniveau+%28MIN%28%3Fn%29+AS+%3Fvon_jahrgangsstufe%29+%28MAX%28%3Fn%29+AS+%3Fbis_jahrgangsstufe%29%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fgraph%2Fbe%3E%0AWHERE+%7B%0A++%3Fstufe+a+Niveaustufe_BE_BB%3A+%3B%0A+++++++++rdfs%3Alabel+%3Fniveaustufe+%3B%0A+++++++++hat_niveau%3A+%3Fnv+.%0A++%3Fnv+rdfs%3Alabel+%3Fniveau+%3B%0A++++++hat_jahrgangsstufe%3A+%3Fjg+.%0A++%3Fjg+rdfs%3Alabel+%3FjgLabel+.%0A++FILTER%28LANG%28%3FjgLabel%29+%3D+%22de%22%29%0A++BIND%28xsd%3Ainteger%28STRAFTER%28%3FjgLabel%2C+%22+%22%29%29+AS+%3Fn%29%0A%7D%0AGROUP+BY+%3Fniveaustufe+%3Fniveau%0AORDER+BY+%3Fniveaustufe+%3Fniveau&format=text%2Fhtml&timeout=0&signal_void=on)
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

Die Abfrage liefert derzeit nur die Berliner Niveaus für den berufsorientierenden Abschluss (BOA), die Berufsbildungsreife (BBR), die erweiterte Berufsbildungsreife (EBBR), den mittleren Schulabschluss (MSA) und das Gymnasialniveau Sek I. Die Brandenburger Niveaus für die erweiterte Berufsbildungsreife (EBR), die Fachoberschulreife (FOR) und die Fachoberschulreife mit Berechtigung zum Besuch der gymnasialen Oberstufe (FOR-Q) sind in der Ontologie in der Version rc6 enthalten, im SPARQL-Endpunkt aber noch nicht.

### <a id="abfrage-cq-4"></a>Welche Kompetenzen sind Voraussetzung für den Erwerb von Kompetenz X?

Kompetenzfrage [CQ 4](introduction.md#cq-4).

Diese Frage lässt sich derzeit nicht beantworten. Die Ontologie enthält zwar Klassen für Voraussetzungen, etwa *Eingangsvoraussetzung (BE)* und *Eingangsvoraussetzung (BB)*, in den Lehrplandaten werden sie aber nicht verwendet. Auch Verweise auf Lernbereiche früherer Jahrgangsstufen, die sich als Hinweis auf Vorwissen auswerten ließen, kommen in den Daten nicht vor.

### <a id="abfrage-cq-19"></a>Wie lassen sich Lerninhalte nach Sprachniveaus filtern?

Kompetenzfrage [CQ 19](introduction.md#cq-19).

Diese Frage lässt sich derzeit nicht beantworten. Die Ontologie enthält die sechs Stufen A1 bis C2 des Gemeinsamen Europäischen Referenzrahmens für Sprachen (GER) als *Fremdsprachenniveau* (siehe [Pattern 9](patterns.md#pattern-9-niveaus)), in den Lehrplandaten sind Lerninhalte und Kompetenzen diesen Stufen aber nicht zugeordnet.


## Ausblick auf die folgenden Kapitel

Die Abfragen dieses Kapitels haben gezeigt, wie sich die Lehrplandaten über den SPARQL-Endpunkt auswerten lassen, von einfachen Übersichten über die Suche nach Begriffen bis zur Beantwortung der Kompetenzfragen. Sie zeigen zugleich, wo die Daten noch Lücken haben und welche Fragen sich erst mit weiteren Daten beantworten lassen.

Das Kapitel [Verwendung](usage.md) beschreibt, wie die Lehrplan-Ontologie über die Abfragen hinaus genutzt werden kann: welche Release-Dateien zur Verfügung stehen, wie die Versionen aufgebaut sind und wie sich Lehrplandaten mit SHACL-Shapes (SHACL: Shapes Constraint Language) gegen die Ontologie prüfen lassen.
