# SPARQL-Abfragen

## Bundeslandübergreifende Abfragen

**Welche Lehrpläne gibt es im Bundesland Sachsen?**

```
PREFIX lehrplan: <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>
PREFIX sachsen: <https://w3id.org/lehrplan/ontology/LP_3000047>

SELECT ?Lehrplan
WHERE {
?Lehrplan a lehrplan: .
?Lehrplan von_bundesland: sachsen: .
}
```
oder
```
PREFIX lehrplan_sachsen: <https://w3id.org/lehrplan/ontology/LP_0000818>

SELECT ?Lehrplan
WHERE {
?Lehrplan a lehrplan_sachsen: .
}
```

**Wie viele Lehrpläne gibt es in Sachsen?**

```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>
PREFIX lehrplan_sachsen: <https://w3id.org/lehrplan/ontology/LP_0000818>

SELECT DISTINCT COUNT(?Lehrplan)
WHERE {
?Lehrplan a lehrplan_sachsen: .
}
```

**Wie viele Lehrpläne gibt es in Rheinland-Pfalz?**

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

**Lehrplananzahl der Bundesländer BY, SN, RP und BB nebeneinander**

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

**Welche Fächer gibt es im Bundesland Sachsen?**

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

**Fächer von BY, SN, RP und BE/BB im Vergleich**

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


**Welche Schularten gibt es im Bundesland Sachsen?**

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

**In welchen Lehrplänen kommt der Begriff "Zelle" vor?**

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

```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>

SELECT *
WHERE {
    ?Lehrplan a lp:LP_0000438 .
    ?Lehrplan rdfs:label ?LehrplanTitel .
    # Verbindung zwischen Objekt und Lehrplan fehlt
    ?Objekt rdfs:label ?ObjektTitel .
    FILTER(regex(str(?ObjektTitel ), "zelle", "i"))
}
```

**Begriff in Beschreibungstexten (nicht nur labels) suchen**

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

**Lernbereiche Mathematik 5. Klasse in Bayern (Gymnasium)**

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

**Kompetenzbereiche Mathematik in Rheinland-Pflaz**

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

**Erste Strukturebene eines beliebigen Lehrplans**

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


## Kompetenzfragen

*	Welche Verknüpfung besteht zwischen Element X und Element Y?

```

```

*	Was sind die Unterschiede der Kompetenzspezifikationen zwischen den verschiedenen Schularten der 7. Klasse in Mathematik im Saarland?

```

```

*	Wie hängen die Niveaustufen in Berlin/Brandenburg mit den Jahrgangsstufen zusammen?

```

```

*	Welche Jahrgangsstufen umfasst die Niveaustufe C in Berlin im Gymnasium?

```

```

*	Welcher Bereich aus Hamburg entspricht einem Element aus Bremen?

```

```

*	Anhand welcher Lerninhalte kann ich eine Kompetenz erlernen?

```

```

*	Welche Kompetenzen werden benötigt, um Kompetenz X zu erlernen?

```

```

*	Wie verläuft die Progression im Fach Mathematik in den verschiedenen Schularten in Hessen?

```

```

*	In welchen Fächern wird in BW das Querschnittsthema "Nachhaltige Entwicklung" gelistet?

```

```

*	Welche zusätzlichen Kompetenzen müssen erlangt werden im Leistungskurs Physik gegenüber dem Grundkurs Physik in Sachsen-Anhalt?

```

```

*	Ich möchte alle Kompetenzbereiche in dem Fach Mathe in Bayern sehen.

```

```

*	Ich möchte alle Kompetenzspezifikationen der Kompetenzen sehen, die in Hessen unter dem Kompetenzbereich "Mathematisch modellieren" in der Jahrgangsstufe 7 erworben werden müssen.

```

```

*	Ich möchte sehen, welche Lerninhalte in der 5. Klasse in dem Fach Biologie in NRW im Unterricht gelehrt werden sollen.

```

```

*	Ich möchte alle Kompetenzbereiche in Französisch von der Primarstufe über die Sek I zur Sek II nach Jahrgangsstufe im Saarland sehen.

```

```

*	Ich möchte alle Kompetenzspezifikationen des Kompetenzbereichs „Lesen“ des Fachs Deutsch in der Primarstufe sehen.

```

```

*	Ich möchte in Hamburg die unterschiedlichen Kompetenzspezifikationen in Biologie nach Bildungsgang in der 8. Jahrgangsstufe sehen.

```

```

*	Ich möchte wissen, welche Kompetenzspezifikationen in Englisch von Jahrgangsstufe 1-9 in Baden-Württemberg vorkommen aber in Brandenburg nicht.

```

```

*	Ich möchte Lerninhalte nach Sprachniveaus (Gemeinsamer europäischer Referenzrahmen für Sprachen) filtern können.

```

```

*	Ich möchte abbilden, welche Kompetenzen im Fach Mathematik im Primarbereich erlernt werden und wie diese sich in der Sek I je nach Bildungsgang weiterentwickeln.

```

```
