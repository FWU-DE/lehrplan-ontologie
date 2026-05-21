# Beispiele / Patterns

Bei der Entwicklung und Nutzung von Ontologien spielen **Anwendungsmuster** eine entscheidende Rolle bei der Bewältigung wiederkehrender Modellierungsanforderungen. Diese Muster bieten standardisierte, wiederverwendbare semantische Bausteine, die eine konsistente Darstellung der Beziehungen zwischen Instanzen und Entitäten ermöglichen. Darüber hinaus können solche Muster zur Erstellung von SHACL-Shapes verwendet werden, um Einschränkungen in eine Wissensrepräsentation einzubinden. Durch die Befolgung von Anwendungsmustern können Ontologie-Anwender und -Entwickler Einheitlichkeit, Klarheit und Wiederverwendbarkeit in ihren Modellen gewährleisten.

Die folgenden Abschnitte veranschaulichen, wie diese Muster gelesen und angewendet werden. Jedes Muster enthält eine Visualisierung, eine Erläuterung und die RDF Daten.

**Legende für Visualisierungen:**

```d2

BFO Klassen: {
  style: {
    font-color: white
    opacity: 0.5
    fill: "#9F0E21"
    stroke: white
  }
}

Lehrplan Klassen: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Instanzen: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

```


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
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
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

