# Patterns

Bei der Entwicklung und Nutzung von Ontologien spielen **Patterns (Anwendungsmuster)** eine entscheidende Rolle bei der Bewältigung wiederkehrender Modellierungsanforderungen. Diese Muster bieten standardisierte, wiederverwendbare semantische Bausteine, die eine konsistente Darstellung der Beziehungen zwischen Instanzen und Entitäten ermöglichen. Darüber hinaus können solche Muster zur Erstellung von SHACL-Shapes verwendet werden, um Einschränkungen in eine Wissensrepräsentation einzubinden. Durch die Befolgung von Anwendungsmustern können Ontologie-Anwender und -Entwickler Einheitlichkeit, Klarheit und Wiederverwendbarkeit in ihren Modellen gewährleisten.

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

**Erläuterung**:

**Lehrplan** (`LP_0000438`) ist die Wurzelklasse für alle konkreten Lehrplandokumente in der Ontologie. Jede länderspezifische Lehrplanvariante – *LehrplanPLUS (BY), Bildungsplan (HH/BW), Kernlehrplan (NW), Kerncurriculum (NI/HE), Rahmenlehrplan (BB), Fachanforderung (SH)* usw. – ist eine Subklasse davon.

**Kontextualisierungsangaben**

Ein Lehrplan-Individuum trägt die Angaben, die seinen institutionellen Geltungsbereich vollständig beschreiben:

- **von Bundesland** (`LP_0000029`) → das ausgebende Bundesland, z.B. *Bayern* (`LP_3000051`)
- **für Schulart** (`LP_0000812`) → die Schulart, für die der Lehrplan gilt, z.B. *Grundschule* (`BY_0000001`)
- **hat Bildungsgangniveau** (`LP_0000833`) → alternativ oder ergänzend das Bildungsgangniveau, das sich auf den angestrebten Abschluss bezieht, z.B. *Realschulniveau* (`LP_0000832`)
- **hat Schulfach** (`LP_0000537`) → das Unterrichtsfach, z.B. *Sport* (`BY_0000013`)
- **hat Jahrgangsstufe** (`LP_0000026`) → die Jahrgangsstufen, für die der Lehrplan gilt
- **hat Schulstufe** (`LP_0000047`) → alternativ oder ergänzend die übergeordnete Schulstufe, z.B. *Primarbereich* (`LP_0000036`)

Diese Angaben zusammen machen einen Lehrplan eindeutig identifizierbar: *„Bayern – Grundschule – Sport – Jahrgangsstufen 1 und 2"*.

**Weitere Metadaten**

- **hat Titel** (`LP_0030056`) → der offizielle Titel des Dokuments als Titel-Individuum
- **hat Beschreibung** (`LP_0030051`) → ein erläuternder Beschreibungstext
- **uri** (`LP_0000463`) → der kanonische URL zum Originaldokument beim Herausgeber, z.B. auf dem Schulportal des Bundeslandes


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

**Erläuterung**:

**Titel** (`LP_0000346`) – Property: **hat Titel** (`LP_0030056`)

Ein Titel-Individuum trägt die offizielle Bezeichnung eines Elements – also den Namen, wie er im gedruckten oder digitalen Lehrplan erscheint. Dabei gilt: Der `Titel` ist nicht identisch mit dem `rdfs:label` des Elements. Das `rdfs:label` ist eine technische Beschriftung für die Ontologie; der `Titel` ist das Pendant zum originalen Dokumenttext.

`hat Titel` hat keinen deklarierten Domain-Constraint – es kann sowohl an Lehrplänen (dann trägt es den offiziellen Dokumenttitel, z.B. *"Lehrplan Plus Gymnasium Bayern – Deutsch"*) als auch an einzelnen Curricularen Elementen hängen. 

**Beschreibung** (`LP_0030003`) – Property: **hat Beschreibung** (`LP_0030051`)

Die Beschreibung trägt längere, erläuternde Texte. Das können sein: Erläuterungen zu Kompetenzbereichen, methodische Hinweise und Anregungen, didaktische Kommentare, Konkretisierungsbeispiele, Literaturhinweise, Kontextinformationen oder Freitexte zum Bildungsauftrag oder den allgemeinen Fachzielen.

Im Gegensatz zu `hat Titel` hat `hat Beschreibung` die **Domain** `Curriculares Element` – es hängt also ausschließlich an CE-Elementen, nicht direkt am Lehrplan-Individuum. Der eigentliche Beschreibungstext wird nicht als `rdfs:label`, sondern als `dc:description` (`http://purl.org/dc/elements/1.1/description`) am Beschreibungs-Individuum gespeichert. Das erlaubt es, den Text sprachlich zu kennzeichnen und beliebig lang zu halten.

**Identifikationsnummer** (`LP_0000347`) – Property: **hat Nummer** (`LP_0030057`)

Die Identifikationsnummer trägt die im Originaldokument verwendete Kennzeichnung eines Elements – also z.B. *"3.1", "LB 2"* oder *"A.1"*. Sie hat ebenfalls die **Domain** `Curriculares Element` und dient dazu, die originale Nummerierung oder Codierung aus dem Quelldokument maschinenlesbar zu bewahren.

Das ist wichtig, weil die IRI eines Elements in der Ontologie zwar eindeutig, aber opak ist (`lp-sachsen.org/resource/55099`). Die Identifikationsnummer stellt den Bezug zur menschenlesbaren Struktur des Originaldokuments her und macht es möglich, ein ontologisches Element direkt auf eine bestimmte Stelle im gedruckten Lehrplan zurückzuführen.

Die drei Klassen ergänzen sich so, dass vollständige Lehrplaninhalte lückenlos abgebildet werden können:
```
Curriculares Element
  ├─[hat Titel]──────────▶ Titel       → der Name des Elements im Dokument
  ├─[hat Nummer]─────────▶ Identifikationsnummer → z.B. "3.1" oder "LB 2"
  └─[hat Beschreibung]───▶ Beschreibung → erläuternder Text
```
Dabei ist wichtig, dass jedes **Curriculare Element** einen `Titel` trägt, aber nicht zwingend eine `Beschreibung` oder eine `Identifikationsnummer`.


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

