# SPARQL-Abfragen

## Bundeslandübergreifende Abfragen

**Welche Lehrpläne gibt es im Bundesland Sachsen?**

```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>

SELECT ?Lehrplan
WHERE {
?Lehrplan a lp:LP_0000438 .
?Lehrplan lp:LP_0000029 lp:LP_3000047 .
}
```
oder

```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>

SELECT ?Lehrplan
WHERE {
?Lehrplan a lp:LP_0000818 .
}
```
**Wie viele Lehrpläne gibt es in Sachsen?**

```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>

SELECT DISTINCT COUNT(?Lehrplan)
WHERE {
?Lehrplan a lp:LP_0000818 .
}
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

**Welche Schularten gibt es im Bundesland Sachsen?**

```
PREFIX lp: <https://w3id.org/lehrplan/ontology/>

SELECT DISTINCT ?Schulart
WHERE {
    ?s a lp:LP_0000111 .
    ?s lp:LP_0000029 lp:LP_3000047 .
    ?s rdfs:label ?Schulart .
}
```

**In welchen Lehrplänen kommt der Begriff "Zelle" vor?**

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
