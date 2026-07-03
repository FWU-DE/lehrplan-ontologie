# Patterns

Bei der Entwicklung und Nutzung von Ontologien spielen **Patterns (Anwendungsmuster)** eine entscheidende Rolle bei der Bewältigung wiederkehrender Modellierungsanforderungen. Diese Muster bieten standardisierte, wiederverwendbare semantische Bausteine, die eine konsistente Darstellung der Beziehungen zwischen Instanzen und Entitäten ermöglichen. Darüber hinaus können solche Muster zur Erstellung von SHACL-Shapes verwendet werden, um Einschränkungen in eine Wissensrepräsentation einzubinden. Durch die Befolgung von Anwendungsmustern können Ontologie-Anwender und -Entwickler Einheitlichkeit, Klarheit und Wiederverwendbarkeit in ihren Modellen gewährleisten.

Die folgenden Abschnitte veranschaulichen, wie diese Muster gelesen und angewendet werden. Jedes Muster enthält eine Visualisierung, eine Erläuterung und die RDF Daten.


## Pattern 1 - Lehrplan eines Bundeslandes

```ontoink
source: patterns/pattern1.ttl
namespaces: false
```


**RDF Daten**:
```text
--8<-- "docs/patterns/pattern1.ttl"
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

**Weitere Informationen**

- **hat Titel** (`LP_0030056`) → der offizielle Titel des Dokuments als Titel-Individuum
- **hat Beschreibung** (`LP_0030051`) → ein erläuternder Beschreibungstext als Individuum
- **uri** (`LP_0000463`) → der kanonische URL zum Originaldokument beim Herausgeber, z.B. auf dem Schulportal des Bundeslandes


## Pattern 2 - Titel, Beschreibung und Identifikationsnummer

```ontoink
source: patterns/pattern2.ttl
namespaces: false
```
**RDF Daten**:
```text
--8<-- "docs/patterns/pattern2.ttl"
```

**Erläuterung**:

**Titel** (`LP_0000346`) – Property: **hat Titel** (`LP_0030056`)

Ein Titel-Individuum trägt die offizielle Bezeichnung eines Elements – also den Namen, wie er im gedruckten oder digitalen Lehrplan erscheint. Dabei gilt: Der `Titel` ist nicht identisch mit dem `rdfs:label` des Elements. Das `rdfs:label` ist eine technische Beschriftung für die Ontologie; der `Titel` ist das Pendant zum originalen Dokumenttext.

`hat Titel` hat keinen deklarierten Domain-Constraint – es kann sowohl an Lehrplänen (dann trägt es den offiziellen Dokumenttitel, z.B. *"Lehrplan Plus Gymnasium Bayern – Deutsch"*) als auch an einzelnen Curricularen Elementen hängen. 

**Beschreibung** (`LP_0030003`) – Property: **hat Beschreibung** (`LP_0030051`)

Die Beschreibung trägt längere, erläuternde Texte. Das können sein: Erläuterungen zu Kompetenzbereichen, methodische Hinweise und Anregungen, didaktische Kommentare, Konkretisierungsbeispiele, Literaturhinweise, Kontextinformationen oder Freitexte zum Bildungsauftrag oder den allgemeinen Fachzielen.

Im Gegensatz zu `hat Titel` hat `hat Beschreibung` die **Domain** `Curriculares Element` – es wird also ausschließlich an CE-Elementen verwendet, nicht direkt am Lehrplan-Individuum. 

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
Jedes **Curriculare Element** trägt einen `Titel`, aber nicht zwingend eine `Beschreibung` oder eine `Identifikationsnummer`. 


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

Das Beispiel zeigt zwei Lehrpläne, denen ein Schulfach, bzw. ein Schulfachbezug zugeordnet sind. 

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

```ontoink
source: patterns/pattern4.ttl
namespaces: false
```

**RDF Daten**:
```text
--8<-- "docs/patterns/pattern4.ttl"
```

**Erläuterung**:

**Schulart** (LP_0000111) bezeichnet den institutionellen Typ einer Schule. Die Schulart-Ontologie umfasst 89 Schulart-Individuen aus allen 16 Bundesländern – jeweils eines für jede länderspezifisch benannte Schulform.

Nur **Grundschule** und **Gymnasium** kommen unter derselben Bezeichnung in allen Bundesländern vor. Alle anderen Schularten unterscheiden sich zum Teil erheblich. So entspricht beispielsweise die **Mittelschule** in Bayern der **Regelschule** in Thüringen, der **Regionalen Schule** in Mecklenburg-Vorpommern, der **Oberschule** in Sachsen oder der **Hauptschule** in Niedersachsen. Auch bei den Gesamtschulen zeigen sich deutliche Unterschiede: Hamburg kennt ausschließlich die **Stadtteilschule**, Schleswig-Holstein die **Gemeinschaftsschule**, Nordrhein-Westfalen unterscheidet zwischen **Gesamtschule** und **Sekundarschule**.

Jedes Schulart-Individuum ist über **von Bundesland** (LP_0000029) genau einem Bundesland zugeordnet und besitzt einen länderspezifischen IRI, beispielsweise `schulart:RP_0000002`. Damit bildet die Schulart den institutionellen Einstiegspunkt in die Lehrplandaten: Jeder Lehrplan verweist über **für Schulart** (LP_0000812) auf genau eine Schulart.

### Schulart und Bildungsgangniveau

Die Verbindung zwischen einer Schulart und den Leistungsniveaus erfolgt über die Property **hat Bildungsgangniveau** (LP_0000833). Jede Schulart deklariert damit explizit, welche **Bildungsgangniveaus** (LP_0000028) an ihr vorkommen . Dadurch können Lehrplanelemente nicht nur einer Schulart, sondern auch einem konkreten Anspruchsniveau zugeordnet werden.

An einer **Einheitsschule** wie dem Gymnasium gibt es in der Regel ein Niveau pro Schulstufe. Ein Gymnasium in Bayern besitzt beispielsweise das **Gymnasialniveau Sek I (BY)** sowie das **Gymnasialniveau Sek II (BY)**.

Anders verhält es sich bei Schularten, die mehrere Bildungsgänge unter einem Dach vereinen. Sie können gleichzeitig mehrere Bildungsgangniveaus besitzen, da Schülerinnen und Schüler dort unterschiedliche Abschlüsse anstreben. Ein Beispiel ist die **Gemeinschaftsschule Sachsen**, die fünf Bildungsgangniveaus umfasst: **Grundschulniveau (SN)**, **Hauptschulbildungsgangniveau (SN)**, **Oberschulniveau (SN)**, **Realschulbildungsgangniveau (SN)** und **Gymnasialniveau Sek I (SN)**. Sie integriert damit alle Bildungsgänge von Klasse 1 bis 10.

### Föderale Vielfalt der Bildungsgangniveaus

Wie die Schularten selbst sind auch die Bildungsgangniveaus landesspezifisch benannt. Inhaltlich vergleichbare Niveaus tragen je nach Bundesland unterschiedliche Bezeichnungen. So heißt das Hauptschulniveau beispielsweise in Baden-Württemberg **G-Niveau**, in Bayern **Mittelschulniveau** und in Rheinland-Pfalz **Grundlegendes Kompetenzniveau**.

Die Ontologie bildet diese föderale Vielfalt bewusst ab. Statt bundesweit einheitliche Begriffe einzuführen, werden die in den jeweiligen Lehrplänen verwendeten Bezeichnungen übernommen.

### Bedeutung für die Lehrplandaten

Auch curriculare Elemente, beispielsweise Kompetenzerwartungen, können über **hat Bildungsgangniveau (LP_0000833)** einem oder mehreren Bildungsgangniveaus zugeordnet werden. Dadurch entsteht die Verknüpfung

**Schulart → hat Bildungsgangniveau ← Curriculares Element.**

Über diese gemeinsame Zuordnung lässt sich ermitteln, an welchen Schularten eine bestimmte Anforderung gilt, ohne dass die Schulart unmittelbar am curricularen Element gespeichert werden muss. Die Schulart fungiert damit als institutioneller Kontext, während das Bildungsgangniveau den fachlichen Anspruch beschreibt.


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

```ontoink
source: patterns/pattern6.ttl
namespaces: false
```

**RDF Daten**:
```text
--8<-- "docs/patterns/pattern6.ttl"
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