**RDF Daten**: 
```
@prefix ex: <https://www.example.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

@prefix lp: <https://w3id.org/lehrplan/ontology/> .

# Klassen
@prefix Schulfach: <https://w3id.org/lehrplan/ontology/LP_0000001> .
@prefix Fremdsprachenfach: <https://w3id.org/lehrplan/ontology/LP_0000004> .
@prefix Schulfachbezug: <https://w3id.org/lehrplan/ontology/LP_0000540> .
@prefix erste_Fremdsprache: <https://w3id.org/lehrplan/ontology/LP_0000541> .

# Instanzen
@prefix Englisch_KIM_Schulfach: <http://w3id.org/kim/schulfaecher/s1007> .

# properties
@prefix hat_Schulfach: <https://w3id.org/lehrplan/ontology/LP_0000537> .

ex:Lehrplan hat_Schulfach: Englisch_KIM_Schulfach: ,
                            ex:Fachbezug_Englisch_als_Erstsprache .
ex:Fachbezug_Englisch_als_Erstsprache hat_Schulfach: Englisch_KIM_Schulfach: ;
                                      a erste_Fremdsprache: .
Englisch_KIM_Schulfach: a Fremdsprachenfach: .
Fremdsprachenfach: rdfs:subClassOf Schulfach: .
erste_Fremdsprache: rdfs:subClassOf Schulfachbezug: .
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

**RDF Daten**: 
```
@prefix ex: <https://www.example.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

@prefix lp: <https://w3id.org/lehrplan/ontology/> .

# Klassen
@prefix Schulart: <https://w3id.org/lehrplan/ontology/LP_0000111> .
@prefix Hauptschulniveau: <https://w3id.org/lehrplan/ontology/LP_0000834> .
@prefix Gymnasialniveau_SekII: <https://w3id.org/lehrplan/ontology/LP_0000835> .

# Instanzen
@prefix Integrierte_Gesamtschule: <https://w3id.org/schulart/RP_0000002> .
@prefix Gesamtschule_KIM: <https://w3id.org/kim/schularten/s05> .
@prefix Rheinland-Pfalz: <https://w3id.org/lehrplan/ontology/LP_3000046> .
@prefix Jahrgangsstufe_9: <https://w3id.org/lehrplan/ontology/LP_2000009> .
@prefix Grundlegendes_Kompetenzniveau_RP: <https://w3id.org/lehrplan/ontology/LP_0000147> .
@prefix Niveau_Sekundarstufe_II_RP: <https://w3id.org/lehrplan/ontology/LP_0030353> .

# properties
@prefix has_exact_match: <http://www.w3.org/2004/02/skos/core#exactMatch> .
@prefix von_Bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029> .
@prefix hat_Jahrgangsstufe: <https://w3id.org/lehrplan/ontology/LP_0000026> .
@prefix hat_Bildungsgangniveau: <https://w3id.org/lehrplan/ontology/LP_0000833> .

Integrierte_Gesamtschule: a Schulart: ;
                          has_exact_match: Gesamtschule_KIM: ;
                          von_Bundesland: Rheinland-Pfalz: ;
                          hat_Jahrgangsstufe: Jahrgangsstufe_9: ;
                          hat_Bildungsgangniveau: Grundlegendes_Kompetenzniveau_RP: ,
                                                  Niveau_Sekundarstufe_II_RP: .
Grundlegendes_Kompetenzniveau_RP: a Hauptschulniveau: .
Niveau_Sekundarstufe_II_RP: a Gymnasialniveau_SekII: .
```

**Erläuterung**:

**Schulart** (`LP_0000111`) bezeichnet den institutionellen Typ einer Schule. Die Schulart-Ontologie erfasst insgesamt 89 Schulart-Individuen aus allen 16 Bundesländern – je eines pro länderspezifisch benannter Schulform.
Grundschule und Gymnasium sind die einzigen Schularten, die in allen Ländern vorkommen. Alle anderen Bezeichnungen variieren erheblich: Was in Bayern *Mittelschule* heißt, heißt in Thüringen *Regelschule*, in Mecklenburg-Vorpommern *Regionale Schule*, in Sachsen *Oberschule* und in Niedersachsen *Hauptschule*. Ähnlich bei den Gesamtschulen: Hamburg kennt nur die *Stadtteilschule*, Schleswig-Holstein die *Gemeinschaftsschule*, Nordrhein-Westfalen unterscheidet zwischen *Gesamt- und Sekundarschule*. 

Jedes Schulart-Individuum ist über `LP_0000029` (**von Bundesland**) an sein Bundesland gebunden und trägt einen länderspezifischen IRI der Form `schulart:BY_0000001`. Damit ist die Schulart der institutionelle Einstiegspunkt in die Lehrplandaten: Ein Lehrplan verweist über **für Schulart** (`LP_0000812`) auf genau eine Schulart – und die Schulart wiederum deklariert über **hat Bildungsgangniveau** (`LP_0000833`), welche Leistungsansprüche an ihr möglich sind.

**Schulart** und **Bildungsgangniveau** (`LP_0000028`) sind über die Property **hat Bildungsgangniveau** (`LP_0000833`) miteinander verknüpft: Jede Schulart deklariert explizit, welche Leistungsniveaus an ihr möglich sind. Das ermöglicht es, Lehrplanelemente nicht nur nach Schulart, sondern gezielt nach Anspruchsniveau zu filtern.

**Warum eine Schulart mehrere Niveaus haben kann**

An einer **Einheitsschule** wie dem Gymnasium gibt es in der Regel ein Niveau pro Schulstufe – in Bayern etwa *Gymnasialniveau Sek I (BY)* und *Gymnasialniveau Sek II (BY)*. An **Schulen mit mehreren Bildungsgängen** hingegen sind mehrere Niveaus gleichzeitig möglich, weil dieselbe Institution Schülerinnen und Schüler auf unterschiedliche Abschlüsse hin unterrichtet. Ein Beispiel aus den Daten: Die Gemeinschaftsschule in Sachsen führt gleich fünf Niveaus – *Grundschulniveau (SN), Hauptschulbildungsgangniveau (SN), Oberschulniveau (SN), Realschulbildungsgangniveau (SN)* und *Gymnasialniveau Sek I (SN)* – weil sie von Klasse 1 bis 10 alle Bildungsgänge integriert.

**Die Vielfalt der Niveaubezeichnungen**

Wie bei den Schularten selbst spiegeln die Niveaubezeichnungen die föderale Vielfalt wider. Was inhaltlich dasselbe meint, heißt in jedem Bundesland anders. Beispiel: Das *Hauptschulniveau* heißt in BW *G Niveau*, in BY *Mittelschulniveau* und in RP *Grundlegendes Kompetenzniveau*.

**Was das für die Lehrplandaten bedeutet**

Ein einzelnes Curriculares Element – etwa eine Kompetenzerwartung – kann in den Lehrplandaten ebenfalls **hat Bildungsgangniveau** tragen. Durch die Verknüpfung Schulart → Bildungsgangniveau ← CE kann das System beantworten: „An welchen Schularten gilt diese Anforderung?" – ohne dass die Schulart direkt am CE stehen muss. 


## Pattern 5 - Jahrgangstufe/Schulstufe und Phasen der Sekundarstufe II

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

G9 Einführungsphase -> Jahrgangsstufe 11: hat Jahrgangsstufe {
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

Sekundarbereich II -> G8 Einführungsphase: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Sekundarbereich II -> G8 Qualifikationsphase: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Sekundarbereich II -> G9 Einführungsphase: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

Sekundarbereich II -> G9 Qualifikationsphase: hat Teil {
  style: {
    stroke: "#9F0E21"
    stroke-width: 3
    font-color: "#9F0E21"
  }
}

```

