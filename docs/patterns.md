# Beispiele / Patterns

*Notiz: (Kompetenzfragen -> patterns auf Miroboard) (vllt zusammenführen mit Besonderheiten)*

Pro Pattern: Bild, RDF-daten, Beschreibung	

## Pattern 1 - Lehrplan eines Bundeslandes

```d2

Lehrplan Oberschule Mathematik: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Sachsen: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Oberschule: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Lehrplan (SN): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Sekundarbereich I: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Mathematik: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Lehrplan: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Lehrplan -> Lehrplan (SN): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Lehrplan -> Lehrplan Oberschule Mathematik: hat Titel {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Lehrplan -> Sachsen: von Bundesland {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Lehrplan -> Mathematik: hat Schulfach {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Lehrplan -> Oberschule: für Schulart {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Lehrplan -> Sekundarbereich I: hat Schulstufe {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

```

## Pattern 2 - Titel, Beschreibung und Identifikationsnummer

```d2

Bildungsplan Sekundarstufe I - Deutsch: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Fragment_xy: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Prozessbezogene Kompetenzen: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Bereich_xy: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Bildungsplan (BW): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Lehrplanfragment (BW): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Sprechen und Zuhören: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"2.1": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"Die Schülerinnen und Schüler erwerben kommunikative Kompetenz ...": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Lehrplan_xy: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Lehrplan_xy -> Bildungsplan (BW): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Lehrplan_xy -> Fragment_xy: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Lehrplan_xy -> Bildungsplan Sekundarstufe I - Deutsch: hat Titel {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Fragment_xy -> Bereich_xy: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Fragment_xy -> Lehrplanfragment (BW): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Fragment_xy -> Prozessbezogene Kompetenzen: hat Titel {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Bereich_xy -> Sprechen und Zuhören: hat Titel {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Bereich_xy -> "2.1": hat Nummer {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Bereich_xy -> "Die Schülerinnen und Schüler erwerben kommunikative Kompetenz ...": hat Beschreibung {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

```

## Pattern 3 - Schulfach und Schulfachbezug

```d2



```

## Pattern 4 - Schulart und Bildungsgangniveau

```d2

Gesamtschule (KIM): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Rheinland-Pfalz: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Jahrgangsstufe 9-13: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Integrierte Gesamtschule: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Grundlegendes Kompetenzniveau (RP): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Hauptschulniveau: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Niveau Sekundarstufe II (RP): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Gymnasialniveau Sek II: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Integrierte Gesamtschule -> Gesamtschule (KIM): has exact match {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Integrierte Gesamtschule -> Rheinland-Pfalz: von Bundesland {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Integrierte Gesamtschule -> Jahrgangsstufe 9-13: hat Jahrgangsstufe {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Integrierte Gesamtschule -> Grundlegendes Kompetenzniveau (RP): hat Bildungsgangniveau {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Integrierte Gesamtschule -> Niveau Sekundarstufe II (RP): hat Bildungsgangniveau {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Grundlegendes Kompetenzniveau (RP) -> Hauptschulniveau: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Niveau Sekundarstufe II (RP) -> Gymnasialniveau Sek II: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

```

## Pattern 5 - Jahrgangstufe/Schulstufe

Jahrgangsstufen 1-4 -> Primarstufe (Ausnahme Berlin: 1-6)
5-10 -> Sek I (Ausnahme Berlin: 7-10)
11-12/13 -> Sek II
G8 und G9 (Jahrgangsstufe 10 = Einführungsphase der Oberstufe bei G8)

## Pattern 6 - Sekundarstufe II

## Pattern 7 - Hierarchie der Curricularen Elemente

- CE-Fragment -> CE-Bereich -> CE-Kompetenzspezifikation -> CE-Hinweis
- CE-Fragment -> CE-Bereich -> CE-Bereich -> CE-Kompetenzspezifikation
- CE-Fragment -> CE-Bereich -> CE-Lerninhalt -> CE-Hinweis
- CE-Fragment -> CE-Bereich -> CE-Kompetenzspezifikation / -> CE-Lerninhalt

```d2

CE-Kompetenzspezifikation 1: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Fragment 1: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Lerninhalt 1: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Lerninhalt 2: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Bereich 1: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Bereich 2: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Hinweis 1: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Hinweis 2: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Lehrplan: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Lehrplan -> CE-Fragment 1: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Fragment 1 -> CE-Bereich 1: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Bereich 1 -> CE-Bereich 2: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Bereich 2 -> CE-Kompetenzspezifikation 1: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Bereich 2 -> CE-Lerninhalt 1: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Lerninhalt 1 -> CE-Lerninhalt 2: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Lerninhalt 2 -> CE-Hinweis 1: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Kompetenzspezifikation 1 -> CE-Hinweis 2: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

```

## Pattern 8 - CE-Verweis

## Pattern 9 - Funktionen

## Pattern 10 - Niveaus

## Pattern 11 - Bildungsgangniveaus?

## Pattern 12 - Niveaustufen BE/BB

## Pattern 13 - Zeitangaben

## Pattern 14 - Gültigkeitsbereich

## Pattern 15 - Bildungsgänge und Abschlüsse

## Pattern 16 - Der Lernprozess


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