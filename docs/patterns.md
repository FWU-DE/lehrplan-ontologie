# Beispiele / Patterns

*Notiz: (Kompetenzfragen -> patterns auf Miroboard) (vllt zusammenführen mit Besonderheiten)*

Pro Pattern: Bild, RDF-daten, Beschreibung	

## Pattern 1 - Lehrplan eines Bundeslandes

- bundesland, titel (textual entity)
- drei hauptteile
Hauptteil:
Untertitel, title, 


# Besonderheiten/Herausforderungen

*Unterschied Titel/Beschreibung, Identifikationsnummer, Abgrenzung Kompetenz-/Themenbereich, Beziehungen CE, CE-Verweis, Funktionen CE Zuordnung, Jahrgangsstufen → Schulstufen, Sek II Abbildung, Primar BE/BB, Vergleichbarkeiten Schularten, Vergleichbarkeiten Fächer, Niveaus allgemein, Niveaustufen BE/BB, Bildungsgänge u Abschlüsse schlussfolgern, Schulfachbezüge, Zeitangaben, Gültigkeitsbereiche, Reihenfolge CE, Verbindlichkeit CE*

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

## 