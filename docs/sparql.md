# SPARQL-Abfragen

## Abfragen zu den Lehrplänen

* **Welche Lehrpläne gibt es im Bundesland Sachsen?**

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lehrplan%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E%0D%0APREFIX+von_bundesland%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000029%3E%0D%0APREFIX+sachsen%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_3000047%3E%0D%0A%0D%0ASELECT+%3FLehrplan+%3FTitel%0D%0AWHERE+%7B%0D%0A%3FLehrplan+a+lehrplan%3A+.%0D%0A%3FLehrplan+von_bundesland%3A+sachsen%3A+.%0D%0A%3FLehrplan+rdfs%3Alabel+%3FTitel+.%0D%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lehrplan: <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>
PREFIX sachsen: <https://w3id.org/lehrplan/ontology/LP_3000047>

SELECT ?Lehrplan ?Titel
WHERE {
?Lehrplan a lehrplan: .
?Lehrplan von_bundesland: sachsen: .
?Lehrplan rdfs:label ?Titel .
}
```
oder

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lehrplan_sachsen%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000818%3E%0D%0A%0D%0ASELECT+%3FLehrplan+%3FTitel%0D%0AWHERE+%7B%0D%0A%3FLehrplan+a+lehrplan_sachsen%3A+.%0D%0A%3FLehrplan+rdfs%3Alabel+%3FTitel+.%0D%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lehrplan_sachsen: <https://w3id.org/lehrplan/ontology/LP_0000818>

SELECT ?Lehrplan ?Titel
WHERE {
?Lehrplan a lehrplan_sachsen: .
?Lehrplan rdfs:label ?Titel .
}
```

* **Wie viele Lehrpläne gibt es in Sachsen?**

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+lehrplan_sachsen%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000818%3E%0D%0A%0D%0ASELECT+DISTINCT+COUNT%28%3FLehrplan%29%0D%0AWHERE+%7B%0D%0A%3FLehrplan+a+lehrplan_sachsen%3A+.%0D%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX lehrplan_sachsen: <https://w3id.org/lehrplan/ontology/LP_0000818>

SELECT DISTINCT COUNT(?Lehrplan)
WHERE {
?Lehrplan a lehrplan_sachsen: .
}
```

* **Wie viele Lehrpläne gibt es in Rheinland-Pfalz?**

Zählt alle Instanzen der Klasse Lehrplan im RP-Graphen: [Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+sf%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F%3E%0D%0APREFIX+sa%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2F%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+bfo%3A++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F%3E%0D%0A%0D%0ASELECT+%28COUNT%28DISTINCT+%3Flp%29+AS+%3Fanzahl%29%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0D%0AWHERE+%7B%0D%0A++%3Flp+rdf%3Atype+lp%3ALP_0000438+.+%23+lp%3ALP_0000438+%3D+Lehrplan%0D%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX sf: <https://w3id.org/schulfach/>
PREFIX sa: <https://w3id.org/schulart/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX bfo:  <http://purl.obolibrary.org/obo/>

SELECT (COUNT(DISTINCT ?lp) AS ?anzahl)
FROM <https://w3id.org/lehrplan/rp>
WHERE {
  ?lp rdf:type lp:LP_0000438 . # lp:LP_0000438 = Lehrplan
}
```

* **Lehrplananzahl der Bundesländer BY, SN, RP und BB nebeneinander**

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+sf%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F%3E%0D%0APREFIX+sa%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2F%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+bfo%3A++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F%3E%0D%0A%0D%0ASELECT+%3Fbundesland+%28COUNT%28DISTINCT+%3Flp%29+AS+%3Fanzahl%29%0D%0AWHERE+%7B%0D%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%7B%0D%0A++++++%3Flp+rdf%3Atype+lp%3ALP_0000438+.+%7D%0D%0A++++BIND%28%22Bayern%22+AS+%3Fbundesland%29+%7D%0D%0A++UNION%0D%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%7B%0D%0A++++++%3Flp+rdf%3Atype+lp%3ALP_0000438+.+%7D%0D%0A++++BIND%28%22Sachsen%22+AS+%3Fbundesland%29+%7D%0D%0A++UNION%0D%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E+%7B%0D%0A++++++%3Flp+rdf%3Atype+lp%3ALP_0000438+.+%7D%0D%0A++++BIND%28%22Rheinland-Pfalz%22+AS+%3Fbundesland%29+%7D%0D%0A++UNION%0D%0A++%7B+GRAPH+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fbb%3E+%7B%0D%0A++++++%3Flp+rdf%3Atype+lp%3ALP_0000438+.+%7D%0D%0A++++BIND%28%22Brandenburg%22+AS+%3Fbundesland%29+%7D%0D%0A%7D%0D%0AGROUP+BY+%3Fbundesland%0D%0AORDER+BY+DESC%28%3Fanzahl%29&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX sf: <https://w3id.org/schulfach/>
PREFIX sa: <https://w3id.org/schulart/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX bfo:  <http://purl.obolibrary.org/obo/>

