# Patterns

Patterns (Anwendungsmuster) zeigen, wie wiederkehrende Sachverhalte mit der Lehrplan-Ontologie modelliert werden. Sie sind wiederverwendbare Bausteine, die eine einheitliche Darstellung in den Lehrplandaten sicherstellen, und können als Grundlage für SHACL-Shapes (SHACL: Shapes Constraint Language) dienen, mit denen sich die Daten prüfen lassen.

Jedes Pattern enthält eine Visualisierung, die RDF-Daten (RDF: Resource Description Framework) und eine Erläuterung. Die Beispiele beziehen sich auf die Version **1.0.0rc6** der Ontologie. Ressourcen mit dem Präfix `ex:` sind erfundene Beispiele; in den echten Lehrplandaten haben sie Internationalized Resource Identifiers (IRIs) der Form `https://w3id.org/lehrplan/resource/by/…`. Damit die Beispiele lesbar bleiben, erhält jeder verwendete Begriff der Ontologie einen eigenen Prefix, der nach seiner Bezeichnung benannt ist (siehe [Schreibweise der Abfragen](sparql.md#schreibweise-der-abfragen)). Prefixe von Klassen beginnen mit einem Großbuchstaben (`Lehrplan:`, `CE_Bereich:`), Prefixe von Properties und Individuen der Ontologie mit einem Kleinbuchstaben (`hat_teil:`, `sachsen:`). Die erfundenen Beispiel-Instanzen sind klein geschrieben und nummeriert (`ex:lehrplan_1`, `ex:titel_2`).


## Pattern 1 - Lehrplan eines Landes

```ontoink
source: patterns/pattern1.ttl
shape: ../shapes/auto-shapes/auto-shapes-open.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern1.ttl"
```

**Erläuterung**:

**Lehrplan** (`LP_0000438`) ist die gemeinsame Oberklasse aller Lehrpläne. Jede länderspezifische Bezeichnung ist eine Unterklasse davon: *LehrplanPLUS (BY)*, *Bildungsplan (BW, HB, HH)*, *Kernlehrplan (NW)*, *Kerncurriculum (NI, HE)*, *Rahmenlehrplan (BE, BB)*, *Rahmenplan (MV)*, *Fachanforderung (SH)* sowie *Lehrplan (RP, SL, SN, ST, TH)*.

**Kontextualisierungsangaben**

Ein Lehrplan trägt die Angaben, die seinen institutionellen Geltungsbereich beschreiben:

- **von Bundesland** (`LP_0000029`) → das ausgebende Land, z. B. *Bayern* (`LP_3000051`)
- **für Schulart** (`LP_0000812`) → die Schulart, für die der Lehrplan gilt, z. B. *Grundschule* (`schulart:BY_0000001`)
- **hat Bildungsgangniveau** (`LP_0000833`) → alternativ oder ergänzend das Bildungsgangniveau, z. B. *Realschulniveau (BY)* (`LP_0000030`)
- **hat Schulfach** (`LP_0000537`) → das Unterrichtsfach, z. B. *Sport* (`schulfach:BY_0000013`)
- **hat Jahrgangsstufe** (`LP_0000026`) → die Jahrgangsstufen, für die der Lehrplan gilt
- **hat Schulstufe** (`LP_0000047`) → alternativ oder ergänzend die übergeordnete Schulstufe, z. B. *Primarbereich* (`LP_0000036`)

Zusammen machen diese Angaben einen Lehrplan eindeutig identifizierbar: *„Bayern – Grundschule – Sport – Jahrgangsstufen 1 und 2“*.

**Weitere Informationen**

- **hat Titel** (`LP_0030056`) → der offizielle Titel als Titel-Individuum (siehe Pattern 2)
- **hat Beschreibung** (`LP_0030051`) → ein erläuternder Text als Beschreibungs-Individuum
- **uri** (`LP_0000463`) → die Uniform Resource Locator (URL) des Originaldokuments beim Herausgeber, z. B. auf dem Schulportal des Landes
- **hat direkten Teil** (`LP_0000565`) → die oberste Gliederungsebene des Lehrplans (siehe Pattern 6)
- **veröffentlicht am** und **hat Gültigkeitsbereich** → zeitliche Angaben (siehe Pattern 13)


## Pattern 2 - Titel, Beschreibung und Identifikationsnummer

```ontoink
source: patterns/pattern2.ttl
shape: ../shapes/auto-shapes/auto-shapes-open.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern2.ttl"
```

**Erläuterung**:

Die Texte eines Lehrplans werden nicht als einfache Literale an die Elemente gehängt, sondern als eigene Informationseinheiten modelliert. Der eigentliche Text steht jeweils über **hat Wert** (`LP_0000344`) an diesem Individuum.

**Titel** (`LP_0000346`) – Property: **hat Titel** (`LP_0030056`)

Ein Titel trägt die Bezeichnung eines Elements, wie sie im gedruckten oder digitalen Lehrplan erscheint. Er ist nicht identisch mit dem `rdfs:label` des Elements: Das Label ist eine Beschriftung für die Anzeige, der Titel bildet den Originaltext des Dokuments ab. *hat Titel* kann an Lehrplänen und an curricularen Elementen verwendet werden (Domain: *Curriculares Element* oder *Lehrplan*). Für eine *CE-Kompetenzspezifikation* ist ein Titel Teil der Definition.

**Beschreibung** (`LP_0030003`) – Property: **hat Beschreibung** (`LP_0030051`)

Die Beschreibung trägt längere, erläuternde Texte: Erläuterungen zu Kompetenzbereichen, methodische Hinweise, didaktische Kommentare, Konkretisierungsbeispiele oder Texte zum Bildungsauftrag. Auch *hat Beschreibung* kann an Lehrplänen und curricularen Elementen verwendet werden.

**Identifikationsnummer** (`LP_0000347`) – Property: **hat Nummer** (`LP_0030057`)

Die Identifikationsnummer bewahrt die Nummerierung des Originaldokuments, z. B. *„3.1“*, *„LB 2“* oder *„A.1“*. Sie ist nur an curricularen Elementen vorgesehen (Domain: *Curriculares Element*). Da die IRIs der Elemente zwar eindeutig, aber für Menschen nicht sprechend sind (z. B. `https://w3id.org/lehrplan/resource/by/a0010229-…`), stellt die Nummer den Bezug zur Stelle im Originaldokument her.

**Gliederung und Reihenfolge**

Das Beispiel zeigt außerdem, wie Elemente ineinander gegliedert werden: Über **hat direkten Teil** (`LP_0000565`) verweist ein Element auf seine unmittelbaren Teile, über **hat Position** (`LP_0000460`) wird die Reihenfolge der Teile innerhalb ihres Elternelements festgehalten.

```text
Curriculares Element
  ├─[hat Titel]──────────▶ Titel                  → Name des Elements im Dokument
  ├─[hat Nummer]─────────▶ Identifikationsnummer  → z. B. "3.1" oder "LB 2"
  ├─[hat Beschreibung]───▶ Beschreibung           → erläuternder Text
  └─[hat Position]───────▶ 1, 2, 3 …              → Reihenfolge im Elternelement
```


## Pattern 3 - Schulfach und Schulfachbezug

```ontoink
source: patterns/pattern3.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern3.ttl"
```

**Erläuterung**:

Das Beispiel zeigt zwei Lehrpläne: Einem ist direkt ein Schulfach zugeordnet, dem anderen ein Schulfachbezug.

**Schulfach** (`LP_0000001`) ist die Klasse aller Unterrichtsfächer. Für häufig abgefragte Fächergruppen gibt es Unterklassen:

- **MINT-Fach** (`LP_0000002`; MINT: Mathematik, Informatik, Naturwissenschaften und Technik) mit der Unterklasse **Naturwissenschaftsfach** (`LP_0000003`)
- **Fremdsprachenfach** (`LP_0000004`)
- **Gesellschaftswissenschaftsfach** (`LP_0000005`)
- **BistaFach** (`LP_0000039`) für die Fächer, für die es KMK-Bildungsstandards (KMK: Kultusministerkonferenz) gibt

Die konkreten Fächer stammen aus der Schulfach-Ontologie (`https://w3id.org/schulfach`): 898 Fächer, je eines pro Land und Fachbezeichnung, z. B. `schulfach:BY_0000001` (Deutsch), `schulfach:HH_0000004` (Deutsch), `schulfach:SN_0000001` (Deutsch). Dass dasselbe Fach in jedem Land ein eigenes Individuum ist, bildet die Realität ab: Die Bezeichnungen weichen voneinander ab, etwa *Arbeit-Wirtschaft-Technik*, *AWT* oder *Arbeitslehre*. Für 733 Fächer gibt es ein `skos:exactMatch` und für 51 ein `skos:closeMatch` auf das bundesweite **KIM-Schulfachvokabular** (KIM: Kompetenzzentrum Interoperable Metadaten), das als gemeinsamer Bezugspunkt für länderübergreifende Abfragen dient.

In den Lehrplandaten wird ein Fach über **hat Schulfach** (`LP_0000537`) mit einem Lehrplan verknüpft.

**Schulfachbezug** (`LP_0000540`) beschreibt die Stellung eines Fachs in einem bestimmten Kontext:

- **Pflichtfach** (`LP_0000544`): für alle Schülerinnen und Schüler verbindlich
- **Wahlpflichtfach** (`LP_0000545`): verbindliche Wahl aus einem festgelegten Angebot
- **Wahlfach** (`LP_0000551`): freiwillig wählbar
- **Erste**, **Zweite** und **Dritte Fremdsprache** (`LP_0000541`, `LP_0000542`, `LP_0000543`)

Ein Schulfachbezug verweist seinerseits über *hat Schulfach* auf das Fach. Deshalb erlaubt *hat Schulfach* als Range sowohl *Schulfach* als auch *Schulfachbezug*. Besonders wichtig ist das für Fremdsprachen: Englisch kann je nach Land und Bildungsgang erste, zweite oder dritte Fremdsprache sein – mit jeweils anderen Anforderungen. So lassen sich z. B. alle Lehrpläne für „Englisch als zweite Fremdsprache“ bundesweit abfragen.


## Pattern 4 - Schulart und Bildungsgangniveau

```ontoink
source: patterns/pattern4.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern4.ttl"
```

**Erläuterung**:

**Schulart** (`LP_0000111`) beschreibt eine Schulform. Die Schulart-Ontologie umfasst 89 Schularten aus allen 16 Ländern – jeweils eine pro länderspezifisch benannter Schulform. Eine Schulart ist eine Informationseinheit; die Rolle, die eine konkrete Schule als Schule dieser Art hat, ist die *Schulartfunktion*.

Nur **Grundschule** und **Gymnasium** gibt es unter derselben Bezeichnung in allen Ländern. Die übrigen Schularten unterscheiden sich zum Teil erheblich: Der **Mittelschule** in Bayern entsprechen etwa die **Regelschule** in Thüringen, die **Regionale Schule** in Mecklenburg-Vorpommern, die **Oberschule** in Sachsen oder die **Hauptschule** in Niedersachsen. Hamburg kennt als integrierte Schulform ausschließlich die **Stadtteilschule**, Schleswig-Holstein die **Gemeinschaftsschule**, Nordrhein-Westfalen unterscheidet zwischen **Gesamtschule** und **Sekundarschule**.

Jede Schulart ist über **von Bundesland** (`LP_0000029`) einem Land zugeordnet und hat eine länderspezifische IRI, z. B. `schulart:RP_0000002` (Integrierte Gesamtschule in Rheinland-Pfalz). Lehrpläne verweisen über **für Schulart** (`LP_0000812`) auf die Schulart, für die sie gelten.

### Schulart und Bildungsgangniveau

Über **hat Bildungsgangniveau** (`LP_0000833`) gibt jede Schulart an, welche **Bildungsgangniveaus** (`LP_0000028`) an ihr unterrichtet werden. Das Gymnasium in Bayern (`schulart:BY_0000005`) hat beispielsweise das *Gymnasialniveau Sek I (BY)* und das *Gymnasialniveau Sek II (BY)*.

Schularten, die mehrere Bildungsgänge unter einem Dach vereinen, haben entsprechend mehrere Niveaus. Die **Gemeinschaftsschule** in Sachsen (`schulart:SN_0000002`) umfasst sechs: *Grundschulniveau (SN)*, *Hauptschulbildungsgangniveau (SN)*, *Realschulbildungsgangniveau (SN)*, *Oberschulniveau (SN)*, *Gymnasialniveau Sek I (SN)* und *Gymnasialniveau Sek II (SN)*. Sie reicht damit von der Grundschule bis zur gymnasialen Oberstufe.

### Föderale Vielfalt der Bildungsgangniveaus

Wie die Schularten sind auch die Bildungsgangniveaus länderspezifisch benannt. Das Hauptschulniveau heißt etwa in Baden-Württemberg *G Niveau*, in Bayern *Mittelschulniveau* und in Rheinland-Pfalz *Grundlegendes Kompetenzniveau*. Die Ontologie übernimmt die Bezeichnungen der Länder und ordnet sie über die generischen Niveauklassen einander zu (siehe Pattern 9).

### Bedeutung für die Lehrplandaten

Auch curriculare Elemente, etwa Kompetenzerwartungen, können über **hat Bildungsgangniveau** einem oder mehreren Niveaus zugeordnet werden. So entsteht die Verknüpfung

**Schulart → hat Bildungsgangniveau ← Curriculares Element**

Darüber lässt sich ermitteln, an welchen Schularten eine Anforderung gilt, ohne dass die Schulart am curricularen Element selbst angegeben sein muss. Die Schulart liefert den institutionellen Kontext, das Bildungsgangniveau den fachlichen Anspruch.


## Pattern 5 - Jahrgangstufe/Schulstufe und Phasen der Sekundarstufe II

```ontoink
source: patterns/pattern5.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern5.ttl"
```

**Erläuterung**:

**Jahrgangsstufen** (`LP_0000009`)

Die Ontologie definiert 13 Jahrgangsstufen (`LP_2000001` bis `LP_2000013`). Sie sind länderunabhängig – Jahrgangsstufe 6 ist in jedem Land dieselbe IRI `LP_2000006`. Lehrpläne und curriculare Elemente werden über **hat Jahrgangsstufe** (`LP_0000026`) an eine oder mehrere Jahrgangsstufen gebunden. Das ist die häufigste und direkteste Zuordnung: Eine Anforderung für Jahrgangsstufe 8 trägt `hat Jahrgangsstufe → LP_2000008`.

**Schulstufe** (`LP_0000020`)

Die Schulstufe fasst mehrere Jahrgangsstufen zu einem Bildungsabschnitt zusammen und wird über **hat Schulstufe** (`LP_0000047`) vergeben:

- **Primarbereich** (`LP_0000036`) – Jahrgangsstufen 1–4 (in Berlin und Brandenburg 1–6)
- **Sekundarbereich I** (`LP_0000045`) – Jahrgangsstufen 5–9/10 (in Berlin und Brandenburg 7–10)
- **Sekundarbereich II** (`LP_0000046`) – Jahrgangsstufen (10/)11–12/13
- **Orientierungsstufe (MV)** (`LP_0000032`) – länderspezifisch für Mecklenburg-Vorpommern, Jahrgangsstufen 5 und 6

Die Schulstufe wird verwendet, wenn ein Element keiner einzelnen Jahrgangsstufe, sondern einem ganzen Bildungsabschnitt zugeordnet ist – z. B. ein Kerncurriculum, das für die gesamte Sekundarstufe I gilt.

**Oberstufenphasen**

Die Klasse **Oberstufenphase** (`LP_0000043`) gliedert die gymnasiale Oberstufe mit den Unterklassen **Einführungsphase** (`LP_0000056`) und **Qualifikationsphase** (`LP_0000057`). Zugeordnet werden die Phasen über **hat Oberstufensphase** (`LP_0000556`).

Da es achtjährige (G8) und neunjährige (G9) Gymnasien gibt, liegen die Phasen in unterschiedlichen Jahrgangsstufen. Beide Varianten sind als eigene Individuen erfasst, die ihre Jahrgangsstufen über *hat Jahrgangsstufe* angeben:

- **G8 Einführungsphase** (`LP_0000051`): Jahrgangsstufe 10
- **G8 Qualifikationsphase** (`LP_0000050`): Jahrgangsstufen 11–12
- **G9 Einführungsphase** (`LP_0000055`): Jahrgangsstufe 11
- **G9 Qualifikationsphase** (`LP_0000052`): Jahrgangsstufen 12–13


## Pattern 6 - Hierarchie der Curricularen Elemente

```ontoink
source: patterns/pattern6.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern6.ttl"
```

**Erläuterung**:

**Curriculare Elemente** (`LP_0000261`) sind die Bausteine, aus denen ein Lehrplan aufgebaut ist. Jede Informationseinheit eines Lehrplans – ein Kapitel, ein Kompetenzbereich, eine einzelne Anforderung, ein Lerninhalt – ist ein curriculares Element. Die generischen Unterklassen tragen das Präfix *CE-*:

**CE-Fragment** ist ein rein strukturgebender Bestandteil: Kapitel, Abschnitte und Überschriften, die einen Lehrplan gliedern, ohne selbst Kompetenzen oder Inhalte zu beschreiben. Jedes Land hat dafür eine eigene Klasse, z. B. *Lehrplanfragment (BY)*.

**CE-Bereich** fasst Kompetenzen und Lerninhalte unter einem gemeinsamen fachlichen Fokus zusammen und kann anderen CE-Bereichen über- oder untergeordnet sein. Die Bezeichnungen der Länder reichen von *Kompetenzbereich* über *Lernbereich*, *Leitidee* und *Themenfeld* bis *Inhaltsfeld*.

**CE-Kompetenzspezifikation** beschreibt eine konkrete Kompetenz – typischerweise als Satz mit Operator, der mit „Die Schülerinnen und Schüler …“ beginnt. Die Ontologie unterscheidet zwischen **Fachbezogener** und **Fachübergreifender Kompetenzspezifikation**. Eine Kompetenzspezifikation ist per Definition Teil eines CE-Bereichs und hat einen Titel.

**CE-Lerninhalt** benennt konkrete Themen und Gegenstände, an denen Kompetenzen erworben werden. Ein Lerninhalt ist Teil eines CE-Bereichs oder eines anderen Lerninhalts.

**CE-Hinweis** enthält ergänzende, empfehlende Informationen: methodische Anregungen, Differenzierungsvorschläge oder Vertiefungsideen. Ein Hinweis ist Teil einer Kompetenzspezifikation, eines Lerninhalts oder eines Bereichs.

**CE-Verweis** (siehe Pattern 7) stellt eine Referenz von einem Element auf ein anderes her.

**CE-Leitperspektive** beschreibt übergreifende Bildungsziele wie Nachhaltigkeit oder Medienbildung, die sich durch mehrere Fächer und Jahrgangsstufen ziehen.

**Die Teil-Ganzes-Beziehung**

Die Elemente werden über **hat direkten Teil** (`LP_0000565`) bzw. die Inverse **direkt Teil von** (`LP_0000566`) miteinander verknüpft: Ein Element verweist auf seine unmittelbar untergeordneten Elemente. Die Reihenfolge gibt **hat Position** (`LP_0000460`) an. Da *hat direkten Teil* eine Sub-Property der transitiven Relation **hat Teil** (`BFO_0000051`) ist, lassen sich daraus alle mittelbaren Teile ableiten – etwa alle Kompetenzspezifikationen eines Lehrplans, unabhängig von der Tiefe der Gliederung.

Typische Hierarchien sind:

- CE-Fragment → CE-Bereich → CE-Kompetenzspezifikation → CE-Hinweis
- CE-Fragment → CE-Bereich → CE-Bereich → CE-Kompetenzspezifikation
- CE-Fragment → CE-Bereich → CE-Lerninhalt → CE-Lerninhalt → CE-Hinweis

Ein bayerischer Lehrplan gliedert sich z. B. in Elemente der Klasse *Lernbereich (BY)* (CE-Bereich), die Elemente der Klassen *Kompetenzerwartung (BY)* (CE-Kompetenzspezifikation) und *Inhalt zu den Kompetenzen (BY)* (CE-Lerninhalt) enthalten. Ein Hamburger Bildungsplan verwendet stattdessen *Kompetenzbereich (HH)* und *Anforderung (HH)*.


## Pattern 7 - CE-Verweis

```ontoink
source: patterns/pattern7.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern7.ttl"
```

**Erläuterung**:

Ein **CE-Verweis** (`LP_0030065`) ist ein curriculares Element, das einen Bezug von einem Element auf ein anderes oder auf eine externe Ressource herstellt. Der CE-Verweis ist nicht das Ziel selbst, sondern die Referenz darauf: Das Ausgangselement trägt den Verweis über **hat Verweis** (`LP_0030071`), der Verweis zeigt über **verweist auf** (`LP_0030072`) auf das Ziel und kann eine eigene Beschreibung haben.

Ein Verweis kann zeigen

- **innerhalb desselben Lehrplans**, z. B. von einem Kompetenzbereich auf einen anderen („siehe auch Lernbereich 3“),
- **in einen anderen Lehrplan**, z. B. fächerverbindend vom Deutsch- auf den Geschichtslehrplan,
- **auf externe Ressourcen**, z. B. Bildungsstandards der KMK oder Materialien.

In den Lehrplandaten treten Verweise als länderspezifische Klassen auf – in rc6 sind es 47, z. B. *Verweis auf standardillustrierende Aufgaben (BE)*, *Verweis auf vernetzte Kompetenzen (BE)* oder *Verweis auf Lernbereich des gleichen Faches einer anderen Klassenstufe (SN)*. Sie tragen die *Verweisbeschreibungsfunktion* und werden dadurch als Unterklassen von *CE-Verweis* abgeleitet (siehe Pattern 8); im Beispiel ist diese abgeleitete Unterklassenbeziehung direkt eingezeichnet.

Da Querverweise nicht als Freitext, sondern als typisierte Elemente modelliert sind, lassen sie sich auswerten: Welche Kompetenzbereiche sind miteinander verknüpft? Wie dicht ist ein Lehrplan intern vernetzt? Welche Fächer verweisen aufeinander?

**Provenienz von Verweisen**

Verweise stammen nicht immer aus dem Lehrplandokument selbst. Sie können auch nachträglich ergänzt werden, etwa durch ein KI-System (KI: Künstliche Intelligenz), das inhaltlich verwandte Elemente automatisch ermittelt, oder durch eine Redaktion, die Bezüge manuell festlegt. Für die Bewertung und Pflege solcher Verweise ist es wichtig festzuhalten, woher sie stammen.

Dies lässt sich mit den Mitteln von Basic Formal Ontology (BFO) und der Relation Ontology (RO) abbilden, die die Lehrplan-Ontologie bereits nachnutzt: Ein CE-Verweis ist der Output eines Prozesses (`BFO_0000015`, *process*), über **output of** (`RO_0002353`) bzw. invers **has output** (`RO_0002234`). An diesem Prozess nimmt über **has participant** (`RO_0000057`) der Akteur teil, der den Verweis erzeugt hat: eine *Person* (`LP_0000010`) oder ein technisches System, auf dem ein KI-Verfahren ausgeführt wird.

```turtle
@prefix ex:             <https://www.example.org/> .
@prefix CE_Verweis:     <https://w3id.org/lehrplan/ontology/LP_0030065> .
@prefix Person:         <https://w3id.org/lehrplan/ontology/LP_0000010> .
@prefix Process:        <http://purl.obolibrary.org/obo/BFO_0000015> .
@prefix Object:         <http://purl.obolibrary.org/obo/BFO_0000030> .
@prefix output_of:      <http://purl.obolibrary.org/obo/RO_0002353> .
@prefix hat_teilnehmer: <http://purl.obolibrary.org/obo/RO_0000057> .

# automatisch durch ein KI-System ermittelter Verweis
ex:verweis_2 a CE_Verweis: ;
             output_of: ex:zuordnung_1 .
ex:zuordnung_1 a Process: ;
             hat_teilnehmer: ex:ki_system_1 .
ex:ki_system_1 a Object: .

# von einer Person angegebener Verweis
ex:verweis_3 a CE_Verweis: ;
             output_of: ex:zuordnung_2 .
ex:zuordnung_2 a Process: ;
             hat_teilnehmer: ex:redakteurin_1 .
ex:redakteurin_1 a Person: .
```

Auf dieser Grundlage lassen sich Verweise aus dem Lehrplan selbst von nachträglich ergänzten unterscheiden, automatisch ermittelte Verweise vor ihrer Übernahme prüfen und bei Bedarf gezielt filtern.

Die Lehrplan-Ontologie enthält in der Version rc6 noch keine spezifischen Klassen für solche Prozesse. Für eine einfache Unterscheidung in den Daten bieten sich eigene Unterklassen von *process* an, etwa für automatische und redaktionelle Zuordnungen. Ebenso offen ist, wie Zeitpunkt und Verlässlichkeit einer automatischen Zuordnung, etwa ein Konfidenzwert, angegeben werden.


## Pattern 8 - Funktionen

```ontoink
source: patterns/pattern8.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern8.ttl"
```

**Erläuterung**:

**Das Problem: Viele Namen, eine Bedeutung**

Die Länder haben ihre Lehrpläne sehr unterschiedlich aufgebaut und verwenden eigene Begriffe. Was in Bayern *Lernbereich* heißt, heißt in Hamburg *Kompetenzbereich*, in Rheinland-Pfalz etwa *Kompetenzbereich*, *Leitidee* oder *Thema* und in Sachsen ebenfalls *Lernbereich*. Ohne einen Zuordnungsmechanismus müsste man für eine bundesweite Abfrage jede der über 400 länderspezifischen Klassen kennen.

**Die Lösung: Funktionsspezifikationen**

Jede länderspezifische Klasse ist in rc6 als Unterklasse einer Schnittmenge definiert: aus dem *Element (XX)* ihres Landes und einer festen Funktion, die über **hat Funktion** (`LP_0000483`) auf ein Individuum der Klasse **Funktionsspezifikation** (`LP_0000478`) verweist. Es gibt drei Arten von Funktionen:

Die **Strukturierungsfunktion** (`LP_0000482`) beschreibt, wie ein Element den Lehrplan gliedert:

- **Fragmentfunktion** – rein strukturierender Bestandteil (Kapitel, Abschnitt). Diese Funktion tragen die 16 Klassen *Lehrplanfragment (XX)*.
- **Bereichsfunktion** – Gliederung in fachlich zusammenhängende Bereiche. 119 Klassen tragen diese Funktion, darunter *Kompetenzbereich (HH)*, *Lernbereich (BY)*, *Leitidee (BE)* und *Inhaltsfeld (HE)*.

Die **Beschreibungsfunktion** (`LP_0000493`) beschreibt, was ein Element inhaltlich leistet:

- **Kompetenzbeschreibungsfunktion** – formuliert eine zu erwerbende Kompetenz, z. B. *Anforderung (HH)*, *Kompetenzerwartung (BY)*, *Kompetenz (RP)*, *Standard (BE)* → CE-Kompetenzspezifikation
- **Lerninhaltsbeschreibungsfunktion** – benennt einen Lerngegenstand → CE-Lerninhalt
- **Hinweisbeschreibungsfunktion** – enthält einen methodischen oder didaktischen Hinweis, z. B. *Bemerkung (SN)*, *Hinweis und Anregung (MV)* → CE-Hinweis
- **Verweisbeschreibungsfunktion** – verweist auf ein anderes Element → CE-Verweis
- **Leitperspektivenbeschreibungsfunktion** – beschreibt eine übergreifende Leitperspektive → CE-Leitperspektive
- **Materialbeschreibungsfunktion** – beschreibt Lern- oder Zusatzmaterial, z. B. *Lernmaterial (BE)*

Die **Bezugsfunktion** (`LP_0000499`) gibt zusätzlich an, worauf sich ein Element inhaltlich bezieht. Sie kommt immer in Verbindung mit einer der anderen Funktionen vor:

- **Prozessbezugsfunktion** – prozessbezogene Kompetenzen (wie gelernt oder gehandelt wird), z. B. *Prozessbezogene Kompetenz (NI)*
- **Inhaltsbezugsfunktion** – inhaltsbezogene Kompetenzen (was gelernt wird), z. B. *Leitidee (BW)*
- **Domänenbezugsfunktion** – Bezug auf eine fachliche Domäne

Daneben enthält die Klasse *Funktionsspezifikation* die Individuen **Verbindlich** und **Optional**.

**Wie die Zuordnung technisch funktioniert**

```turtle
@prefix rdfs:                 <http://www.w3.org/2000/01/rdf-schema#> .
@prefix owl:                  <http://www.w3.org/2002/07/owl#> .
@prefix Lernbereich_BY:       <https://w3id.org/lehrplan/ontology/LP_0002046> .
@prefix Element_BY:           <https://w3id.org/lehrplan/ontology/LP_0000434> .
@prefix CE_Bereich:           <https://w3id.org/lehrplan/ontology/LP_0000349> .
@prefix Curriculares_Element: <https://w3id.org/lehrplan/ontology/LP_0000261> .
@prefix hat_funktion:         <https://w3id.org/lehrplan/ontology/LP_0000483> .
@prefix bereichsfunktion:     <https://w3id.org/lehrplan/ontology/LP_0000497> .

Lernbereich_BY:
  rdfs:subClassOf [
    owl:intersectionOf (
      Element_BY:
      [ owl:onProperty hat_funktion: ;
        owl:hasValue   bereichsfunktion: ]
    )
  ] .

CE_Bereich:
  owl:equivalentClass [
    owl:intersectionOf (
      Curriculares_Element:
      [ owl:onProperty hat_funktion: ;
        owl:hasValue   bereichsfunktion: ]
    )
  ] .
```

Jede Instanz von *Lernbereich (BY)* hat damit automatisch die Bereichsfunktion – ohne dass in den Lehrplandaten ein expliziter *hat Funktion*-Tripel stehen muss. Da *CE-Bereich* als genau diese Kombination definiert ist, ordnet ein Reasoner *Lernbereich (BY)* als Unterklasse von *CE-Bereich* ein.

Für *CE-Kompetenzspezifikation*, *CE-Lerninhalt* und *CE-Hinweis* verlangt die Definition zusätzlich eine Einbettung in die Gliederung (siehe Pattern 6). Diese Klassen werden daher nicht auf Klassenebene, sondern für jedes einzelne Element in den Daten abgeleitet. Das Beispiel zeigt das Ergebnis: Das Element ist zugleich *Kompetenzerwartung (NW)* und *CE-Kompetenzspezifikation* und trägt die Kompetenzbeschreibungsfunktion.

**Was das für Abfragen bedeutet**

Im SPARQL-Endpunkt (SPARQL: SPARQL Protocol and RDF Query Language) liegen die vom Reasoner abgeleiteten Tripel in eigenen Graphen vor (siehe [SPARQL-Abfragen](sparql.md)). Damit kann man bundesweit abfragen, ohne die länderspezifischen Klassen zu kennen:

- *„Alle Kompetenzbereiche aus allen Ländern“* → alle Instanzen von *CE-Bereich* bzw. mit *hat Funktion* → *Bereichsfunktion*
- *„Alle Anforderungen aus dem Hamburger Deutschlehrplan“* → alle Instanzen mit *hat Funktion* → *Kompetenzbeschreibungsfunktion*, gefiltert auf Hamburg
- *„Alle Hinweise“* → alle Instanzen mit *hat Funktion* → *Hinweisbeschreibungsfunktion*

Die Funktionsspezifikationen sind damit die zentrale Brücke zwischen der Terminologie der Länder und einer einheitlichen, bundesweiten Semantik.


## Pattern 9 - Niveaus

```ontoink
source: patterns/pattern9.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern9.ttl"
```

**Erläuterung**:

**Niveau** (`LP_0000037`) ist die Oberklasse aller Leistungs- und Anforderungsstufen. Sie gliedert sich in vier Unterklassen.

Das **Bildungsgangniveau** (`LP_0000028`) beschreibt den Leistungsanspruch, mit dem Inhalte und Kompetenzen für eine bestimmte Lerngruppe formuliert sind – und damit, auf welchen Schulabschluss hin unterrichtet wird. Es gibt fünf generische Niveauklassen: **Grundschulniveau**, **Hauptschulniveau**, **Realschulniveau**, **Gymnasialniveau Sek I** und **Gymnasialniveau Sek II**. Für jedes Land gibt es außerdem eine Klasse *Bildungsgangniveau (XX)*, definiert als Bildungsgangniveau mit *von Bundesland* = XX. Die konkreten Niveaus der Länder sind Individuen, die einer oder mehreren generischen Klassen und der Klasse ihres Landes angehören.

Die Namen variieren erheblich: Das Hauptschulniveau heißt in Bayern *Mittelschulniveau*, in Hamburg *Mindestanforderungen*; das *Regelschulniveau (TH)* und das *Sekundarstufenniveau (SH)* decken mehrere Niveaus zugleich ab. Das Gymnasialniveau Sek I heißt in Bremen *Erweitertes Anforderungsniveau*, in Rheinland-Pfalz *Erhöhtes Kompetenzniveau* und in Nordrhein-Westfalen *Erweiterungskurs*. Berlin und Brandenburg differenzieren nach Abschluss und Niveaustufe, z. B. *MSA A–G* für den mittleren Schulabschluss (MSA) oder *Gymnasialniveau Sek I A–H* (siehe Pattern 11).

Das **Fachniveau Sek II** (`LP_0000265`) beschreibt den Kurstyp in der gymnasialen Oberstufe. Es hat die generischen Unterklassen **Grundkursniveau** und **Leistungskursniveau**. Die Kursarten der Länder sind Individuen dieser Klassen und der Klasse *Fachniveau Sek II (XX)* ihres Landes, z. B. *Grundlegendes Anforderungsniveau (ST)* oder *Leistungskursfach (BB)*.

Der **Anforderungsbereich** (`LP_0000802`) stammt aus den KMK-Bildungsstandards und klassifiziert den kognitiven Anspruch einer Aufgabe oder Kompetenz. Die drei Individuen sind **Anforderungsbereich 1 (Reproduktion)**, **Anforderungsbereich 2 (Reorganisation und Transfer)** und **Anforderungsbereich 3 (Reflexion und Problemlösung)**. Anders als Bildungsgang- und Fachniveaus beschreibt er nicht organisatorische Rahmenbedingungen, sondern die kognitive Tiefe eines Lernziels – unabhängig von Schulart oder Land.

Das **Fremdsprachenniveau** (`LP_0010001`) bildet die sechs Stufen des **Gemeinsamen Europäischen Referenzrahmens für Sprachen (GER)** ab, von *A1 Anfänger* (`LP_0030317`) bis *C2 Annähernd muttersprachliche Kenntnisse* (`LP_0030313`). Diese Niveaus sind bundeseinheitlich und ermöglichen es, Lehrplanelemente aus Fremdsprachenfächern mit dem GER zu verknüpfen.


## Pattern 10 - Bildungsgangniveaus, Bildungsgänge und Abschlüsse

```ontoink
source: patterns/pattern10.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern10.ttl"
```

**Erläuterung**:

Bildungsgänge, Bildungsgangniveaus und Abschlüsse beschreiben gemeinsam den Rahmen, in dem Lehrplaninhalte gelten: auf welchem Anspruchsniveau gelernt wird und worauf die Laufbahn abzielt. Wie überall in der Ontologie wird dabei zwischen der realen Entität und der Informationseinheit unterschieden, die sie beschreibt.

**Bildungsgangspezifikation** (`LP_0000816`) beschreibt eine schulische Laufbahn, die zu einem bestimmten Abschluss führt. Die drei generischen Unterklassen *Gymnasialer Bildungsgang*, *Realschulbildungsgang* und *Hauptschulbildungsgang* sind über ihr Bildungsgangniveau definiert – ein *Realschulbildungsgang* ist genau eine Bildungsgangspezifikation mit Realschulniveau. Der **Bildungsgang** (`LP_0000567`) selbst ist der Prozess, den eine Person gemäß dieser Spezifikation durchläuft. Ein Bildungsgang ist nicht dasselbe wie eine Schulart: Der gymnasiale Bildungsgang kann auch an einer Gesamt- oder Gemeinschaftsschule durchlaufen werden.

**Bildungsgangniveau** (`LP_0000028`) beschreibt den Leistungsanspruch innerhalb eines Bildungsgangs (siehe Pattern 9). In den Lehrplandaten wird es über **hat Bildungsgangniveau** (`LP_0000833`) an Lehrpläne und einzelne Elemente gehängt, um anzugeben, für welche Lerngruppe eine Kompetenz gilt.

**Schulabschlussspezifikation** (`LP_0000019`) beschreibt einen Schulabschluss und die Anforderungen für seine Verleihung. Die generischen Unterklassen sind über das benötigte Niveau definiert:

- **Erster Schulabschluss** – *benötigt Niveau* some Hauptschulniveau
- **Mittlerer Schulabschluss** – *benötigt Niveau* some Realschulniveau
- **Allgemeine Hochschulreife** – *benötigt Niveau* some Gymnasialniveau Sek II

Für jedes Land gibt es Unterklassen wie *Mittlerer Abschluss (RP)*, deren Individuen die konkreten Abschlüsse sind, z. B. *Qualifizierter Sekundarabschluss I (RP)*. Der **Schulabschluss** (`LP_0000008`) selbst ist die Rolle, die eine Person mit dem Erwerb erhält. Eine Bildungsgangspezifikation verweist über **ermöglicht Abschluss** (`LP_0000021`) auf die erreichbare Schulabschlussspezifikation.

Die Konzepte bilden eine Kette:

```text
Realschulbildungsgang
   ──[hat Bildungsgangniveau]──▶ Realschulniveau
   ──[ermöglicht Abschluss]────▶ Mittlerer Schulabschluss
                                    ──[benötigt Niveau]──▶ Realschulniveau
```

Im Beispiel ist das benötigte Niveau direkt am rheinland-pfälzischen Abschluss angegeben. In rc6 ist es als Klassenaxiom an *Mittlerer Schulabschluss* festgelegt und gilt damit für alle mittleren Abschlüsse.

Für Lehrplandaten bedeutet das: Eine Kompetenzspezifikation mit `hat Bildungsgangniveau → Gymnasialniveau Sek I` gilt für Lernende im gymnasialen Bildungsgang der Sekundarstufe I – unabhängig davon, ob sie ein Gymnasium oder eine Gesamtschule besuchen.


## Pattern 11 - Niveaustufen BE/BB

```ontoink
source: patterns/pattern11.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern11.ttl"
```

**Erläuterung**:

Berlin und Brandenburg arbeiten mit gemeinsamen Rahmenlehrplänen. Diese strukturieren Kompetenzen nicht primär nach Jahrgangsstufen, sondern entlang von acht **Niveaustufen A bis H**, die unterschiedliche Grade der Kompetenzentwicklung abbilden. In der Ontologie sind sie Individuen der Klasse **Niveaustufe BE/BB** (`LP_0000443`).

Kompetenzspezifikationen, z. B. *Standard (BE)*, werden über **hat Niveaustufe** (`LP_0000578`) einer Niveaustufe zugeordnet; die Inverse ist **ist Niveaustufe von** (`LP_0000580`). Die Niveaustufe allein reicht für die Vergleichbarkeit aber nicht aus, denn eine Kompetenz ist immer im Kontext des angestrebten Abschlusses zu lesen.

Die Konkretisierung erfolgt daher über **Bildungsgangniveaus**, die Niveaustufe und Abschluss kombinieren: In Berlin gibt es je Abschlusstyp eine Reihe von Niveaus – *BOA A–E*, *BBR A–F*, *EBBR A–G*, *MSA A–G* und *Gymnasialniveau Sek I A–H* –, in Brandenburg entsprechend *EBR A–G*, *FOR A–G* und *FOR-Q A–H*. Die Kürzel bezeichnen die angestrebten Abschlüsse: in Berlin den berufsorientierenden Abschluss (BOA), die Berufsbildungsreife (BBR), die erweiterte Berufsbildungsreife (EBBR) und den mittleren Schulabschluss (MSA), in Brandenburg die erweiterte Berufsbildungsreife (EBR), die Fachoberschulreife (FOR) und die Fachoberschulreife mit Berechtigung zum Besuch der gymnasialen Oberstufe (FOR-Q). Jedes dieser Niveaus verweist über **ist Niveau von** (`LP_0000086`) auf seine Niveaustufe; umgekehrt hat die Niveaustufe über **hat Niveau** (`LP_0000840`) alle zugehörigen Niveaus. Die Niveaus sind Individuen von Klassen wie *MSA Niveau*, die als Bildungsgangniveau des Landes und zugleich als generisches Niveau definiert sind (*MSA Niveau* als Realschulniveau in Berlin).

Damit die BE/BB-Niveaus mit den anderen Ländern vergleichbar sind, trägt jedes Niveau über **hat Jahrgangsstufe** (`LP_0000026`) die Jahrgangsstufen, in denen es typischerweise erreicht wird. Die Zuordnung ist bewusst überlappend, weil der Rahmenlehrplan individuelle Lernentwicklungen statt starrer Grenzen vorsieht. Über alle Abschlusstypen hinweg ergeben sich in rc6 folgende Spannen:

| Niveaustufe | Jahrgangsstufen |
|-------------|-----------------|
| A           | 1–2             |
| B           | 1–3             |
| C           | 2–7             |
| D           | 4–9             |
| E           | 6–10            |
| F           | 7–10            |
| G           | 9–10            |
| H           | 10              |

Die genauen Jahrgangsstufen hängen vom Abschlusstyp ab; *MSA E* liegt beispielsweise in den Jahrgangsstufen 6–8.

Zusammengefasst: Der Rahmenlehrplan BE/BB verknüpft **Kompetenzspezifikationen** mit **Niveaustufen**. Aus der Kombination von Niveaustufe und angestrebtem Abschluss ergibt sich das Bildungsgangniveau, über das wiederum die Jahrgangsstufen ermittelt werden können. Die Vergleichbarkeit mit den anderen Ländern beruht auf zwei Mechanismen:

1. **Generische Bildungsgangniveaus**: Die abschlussspezifischen Niveaus (z. B. *MSA*) gehören den generischen Niveauklassen an (z. B. *Realschulniveau*).
2. **Gemeinsame Jahrgangsstufen**: Da alle Länder dieselben Jahrgangsstufen-IRIs verwenden, lassen sich Anforderungen bundesweit vergleichen.


## Pattern 12 - Zeitangaben

```ontoink
source: patterns/pattern12.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern12.ttl"
```

**Erläuterung**:

Zeitangaben verankern Lehrplanelemente nicht nur inhaltlich, sondern auch zeitlich – z. B. die Zahl der Unterrichtsstunden, die für einen Lernbereich vorgesehen ist.

Die **Zeitspezifikation** (`LP_0000508`) bündelt eine Zeitangabe aus Wert und Einheit, z. B. „6 Unterrichtsstunden“ oder „45 Minuten“. Sie ist ein *data item* (`IAO_0000027`) aus der Information Artifact Ontology, also eine Informationseinheit, die einen Messwert trägt. Laut Definition hat jede Zeitspezifikation einen dezimalen Wert über **hat Wert** (`LP_0000344`) und eine Einheit über **hat Einheit** (`qudt:hasUnit`).

Die Einheiten sind Individuen der Klasse **Unit** aus dem Vokabular **Quantities, Units, Dimensions and Types (QUDT)**. Zur Verfügung stehen *Stunde* (`qudt:HR`), *Minute* (`qudt:MIN`) und die eigene Einheit *Unterrichtsstunde* (`LP_0000535`).

Ein curriculares Element verweist über **wird beschrieben von** (`LP_0000024`) auf seine Zeitspezifikation.

```text
Zeitspezifikation
  ├─[hat Wert]────▶ 6                    (xsd:decimal)
  └─[hat Einheit]─▶ Unterrichtsstunde    (qudt:Unit)
```

Statt Freitext wie *„ca. 6 Stunden“* werden Wert und Einheit getrennt maschinenlesbar erfasst. Das ermöglicht Auswertungen, z. B. die Summe der Unterrichtsstunden eines Lehrplans oder den Vergleich von Zeitvorgaben zwischen Ländern.


## Pattern 13 - Gültigkeitsbereich

```ontoink
source: patterns/pattern13.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern13.ttl"
```

**Erläuterung**:

Lehrpläne gelten für einen bestimmten Zeitraum: Sie treten zu einem Schuljahr in Kraft und werden später durch neue Fassungen abgelöst. Für diese Angaben stehen zwei Mechanismen zur Verfügung:

- **veröffentlicht am** (`LP_0000553`) gibt das Veröffentlichungsdatum eines Lehrplans an.
- **hat Gültigkeitsbereich** (`LP_0000550`) verweist auf einen **Gültigkeitsbereich** (`LP_0000547`), der den zeitlichen Geltungsbereich beschreibt. Er trägt über **von Datum** (`LP_0000548`) und **bis Datum** (`LP_0000549`) Beginn und Ende der Gültigkeit.

Alle Datumsangaben haben den Datentyp `xsd:dateTimeStamp` und sind Sub-Properties von *hat Wert*.

Ein Gültigkeitsbereich ist eine eigenständige Informationseinheit und kann daher von mehreren Lehrplänen gemeinsam genutzt werden. Das ist der Regelfall, wenn ein Land die Lehrpläne mehrerer Fächer oder Jahrgangsstufen zum selben Termin in Kraft setzt. Im Beispiel verweisen die Lehrpläne für Deutsch und Mathematik auf denselben Gültigkeitsbereich. Ändert sich der Zeitraum, etwa weil eine Übergangsfrist verlängert wird, genügt eine Anpassung an einer Stelle.

!!! note "Noch nicht in den Lehrplandaten"

    Die Klassen und Properties sind in rc6 angelegt, werden in den Lehrplandaten aber noch nicht verwendet.


## Pattern 14 - Der Lernprozess

```ontoink
source: patterns/pattern14.ttl
namespaces: false
```

**RDF Daten**:

```text
--8<-- "docs/patterns/pattern14.ttl"
```

**Erläuterung**:

Die bisherigen Patterns beschreiben Lehrpläne als Informationseinheiten: Sie legen fest, welche Kompetenzen erworben werden sollen. Dieses Pattern zeigt, wie sich der tatsächliche Unterricht und das Lernen einzelner Personen damit verbinden lassen. Es greift die Unterscheidung zwischen realweltlichen Entitäten und den Informationseinheiten auf, die sie beschreiben (siehe [Ontologisches Grundverständnis](structure.md#ontologisches-grundverstandnis)).

**Personen und Rollen**

Schülerinnen und Schüler sowie Lehrkräfte sind Instanzen der Klasse **Person** (`LP_0000010`). Ihre Funktion im Unterricht ist keine eigene Art von Person, sondern eine Rolle, die eine Person trägt: die **Schüler Rolle** (`LP_0000012`) bzw. die **Lehrer Rolle** (`LP_0000011`). Verbunden werden Person und Rolle über **has role** (`RO_0000087`). Dieselbe Person kann so im Lauf der Zeit unterschiedliche Rollen einnehmen.

**Lehrprozess und Lernprozess**

Der **Lehrprozess** (`LP_0000006`) ist ein geplanter Prozess, an dem Personen in der Rolle von Lehrkräften und Lernenden teilnehmen, etwa eine Unterrichtsstunde. Der **Lernprozess** (`LP_0000007`) findet dagegen in der lernenden Person selbst statt; das wird über **occurs in** (`BFO_0000066`) ausgedrückt. Er kann durch einen Lehrprozess angestoßen werden, ist mit ihm aber nicht identisch: Nicht jeder Unterricht führt zum Lernen, und Lernen findet auch außerhalb des Unterrichts statt. An beiden Prozessen nehmen Personen über **has participant** (`RO_0000057`) teil. Die Relation *occurs in* ist in rc6 noch nicht enthalten und muss für dieses Pattern aus BFO bzw. der Relation Ontology in die Lehrplan-Ontologie übernommen werden.

**Kompetenz als Ergebnis**

Das Ergebnis eines erfolgreichen Lernprozesses ist eine **Kompetenz** (`LP_0000013`). Sie ist eine Eigenschaft der lernenden Person, keine Information: Die Person trägt sie über **has characteristic** (`RO_0000053`). Im Beispiel ist die Kompetenz über **has output** (`RO_0002234`) als Ergebnis des Lernprozesses angegeben. Die Verbindung zum Lehrplan stellt **wird beschrieben von** (`LP_0000024`) her: Die Kompetenz einer konkreten Person wird von einer *CE-Kompetenzspezifikation* im Lehrplan beschrieben, etwa einer Kompetenzerwartung. Laut Definition in rc6 wird jede Kompetenz von mindestens einer Kompetenzspezifikation beschrieben.

**Einbettung in den Bildungsgang**

Der Unterricht ist über **ist Teil von** (`BFO_0000050`) Teil eines **Bildungsgangs** (`LP_0000567`), also der schulischen Laufbahn, die eine Person durchläuft. Der Lernprozess ist dagegen nicht Teil des Bildungsgangs: Er findet in der lernenden Person statt und ist nicht an den organisatorischen Rahmen der Schullaufbahn gebunden. Der Bildungsgang wird von einer *Bildungsgangspezifikation* beschrieben, im Beispiel einem *Realschulbildungsgang* (siehe [Pattern 10](#pattern-10-bildungsgangniveaus-bildungsgange-und-abschlusse)).

```text
Lehrplan ──[hat Teil]──▶ CE-Kompetenzspezifikation
                                  ▲
                      [wird beschrieben von]
                                  │
Person ──[has characteristic]──▶ Kompetenz ◀──[has output]── Lernprozess
```

!!! note "Noch nicht in den Lehrplandaten"

    Die Klassen und Relationen dieses Patterns sind in rc6 angelegt, werden in den Lehrplandaten aber nicht verwendet: Die Lehrplandaten beschreiben Vorgaben, nicht den tatsächlichen Unterricht. Das Pattern zeigt, wie Daten über Unterricht, Lernstände oder Bildungsverläufe, etwa aus Lernplattformen, an die Lehrplandaten angebunden werden können. Personenbezogene Daten unterliegen dabei den Anforderungen des Datenschutzes.


## Ausblick auf die folgenden Kapitel

Die Patterns haben an konkreten Beispielen gezeigt, wie Lehrpläne, curriculare Elemente, Bildungskontext, Niveaus, Verweise und Zeitangaben modelliert werden und wie sich der tatsächliche Unterricht daran anbinden lässt. Die folgenden Kapitel zeigen, wie mit den so modellierten Daten gearbeitet wird:

- Das Kapitel [SPARQL-Abfragen](sparql.md) zeigt, wie sich die Lehrplandaten abfragen lassen, vom Auflisten der Lehrpläne eines Landes über die Suche nach Begriffen bis zur Auswertung der Struktur eines Lehrplans.
- Das Kapitel [Verwendung](usage.md) beschreibt die verfügbaren Release-Dateien, den Zugriff auf die Daten und ihre Validierung mit SHACL-Shapes, die auf den hier beschriebenen Patterns beruhen.