"ex:Lehrplan": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> Lehrplan (SN): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> Lehrplan Oberschule Mathematik: hat Titel {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> Sachsen: von Bundesland {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> Mathematik: hat Schulfach {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> Oberschule: für Schulart {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> Sekundarbereich I: hat Schulstufe {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

```

**Erläuterung**:

**RDF Daten**: 
```
@prefix ex: <https://www.example.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

@prefix lp: <https://w3id.org/lehrplan/ontology/> .

# Klassen
@prefix Lehrplan_SN: <https://w3id.org/lehrplan/ontology/LP_0000818> .

# Instanzen
@prefix Sachsen: <https://w3id.org/lehrplan/ontology/LP_3000047> .
@prefix Mathematik: <https://w3id.org/schulfach/SN_0000012> .
@prefix Oberschule: <https://w3id.org/schulart/SN_0000003> .
@prefix Sekundarbereich_II: <https://w3id.org/lehrplan/ontology/LP_0000046> .

# properties
@prefix hat_Titel: <https://w3id.org/lehrplan/ontology/LP_0030056> .
@prefix von_Bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029> .
@prefix hat_Schulfach: <https://w3id.org/lehrplan/ontology/LP_0000537> .
@prefix für_Schulart: <https://w3id.org/lehrplan/ontology/LP_0000812>.
@prefix hat_Schulstufe: <https://w3id.org/lehrplan/ontology/LP_0000047>.

ex:Lehrplan a Lehrplan_SN: ;
            hat_Titel: "Lehrplan Oberschule Mathematik" ;
            von_Bundesland: Sachsen: ;
            hat_Schulfach: Mathematik: ;
            für_Schulart: Oberschule: ;
            hat_Schulstufe: Sekundarbereich_II: . 
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

"ex:Fragment": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Prozessbezogene Kompetenzen: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"ex:Bereich": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Bildungsplan (BW): {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Lehrplanfragment (BW): {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
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

"ex:Lehrplan": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> Bildungsplan (BW): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> "ex:Fragment": hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> Bildungsplan Sekundarstufe I - Deutsch: hat Titel {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Fragment" -> "ex:Bereich": hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Fragment" -> Lehrplanfragment (BW): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Fragment" -> Prozessbezogene Kompetenzen: hat Titel {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Bereich" -> Sprechen und Zuhören: hat Titel {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Bereich" -> "2.1": hat Nummer {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Bereich" -> "Die Schülerinnen und Schüler erwerben kommunikative Kompetenz ...": hat Beschreibung {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

```
**Erläuterung**:

**RDF Daten**: 
```
@prefix ex: <https://www.example.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

@prefix lp: <https://w3id.org/lehrplan/ontology/> .

# Klassen
@prefix Bildungsplan_BW: <https://w3id.org/lehrplan/ontology/LP_0000806> .
@prefix Lehrplanfragment_BW: <https://w3id.org/lehrplan/ontology/LP_0002052> .

# properties
@prefix hat_Titel: <https://w3id.org/lehrplan/ontology/LP_0030056> .
@prefix hat_Teil: <http://purl.obolibrary.org/obo/BFO_0000051> .
@prefix hat_Nummer: <https://w3id.org/lehrplan/ontology/LP_0030057> .
@prefix hat_Beschreibung: <https://w3id.org/lehrplan/ontology/LP_0030051> .

ex:Lehrplan a Bildungsplan_BW: ;
            hat_Teil: ex:Fragment ;
            hat Titel: "Bildungsplan Sekundarstufe I - Deutsch" .
ex:Fragment a Lehrplanfragment_BW: ;
            hat_Teil: ex:Bereich ;
            hat Titel: "Prozessbezogene Kompetenzen" .
ex:Bereich hat_Titel "Sprechen und Zuhören" ;
            hat_Nummer: 2.1 ;
            hat_Beschreibung: "Die Schülerinnen und Schüler erwerben kommunikative Kompetenz ..." .
```

## Pattern 3 - Schulfach und Schulfachbezug

```d2

"ex:Lehrplan": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"ex:Fachbezug_Englisch_als_Erstsprache": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Schulfach: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Fremdsprachenfach: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Schulfachbezug: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

erste Fremdsprache: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Englisch (KIM-Schulfach): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Englisch (KIM-Schulfach) -> Fremdsprachenfach: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Fremdsprachenfach -> Schulfach: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

erste Fremdsprache -> Schulfachbezug: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> Englisch (KIM-Schulfach): hat Schulfach {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Lehrplan" -> "ex:Fachbezug_Englisch_als_Erstsprache": hat Schulfach {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Fachbezug_Englisch_als_Erstsprache" -> erste Fremdsprache: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Fachbezug_Englisch_als_Erstsprache" -> Englisch (KIM-Schulfach): hat Schulfach {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}


```
**Erläuterung**:

**Schulfach** (`LP_0000001`) ist die Basisklasse für alle Unterrichtsfächer im deutschen Schulsystem. Die Ontologie definiert vier thematische Subklassen für häufig abgefragte Fächergruppen:

- **MINT-Fach** (`LP_0000002`) – Mathematik, Informatik, Naturwissenschaften, Technik; enthält seinerseits
- **Naturwissenschaftsfach** (`LP_0000003`) als Subklasse des MINT-Fachs
- **Fremdsprachenfach** (`LP_0000004`)
- **Gesellschaftswissenschaftsfach** (`LP_0000005`)

Diese Subklassen dienen der thematischen Filterung über Bundeslandgrenzen hinweg, etwa um gezielt alle Naturwissenschaftslehrpläne aller Länder zu finden.

Die konkreten Fächer (die Individuen) sind im separaten Schulfach-Graphen (`https://w3id.org/schulfach/1.0.0`) erfasst: 894 Fach-Individuen, je eines pro Bundesland und Fachbezeichnung – z.B. `BY_0000001 (Deutsch)`, `HH_0000004 (Deutsch)`, `SN_0000001 (Deutsch)`. Dass dasselbe Fach in verschiedenen Ländern als eigenes Individuum geführt wird, bildet die Realität ab: Die Bezeichnungen weichen ab (*Arbeit-Wirtschaft-Technik* in Niedersachsen vs. *AWT* in Mecklenburg-Vorpommern vs. *Arbeitslehre* in HE, NW, RP, SL). Für 46 Fächer existiert zusätzlich ein `skos:exactMatch` auf das bundesweite **KIM-Schulfachvokabular**, das als gemeinsamer Referenzpunkt für länderübergreifende Abfragen dient.

In den Lehrplandaten wird ein konkretes Fach-Individuum über die Property `LP_0000537` (**hat Schulfach**) an einen Lehrplan gehängt – z.B. zeigt `Deutsch 1/2 (BY)` auf `schulfach:BY_0000001`.

Daneben gibt es die Subklasse **BistaFach** (`LP_0000039`), die Fächer kennzeichnet, für die bundesweit einheitliche Bildungsstandards der KMK existieren.

Während Schulfach beschreibt, was gelehrt wird, beschreibt **Schulfachbezug** (`LP_0000540`) die Stellung eines Faches im Stundentafel- und Bildungsgangskontext. Die Subklassen spiegeln die schulorganisatorischen Kategorien direkt wider:

- **Pflichtfach** (`LP_0000544`): Für alle Schülerinnen und Schüler verbindlich
- **Wahlpflichtfach** (`LP_0000545`): Verbindliche Wahl aus einem definierten Angebot
- **Wahlfach** (`LP_0000551`): Freiwillig wählbar ohne Pflichtcharakter
- **Erste Fremdsprache** (`LP_0000541`): Die erste gelernte Fremdsprache im Bildungsgang
- **Zweite Fremdsprache** (`LP_0000542`): Die zweite gelernte Fremdsprache
- **Dritte Fremdsprache** (`LP_0000543`): Die dritte gelernte Fremdsprache

Der Schulfachbezug ist für Fremdsprachen besonders wichtig: Englisch kann je nach Bundesland und Bildungsgang erste, zweite oder dritte Fremdsprache sein – mit je anderen curricularen Anforderungen. Indem der Bezug als eigene Klasse modelliert ist, lassen sich z.B. alle Lehrpläne für „Englisch als zweite Fremdsprache" bundeslandübergreifend abfragen, ohne auf Freitext angewiesen zu sein.

**RDF Daten**: 
```

```

## Pattern 4 - Schulart und Bildungsgangniveau

```d2

Schulart: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

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
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
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
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
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
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Integrierte Gesamtschule -> Schulart: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
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
**Erläuterung**:

**RDF Daten**: 
```

```

## Pattern 5 - Jahrgangstufe/Schulstufe und Phasen der Sekundarstufe II

Jahrgangsstufen 1-4 -> Primarstufe (Ausnahme Berlin: 1-6)
5-10 -> Sek I (Ausnahme Berlin: 7-10)
11-12/13 -> Sek II
G8 und G9 (Jahrgangsstufe 10 = Einführungsphase der Oberstufe bei G8)

```d2
Schulstufe: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Primarbereich: {
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

Sekundarbereich II: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Oberstufenphase: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Einführungsphase: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Qualifikationsphase: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

G8 Einführungsphase: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

G9 Einführungsphase: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

G8 Qualifikationsphase: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

G9 Qualifikationsphase: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Jahrgangsstufe: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Jahrgangsstufe 13: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Jahrgangsstufe 12: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Jahrgangsstufe 11: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Jahrgangsstufe 10: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Primarbereich -> Schulstufe: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Sekundarbereich I -> Schulstufe: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Sekundarbereich II -> Schulstufe: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Jahrgangsstufe 10 -> Jahrgangsstufe: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Jahrgangsstufe 11 -> Jahrgangsstufe: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Jahrgangsstufe 12 -> Jahrgangsstufe: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Jahrgangsstufe 13 -> Jahrgangsstufe: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Einführungsphase -> Oberstufenphase: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Qualifikationsphase -> Oberstufenphase: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

G8 Einführungsphase -> Einführungsphase: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

G9 Einführungsphase -> Einführungsphase: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

G8 Qualifikationsphase -> Jahrgangsstufe 11: hat Jahrgangsstufe {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

G8 Qualifikationsphase -> Qualifikationsphase: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

G9 Qualifikationsphase -> Qualifikationsphase: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

G8 Einführungsphase -> Jahrgangsstufe 10: hat Jahrgangsstufe {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

G9 Einführungsphase -> Jahrgangsstufe 11: hat Jahrgangsstufe {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

G8 Qualifikationsphase -> Jahrgangsstufe 12: hat Jahrgangsstufe {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

G9 Qualifikationsphase -> Jahrgangsstufe 12: hat Jahrgangsstufe {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

G9 Qualifikationsphase -> Jahrgangsstufe 13: hat Jahrgangsstufe {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Oberstufenphase -> Sekundarbereich II: Equivalent To {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

```

**Erläuterung**:

**RDF Daten**: 
```

```


## Pattern 6 - Hierarchie der Curricularen Elemente

```d2

CE-Kompetenzspezifikation 1: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Fragment 1: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Lerninhalt 1: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Lerninhalt 2: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Bereich 1: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Bereich 2: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Hinweis 1: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Hinweis 2: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Lehrplan: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
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

**Erläuterung**:

**Curriculare Elemente** (`LP_0000261`) sind die Bausteine, aus denen ein Lehrplan in der MEM-Ontologie aufgebaut ist. Jede Informationseinheit eines Lehrplans – ein Kapitel, ein Kompetenzbereich, eine einzelne Anforderung, ein Lerninhalt – wird als Curriculares Element modelliert. Die Ontologie kennt sieben generische Unterklassen:

**CE-Fragment** ist der rein strukturgebende Behälter ohne inhaltliche Semantik: Kapitel, Abschnitte und Überschriften, die einen Lehrplan gliedern, ohne selbst Kompetenzen oder Inhalte zu definieren. Jedes Bundesland hat eine eigene Subklasse davon (z.B. *Lehrplanfragment (HH), Lehrplanfragment (BY)*).

**CE-Bereich** fasst Kompetenzen und Lerninhalte unter einem gemeinsamen inhaltlichen Fokus zusammen – er kann anderen CE-Bereichen über- oder untergeordnet sein. Die länderspezifischen Entsprechungen reichen von Kompetenzbereich (in fast allen Bundesländern) über *Lernbereich (BY, SN, NI), Leitidee (BE, BW, HH)* bis hin zu *Thema, Themenfeld* oder *Inhaltsfeld*.

**CE-Kompetenzspezifikation** beschreibt eine konkrete Kompetenz im Lehrplan – typischerweise als Satz mit Operator, der mit "Die Schülerinnen und Schüler …" beginnt. Die Ontologie unterscheidet dabei zwischen Fachbezogener und Fachübergreifender Kompetenzspezifikation. Länderspezifische Beispiele: *Anforderung (HH), Kompetenzerwartung (BY), Standard (BE), Kompetenz (RP)*.

**CE-Lerninhalt** benennt konkrete Themen und Gegenstände, an denen Kompetenzen erworben werden. Er liefert die inhaltliche Basis für den Unterricht. Ein CE-Lerninhalt kann weitere CE-Lerninhalte enthalten, aber keine übergeordneteren Elemente wie CE-Bereiche.

**CE-Hinweis** enthält ergänzende, empfehlende Informationen: methodische Anregungen, Differenzierungsvorschläge oder Vertiefungsideen. Er hat keine normative Verbindlichkeit.

**CE-Verweis** (im folgenden Pattern genauer erklärt) stellt eine Referenz von einem Element auf ein anderes her – auf ein Element desselben Lehrplans, eines anderen Lehrplans oder einer externen Ressource. Er ist selbst kein Inhalt, sondern ein Zeiger.

**CE-Leitperspektive** kodiert übergreifende Bildungsziele wie Nachhaltigkeit oder Demokratieerziehung, die sich durch mehrere Fächer und Jahrgangsstufen ziehen.

Die **"hat Teil"-Beziehung**: Alle Curricularen Elemente werden über die Property `bfo:BFO_0000051` **(hat Teil)** hierarchisch miteinander verknüpft. Das Prinzip ist einfach: Ein Element enthält seine untergeordneten Elemente als Teile. Dabei gibt es keine starre Vorschrift, welcher Typ welchen anderen enthalten darf – die Ontologie lässt Flexibilität, damit die unterschiedlichen Lehrplanstrukturen der 16 Bundesländer abgebildet werden können. 

Beispielhafte Hierarchien können sein:

- CE-Fragment -> CE-Bereich -> CE-Kompetenzspezifikation -> CE-Hinweis
- CE-Fragment -> CE-Bereich -> CE-Bereich -> CE-Kompetenzspezifikation
- CE-Fragment -> CE-Bereich -> CE-Lerninhalt -> CE-Hinweis
- CE-Fragment -> CE-Bereich -> CE-Kompetenzspezifikation / -> CE-Lerninhalt

Ein bayerischer Lehrplan hat z.B. einen *Lernbereich (BY)* als CE-Bereich, der *Kompetenzerwartungen (BY)* als CE-Kompetenzspezifikationen und *Inhalte zu den Kompetenzen (BY)* als CE-Lerninhalte enthält. Ein Hamburger Bildungsplan hat stattdessen einen *Kompetenzbereich (HH)* als CE-Bereich, darunter *Themenbereiche (HH)* als weitere CE-Bereiche, und darin einzelne *Anforderungen (HH)* als CE-Kompetenzspezifikationen. Die Hierarchie sieht strukturell gleich aus – nur die Klassen-Labels unterscheiden sich. Genau das macht die „hat Teil"-Beziehung zum zentralen Werkzeug der Ontologie: Sie erlaubt bundeslandübergreifende Traversierung und Suche, unabhängig von der lokalen Terminologie.

**RDF Daten**: 
```

```

## Pattern 7 - CE-Verweis

```d2

Curriculares Element: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Bereich: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

"ex:Kompetenz_1": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"ex:Verweis_1": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"ex:Lernbereich_1": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"ex:Beschreibung_1": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Kompetenzspezifikation: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Verweis: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Verweis auf Lernbereich des gleichen Faches einer anderen Klassenstufe (SN): {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

"ex:Kompetenz_1" -> CE-Kompetenzspezifikation: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Kompetenzspezifikation -> Curriculares Element: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Kompetenz_1" -> "ex:Verweis_1": hat Verweis {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Verweis_1" -> "ex:Beschreibung_1": hat Beschreibung {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Verweis_1" -> "ex:Lernbereich_1": verweist auf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Lernbereich_1" -> CE-Bereich: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Verweis_1" -> Verweis auf Lernbereich des gleichen Faches einer anderen Klassenstufe (SN): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Verweis auf Lernbereich des gleichen Faches einer anderen Klassenstufe (SN) -> CE-Verweis: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}


```
**Erläuterung**:

Ein **CE-Verweis** (`LP_0030065`) ist ein Curriculares Element, das einen Bezug von einem Element eines Lehrplans auf ein anderes oder zu einer externen Ressource herstellt. Wichtig: Der CE-Verweis ist nicht das verlinkte Ziel, sondern stellt nur die Referenz darauf dar – er ist ein explizit modellierter Zeiger.

Wohin kann ein CE-Verweis zeigen? Drei Zielkategorien sind möglich:

- **Innerhalb desselben Lehrplans** – z.B. wenn ein Kompetenzbereich auf einen anderen Kompetenzbereich desselben Faches verweist ("siehe auch Lernbereich 3").
- **In einen anderen Lehrplan** – z.B. fächerverbindende Querverweise, etwa aus dem Deutschlehrplan auf den Geschichtslehrplan.
- **Auf externe Ressourcen** – z.B. Verlinkungen auf Bildungsstandards der KMK, Referenzrahmen oder andere Dokumente.

Wie wird er in der Praxis modelliert?

In den Lehrplandaten der Bundesländer treten CE-Verweise als länderspezifische Subklassen auf. In Berlin gibt es z.B. Klassen wie *Verweis auf standardillustrierende Aufgaben (BE)* oder *Verweis auf vernetzte Kompetenzen (BE)*, in Sachsen *Verweis auf Lernbereich des gleichen Faches (SN)* oder *Verweis auf überfachliche Bildungsziele (SN)*. Sie hängen per `hat Teil` an dem Element, von dem aus der Verweis ausgeht.

Wozu dient das?

Indem Querverweise nicht als Freitext, sondern als eigene typisierte Elemente modelliert werden, können sie maschinell ausgewertet werden: Man kann gezielt fragen, welche Kompetenzbereiche miteinander verlinkt sind, wie dicht ein Lehrplan intern vernetzt ist, oder ob bestimmte Bildungsstandards in mehreren Ländern referenziert werden – ohne Freitexte parsen zu müssen.

**RDF Daten**: 
```

```

## Pattern 8 - Funktionen

```d2

Element (NW): {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Funktionsspezifikation: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Beschreibungsfunktion: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Strukturierungsfunktion: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Kompetenzbeschreibungsfunktion: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Bereichsfunktion: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"ex:Kompetenz": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"ex:Bereich": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Kompetenzerwartung (NW): {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Kompetenzspezifikation: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

CE-Bereich: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Curriculares Element: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Kompetenzbereich (NW): {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Kompetenzbereich (NW) -> Element (NW): rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Kompetenz" -> Kompetenzerwartung (NW): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Kompetenzerwartung (NW) -> Kompetenzbeschreibungsfunktion: hat Funktion {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Kompetenzerwartung (NW) -> Element (NW): rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Element (NW) -> Curriculares Element: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Kompetenzspezifikation -> Kompetenzbeschreibungsfunktion: hat Funktion {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Kompetenzspezifikation -> Curriculares Element: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Beschreibungsfunktion -> Funktionsspezifikation: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Strukturierungsfunktion -> Funktionsspezifikation: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Bereichsfunktion -> Strukturierungsfunktion: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Kompetenzbeschreibungsfunktion -> Beschreibungsfunktion: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"ex:Bereich" -> Kompetenzbereich (NW): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Bereich -> Curriculares Element: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

CE-Bereich -> Bereichsfunktion: hat Funktion {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Kompetenzbereich (NW) -> Bereichsfunktion: hat Funktion {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}


```
**Erläuterung**:

**RDF Daten**: 
```

```

## Pattern 9 - Niveaus

```d2

Niveau: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Bildungsgangniveau: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Anforderungsbereich: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Fachniveau Sek II: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Fremdsprachenniveau: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Bildungsgangniveau (ST): {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Gymnasialniveau Sek I: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Gymnasialniveau Sek I (ST): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Sachsen-Anhalt: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

"Anforderungsbereich 2: Reorganisation und Transfer": {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Grundkursniveau: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Leistungskursniveau: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Fachniveau Sek II (ST): {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Grundlegendes Anforderungsniveau (ST): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Erhöhtes Anforderungsniveau (ST): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

B1 Fortgeschrittene Sprachverwendung: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Bildungsgangniveau (ST) -> Sachsen-Anhalt: von Bundesland {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Gymnasialniveau Sek I (ST) -> Bildungsgangniveau (ST): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Gymnasialniveau Sek I (ST) -> Gymnasialniveau Sek I: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Gymnasialniveau Sek I -> Bildungsgangniveau: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Bildungsgangniveau (ST) -> Bildungsgangniveau: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Bildungsgangniveau -> Niveau: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Fachniveau Sek II -> Niveau: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Anforderungsbereich -> Niveau: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Fremdsprachenniveau -> Niveau: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Grundkursniveau -> Fachniveau Sek II: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Leistungskursniveau -> Fachniveau Sek II: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Fachniveau Sek II (ST) -> Fachniveau Sek II: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Grundlegendes Anforderungsniveau (ST) -> Grundkursniveau: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Grundlegendes Anforderungsniveau (ST) -> Fachniveau Sek II (ST): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

B1 Fortgeschrittene Sprachverwendung -> Fremdsprachenniveau: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Erhöhtes Anforderungsniveau (ST) -> Fachniveau Sek II (ST): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Erhöhtes Anforderungsniveau (ST) -> Leistungskursniveau: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

"Anforderungsbereich 2: Reorganisation und Transfer" -> Anforderungsbereich: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}


```
**Erläuterung**:

**RDF Daten**: 
```

```

## Pattern 10 - Bildungsgangniveaus, Bildungsgänge und Abschlüsse

```d2

Rheinland-Pfalz: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Niveau: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Bildungsgangniveau: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Bildungsgang: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Realschulbildungsgang: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Realschulniveau: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Bildungsgangniveau (RP): {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Mittleres Kompetenzniveau (RP): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Schulabschluss: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Mittlerer Schulabschluss: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Mittlerer Abschluss (RP): {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Qualifizierter Sekundarabschluss I (RP): {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Bildungsgangniveau (RP) -> Rheinland-Pfalz: von Bundesland {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Qualifizierter Sekundarabschluss I (RP) -> Mittlerer Abschluss (RP): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Mittlerer Abschluss (RP) -> Mittlerer Schulabschluss: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Realschulbildungsgang -> Bildungsgang: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Bildungsgangniveau -> Niveau: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Bildungsgangniveau (RP) -> Bildungsgangniveau: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Realschulniveau -> Bildungsgangniveau: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Mittleres Kompetenzniveau (RP) -> Bildungsgangniveau (RP): rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Mittleres Kompetenzniveau (RP) -> Realschulniveau: rdf:type {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Mittlerer Schulabschluss -> Realschulniveau: benötigt Niveau {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Realschulbildungsgang -> Realschulniveau: hat Bildungsgangniveau {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Mittlerer Schulabschluss -> Schulabschluss: rdfs:subClassOf {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Realschulbildungsgang -> Mittlerer Schulabschluss: endet mit Abschluss {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}


```
**Erläuterung**:

Die drei Klassen beschreiben gemeinsam den Rahmen, in dem Lehrplaninhalte gelten – wer lernt auf welchem Anspruchsniveau und worauf zielt die Laufbahn ab.

**Bildungsgang** (LP_0000816) bezeichnet die schulische Laufbahn als Ganzes – also den Weg, den Lernende durch das Schulsystem nehmen. Die Ontologie kennt drei generische Subklassen: *Gymnasialer Bildungsgang, Realschulbildungsgang* und *Hauptschulbildungsgang*. Wichtig: Ein Bildungsgang ist nicht dasselbe wie eine Schulart. Der gymnasiale Bildungsgang kann beispielsweise auch an einer Gesamt- oder Gemeinschaftsschule absolviert werden – entscheidend ist das Ziel, nicht die Institution.

**Bildungsgangniveau** (`LP_0000028`) beschreibt den Leistungsanspruch, mit dem Inhalte und Kompetenzen innerhalb eines Bildungsgangs behandelt werden. Die generischen Niveaus sind *Hauptschulniveau, Realschulniveau, Gymnasialniveau Sek I und Gymnasialniveau Sek II*. Für jedes Bundesland gibt es darüber hinaus eigene Subklassen – z.B. *Gymnasialniveau Sek I (BE)* in Berlin oder die Berliner Abschlussniveaus *BOA, BBR, EBBR* und *MSA*. In den Lehrplandaten wird das Bildungsgangniveau über die Property `LP_0000833` (hat Bildungsgangniveau) direkt an einzelne Anforderungen oder Lehrplanelemente gehängt, um anzugeben, für welche Lerngruppe eine Kompetenz gilt.

**Schulabschluss** (`LP_0000019`) ist der am Ende eines Bildungsgangs offiziell erworbene Qualifikationsnachweis. Er berechtigt zu weiterführenden Bildungswegen oder dem Berufseinstieg. Generische Subklassen sind Erster Schulabschluss, Mittlerer Schulabschluss, Fachabitur und Allgemeine Hochschulreife; daneben gibt es länderspezifische Varianten wie *Erster Abschluss (BE)* oder *Mittlerer Abschluss (RP)*. Der Zusammenhang zur Laufbahn wird über die Property `LP_0000021` (ermöglicht Abschluss / endet mit Abschluss) hergestellt.

Die drei Konzepte bilden eine Kette: Ein **Bildungsgang** läuft auf einem bestimmten **Bildungsgangniveau** und endet mit einem bestimmten **Schulabschluss**. In der Ontologie ist das so modelliert:

```
Gymnasialer Bildungsgang
   ──[hat Bildungsgangniveau]──▶ Gymnasialniveau Sek I / Sek II
   ──[ermöglicht Abschluss]───▶ Allgemeine Hochschulreife
```

Für Lehrplandaten bedeutet das: Eine CE-Kompetenzspezifikation, die `hat Bildungsgangniveau → Gymnasialniveau Sek I` trägt, gilt explizit für Lernende im gymnasialen Bildungsgang der Sekundarstufe I – unabhängig davon, ob sie ein Gymnasium oder eine Gesamtschule besuchen. Das macht die Zuordnung schulartübergreifend und strukturell eindeutig.

**RDF Daten**: 
```

```

## Pattern 11 - Niveaustufen BE/BB

```d2



```
**Erläuterung**:

**RDF Daten**: 
```

```

## Pattern 12 - Zeitangaben

```d2



```
**Erläuterung**:

**RDF Daten**: 
```

```

## Pattern 13 - Gültigkeitsbereich

```d2



```
**Erläuterung**:

**RDF Daten**: 
```

```

## Pattern 14 - Der Lernprozess

```d2



```
**Erläuterung**:

**RDF Daten**: 
```

```


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

## SPARQL-Abfragen der Kompetenzfragen

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