**RDF Daten**: 
```
@prefix ex: <https://www.example.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

@prefix lp: <https://w3id.org/lehrplan/ontology/> .

# Klassen
@prefix Schulstufe: <https://w3id.org/lehrplan/ontology/LP_0000020> .
@prefix Oberstufenphase: <https://w3id.org/lehrplan/ontology/LP_0000043> .
@prefix Einführungsphase: <https://w3id.org/lehrplan/ontology/LP_0000056> .
@prefix Qualifikationsphase: <https://w3id.org/lehrplan/ontology/LP_0000057> .
@prefix Jahrgangsstufe: <https://w3id.org/lehrplan/ontology/LP_0000009> .

# Individuen
@prefix Sekundarbereich_II: <https://w3id.org/lehrplan/ontology/LP_0000046> .
@prefix Sekundarbereich_I: <https://w3id.org/lehrplan/ontology/LP_0000045> .
@prefix Primarbereich: <https://w3id.org/lehrplan/ontology/LP_0000036> .
@prefix G8_Einführungsphase: <https://w3id.org/lehrplan/ontology/LP_0000051> .
@prefix G8_Qualifikationsphase: <https://w3id.org/lehrplan/ontology/LP_0000050> .
@prefix G9_Einführungsphase: <https://w3id.org/lehrplan/ontology/LP_0000055> .
@prefix G9_Qualifikationsphase: <https://w3id.org/lehrplan/ontology/LP_0000052> .
@prefix Jahrgangsstufe_10: <https://w3id.org/lehrplan/ontology/LP_2000010> .
@prefix Jahrgangsstufe_11: <https://w3id.org/lehrplan/ontology/LP_2000011> .
@prefix Jahrgangsstufe_12: <https://w3id.org/lehrplan/ontology/LP_2000012> .
@prefix Jahrgangsstufe_13: <https://w3id.org/lehrplan/ontology/LP_2000013> .

# properties
@prefix hat_Jahrgangsstufe: <https://w3id.org/lehrplan/ontology/LP_0000026> .
@prefix hat_Teil: <> .
G8_Einführungsphase: a Einführungsphase: ;
                      hat_Jahrgangsstufe: Jahrgangsstufe_10: .
G9_Einführungsphase: a Einführungsphase: ;
                      hat_Jahrgangsstufe: Jahrgangsstufe_11: .
G8_Qualifikationsphase: a Qualifikationsphase: ;
                        hat_Jahrgangsstufe: Jahrgangsstufe_11: ,
                                            Jahrgangsstufe_12: .
G9_Qualifikationsphase: a Qualifikationsphase: ;
                        hat_Jahrgangsstufe: Jahrgangsstufe_12: ,
                                            Jahrgangsstufe_13: .                     
Jahrgangsstufe_10: a Jahrgangsstufe: .
Jahrgangsstufe_11: a Jahrgangsstufe: .
Jahrgangsstufe_12: a Jahrgangsstufe: .
Jahrgangsstufe_13: a Jahrgangsstufe: .
Einführungsphase: rdfs:subClassOf Oberstufenphase: .
Qualifikationsphase: rdfs:subClassOf Oberstufenphase: .
Sekundarbereich_II: a Schulstufe: ;
                    hat_Teil: G8_Einführungsphase: ,
                              G9_Einführungsphase: ,
                              G8_Qualifikationsphase: ,
                              G9_Qualifikationsphase: .
Sekundarbereich_I: a Schulstufe: .
Primarbereich: a Schulstufe: .
```

**Erläuterung**:

**Jahrgangsstufen** (`LP_0000009`)

Die Ontologie definiert **13 Jahrgangsstufen-Individuen** (`LP_2000001` bis `LP_2000013`) für die Jahrgänge 1–13. Sie sind bundeslandunabhängig – Jahrgangsstufe 6 ist in jedem Land dieselbe IRI `LP_2000006`. Curriculare Elemente werden über die Property **hat Jahrgangsstufe** (`LP_0000026`) an eine oder mehrere Jahrgangsstufen gebunden. Das ist die häufigste und direkteste Zuordnung: Eine Anforderung, die für Jahrgangsstufe 8 gilt, trägt `hat Jahrgangsstufe → LP_2000008`.

**Schulstufe** (`LP_0000020`) ist eine abstraktere Einordnung, die mehrere Jahrgangsstufen zu einem pädagogischen Abschnitt zusammenfasst. Sie wird über **hat Schulstufe** (`LP_0000047`) vergeben. Die Ontologie kennt folgende Schulstufen-Individuen:

- **Primarbereich** (`LP_0000036`) – umfasst die Jahrgangsstufen 1–4 (Ausnahme: Berlin/Brandenburg 1-6)
- **Sekundarbereich I** (`LP_0000045`) – umfasst die Jahrgangsstufen 5–9/10 (Ausnahme: Berlin/Brandenburg 7-10)
- **Sekundarbereich II** (`LP_0000046`) – umfasst die Jahrgangsstufen (10/)11–12/13
- (**Orientierungsstufe (MV)** (`LP_0000032`) – länderspezifisch für Mecklenburg-Vorpommern, umfasst die Jahrgangsstufen 5 und 6)

Die Schulstufe wird eingesetzt, wenn ein Lehrplanelement keiner einzelnen Jahrgangsstufe, sondern einem ganzen Bildungsabschnitt zugeordnet ist – z.B. ein Kerncurriculum, das für die gesamte Sekundarstufe I gilt.

**Die Oberstufenphasen: Einführungs- und Qualifikationsphase**