SELECT ?bundesland (COUNT(DISTINCT ?lp) AS ?anzahl)
WHERE {
  { GRAPH <https://w3id.org/lehrplan/by> {
      ?lp rdf:type lp:LP_0000438 . }
    BIND("Bayern" AS ?bundesland) }
  UNION
  { GRAPH <https://w3id.org/lehrplan/sn> {
      ?lp rdf:type lp:LP_0000438 . }
    BIND("Sachsen" AS ?bundesland) }
  UNION
  { GRAPH <https://w3id.org/lehrplan/rp> {
      ?lp rdf:type lp:LP_0000438 . }
    BIND("Rheinland-Pfalz" AS ?bundesland) }
  UNION
  { GRAPH <https://w3id.org/lehrplan/bb> {
      ?lp rdf:type lp:LP_0000438 . }
    BIND("Brandenburg" AS ?bundesland) }
}
GROUP BY ?bundesland
ORDER BY DESC(?anzahl)
```

## Abfragen zu Fächern

* **Welche Fächer gibt es im Bundesland Sachsen?**

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0A%0D%0ASELECT+DISTINCT+%3FSchulfach%0D%0AWHERE+%7B%0D%0A++++%3Fs+a+lp%3ALP_0000001+.+%0D%0A++++%3Fs+lp%3ALP_0000029+lp%3ALP_3000047+.%0D%0A++++%3Fs+rdfs%3Alabel+%3FSchulfach+.%0D%0A%7D+&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>

SELECT DISTINCT ?Schulfach
WHERE {
    ?s a lp:LP_0000001 . 
    ?s lp:LP_0000029 lp:LP_3000047 .
    ?s rdfs:label ?Schulfach .
} 
```