```ontoink
source: patterns/pattern7.ttl
namespaces: false
```

**RDF Daten**:
```text
--8<-- "docs/patterns/pattern7.ttl"
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

```ontoink
source: patterns/pattern9.ttl
namespaces: false
```

**RDF Daten**:
```text
--8<-- "docs/patterns/pattern9.ttl"
```


**Erläuterung**:

**Niveau** (`LP_0000037`) ist die gemeinsame Superklasse für alle Leistungs- und Anforderungsstufen in der Ontologie. Sie gliedert sich in vier thematisch unterschiedliche Unterklassen.

Das **Bildungsgangniveau** (`LP_0000028`) beschreibt den Leistungsanspruch, mit dem Inhalte und Kompetenzen für eine bestimmte Lerngruppe formuliert sind – und damit, auf welchen Schulabschluss hin unterrichtet wird. Die Ontologie definiert vier generische Niveaus: **Hauptschulniveau, Realschulniveau, Gymnasialniveau Sek I** und **Gymnasialniveau Sek II**. Für jedes Bundesland gibt es eigene Subklassen (*Bildungsgangniveau (HH), Bildungsgangniveau (SN)* usw.), und darunter wiederum die konkreten länderspezifischen Individuen.

Die Namen variieren erheblich: Dasselbe Hauptschulniveau heißt in Bayern *Mittelschulniveau*, in Thüringen *Regelschulniveau*, in Schleswig-Holstein *Sekundarstufenniveau*, in Hamburg *Mindestanforderungen*. Das Gymnasialniveau Sek I heißt in Bremen *Erweitertes Anforderungsniveau*, in Rheinland-Pfalz *Erhöhtes Kompetenzniveau*, in Nordrhein-Westfalen *Erweiterungskurs*. Berlin geht etwas anders vor und differenziert nach Abschlusstyp und Niveaustufen A-H: Die Niveaus *BOA, BBR (A–F), EBBR (A–G), MSA (A–G)* und *Gymnasialniveau Sek I (A–H)* bilden die jahrgangsbandweise Kompetenzentwicklung innerhalb eines Abschlussziels ab. (Eine detaillierte Erklärung dazu liefert Pattern 11.)

Das **Fachniveau Sek II** (`LP_0000265`) beschreibt den Kurstyp in der gymnasialen Oberstufe. Die generischen Individuen sind **Grundkursniveau** und **Leistungskursniveau**. Darüber hinaus haben die Bundesländer eigene Subklassen (*Fachniveau Sek II (BY)* usw.) mit länderspezifischen Bezeichnungen für Kursarten (z.B. *Grundlegendes Anforderungsniveau*, *Erhöhtes Anforderungsniveau*, *Leistungskursfach*).

Der **Anforderungsbereich** (`LP_0000802`) ist eine bundesweit einheitliche Taxonomie aus den KMK-Bildungsstandards, die den kognitiven Anspruch einer Aufgabe oder Kompetenz klassifiziert. Die drei Individuen sind fest definiert: **Anforderungsbereich 1 (Reproduktion), Anforderungsbereich 2 (Reorganisation und Transfer)** und **Anforderungsbereich 3 (Reflexion und Problemlösung)**. Im Gegensatz zu Bildungsgang- und Fachniveaus, die organisatorische Rahmenbedingungen beschreiben, charakterisiert der Anforderungsbereich die kognitive Tiefe eines Lernziels – unabhängig von Schulart oder Bundesland.

Das **Fremdsprachenniveau** (`LP_0010001`) bildet die Kompetenzstufen des **Gemeinsamen Europäischen Referenzrahmens für Sprachen (GER)** als sechs Individuen ab (von *A1 - Anfänger* (`LP_0030317`) bis *C2 - Annähernd muttersprachliche Kenntnisse* (`LP_0030313`)). Diese Niveaus sind bundeslandunabhängig und einheitlich – im Gegensatz zu den stark föderalen Bildungsgangniveaus. Sie ermöglichen es, Lehrplanelemente aus Fremdsprachenfächern direkt mit dem international anerkannten GER-Standard zu verknüpfen.


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


```ontoink
source: patterns/pattern11.ttl
namespaces: false
```

**RDF Daten**:
```text
--8<-- "docs/patterns/pattern11.ttl"
```


**Erläuterung**:

Berlin und Brandenburg arbeiten seit 2004 mit gemeinsamen Rahmenlehrplänen – ein bundesweites Unikat. Dieses Prinzip spiegelt sich auch in der Ontologie wider, insbesondere in der Klasse **Niveaustufe (BE/BB)** (`LP_0000443`). Der Rahmenlehrplan strukturiert Kompetenzen nicht primär nach Jahrgangsstufen, sondern entlang von acht **Niveaustufen A bis H**, die unterschiedliche Grade der Kompetenzentwicklung abbilden. Eine Niveaustufe fungiert dabei als Curriculares Element, das als Container für die zugehörigen Kompetenzanforderungen dient.

Kompetenzspezifikationen werden in BE/BB stets einer solchen Niveaustufe über **hat Niveaustufe** zugeordnet. Diese Niveaustufen sind jedoch allein noch nicht hinreichend für eine Vergleichbarkeit, da Kompetenzen immer im Kontext eines Bildungsgangniveaus interpretiert werden müssen. Eine reine Betrachtung auf Ebene der Jahrgangsstufe ist daher nicht ausreichend.

Die eigentliche Konkretisierung erfolgt über die **Bildungsgangniveaus**, die den angestrebten **Abschluss** berücksichtigen. Jedes Bildungsgangniveau ist eine Kombination aus einer *BE/BB-Niveaustufe (A–H)* und einem spezifischen *Abschluss* (z. B. *BBR, EBBR, MSA* oder *Gymnasialniveau Sek I*). Über die Property **hat Niveau** (`LP_0000840`) sind die generischen Niveaustufen direkt mit diesen abschlussspezifischen Ausprägungen verknüpft (z. B. *Niveaustufe A → BOA A, BBR A, EBBR A, MSA A, Gymnasialniveau Sek I A*). Umgekehrt referenzieren die Bildungsgangniveaus über **ist Niveaustufe von** (`LP_0000580`) zurück auf die zugrunde liegende Buchstabenstufe.

In Berlin existiert jede Buchstabenstufe einmal je Abschlusstyp (z. B. *BOA A–E, MSA A–G, Gymnasialniveau Sek I A–H*), während in Brandenburg entsprechende Bildungsgangniveaus (z. B. *EBR, FOR, FOR-Q*) strukturell analog organisiert sind. Die konkrete Ontologie-Verknüpfung ermöglicht es, dass einer Kompetenz – über die Zuordnung zu einer Niveaustufe und die anschließende Zuordnung zu einem Bildungsgangniveau – letztlich ein spezifisches Niveau (z. B. *A-EBBR*) zugewiesen wird.

Ein zentrales Merkmal des BE/BB-Systems ist die **Verknüpfung von Niveaustufen mit Jahrgangsstufen**, um eine Vergleichbarkeit zu den anderen Bundesländern herstellen zu können. Jede Bildungsgangniveau-Stufe trägt über **hat Jahrgangsstufe** (`LP_0000026`) die Jahrgänge, in denen sie typischerweise erreicht wird. Diese Zuordnung ist bewusst überlappend gestaltet, da der Rahmenlehrplan individuelle Kompetenzentwicklungen statt starrer Progressionsgrenzen vorsieht. Die generische Zuordnung lautet:

- A → 1
- B → 1–3
- C → 2–5
- D → 4–7
- E → 6–9
- F → 8–10
- G → 9–10
- H → 10

Diese Jahrgangsstufen gelten abschlusstypübergreifend; die tatsächliche Reichweite hängt vom jeweiligen Bildungsgang ab (z.B. *BOA* bis *Stufe E, Gymnasialniveau Sek I* bis *H*).

Zusammengefasst heißt das:

Der Lehrplan BE/BB verknüpft **Kompetenzspzifikationen** (*Standard (BE)*) mit **Niveaustufen**. Je nach angestrebtem Abschluss, kann aus der Kombination von Niveaustufe BE/BB und Abschluss das richtige Bildungsgangniveau zugeordnet werden, durch welches wiederum die Jahrgangsstufen ermittelt werden können. Auf Ebene der **Jahrgangsstufen** kann eine Vergleichbarkeit zu den anderen Bundesländern hergestellt werden.

Die Vergleichbarkeit mit anderen Bundesländern wird durch zwei Mechanismen sichergestellt:

1. **Generische Bildungsgangniveaus**: Abschlussspezifische Niveaus (z. B. *MSA*) sind als Subklassen allgemeiner Niveaus (z. B. Realschulniveau) modelliert.
2. **Standardisierte Jahrgangsstufen**: Da dieselben Jahrgangsstufen-IRIs verwendet werden, lassen sich Anforderungen bundeslandübergreifend vergleichen.


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