Die Ontologie kennt weitere drei Klassen, die speziell die gymnasiale Oberstufe strukturieren: **Oberstufenphase** (`LP_0000043`) als gemeinsamer Oberbegriff, und darunter **Einführungsphase** (LP_0000056) und **Qualifikationsphase** (`LP_0000057`). Die **Oberstufenphase** entspricht der **Sekundarstufe II**.
Da in Deutschland teils achtjährige (G8), teils neunjährige (G9) Gymnasien existieren, fallen Einführungs- und Qualifikationsphase in unterschiedliche Jahrgangsstufen. Beide Varianten sind in der Ontologie als eigene Individuen erfasst:

- **G8 Einführungsphase** (`LP_0000051`): Jahrgangsstufe 10
- **G8 Qualifikationsphase** (`LP_0000050`): Jahrgangsstufen 11-12
- **G9 Einführungsphase** (`LP_0000055`): Jahrgangsstufe 11
- **G9 Qualifikationsphase** (`LP_0000052`): Jahrgangsstufen 12-13


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

**RDF Daten**: 
```
@prefix ex: <https://www.example.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

@prefix lp: <https://w3id.org/lehrplan/ontology/> .

# Klassen
@prefix Lehrplan: <https://w3id.org/lehrplan/ontology/LP_0000438> .
@prefix CE-Fragment: <https://w3id.org/lehrplan/ontology/LP_0001015> .
@prefix CE-Bereich: <https://w3id.org/lehrplan/ontology/LP_0000349> .
@prefix CE-Lerninhalt: <https://w3id.org/lehrplan/ontology/LP_0000332> .
@prefix CE-Kompetenzspezifikation: <https://w3id.org/lehrplan/ontology/LP_0000263> .
@prefix CE-Hinweis: <https://w3id.org/lehrplan/ontology/LP_0000852> .

# properties
@prefix hat_Teil: <http://purl.obolibrary.org/obo/BFO_0000051> .

ex:Lehrplan hat_Teil: ex:CE-Fragment_1 .
ex:CE-Fragment_1 hat_Teil: ex:CE-Bereich_1 .
ex:CE-Bereich_1 hat_Teil: ex:CE-Bereich_2 .
ex:CE-Bereich_2 hat_Teil: ex:CE-Lerninhalt_1 ,
                          ex:CE-Kompetenzspezifikation_1 .                   
ex:CE-Lerninhalt_1 hat_Teil: ex:CE-Lerninhalt_2 .
ex:CE-Lerninhalt_2 hat_Teil: ex:CE-Hinweis_1 .
ex:CE-Kompetenzspezifikation_1 hat_Teil: ex:CE-Hinweis_2 .
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

**RDF Daten**: 
```
@prefix ex: <https://www.example.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

@prefix lp: <https://w3id.org/lehrplan/ontology/> .

# Klassen
@prefix Curriculares_Element: <https://w3id.org/lehrplan/ontology/LP_0000261> .
@prefix CE-Bereich: <https://w3id.org/lehrplan/ontology/LP_0000349> .
@prefix CE-Kompetenzspezifikation: <https://w3id.org/lehrplan/ontology/LP_0000263> .
@prefix CE-Verweis: <https://w3id.org/lehrplan/ontology/LP_0030065> .
@prefix Verweis_auf_Lernbereich_des_gleichen_Faches_einer_anderen_Klassenstufe_SN: <https://w3id.org/lehrplan/ontology/LP_0030188> .

# properties
@prefix hat_Verweis: <https://w3id.org/lehrplan/ontology/LP_0030071> .
@prefix verweist_auf: <https://w3id.org/lehrplan/ontology/LP_0030072> .
@prefix hat_Beschreibung: <https://w3id.org/lehrplan/ontology/LP_0030051> .

ex:Kompetenz_1 a CE-Kompetenzspezifikation: ;
                hat_Verweis: ex:Verweis_1 .
ex:Verweis_1 a Verweis_auf_Lernbereich_des_gleichen_Faches_einer_anderen_Klassenstufe_SN: ;
              verweist_auf: ex_Lernbereich_1 ;
              hat_Beschreibung: ex:Beschreibung_1 .
ex:Lernbereich_1 a CE-Bereich: .
CE-Kompetenzspezifikation: rdfs:subClassOf Curriculares_Element: .
Verweis_auf_Lernbereich_des_gleichen_Faches_einer_anderen_Klassenstufe_SN: rdfs:subClassOf CE-Verweis: .
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

**RDF Daten**: 
```
@prefix ex: <https://www.example.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

@prefix lp: <https://w3id.org/lehrplan/ontology/> .

# Klassen
@prefix Funktionsspezifikation: <https://w3id.org/lehrplan/ontology/LP_0000478> .
@prefix Beschreibungsfunktion: <https://w3id.org/lehrplan/ontology/LP_0000493> .
@prefix Strukturierungsfunktion: <https://w3id.org/lehrplan/ontology/LP_0000482> .
@prefix Curriculares_Element: <https://w3id.org/lehrplan/ontology/LP_0000261> .
@prefix Element_NW: <https://w3id.org/lehrplan/ontology/LP_0002085> .
@prefix Kompetenzerwartung_NW: <https://w3id.org/lehrplan/ontology/LP_0002188> .
@prefix Kompetenzbereich_NW: <https://w3id.org/lehrplan/ontology/LP_0002187> .
@prefix CE-Bereich: <https://w3id.org/lehrplan/ontology/LP_0000349> .
@prefix CE-Kompetenzspezifikation: <https://w3id.org/lehrplan/ontology/LP_0000263> .

# Individuen
@prefix Kompetenzbeschreibungsfunktion: <https://w3id.org/lehrplan/ontology/LP_0000479> .
@prefix Bereichsfunktion: <https://w3id.org/lehrplan/ontology/LP_0000497> .

# properties
@prefix hat_Funktion: <https://w3id.org/lehrplan/ontology/LP_0000483> .

ex:Kompetenz a Kompetenzerwartung_NW: .
Kompetenzerwartung_NW: hat_Funktion: Kompetenzbeschreibungsfunktion:
                       rdfs:subClassOf Element_NW: .
CE-Kompetenzspezifikation: hat_Funktion: Kompetenzbeschreibungsfunktion:
                           rdfs:subClassOf Curriculares_Element: .
Kompetenzbeschreibungsfunktion: a Beschreibungsfunktion: .                       
Beschreibungsfunktion: rdfs:subClassOf Funktionsspezifikation: .
ex:Bereich a Kompetenzbereich_NW: .
Kompetenzbereich_NW: hat_Funktion: Bereichsfunktion:
                     rdfs:subClassOf Element_NW: .
CE-Bereich: hat_Funktion: Bereichsfunktion:
                     rdfs:subClassOf Curriculares_Element: .
Bereichsfunktion: a Strukturierungsfunktion: .                       
Strukturierungsfunktion: rdfs:subClassOf Funktionsspezifikation: .
Element_NW: rdfs:subClassOf Curriculares_Element: .
```