Listet alle Schulfächer aus dem zentralen Schulfach-Graphen, gefiltert auf das Präfix SN_:
[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+sf%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F%3E%0D%0APREFIX+sa%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2F%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+bfo%3A++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F%3E%0D%0A%0D%0ASELECT+DISTINCT+%3Ffach+%3Flabel%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F1.0.0%3E%0D%0AWHERE+%7B%0D%0A++%3Ffach+rdf%3Atype+++%3Ftype+%3B%0D%0A++++++++rdfs%3Alabel+%3Flabel+.%0D%0A++FILTER%28+STRSTARTS%28STR%28%3Ffach%29%2C+%22https%3A%2F%2Fw3id.org%2Fschulfach%2FSN%22%29+%29%0D%0A++FILTER%28+%3Ffach+%21%3D+sf%3ASN_0000000+%29+%23+Root-Knoten+ausblenden%0D%0A%7D%0D%0AORDER+BY+%3Flabel&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX sf: <https://w3id.org/schulfach/>
PREFIX sa: <https://w3id.org/schulart/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX bfo:  <http://purl.obolibrary.org/obo/>

SELECT DISTINCT ?fach ?label
FROM <https://w3id.org/schulfach/1.0.0>
WHERE {
  ?fach rdf:type   ?type ;
        rdfs:label ?label .
  FILTER( STRSTARTS(STR(?fach), "https://w3id.org/schulfach/SN") )
  FILTER( ?fach != sf:SN_0000000 ) # Root-Knoten ausblenden
}
ORDER BY ?label
```

* **Fächer von BY, SN, RP und BE/BB im Vergleich**

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+sf%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F%3E%0D%0APREFIX+sa%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2F%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+bfo%3A++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F%3E%0D%0A%0D%0ASELECT+DISTINCT+%3Fbundesland+%3Flabel%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F1.0.0%3E%0D%0AWHERE+%7B%0D%0A++VALUES+%28%3Fprefix+%3Fbundesland%29+%7B%0D%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FBY%22+%22Bayern%22%29%0D%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FSN%22+%22Sachsen%22%29%0D%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FRP%22+%22Rheinland-Pfalz%22%29%0D%0A++++%28%22https%3A%2F%2Fw3id.org%2Fschulfach%2FBB%22+%22Brandenburg%22%29%0D%0A++%7D%0D%0A++%3Ffach+a+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000001%3E+%3B%0D%0A++++++++rdfs%3Alabel+%3Flabel+.%0D%0A++FILTER%28+STRSTARTS%28STR%28%3Ffach%29%2C+%3Fprefix%29+%29%0D%0A++FILTER%28+%21REGEX%28%3Flabel%2C+%22%5ESchulf%C3%A4cher%22%29+%29%0D%0A%7D%0D%0AORDER+BY+%3Fbundesland+%3Flabel&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX sf: <https://w3id.org/schulfach/>
PREFIX sa: <https://w3id.org/schulart/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX bfo:  <http://purl.obolibrary.org/obo/>

SELECT DISTINCT ?bundesland ?label
FROM <https://w3id.org/schulfach/1.0.0>
WHERE {
  VALUES (?prefix ?bundesland) {
    ("https://w3id.org/schulfach/BY" "Bayern")
    ("https://w3id.org/schulfach/SN" "Sachsen")
    ("https://w3id.org/schulfach/RP" "Rheinland-Pfalz")
    ("https://w3id.org/schulfach/BB" "Brandenburg")
  }
  ?fach a <https://w3id.org/lehrplan/ontology/LP_0000001> ;
        rdfs:label ?label .
  FILTER( STRSTARTS(STR(?fach), ?prefix) )
  FILTER( !REGEX(?label, "^Schulfächer") )
}
ORDER BY ?bundesland ?label
```
## Abfragen zu den Schularten

* **Welche Schularten gibt es im Bundesland Sachsen?**

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+schulart%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000111%3E%0D%0APREFIX+sachsen%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_3000047%3E%0D%0APREFIX+von_bundesland%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000029%3E%0D%0A%0D%0ASELECT+DISTINCT+%3FSchulart%0D%0AWHERE+%7B%0D%0A++++%3Fs+a+schulart%3A+.%0D%0A++++%3Fs+von_bundesland%3A+sachsen%3A+.%0D%0A++++%3Fs+rdfs%3Alabel+%3FSchulart+.%0D%0A%7D&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX schulart: <https://w3id.org/lehrplan/ontology/LP_0000111>
PREFIX sachsen: <https://w3id.org/lehrplan/ontology/LP_3000047>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>

SELECT DISTINCT ?Schulart
WHERE {
    ?s a schulart: .
    ?s von_bundesland: sachsen: .
    ?s rdfs:label ?Schulart .
}
```

## Abfragen zu Inhalten der Lehrpläne

* **In welchen Lehrplänen kommt der Begriff "Zelle" vor?**

Sucht über alle vier Graphen nach Labels, die den Begriff enthalten, und gibt den zugehörigen Lehrplan sowie das Bundesland zurück. Die transitive Eigenschaft bfo:BFO_0000051+ (mit +) traversiert beliebig tief in die Hierarchie.
[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+sf%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F%3E%0D%0APREFIX+sa%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2F%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+bfo%3A++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F%3E%0D%0A%0D%0ASELECT+DISTINCT+%3Fbundesland+%3FlpLabel+%3Ftreffer%0D%0AWHERE+%7B%0D%0A++VALUES+%28%3Fg+%3Fbundesland%29+%7B%0D%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%22Bayern%22%29%0D%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%22Sachsen%22%29%0D%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E+%22Rheinland-Pfalz%22%29%0D%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fbb%3E+%22Brandenburg%22%29%0D%0A++%7D%0D%0A++GRAPH+%3Fg+%7B%0D%0A++++%3Flp+rdf%3Atype++++++++lp%3ALP_0000438+%3B%0D%0A++++++++rdfs%3Alabel++++++%3FlpLabel+%3B%0D%0A++++++++bfo%3ABFO_0000051%2B+%3Fnode+.++++++%23+transitiv%3A+alle+Ebenen%0D%0A++++%3Fnode+rdfs%3Alabel+%3Ftreffer+.%0D%0A++++FILTER%28CONTAINS%28LCASE%28%3Ftreffer%29%2C+%22zelle%22%29%29%0D%0A++%7D%0D%0A%7D%0D%0AORDER+BY+%3Fbundesland+%3FlpLabel+%3Ftreffer&format=text%2Fhtml&timeout=0&signal_void=on)

```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX sf: <https://w3id.org/schulfach/>
PREFIX sa: <https://w3id.org/schulart/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX bfo:  <http://purl.obolibrary.org/obo/>

SELECT DISTINCT ?bundesland ?lpLabel ?treffer
WHERE {
  VALUES (?g ?bundesland) {
    (<https://w3id.org/lehrplan/by> "Bayern")
    (<https://w3id.org/lehrplan/sn> "Sachsen")
    (<https://w3id.org/lehrplan/rp> "Rheinland-Pfalz")
    (<https://w3id.org/lehrplan/bb> "Brandenburg")
  }
  GRAPH ?g {
    ?lp rdf:type        lp:LP_0000438 ;
        rdfs:label      ?lpLabel ;
        bfo:BFO_0000051+ ?node .      # transitiv: alle Ebenen
    ?node rdfs:label ?treffer .
    FILTER(CONTAINS(LCASE(?treffer), "zelle"))
  }
}
ORDER BY ?bundesland ?lpLabel ?treffer
```

* **Begriff in Beschreibungstexten (nicht nur labels) suchen**

Schließt auch Beschreibungsliteral (lp:LP_0030051 = hat Beschreibung) ein – liefert mehr Treffer als reine Label-Suche. Bayern und Sachsen wurden hier beispielhaft verwendet.
[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+sf%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F%3E%0D%0APREFIX+sa%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2F%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+bfo%3A++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F%3E%0D%0A%0D%0ASELECT+DISTINCT+%3Fbundesland+%3FlpLabel+%3Ftext%0D%0AWHERE+%7B%0D%0A++VALUES+%28%3Fg+%3Fbundesland%29+%7B%0D%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E+%22Bayern%22%29%0D%0A++++%28%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E+%22Sachsen%22%29%0D%0A++%7D%0D%0A++GRAPH+%3Fg+%7B%0D%0A++++%3Flp+rdf%3Atype+++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E+%3B%0D%0A++++++++rdfs%3Alabel+%3FlpLabel+%3B%0D%0A++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%2B+%3Fnode+.%0D%0A++++%3Fnode+%28+rdfs%3Alabel+%7C+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0030051%3E+%29+%3Ftext+.%0D%0A++++FILTER%28+CONTAINS%28LCASE%28STR%28%3Ftext%29%29%2C+%22zelle%22%29+%29%0D%0A++%7D%0D%0A%7D%0D%0AORDER+BY+%3Fbundesland+%3FlpLabel%0D%0ALIMIT+50&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX sf: <https://w3id.org/schulfach/>
PREFIX sa: <https://w3id.org/schulart/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX bfo:  <http://purl.obolibrary.org/obo/>

SELECT DISTINCT ?bundesland ?lpLabel ?text
WHERE {
  VALUES (?g ?bundesland) {
    (<https://w3id.org/lehrplan/by> "Bayern")
    (<https://w3id.org/lehrplan/sn> "Sachsen")
  }
  GRAPH ?g {
    ?lp rdf:type   <https://w3id.org/lehrplan/ontology/LP_0000438> ;
        rdfs:label ?lpLabel ;
        <http://purl.obolibrary.org/obo/BFO_0000051>+ ?node .
    ?node ( rdfs:label | <https://w3id.org/lehrplan/ontology/LP_0030051> ) ?text .
    FILTER( CONTAINS(LCASE(STR(?text)), "zelle") )
  }
}
ORDER BY ?bundesland ?lpLabel
LIMIT 50
```

* **Lernbereiche Mathematik 5. Klasse in Bayern (Gymnasium)**

Findet alle Lernbereiche (lp:LP_0002046) aus Lehrplänen, die Mathematik, Jahrgangsstufe 5 und Schulart Gymnasium kombinieren. In Bayern heißt die erste Strukturebene unterhalb des Lehrplans „Lernbereich".
[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+sf%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F%3E%0D%0APREFIX+sa%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2F%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+bfo%3A++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F%3E%0D%0A%0D%0ASELECT+DISTINCT+%3FlpLabel+%3FbereichLabel%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E%0D%0AWHERE+%7B%0D%0A++%3Flp+rdf%3Atype++++++++++++++lp%3ALP_0000438+%3B+++++++%23+Lehrplan%0D%0A++++++rdfs%3Alabel++++++++++++%3FlpLabel+%3B%0D%0A++++++lp%3ALP_0000537+++++++++%3Ffach+%3B+++++++++++++++%23+hat+Schulfach%0D%0A++++++lp%3ALP_0000026+++++++++lp%3ALP_2000005+%3B+++++++%23+hat+Jahrgangsstufe+5%0D%0A++++++lp%3ALP_0000812+++++++++sa%3ABY_0000005+%3B+++++++%23+f%C3%BCr+Schulart+Gymnasium%0D%0A++++++bfo%3ABFO_0000051+++++++%3Fbereich+.++++++++++++%23+hat+Teil%0D%0A%0D%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0D%0A++FILTER%28CONTAINS%28LCASE%28%3FfachLabel%29%2C+%22mathematik%22%29%29%0D%0A%0D%0A++%3Fbereich+rdf%3Atype+++lp%3ALP_0002046+%3B++++++++++++%23+Lernbereich+%28BY%29%0D%0A+++++++++++rdfs%3Alabel+%3FbereichLabel+.%0D%0A%7D%0D%0AORDER+BY+%3FlpLabel+%3FbereichLabel&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX sf: <https://w3id.org/schulfach/>
PREFIX sa: <https://w3id.org/schulart/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX bfo:  <http://purl.obolibrary.org/obo/>

SELECT DISTINCT ?lpLabel ?bereichLabel
FROM <https://w3id.org/lehrplan/by>
WHERE {
  ?lp rdf:type              lp:LP_0000438 ;       # Lehrplan
      rdfs:label            ?lpLabel ;
      lp:LP_0000537         ?fach ;               # hat Schulfach
      lp:LP_0000026         lp:LP_2000005 ;       # hat Jahrgangsstufe 5
      lp:LP_0000812         sa:BY_0000005 ;       # für Schulart Gymnasium
      bfo:BFO_0000051       ?bereich .            # hat Teil

  ?fach rdfs:label ?fachLabel .
  FILTER(CONTAINS(LCASE(?fachLabel), "mathematik"))

  ?bereich rdf:type   lp:LP_0002046 ;            # Lernbereich (BY)
           rdfs:label ?bereichLabel .
}
ORDER BY ?lpLabel ?bereichLabel
```

* **Kompetenzbereiche Mathematik in Rheinland-Pflaz**

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+sf%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F%3E%0D%0APREFIX+sa%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2F%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+bfo%3A++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F%3E%0D%0A%0D%0ASELECT+DISTINCT+%3FlpLabel+%3FkbLabel%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0D%0AWHERE+%7B%0D%0A++%3Flp+rdf%3Atype++++++++lp%3ALP_0000438+%3B%0D%0A++++++rdfs%3Alabel++++++%3FlpLabel+%3B%0D%0A++++++lp%3ALP_0000537+++%3Ffach+%3B%0D%0A++++++bfo%3ABFO_0000051+%3Fkb+.%0D%0A%0D%0A++%3Ffach+rdfs%3Alabel+%3FfachLabel+.%0D%0A++FILTER%28CONTAINS%28LCASE%28%3FfachLabel%29%2C+%22mathematik%22%29%29%0D%0A%0D%0A++%3Fkb+rdf%3Atype+++lp%3ALP_0000431+%3B+%23+Kompetenzbereich+%28RP%29%0D%0A++++++rdfs%3Alabel+%3FkbLabel+.%0D%0A%7D%0D%0AORDER+BY+%3FlpLabel+%3FkbLabel&format=text%2Fhtml&timeout=0&signal_void=on)
```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX sf: <https://w3id.org/schulfach/>
PREFIX sa: <https://w3id.org/schulart/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX bfo:  <http://purl.obolibrary.org/obo/>

SELECT DISTINCT ?lpLabel ?kbLabel
FROM <https://w3id.org/lehrplan/rp>
WHERE {
  ?lp rdf:type        lp:LP_0000438 ;
      rdfs:label      ?lpLabel ;
      lp:LP_0000537   ?fach ;
      bfo:BFO_0000051 ?kb .

  ?fach rdfs:label ?fachLabel .
  FILTER(CONTAINS(LCASE(?fachLabel), "mathematik"))

  ?kb rdf:type   lp:LP_0000431 ; # Kompetenzbereich (RP)
      rdfs:label ?kbLabel .
}
ORDER BY ?lpLabel ?kbLabel
```

## Abfragen zur Struktur der Lehrpläne

* **Erste Strukturebene eines beliebigen Lehrplans**

Bundeslandübergreifend: Gibt alle direkten Teilelemente (hat Teil) eines Lehrplans zurück – unabhängig vom konkreten Klassen-Namen.

```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX sf: <https://w3id.org/schulfach/>
PREFIX sa: <https://w3id.org/schulart/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX bfo:  <http://purl.obolibrary.org/obo/>

# <LEHRPLAN-URI> durch die konkrete URI ersetzen,
# <GRAPH-URI>    durch den passenden Graphen
SELECT DISTINCT ?elementLabel ?typ
FROM <GRAPH-URI>
WHERE {
  <LEHRPLAN-URI> bfo:BFO_0000051 ?element .
  ?element rdfs:label ?elementLabel .
  OPTIONAL { ?element rdf:type ?typ .
             FILTER(STRSTARTS(STR(?typ),
               "https://w3id.org/lehrplan/ontology/")) }
}
ORDER BY ?elementLabel
```
[Direkter Link zu Beispiel mit bayrischem Lehrplan im SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+sf%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F%3E%0D%0APREFIX+sa%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2F%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+bfo%3A++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F%3E%0D%0A%0D%0A%23+%3CLEHRPLAN-URI%3E+durch+die+konkrete+URI+ersetzen%2C%0D%0A%23+%3CGRAPH-URI%3E++++durch+den+passenden+Graphen%0D%0ASELECT+DISTINCT+%3FelementLabel+%3Ftyp%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fby%3E%0D%0AWHERE+%7B%0D%0A++%3Chttps%3A%2F%2Flp-bavaria.org%2Flehrplanplus-lis_live_isb.c.117097.de%3E+bfo%3ABFO_0000051+%3Felement+.%0D%0A++%3Felement+rdfs%3Alabel+%3FelementLabel+.%0D%0A++OPTIONAL+%7B+%3Felement+rdf%3Atype+%3Ftyp+.%0D%0A+++++++++++++FILTER%28STRSTARTS%28STR%28%3Ftyp%29%2C%0D%0A+++++++++++++++%22https%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%22%29%29+%7D%0D%0A%7D%0D%0AORDER+BY+%3FelementLabel&format=text%2Fhtml&timeout=0&signal_void=on)
[Direkter Link zu Beispiel mit einem sächsischen Lehrplan im SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=PREFIX+lp%3A+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%3E%0D%0APREFIX+sf%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulfach%2F%3E%0D%0APREFIX+sa%3A+%3Chttps%3A%2F%2Fw3id.org%2Fschulart%2F%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A++%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+bfo%3A++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F%3E%0D%0A%0D%0A%23+%3CLEHRPLAN-URI%3E+durch+die+konkrete+URI+ersetzen%2C%0D%0A%23+%3CGRAPH-URI%3E++++durch+den+passenden+Graphen%0D%0ASELECT+DISTINCT+%3FelementLabel+%3Ftyp%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0D%0AWHERE+%7B%0D%0A++%3Chttps%3A%2F%2Flp-sachsen.org%2Fresource%2Flehrplan-935-1%3E+bfo%3ABFO_0000051+%3Felement+.%0D%0A++%3Felement+rdfs%3Alabel+%3FelementLabel+.%0D%0A++OPTIONAL+%7B+%3Felement+rdf%3Atype+%3Ftyp+.%0D%0A+++++++++++++FILTER%28STRSTARTS%28STR%28%3Ftyp%29%2C%0D%0A+++++++++++++++%22https%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2F%22%29%29+%7D%0D%0A%7D%0D%0AORDER+BY+%3FelementLabel&format=text%2Fhtml&timeout=0&signal_void=on)

* **Welche Verknüpfung besteht zwischen Element X und Element Y?**

Direkte Relation X → Y oder Y → X:

[Direkter Link zu Beispiel im SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&query=SELECT+DISTINCT+%3Fvon+%3Fpraedikat+%3Fnach+%3Flabel%0D%0AWHERE+%7B%0D%0A++GRAPH+%3Fg+%7B%0D%0A++++%7B+%3Chttps%3A%2F%2Flp-bavaria.org%2Flis_01.c.348.de%3E+%3Fpraedikat+%3Chttps%3A%2F%2Flp-bavaria.org%2Fb2e89d1f-00b9-4c96-b66b-8ab6ca774b57%3E+.%0D%0A++++++BIND%28%3Chttps%3A%2F%2Flp-bavaria.org%2Flis_01.c.348.de%3E+AS+%3Fvon%29++BIND%28%3Chttps%3A%2F%2Flp-bavaria.org%2Fb2e89d1f-00b9-4c96-b66b-8ab6ca774b57%3E+AS+%3Fnach%29+%7D%0D%0A++++UNION%0D%0A++++%7B+%3Chttps%3A%2F%2Flp-bavaria.org%2Fb2e89d1f-00b9-4c96-b66b-8ab6ca774b57%3E+%3Fpraedikat+%3Chttps%3A%2F%2Flp-bavaria.org%2Flis_01.c.348.de%3E+.%0D%0A++++++BIND%28%3Chttps%3A%2F%2Flp-bavaria.org%2Fb2e89d1f-00b9-4c96-b66b-8ab6ca774b57%3E+AS+%3Fvon%29++BIND%28%3Chttps%3A%2F%2Flp-bavaria.org%2Flis_01.c.348.de%3E+AS+%3Fnach%29+%7D%0D%0A%3Fpraedikat+rdfs%3Alabel+%3Flabel+.%0D%0A++%7D%0D%0A%7D%0D%0AORDER+BY+%3Fvon+%3Fpraedikat&format=text%2Fhtml&timeout=0&signal_void=on)

```
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

[Direkter Link zu Beispiel im SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3Fp1+%3Fz+%3FzLabel+%3Fp2%0D%0AWHERE+%7B%0D%0A++GRAPH+%3Fg+%7B%0D%0A++++%7B+%3Chttps%3A%2F%2Flp-bavaria.org%2Flis_01.c.348.de%3E+%3Fp1+%3Fz+.+%3Fz+%3Fp2+%3Chttps%3A%2F%2Flp-bavaria.org%2Fb2e89d1f-00b9-4c96-b66b-8ab6ca774b57%3E+.+%7D%0D%0A++++UNION%0D%0A++++%7B+%3Fz+%3Fp1+%3Chttps%3A%2F%2Flp-bavaria.org%2Flis_01.c.348.de%3E+.+%3Fz+%3Fp2+%3Chttps%3A%2F%2Flp-bavaria.org%2Fb2e89d1f-00b9-4c96-b66b-8ab6ca774b57%3E+.+%7D%0D%0A++%7D%0D%0A++OPTIONAL+%7B+%3Fz+rdfs%3Alabel+%3FzLabel+%7D%0D%0A++FILTER%28+%3Fz+%21%3D+%3Chttps%3A%2F%2Flp-bavaria.org%2Flis_01.c.348.de%3E+%26%26+%3Fz+%21%3D+%3Chttps%3A%2F%2Flp-bavaria.org%2Fb2e89d1f-00b9-4c96-b66b-8ab6ca774b57%3E+%29%0D%0A%7D%0D%0ALIMIT+50&format=text%2Fhtml&timeout=0&signal_void=on)

```
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

[Direkter Link zu Beispiel im SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3Frichtung+%3Fpraedikat+%3FpraedikatLabel+%3Fnachbar+%3FnachbarLabel%0D%0AWHERE+%7B%0D%0A++GRAPH+%3Fg+%7B%0D%0A++++%7B+%3Chttps%3A%2F%2Flp-bavaria.org%2Flis_01.c.348.de%3E+%3Fpraedikat+%3Fnachbar+.+BIND%28%22%E2%86%92%22+AS+%3Frichtung%29+%7D%0D%0A++++UNION%0D%0A++++%7B+%3Fnachbar+%3Fpraedikat+%3Chttps%3A%2F%2Flp-bavaria.org%2Flis_01.c.348.de%3E+.+BIND%28%22%E2%86%90%22+AS+%3Frichtung%29+%7D%0D%0A++%7D%0D%0A++OPTIONAL+%7B+%3Fpraedikat+rdfs%3Alabel+%3FpraedikatLabel+%7D%0D%0A++OPTIONAL+%7B+%3Fnachbar+++rdfs%3Alabel+%3FnachbarLabel++%7D%0D%0A%7D%0D%0AORDER+BY+%3Frichtung+%3Fpraedikat&format=text%2Fhtml&timeout=0&signal_void=on)

```
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

## Weitere konkretere Abfragen zu den Inhalten der Lehrpläne

* **Zeige mir die Kompetenzspezifikationen im Fach Mathematik für die 7. Klasse nach den verschiedenen Schularten in Sachsen**

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3FschulartLabel+%3FlpLabel+%3FelementLabel%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0D%0AWHERE+%7B%0D%0A++%3Flp+rdf%3Atype++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E+%3B%0D%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0D%0A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000537%3E+%3Ffach+%3B%0D%0A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000026%3E+%3Fjg+%3B%0D%0A++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000812%3E+%3Fschulart+%3B%0D%0A++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%2B++%3Felement+.++%23+transitiv%0D%0A%0D%0A%3Felement+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000479%3E+.+%23+Kompetenzbeschreibungsfunktion%0D%0A%0D%0A++%3Ffach+++++rdfs%3Alabel+%3FfachLabel+.%0D%0A++%3Fjg+++++++rdfs%3Alabel+%3FjgLabel+.%0D%0A++%3Fschulart+rdfs%3Alabel+%3FschulartLabel+.%0D%0A++%3Felement++rdfs%3Alabel+%3FelementLabel+.%0D%0A%0D%0A++FILTER%28+CONTAINS%28LCASE%28STR%28%3FfachLabel%29%29%2C+%22mathematik%22%29+%29%0D%0A++FILTER%28+CONTAINS%28STR%28%3FjgLabel%29%2C+%227%22%29+%29%0D%0A%7D%0D%0AORDER+BY+%3FschulartLabel+%3FlpLabel+%3FelementLabel&format=text%2Fhtml&timeout=0&signal_void=on)

```
SELECT DISTINCT ?schulartLabel ?lpLabel ?elementLabel
FROM <https://w3id.org/lehrplan/sn>
WHERE {
  ?lp rdf:type  <https://w3id.org/lehrplan/ontology/LP_0000438> ;
      rdfs:label ?lpLabel ;
      <https://w3id.org/lehrplan/ontology/LP_0000537> ?fach ;
      <https://w3id.org/lehrplan/ontology/LP_0000026> ?jg ;
      <https://w3id.org/lehrplan/ontology/LP_0000812> ?schulart ;
      <http://purl.obolibrary.org/obo/BFO_0000051>+  ?element .  # transitiv

  ?element <https://w3id.org/lehrplan/ontology/LP_0000483> <https://w3id.org/lehrplan/ontology/LP_0000479> . # Kompetenzbeschreibungsfunktion

  ?fach     rdfs:label ?fachLabel .
  ?jg       rdfs:label ?jgLabel .
  ?schulart rdfs:label ?schulartLabel .
  ?element  rdfs:label ?elementLabel .

  FILTER( CONTAINS(LCASE(STR(?fachLabel)), "mathematik") )
  FILTER( CONTAINS(STR(?jgLabel), "7") )
}
ORDER BY ?schulartLabel ?lpLabel ?elementLabel
```

*	**Zeige mir die Niveaustufen, die in Berlin/Brandenburg den Lehrplanelementen zugeordnet sind**

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3FlpLabel+%3FniveauLabel+%3FelemLabel+%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fbb%3E%0D%0AWHERE+%7B%0D%0A%3Flp+rdf%3Atype++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E+%3B%0D%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0D%0A++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%2B++++%3Felem+.%0D%0A%0D%0A%3Felem+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000578%3E+%3Fniveau+.%0D%0A%0D%0A%3Felem+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000024%3E+%3FelemTitel+.%0D%0A%3FelemTitel+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000344%3E+%3FelemLabel+.%0D%0A%0D%0A%3Fniveau+rdfs%3Alabel+%3FniveauLabel+.%0D%0A%7D%0D%0A&format=text%2Fhtml&timeout=0&signal_void=on)

```
SELECT DISTINCT ?lpLabel ?niveauLabel ?elemLabel 
FROM <https://w3id.org/lehrplan/bb>
WHERE {
?lp rdf:type  <https://w3id.org/lehrplan/ontology/LP_0000438> ;
      rdfs:label ?lpLabel ;
      <http://purl.obolibrary.org/obo/BFO_0000051>+    ?elem .

?elem <https://w3id.org/lehrplan/ontology/LP_0000578> ?niveau .

?elem <https://w3id.org/lehrplan/ontology/LP_0000024> ?elemTitel .
?elemTitel <https://w3id.org/lehrplan/ontology/LP_0000344> ?elemLabel .

?niveau rdfs:label ?niveauLabel .
}

```

*	**Welcher Bereich aus Rheinland-Pfalz entspricht einem Element aus Bayern?**


Konkretes BY-Element als Ausgangspunkt: 

[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT+%3FrpLpLabel+%3FrpElementLabel%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Frp%3E%0D%0AWHERE+%7B%0D%0A++%3FrpLp+rdf%3Atype++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E+%3B%0D%0A++++++++rdfs%3Alabel+%3FrpLpLabel+%3B%0D%0A++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%2B+%3FrpEl+.%0D%0A++%3FrpEl+rdfs%3Alabel+%3FrpElementLabel+.%0D%0A%0D%0A++BIND%28%22Nat%C3%BCrliche+Zahlen%22+AS+%3Fsuchbegriff%29++%23+%E2%86%90+BY-Label+hier+eintragen%0D%0A++FILTER%28+CONTAINS%28LCASE%28STR%28%3FrpElementLabel%29%29%2C+LCASE%28%3Fsuchbegriff%29%29+%29%0D%0A%7D%0D%0AORDER+BY+%3FrpLpLabel+%3FrpElementLabel&format=text%2Fhtml&timeout=0&signal_void=on)
```
SELECT DISTINCT ?rpLpLabel ?rpElementLabel
FROM <https://w3id.org/lehrplan/rp>
WHERE {
  ?rpLp rdf:type  <https://w3id.org/lehrplan/ontology/LP_0000438> ;
        rdfs:label ?rpLpLabel ;
        <http://purl.obolibrary.org/obo/BFO_0000051>+ ?rpEl .
  ?rpEl rdfs:label ?rpElementLabel .

  BIND("Natürliche Zahlen" AS ?suchbegriff)  # ← BY-Label hier eintragen
  FILTER( CONTAINS(LCASE(STR(?rpElementLabel)), LCASE(?suchbegriff)) )
}
ORDER BY ?rpLpLabel ?rpElementLabel
```

*	**Welche Lerninhalte sind einem Bereich zugeordnet?**

Beispiel: Alle Lerninhalte in Sachsen, die einem Bereich mit dem Stichwort "schreiben" zugeordnet sind:
[Direkter Link zum SPARQL-Endpunkt](https://sparql.mem.edufeed.org/sparql?default-graph-uri=&qtxt=SELECT+DISTINCT%0D%0A++%3FlpLabel+%3FbereichLabel+%3FlerninhaltLabel%0D%0AFROM+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fsn%3E%0D%0AWHERE+%7B%0D%0A++%3Fbereich+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0D%0A+++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000497%3E+%3B+%23+Bereichsfunktion%0D%0A+++++++++++++rdfs%3Alabel+%3FbereichLabel+%3B%0D%0A+++++++++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E+%3Flerninhalt+.%0D%0A%0D%0A++%3Flerninhalt+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000483%3E%0D%0A++++++++++++++%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000480%3E+%3B+%23+Lerninhaltsbeschreibungsfunktion%0D%0A++++++++++++++rdfs%3Alabel+%3FlerninhaltLabel+.%0D%0A%0D%0A++%23+Lehrplan-Zuordnung+f%C3%BCr+Kontext%0D%0A++%3Flp+a+%3Chttps%3A%2F%2Fw3id.org%2Flehrplan%2Fontology%2FLP_0000438%3E+%3B%0D%0A++++++rdfs%3Alabel+%3FlpLabel+%3B%0D%0A++++++%3Chttp%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000051%3E%2B+%3Fbereich+.%0D%0A%0D%0A++FILTER%28+CONTAINS%28LCASE%28STR%28%3FbereichLabel%29%29%2C+%22schreiben%22%29+%29%0D%0A%7D%0D%0AORDER+BY+%3FlpLabel+%3FbereichLabel+%3FlerninhaltLabel&format=text%2Fhtml&timeout=0&signal_void=on)
```
SELECT DISTINCT
  ?lpLabel ?bereichLabel ?lerninhaltLabel
FROM <https://w3id.org/lehrplan/sn>
WHERE {
  ?bereich <https://w3id.org/lehrplan/ontology/LP_0000483>
             <https://w3id.org/lehrplan/ontology/LP_0000497> ; # Bereichsfunktion
             rdfs:label ?bereichLabel ;
             <http://purl.obolibrary.org/obo/BFO_0000051> ?lerninhalt .

  ?lerninhalt <https://w3id.org/lehrplan/ontology/LP_0000483>
              <https://w3id.org/lehrplan/ontology/LP_0000480> ; # Lerninhaltsbeschreibungsfunktion
              rdfs:label ?lerninhaltLabel .

  # Lehrplan-Zuordnung für Kontext
  ?lp a <https://w3id.org/lehrplan/ontology/LP_0000438> ;
      rdfs:label ?lpLabel ;
      <http://purl.obolibrary.org/obo/BFO_0000051>+ ?bereich .

  FILTER( CONTAINS(LCASE(STR(?bereichLabel)), "schreiben") )
}
ORDER BY ?lpLabel ?bereichLabel ?lerninhaltLabel

```


*	**Wie unterscheiden sich die Inhalte im Fach Mathematik in der 10. Klasse in den verschiedenen Schularten in Sachsen?**

```

```


*	**Welche zusätzlichen Kompetenzen müssen erlangt werden im Leistungskurs Physik gegenüber dem Grundkurs Physik in Bayern?**

```

```

*	**Ich möchte alle Kompetenzbereiche im Fach Mathematik in Rheinland-Pfalz sehen.**

```

```

*	**Ich möchte alle Kompetenzen sehen, die in Berlin unter dem Kompetenzbereich "Mathematisch modellieren" in der Jahrgangsstufe 7 erworben werden müssen.**

```

```

*	**Ich möchte sehen, welche Lerninhalte in der 5. Klasse in dem Fach Biologie in Bayern im Unterricht gelehrt werden sollen.**

```

```

*	**Ich möchte alle Kompetenzbereiche in Französisch von der Primarstufe über die Sek I zur Sek II nach Jahrgangsstufe in Rheinland-Pfalz sehen.**

```

```

*	**Ich möchte alle Kompetenzspezifikationen des Kompetenzbereichs „Lesen“ des Fachs Deutsch in der Primarstufe sehen.**

```

```

*	**Ich möchte in Sachsen die unterschiedlichen Kompetenzen und Inhalte in Biologie nach Bildungsgang in der 8. Jahrgangsstufe sehen.**

```

```

*	**Ich möchte wissen, welche Kompetenzspezifikationen in Englisch von Jahrgangsstufe 1-9 in Bayern vorkommen aber in Brandenburg nicht.**

```

```


*	**Ich möchte abbilden, welche Kompetenzen im Fach Mathematik im Primarbereich erlernt werden und wie diese sich in der Sek I je nach Bildungsgang weiterentwickeln.**

```

```

*	**Welche Jahrgangsstufen umfasst die Niveaustufe C in Berlin im Gymnasium?**

```

```