**Erläuterung**:

**Das Problem: Viele Namen, eine Bedeutung**

Die 16 Bundesländer haben ihre Lehrpläne strukturell sehr unterschiedlich aufgebaut und verwenden eigene Terminologien. Was in Bayern *Lernbereich* heißt, heißt in Hamburg *Kompetenzbereich*, in Rheinland-Pfalz  oder , in Sachsen ebenfalls Lernbereich, in Nordrhein-Westfalen Bereich, in Sachsen-Anhalt eBereich, in Thüringen Lernbereich oder Schwerpunkt usw. Inhaltlich spielen all diese Klassen dieselbe Rolle: Sie fassen Kompetenzen oder Lerninhalte unter einem thematischen Fokus zusammen.

Ohne ein zusätzliches Zuordnungsmechanismus wäre eine bundeslandübergreifende Abfrage nicht möglich – man müsste jede der gut 200 länderspezifischen CE-Klassen einzeln kennen und benennen.

**Die Lösung: Funktionsspezifikationen**

Die Lehrplan-Ontologie löst dieses Problem mit dem Konzept der **Funktionsspezifikation** (`LP_0000478`). Jede länderspezifische CE-Klasse erhält in ihrer OWL-Klassendefinition eine Restriktion, die über die Property **hat Funktion** (`LP_0000483`) auf ein bestimmtes Funktionsspezifikations-Individuum zeigt. Diese Restriktion ist kein Datenpunkt, der in den Lehrplandaten stehen muss – sie ist fest in der Klassendefinition verankert und gilt damit automatisch für jede Instanz dieser Klasse.

Die Ontologie definiert drei Unterklassen von Funktionsspezifikation:

Die **Strukturierungsfunktion** (`LP_0000482`) beschreibt, wie ein CE-Element den Lehrplan gliedert – ohne selbst inhaltliche Semantik zu tragen:

- **Fragmentfunktion** – Das Element ist ein rein strukturierender Behälter (Kapitel, Abschnitt, Überschrift). Alle 16 Lehrplanfragment-Klassen tragen diese Funktion: *Lehrplanfragment (BY), Lehrplanfragment (HH), Lehrplanfragment (SN)* usw.
- **Bereichsfunktion** – Das Element gliedert den Lehrplan in inhaltlich zusammenhängende Bereiche. Rund 80 länderspezifische Klassen tragen diese Funktion, darunter *Kompetenzbereich (HH), Lernbereich (BY), Bereich (NW), Leitidee (BE), Inhaltsfeld (HE), Inhalt (HH)* uvm. – trotz unterschiedlicher Namen bilden sie alle einen CE-Bereich ab.

Die **Beschreibungsfunktion** (`LP_0000493`) beschreibt, was ein CE-Element inhaltlich leistet:

- **Kompetenzbeschreibungsfunktion** – Das Element formuliert eine zu erwerbende Kompetenz: *Anforderung (HH), Kompetenzerwartung (BY), Kompetenz (RP), Standard (BE)* usw. → entspricht der generischen Klasse CE-Kompetenzspezifikation.
- **Lerninhaltsbeschreibungsfunktion** – Das Element benennt einen konkreten Lerngegenstand oder ein Thema → entspricht CE-Lerninhalt.
- **Hinweisbeschreibungsfunktion** – Das Element enthält einen methodischen oder didaktischen Hinweis → entspricht CE-Hinweis. Auch hier gibt es eine große Vielfalt länderspezifischer Klassen, z.B. *Bemerkung (SN), Hinweis und Anregung (MV), Möglicher Kontext (BE), Erläuterung (BY), Differenzierungsmöglichkeit (RP)*.
- **Verweisbeschreibungsfunktion** – Das Element ist ein Verweis auf ein anderes Element → entspricht CE-Verweis.
- **Leitperspektivenbeschreibungsfunktion** – Das Element kodiert eine übergreifende Leitperspektive → entspricht CE-Leitperspektive.

Die **Bezugsfunktion** (LP_0000499) beschreibt, worauf sich ein CE-Element inhaltlich bezieht – d.h. welche Dimension von Kompetenz es adressiert:

- **Prozessbezugsfunktion** – Das Element adressiert prozessorientierte Kompetenzen (wie gelernt oder gehandelt wird).
- **Inhaltsbezugsfunktion** – Das Element adressiert inhaltsorientierte Kompetenzen (was gelernt wird).
- **Domänenbezugsfunktion** – Das Element bezieht sich auf eine fachliche Domäne (z.B. Lesen, Schreiben als Kompetenzdomänen).

**Wie die Zuordnung technisch funktioniert**

In OWL wird die Funktionszuordnung als notwendige Bedingung (`rdfs:subClassOf`) mit einer `owl:hasValue`-Restriktion modelliert:
```
Lernbereich (BY)
  rdfs:subClassOf  [
    owl:onProperty  lp:LP_0000483 (hat Funktion) ;
    owl:hasValue    lp:LP_0000497 (Bereichsfunktion)
  ]
```

Das bedeutet: Jede Instanz von `Lernbereich (BY)` trägt automatisch die Bereichsfunktion – ohne dass in den Lehrplandaten ein expliziter `hat Funktion`-Tripel stehen muss. Ein OWL-Reasoner kann daraus schließen, dass `Lernbereich (BY)` semantisch einem **CE-Bereich** entspricht.

**Was das für Abfragen bedeutet**

Dank der Funktionsspezifikationen kann man bundeslandübergreifend abfragen, ohne die länderspezifischen Klassen zu kennen:

- *"Gib mir alle Kompetenzbereiche aus allen Bundesländern"* → Suche alle CE-Instanzen, deren Klasse `hat Funktion → Bereichsfunktion` trägt.
- *"Gib mir alle konkreten Anforderungen aus dem Hamburger Deutschlehrplan"* → Suche alle Instanzen, deren Klasse `hat Funktion → Kompetenzbeschreibungsfunktion` trägt, gefiltert auf Hamburg.
- *"Welche Elemente sind nur Hinweise?"* → Suche alle Instanzen mit `hat Funktion → Hinweisbeschreibungsfunktion`.

Die Funktionsspezifikationen sind damit die zentrale Brücke zwischen der reichen länderspezifischen Terminologie und einer einheitlichen, bundeslandübergreifenden Semantik.


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

**RDF Daten**: 
```
@prefix ex: <https://www.example.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

@prefix lp: <https://w3id.org/lehrplan/ontology/> .

# Klassen
@prefix Niveau: <https://w3id.org/lehrplan/ontology/LP_0000037> .
@prefix Bildungsgangniveau: <https://w3id.org/lehrplan/ontology/LP_0000028> .
@prefix Anforderungsbereich: <https://w3id.org/lehrplan/ontology/LP_0000802> .
@prefix Fachniveau_Sek_II: <https://w3id.org/lehrplan/ontology/LP_0000265> .
@prefix Fremdsprachenniveau: <https://w3id.org/lehrplan/ontology/LP_0010001> .
@prefix Bildungsgangniveau_ST: <https://w3id.org/lehrplan/ontology/LP_0001035> .
@prefix Gymnasialniveau_Sek_I: <https://w3id.org/lehrplan/ontology/LP_0000069> .
@prefix Grundkursniveau: <https://w3id.org/lehrplan/ontology/LP_0000530> .
@prefix Leistungskursniveau: <https://w3id.org/lehrplan/ontology/LP_0000531> .
@prefix Fachniveau_Sek_II_ST: <https://w3id.org/lehrplan/ontology/LP_0002094> .

# Individuen
@prefix Gymnasialniveau_Sek_I_ST: <https://w3id.org/schulart/RP_0000296> .
@prefix Sachsen-Anhalt: <https://w3id.org/lehrplan/ontology/LP_3000053> .
@prefix Anforderungsbereich_2: <https://w3id.org/lehrplan/ontology/LP_0000804> .
@prefix Grundlegendes_Anforderungsniveau_ST: <https://w3id.org/lehrplan/ontology/LP_0000526> .
@prefix Erhöhtes_Anforderungsniveau_ST: <https://w3id.org/lehrplan/ontology/LP_0000527> .
@prefix B1: <https://w3id.org/lehrplan/ontology/LP_0030315> .

# properties
@prefix von_Bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029> .

Gymnasialniveau_Sek_I_ST: a Bildungsgangniveau_ST: ,
                            Gymnasialniveau_Sek_I .
Bildungsgangniveau_ST: von_Bundesland: Sachsen-Anhalt: ;
                       rdfs:subClassof Bildungsgangniveau: .                       
Gymnasialniveau_Sek_I rdfs:subClassof Bildungsgangniveau: .
Bildungsgangniveau: rdfs:subClassof Niveau: .
Anforderungsbereich_2: a Anforderungsbereich: .
Anforderungsbereich rdfs:subClassof Niveau: .
Grundlegendes_Anforderungsniveau_ST: a Grundkursniveau: ,
                                       Fachniveau_Sek_II_ST: .
Erhöhtes_Anforderungsniveau_ST: a Leistungskursniveau: ,
                                  Fachniveau_Sek_II_ST: .
Grundkursniveau: rdfs:subClassof Fachniveau_Sek_II: .
Leistungskursniveau: rdfs:subClassof Fachniveau_Sek_II: .
Fachniveau_Sek_II_ST: rdfs:subClassof Fachniveau_Sek_II: .
Fachniveau_Sek_II: rdfs:subClassof Niveau: .
B1: a Fremdsprachenniveau: .
Fremdsprachenniveau: rdfs:subClassof Niveau: .
```

**Erläuterung**:

**Niveau** (`LP_0000037`) ist die gemeinsame Superklasse für alle Leistungs- und Anforderungsstufen in der Ontologie. Sie gliedert sich in vier thematisch unterschiedliche Unterklassen.

Das **Bildungsgangniveau** (`LP_0000028`) beschreibt den Leistungsanspruch, mit dem Inhalte und Kompetenzen für eine bestimmte Lerngruppe formuliert sind – und damit, auf welchen Schulabschluss hin unterrichtet wird. Die Ontologie definiert vier generische Niveaus: **Hauptschulniveau, Realschulniveau, Gymnasialniveau Sek I** und **Gymnasialniveau Sek II**. Für jedes Bundesland gibt es eigene Subklassen (*Bildungsgangniveau (HH), Bildungsgangniveau (SN)* usw.), und darunter wiederum die konkreten länderspezifischen Individuen.

Die Namen variieren erheblich: Dasselbe Hauptschulniveau heißt in Bayern *Mittelschulniveau*, in Thüringen *Regelschulniveau*, in Schleswig-Holstein *Sekundarstufenniveau*, in Hamburg *Mindestanforderungen*. Das Gymnasialniveau Sek I heißt in Bremen *Erweitertes Anforderungsniveau*, in Rheinland-Pfalz *Erhöhtes Kompetenzniveau*, in Nordrhein-Westfalen *Erweiterungskurs*. Berlin geht etwas anders vor und differenziert nach Abschlusstyp und Niveaustufen A-H: Die Niveaus *BOA, BBR (A–F), EBBR (A–G), MSA (A–G)* und *Gymnasialniveau Sek I (A–H)* bilden die jahrgangsbandweise Kompetenzentwicklung innerhalb eines Abschlussziels ab. (Eine detaillierte Erklärung dazu liefert Pattern 11.)

Das **Fachniveau Sek II** (`LP_0000265`) beschreibt den Kurstyp in der gymnasialen Oberstufe. Die generischen Individuen sind **Grundkursniveau** und **Leistungskursniveau**. Darüber hinaus haben die Bundesländer eigene Subklassen (*Fachniveau Sek II (BY)* usw.) mit länderspezifischen Bezeichnungen für Kursarten (z.B. *Grundlegendes Anforderungsniveau*, *Erhöhtes Anforderungsniveau*, *Leistungskursfach*).

Der **Anforderungsbereich** (`LP_0000802`) ist eine bundesweit einheitliche Taxonomie aus den KMK-Bildungsstandards, die den kognitiven Anspruch einer Aufgabe oder Kompetenz klassifiziert. Die drei Individuen sind fest definiert: **Anforderungsbereich 1 (Reproduktion), Anforderungsbereich 2 (Reorganisation und Transfer)** und **Anforderungsbereich 3 (Reflexion und Problemlösung)**. Im Gegensatz zu Bildungsgang- und Fachniveaus, die organisatorische Rahmenbedingungen beschreiben, charakterisiert der Anforderungsbereich die kognitive Tiefe eines Lernziels – unabhängig von Schulart oder Bundesland.

Das **Fremdsprachenniveau** (`LP_0010001`) bildet die Kompetenzstufen des **Gemeinsamen Europäischen Referenzrahmens für Sprachen (GER)** als sechs Individuen ab (von *A1 - Anfänger* (`LP_0030317`) bis *C2 - Annähernd muttersprachliche Kenntnisse* (`LP_0030313`)). Diese Niveaus sind bundeslandunabhängig und einheitlich – im Gegensatz zu den stark föderalen Bildungsgangniveaus. Sie ermöglichen es, Lehrplanelemente aus Fremdsprachenfächern direkt mit dem international anerkannten GER-Standard zu verknüpfen.


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

**RDF Daten**: 
```
@prefix ex: <https://www.example.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

@prefix lp: <https://w3id.org/lehrplan/ontology/> .

# Klassen
@prefix Niveau: <https://w3id.org/lehrplan/ontology/LP_0000037> .
@prefix Bildungsgangniveau: <https://w3id.org/lehrplan/ontology/LP_0000028> .
@prefix Realschulniveau: <https://w3id.org/lehrplan/ontology/LP_0000832> .
@prefix Bildungsgangniveau_RP: <https://w3id.org/lehrplan/ontology/LP_0001019> .
@prefix Realschulbildungsgang: <https://w3id.org/lehrplan/ontology/LP_0000814> .
@prefix Bildungsgang: <https://w3id.org/lehrplan/ontology/LP_0000816> .
@prefix Schulabschluss: <https://w3id.org/lehrplan/ontology/LP_0000019> .
@prefix Mittlerer_Schulabschluss: <https://w3id.org/lehrplan/ontology/LP_0000078> .
@prefix Mittlerer_Abschluss_RP: <https://w3id.org/lehrplan/ontology/LP_0000204> .

# Individuen
@prefix Mittleres_Kompetenzniveau_RP: <https://w3id.org/schulart/RP_0000151> .
@prefix Rheinland-Pfalz: <https://w3id.org/lehrplan/ontology/LP_3000046> .
@prefix Qualifizierter_Sekundarabschluss_I_RP: <https://w3id.org/lehrplan/ontology/LP_0000281> .

# properties
@prefix von_Bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029> .
@prefix hat_Bildungsgangniveau: <https://w3id.org/lehrplan/ontology/LP_0000833> .
@prefix benötigt_Niveau: <https://w3id.org/lehrplan/ontology/LP_0000071> .
@prefix endet_mit_Abschluss: <https://w3id.org/lehrplan/ontology/LP_0000021> .

Qualifizierter_Sekundarabschluss_I_RP: a Mittlerer_Abschluss_RP: .
Mittlerer_Abschluss_RP: rdfs:subClassof Mittlerer_Schulabschluss: .
Mittlerer_Schulabschluss: rdfs:subClassof Schulabschluss: ;
                          benötigt_Niveau: Realschulniveau: .
Realschulbildungsgang: rdfs:subClassof Bildungsgang: ;
                       endet_mit_Abschluss: Mittlerer_Schulabschluss: ;
                       hat_Bildungsgangniveau: Realschulniveau: .            
Mittleres_Kompetenzniveau_RP: a Realschulniveau: ,
                                Bildungsgangniveau_RP: .
Bildungsgangniveau_RP :rdfs:subClassof Bildungsgangniveau: ;
                      von_Bundesland: Rheinland-Pfalz: .                       
Realschulniveau: rdfs:subClassof Bildungsgangniveau: .
Bildungsgangniveau: rdfs:subClassof Niveau: .
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


## Pattern 11 - Niveaustufen BE/BB

```d2



```
**Erläuterung**:

**Berlin** und **Brandenburg** teilen seit 2004 gemeinsame Rahmenlehrpläne – ein bundesweites Unikat. Das spiegelt sich direkt in der Ontologie wider: Die Niveaustufen-Klasse heißt bezeichnenderweise **Niveaustufe (BE/BB)** (`LP_0000443`).

Der Berliner und Brandenburger Rahmenlehrplan strukturiert Kompetenzen nicht immer nach Jahrgangsstufen, sondern nach **Buchstabenstufen A bis H**, die den Grad der Kompetenzentwicklung beschreiben. Eine Niveaustufe ist dabei ein **Curriculares Element** – sie steht als Behälter in der Lehrplanhierarchie und enthält die konkreten Standards, die für diese Stufe gelten. Die acht Individuen **Niveaustufe A** bis **Niveaustufe H** sind für BE und BB gemeinsam definiert.

**Die Verknüpfung mit Jahrgangsstufen**

Das Besondere am BE/BB-System: Jede Bildungsgangniveau-Stufe (z.B. *"MSA D"* oder *"Gymnasialniveau Sek I F"*) trägt über **hat Jahrgangsstufe** (`LP_0000026`) direkt die Jahrgangsstufen, in denen diese Stufe typischerweise erreicht wird. Dabei überlappen sich benachbarte Stufen bewusst über Jahrgangsgrenzen hinweg – denn der Rahmenlehrplan sieht individuelle Kompetenzentwicklung vor, keine starren Stufenschwellen. Die Zuordnung aus den Ontologiedaten ist die folgende:

**Niveaustufe → Jahrgangsstufen**
- A → 1
- B → 1–3
- C → 2–5
- D → 4–7
- E → 6–8
- F → 8–10
- G → 9–10
- H → 10

Diese Jahrgangsstufen gelten übergreifend für alle Abschlusstypen (*BOA, BBR, EBBR, MSA, Gymnasialniveau Sek I*). Die konkreten Bildungsgangniveau-Individuen tragen dieselben Jahrgangsstufen, jeweils angepasst an die Reichweite des Abschlusses – z.B. reicht *BOA* nur bis Stufe E (Jahrgänge 1–8), während das *Gymnasialniveau Sek I* alle acht Stufen A–H (Jahrgänge 1–10) umfasst.

**Verknüpfung mit Abschlüssen: Die Bildungsgangniveaus**

Über die Property **hat Niveau** (`LP_0000840`) sind die Niveaustufen-Individuen (A–H) direkt mit den abschlussspezifischen Bildungsgangniveau-Individuen verknüpft. So zeigt *Niveaustufe A* auf *BOA A, BBR A, EBBR A, MSA A und Gymnasialniveau Sek I A* gleichzeitig – und stellt damit die gemeinsame Buchstabenstufe als verbindendes Konzept her. Umgekehrt zeigt jedes Bildungsgangniveau-Individuum über **ist Niveaustufe von** (`LP_0000580`) zurück auf seine generische Buchstabenstufe.

**Für Berlin (`Bildungsgangniveau (BE)`):**

Jede Buchstabenstufe existiert einmal je Abschlusstyp.

BOA-Niveaus (Berufsorientierungsabschluss, Stufen A–E):

LP_0000583 – BOA A
LP_0000584 – BOA B
LP_0000585 – BOA C
LP_0000586 – BOA D
LP_0000587 – BOA E

MSA-Niveaus (Mittlerer Schulabschluss, Stufen A–G):

LP_0000601 – MSA A
LP_0000602 – MSA B
LP_0000603 – MSA C
LP_0000604 – MSA D
LP_0000605 – MSA E
LP_0000606 – MSA F
LP_0000607 – MSA G

Gymnasialniveau Sek I BE (Stufen A–H):

LP_0000608 – Gymnasialniveau Sek I A (BE)
LP_0000609 – Gymnasialniveau Sek I B (BE)
LP_0000610 – Gymnasialniveau Sek I C (BE)
LP_0000611 – Gymnasialniveau Sek I D (BE)
LP_0000612 – Gymnasialniveau Sek I E (BE)
LP_0000613 – Gymnasialniveau Sek I F (BE)
LP_0000614 – Gymnasialniveau Sek I G (BE)
LP_0000616 – Gymnasialniveau Sek I H (BE)

Berufsbildungsreife BBR Niveau A–F (Jg. 1–10) Hauptschulniveau
Erweiterte Berufsbildungsreife EBBR Niveau A–G (Jg. 1–10) Hauptschulniveau
Mittlerer SchulabschlussMSA Niveau A–G (Jg. 1–10) Realschulniveau
Gymnasialniveau Sek I Gymnasialniveau Sek I (BE) A–H (Jg. 1–10) Gymnasialniveau Sek I
Oberstufe Oberstufenniveau (BE) Gymnasialniveau Sek II

**Für Brandenburg (`Bildungsgangniveau (BB)`):**

Erster AbschlussEBR NiveauA–GHauptschulniveau
Mittlerer AbschlussFOR NiveauA–GRealschulniveau
Mittlerer Abschluss mit GymnasialberechtigungFOR-Q NiveauA–HGymnasialniveau Sek I
OberstufeOberstufenniveau (BB)—Gymnasialniveau Sek II

**Wie Vergleichbarkeit mit anderen Bundesländern hergestellt wird**

Dank zweier Mechanismen lassen sich BE/BB-Lehrplaninhalte bundeslandübergreifend vergleichen:

**1. Über das generische Bildungsgangniveau:** Jede BE/BB-Niveau-Klasse ist Subklasse eines generischen Niveaus – `BBR Niveau` und `EBBR Niveau` erben von `Hauptschulniveau`, `MSA Niveau` von `Realschulniveau`, `Gymnasialniveau Sek I (BE)` von `Gymnasialniveau Sek I`. Ein OWL-Reasoner kann damit automatisch schließen: Eine Anforderung auf `MSA F` (Jg. 8–9) entspricht generisch dem Realschulniveau – und ist damit direkt vergleichbar mit z.B. bayerischen Anforderungen auf `Realschulniveau (BY)`.

**2. Über die Jahrgangsstufen:** Da jedes Bildungsgangniveau-Individuum dieselben Jahrgangsstufen-IRIs trägt wie alle anderen Bundesländer, kann man direkt fragen: *"Welche Kompetenzanforderungen gibt es in Jahrgangsstufe 8 auf Hauptschulniveau in allen Bundesländern?"* – und erhält sowohl bayerische Kompetenzerwartungen auf Mittelschulniveau als auch Berliner Standards auf BBR E / EBBR E-Niveau, die beide in Jahrgangsstufe 8 verortet und beide als Hauptschulniveau klassifiziert sind.

**RDF Daten**: 
```

```

## Pattern 12 - Zeitangaben

```d2



```
**Erläuterung**:

Zeitangaben werden benötigt, um Lehrplanelemente nicht nur inhaltlich, sondern auch zeitlich zu verankern – z.B. den zeitlichen Rahmen, in dem ein Inhalt behandelt werden soll.

Die Klasse **Data Item** (`IAO_0000027`) stammt aus der *Information Artifact Ontology (IAO)*, einer weitverbreiteten OBO-Bibliotheksontologie. Sie bezeichnet eine abstrakte Informationseinheit – also einen Datenpunkt, der einen Wert repräsentiert. In der MEM-Ontologie wird sie als Superklasse für alle strukturierten Angaben genutzt, die keinen eigenständigen Gegenstand in der Welt beschreiben, sondern Messwerte, Datumsangaben oder andere skalare Informationen tragen.

**Unit** (`UO_0000000`) stammt aus der *Units of Measurement Ontology (UO)* und bezeichnet eine Maßeinheit. In der MEM-Ontologie wird sie herangezogen, um Zeitangaben mit einer Einheit zu versehen – z.B. „Stunden", „Wochen" oder „Schuljahr". Eine Unit ist dabei das Maß, das einer numerischen Zeitangabe erst Bedeutung gibt: Die Zahl „2" allein sagt nichts; erst „2 Unterrichtsstunden" oder „2 Schulwochen" ist eine sinnvolle curriculare Aussage.

Die **Zeitspezifikation** (`LP_0000508`) ist die LP-eigene Klasse, die eine konkrete Zeitangabe als Ganzes bündelt. Sie kombiniert einen numerischen Wert mit einer Unit zu einer vollständigen Zeitaussage – z.B. "45 Minuten" oder "1 Schulhalbjahr". Sie kann an Curricularen Elementen hängen, um zeitliche Empfehlungen oder Vorgaben maschinenlesbar zu machen: Wie viel Unterrichtszeit ist für diesen Lernbereich vorgesehen? Über welchen Zeitraum soll ein Thema behandelt werden?

Die drei Konzepte bauen aufeinander auf:
```
Zeitspezifikation
  ├─[hat Wert]──▶ numerischer Wert (z.B. "45")     ← Data Item
  └─[hat Einheit]▶ Unit (z.B. "Unterrichtsminuten") ← UO_0000000
```
Damit folgt die Zeitmodellierung demselben Prinzip wie der Rest der MEM-Ontologie: Statt Freitext – *"ca. 45 Minuten"* – werden Wert und Einheit getrennt maschinenlesbar erfasst. Das ermöglicht automatische Auswertungen, z.B. die Berechnung der Gesamtstundenzahl eines Lehrplans oder den Vergleich von Zeitvorgaben zwischen Bundesländern.

**RDF Daten**: 
```

```

## Pattern 13 - Gültigkeitsbereich

**-> aktuell noch nicht in der Ontologie modelliert!**
`Gültigkeitszeitraum`, `Versionierung` ?
`GültigAb`, `gültigVon`, `gültigBis`, `inkraftGetreten` ?

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