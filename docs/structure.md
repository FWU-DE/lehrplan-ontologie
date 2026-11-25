# Ontologie-Modell

Diese Seite beschreibt das Modell der Lehrplan-Ontologie in der Version **1.0.0rc6**: die ontologischen Grundannahmen, den Aufbau in Schichten, das Designprinzip aus gemeinsamem Kern und länderspezifischen Konkretisierungen sowie die nachgenutzten Ontologien. Am Ende folgt eine Übersicht über die wichtigsten Klassen, Instanzen und Beziehungen.


## Ontologisches Grundverständnis

Ein Lehrplan ist ontologisch nicht als Dokument zu verstehen, sondern als **Informationseinheit** (*information content entity*). Das Dokument – etwa ein Portable Document Format (PDF), eine Webseite oder ein Buch – ist lediglich Träger dieser Information.

Ein Lehrplan ist eine systematische Zusammenstellung curricularer Elemente. Er legt verbindlich fest, welche Kompetenzen und Inhalte Schülerinnen und Schüler in einem bestimmten Fach, einer Jahrgangsstufe, einer Schulart oder einem Bildungsgang eines Landes erwerben sollen. Je nach Land heißt er *Bildungsplan*, *Fachanforderungen*, *Kerncurriculum*, *Kernlehrplan*, *LehrplanPLUS*, *Rahmenlehrplan*, *Rahmenplan* oder schlicht *Lehrplan*. Von ihm zu unterscheiden sind die länderübergreifenden **Bildungsstandards** der Kultusministerkonferenz (KMK), die als Grundlage für die Lehrpläne der Länder dienen.

Ein Lehrplan beschreibt nicht den tatsächlich stattfindenden Unterricht, sondern legt fest, wie Lehr- und Lernprozesse idealerweise gestaltet sein sollen. Aus ontologischer Sicht sind **Lehrprozess** und **Lernprozess** klar zu unterscheiden: Der Lehrprozess wird durch Lehrpersonen oder das Bildungssystem gestaltet, der Lernprozess findet in der lernenden Person statt. Das Ergebnis eines erfolgreichen Lernprozesses kann eine **Kompetenz** sein – ontologisch keine Information, sondern eine Disposition einer Person, in einer Klasse von Situationen erfolgreich zu handeln.

Der Lehrplan enthält Kompetenzen also nicht selbst, sondern beschreibt sie in Form von **Kompetenzspezifikationen**. Diese Trennung zwischen einer **realweltlichen Entität** und der **Informationseinheit, die sie beschreibt**, zieht sich als Grundprinzip durch die gesamte Ontologie:

| Realweltliche Entität                            | wird beschrieben von (Informationseinheit)                    |
|--------------------------------------------------|---------------------------------------------------------------|
| **Kompetenz** (Disposition einer Person)         | **CE-Kompetenzspezifikation**                                 |
| **Bildungsgang** (Prozess, den eine Person durchläuft) | **Bildungsgangspezifikation** (z. B. *Gymnasialer Bildungsgang*) |
| **Schulabschluss** (Rolle einer Person)          | **Schulabschlussspezifikation** (z. B. *Mittlerer Schulabschluss*) |
| **Schulartfunktion** (Rolle einer Schule)        | **Schulart** (z. B. *Gymnasium*)                              |

In den Lehrplandaten werden fast ausschließlich die Informationseinheiten verwendet. Die realweltlichen Entitäten – Personen, Schulen, Lehr- und Lernprozesse, Kompetenzen und Rollen – sind in der Ontologie angelegt, damit die Lehrplandaten später mit Daten über tatsächlichen Unterricht verknüpft werden können.


## Aufbau und Struktur der Lehrplan-Ontologie

Die Lehrplan-Ontologie ist als OWL-2-Ontologie (OWL: Web Ontology Language) implementiert. Inhaltlich lässt sie sich in fünf Schichten gliedern, die unterschiedliche Aspekte des Lehrplansystems abbilden – vom institutionellen Bildungskontext über die curriculare Struktur bis zu den Beziehungen zwischen den Elementen.

### 1. Bildungskontext: Land, Schulart und Schulfach

*Wo und für wen gilt der Lehrplan?*

Der föderale Charakter des Bildungssystems wird durch die Klasse **Bundesland Bezeichnung** (`LP_0000040`) abgebildet. Sie ist als geschlossene Aufzählung der 16 Länder definiert, die als Individuen modelliert sind. Die Unterklasse **Berlin-Brandenburg** (`LP_0000053`) fasst die beiden Länder mit gemeinsamen Rahmenlehrplänen zusammen, **Ohne-Berlin-Brandenburg** (`LP_0000054`) die übrigen 14.

Die Klasse **Schulart** (`LP_0000111`) beschreibt eine Schulform wie *Gymnasium* oder *Stadtteilschule*. Eine Schulart ist eine Informationseinheit; die tatsächliche Rolle, die eine konkrete Schule als Schule dieser Art einnimmt, ist die **Schulartfunktion** (`LP_0000475`). Die 89 Schularten der Länder stammen aus der [Schulart-Ontologie](#schulart-ontologie).

Die Klasse **Schulfach** (`LP_0000001`) umfasst die Unterrichtsfächer und gliedert sich in **MINT-Fach** (MINT: Mathematik, Informatik, Naturwissenschaften und Technik; mit der Unterklasse **Naturwissenschaftsfach**), **Fremdsprachenfach**, **Gesellschaftswissenschaftsfach** und **BistaFach** (Fächer der KMK-Bildungsstandards). Die Fächer der Länder stammen aus der [Schulfach-Ontologie](#schulfach-ontologie). Die Klasse **Schulfachbezug** (`LP_0000540`) beschreibt die Stellung eines Fachs in einem bestimmten Kontext: *Pflichtfach*, *Wahlpflichtfach*, *Wahlfach* sowie *Erste*, *Zweite* und *Dritte Fremdsprache*.

Die **Bildungsgangspezifikation** (`LP_0000816`) beschreibt eine schulische Laufbahn, die zu einem bestimmten Abschluss führt. Ihre Unterklassen **Gymnasialer Bildungsgang**, **Realschulbildungsgang** und **Hauptschulbildungsgang** sind über das jeweilige Bildungsgangniveau definiert – ein *Gymnasialer Bildungsgang* ist genau eine Bildungsgangspezifikation mit Gymnasialniveau Sek I oder Sek II. Der **Bildungsgang** (`LP_0000567`) selbst ist der Prozess, den eine Person gemäß dieser Spezifikation durchläuft.

### 2. Curriculare Elemente als semantischer Kern der Ontologie

*Woraus besteht ein Lehrplan?*

Die Klasse **Lehrplan** (`LP_0000438`) ist die gemeinsame Oberklasse für die Lehrpläne aller Länder. Ihre 16 länderspezifischen Unterklassen tragen die jeweilige Bezeichnung des Landes, z. B. *LehrplanPLUS (BY)*, *Bildungsplan (BW)*, *Rahmenlehrplan (BE)* oder *Lehrplan (RP)*.

Die Klasse **Curriculares Element** (`LP_0000261`) ist die Oberklasse aller inhaltlichen Bausteine eines Lehrplans oder Bildungsstandards. Die länderübergreifenden Unterklassen tragen das Präfix *CE-*:

| Klasse                                   | Bedeutung                                                                                                            |
|------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| **CE-Fragment** (`LP_0001015`)           | strukturgebender Bestandteil ohne eigene fachliche Bedeutung, z. B. Kapitel oder Abschnitt                           |
| **CE-Bereich** (`LP_0000349`)            | fachlich gliedernder Bereich, z. B. Kompetenzbereich, Lernbereich, Leitidee, Themenfeld, Inhaltsfeld                 |
| **CE-Kompetenzspezifikation** (`LP_0000263`) | Beschreibung einer zu erwerbenden Kompetenz, z. B. *Kompetenzerwartung (BY)*, *Standard (BE)*, *Anforderung (HH)* |
| **CE-Lerninhalt** (`LP_0000332`)         | fachlicher Inhalt oder Lerngegenstand                                                                                |
| **CE-Hinweis** (`LP_0000852`)            | ergänzende didaktische, methodische oder organisatorische Information                                                |
| **CE-Verweis** (`LP_0030065`)            | Verweis auf ein anderes Element, einen anderen Lehrplan oder eine externe Ressource                                  |
| **CE-Leitperspektive** (`LP_0030325`)    | übergreifendes Bildungsziel wie Nachhaltigkeit oder Medienbildung                                                    |

Die CE-Klassen sind über die **Funktion** definiert, die ein Element im Lehrplan erfüllt. Wie das funktioniert, beschreibt der Abschnitt [Designprinzip](#modellierung-designprinzip).

### 3. Zeitliche und stufenbezogene Einordnung

*Wann gilt etwas?*

Die Klasse **Jahrgangsstufe** (`LP_0000009`) enthält 13 länderunabhängige Individuen (Jahrgangsstufe 1 bis 13), die alle Lehrplandaten gemeinsam verwenden. Die **Schulstufe** (`LP_0000020`) fasst größere Abschnitte zusammen: *Primarbereich*, *Sekundarbereich I*, *Sekundarbereich II* und die *Orientierungsstufe (MV)*. Die **Oberstufenphase** (`LP_0000043`) gliedert die gymnasiale Oberstufe in **Einführungsphase** und **Qualifikationsphase**, jeweils in einer G8- und einer G9-Variante.

Die **Schulabschlussspezifikation** (`LP_0000019`) beschreibt einen Schulabschluss und die Anforderungen für seine Verleihung. Die generischen Unterklassen sind über das benötigte Niveau definiert:

- **Erster Schulabschluss** – benötigt Hauptschulniveau
- **Mittlerer Schulabschluss** – benötigt Realschulniveau
- **Allgemeine Hochschulreife** – benötigt Gymnasialniveau Sek II

Für jedes Land gibt es eigene Unterklassen wie *Mittlerer Abschluss (BY)*, deren Individuen die konkreten Abschlüsse des Landes sind (z. B. *Mittlerer Schulabschluss der Realschule (BY)*). Der **Schulabschluss** (`LP_0000008`) selbst ist die Rolle, die eine Person mit dem Erwerb des Abschlusses erhält.

Für die zeitliche Gültigkeit eines Lehrplans stehen der **Gültigkeitsbereich** (`LP_0000547`) mit den Datumsangaben *von Datum* und *bis Datum* sowie das Datum *veröffentlicht am* zur Verfügung. Zeitumfänge wie Unterrichtsstunden werden als **Zeitspezifikation** (`LP_0000508`) aus Wert und Einheit angegeben (siehe [Pattern 12](patterns.md#pattern-12-zeitangaben)).

### 4. Niveau-System

*Für welches Anspruchsniveau gilt etwas?*

Die Klasse **Niveau** (`LP_0000037`) ist die Oberklasse aller Leistungs- und Anforderungsstufen:

- **Bildungsgangniveau** (`LP_0000028`) beschreibt den Leistungsanspruch innerhalb eines Bildungsgangs. Die fünf generischen Unterklassen sind **Grundschulniveau**, **Hauptschulniveau**, **Realschulniveau**, **Gymnasialniveau Sek I** und **Gymnasialniveau Sek II**. Die Niveaus der Länder sind Individuen dieser Klassen, z. B. *Mittelschulniveau (BY)* als Hauptschulniveau oder *Erhöhte Anforderungen (HH)* als Realschul- und Gymnasialniveau Sek I. Für Brandenburg gibt es zusätzlich die Klassen *EBR Niveau*, *FOR Niveau* und *FOR-Q Niveau* für die angestrebten Abschlüsse erweiterte Berufsbildungsreife (EBR), Fachoberschulreife (FOR) und Fachoberschulreife mit Berechtigung zum Besuch der gymnasialen Oberstufe (FOR-Q).
- **Fachniveau Sek II** (`LP_0000265`) beschreibt den Kurstyp in der gymnasialen Oberstufe mit den Unterklassen **Grundkursniveau** und **Leistungskursniveau**.
- **Anforderungsbereich** (`LP_0000802`) enthält die drei Anforderungsbereiche der KMK.
- **Fremdsprachenniveau** (`LP_0010001`) enthält die sechs Stufen A1 bis C2 des Gemeinsamen Europäischen Referenzrahmens.

Unabhängig davon gibt es die **Niveaustufe BE/BB** (`LP_0000443`) mit den acht Stufen A bis H der gemeinsamen Rahmenlehrpläne von Berlin und Brandenburg (siehe [Pattern 11](patterns.md#pattern-11-niveaustufen-bebb)).

### 5. Relationen und Funktionen

*Wie hängen die Elemente zusammen?*

Die Ontologie verwendet Relationen aus Basic Formal Ontology (BFO), Relation Ontology (RO) und Information Artifact Ontology (IAO) sowie eigene Properties, die als Sub-Properties dieser Basisrelationen eingeordnet sind. Die wichtigsten sind:

- **hat direkten Teil** (`LP_0000565`) bildet die Gliederung eines Lehrplans ab: Ein Element ist unmittelbarer Teil seines übergeordneten Elements. Die Reihenfolge der Teile gibt **hat Position** (`LP_0000460`) an. *hat direkten Teil* ist Sub-Property der transitiven Relation **hat Teil** (`BFO_0000051`), sodass sich alle mittelbaren Teile ableiten lassen.
- **von Bundesland**, **für Schulart**, **hat Schulfach**, **hat Jahrgangsstufe**, **hat Schulstufe** und **hat Bildungsgangniveau** ordnen Lehrpläne und curriculare Elemente in den Bildungskontext ein.
- **hat Titel**, **hat Beschreibung** und **hat Nummer** verbinden ein Element mit seinen textuellen Bestandteilen (Titel, Beschreibung, Identifikationsnummer).
- **hat Funktion** (`LP_0000483`) verbindet ein curriculares Element mit seiner **Funktionsspezifikation** (`LP_0000478`).

Fast alle beschreibenden Properties sind Sub-Properties von **wird beschrieben von** (`LP_0000024`), der Inversen von **beschreibt** (`IAO_0000136`, *is about*). Eine vollständige Liste steht im Abschnitt [Beziehungen](#beziehungen-properties).


## Modellierung / Designprinzip

Das Grundprinzip der Ontologie lässt sich so zusammenfassen: **eine gemeinsame Abstraktion mit vielfältigen länderspezifischen Konkretisierungen**. Alle Länder verwenden dieselben generischen Klassen (*Lehrplan*, *CE-Bereich*, *CE-Kompetenzspezifikation* usw.) und dieselben Relationen. Gleichzeitig bleibt die Terminologie jedes Landes in eigenen Klassen erhalten.

Dieses Modell ermöglicht sowohl länderübergreifende Auswertungen (z. B. „alle Kompetenzbereiche zu Thema X in allen Ländern“) als auch länderspezifische Analysen (z. B. „alle Lernbereiche im LehrplanPLUS Bayern“).

```d2
Kern-Ontologie: {
  style: {
    font-color: white
    fill: "#9F0E21"
    stroke: white
  }
}
BW: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
BY: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
BE: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
"…": { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }

Kern-Ontologie -> BW: { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
Kern-Ontologie -> BY: { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
Kern-Ontologie -> BE: { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
Kern-Ontologie -> "…": { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
```

### Wie die Länderklassen an den Kern angebunden sind

Die Anbindung erfolgt in drei Schritten:

1. **Element des Landes.** Für jedes Land gibt es eine Klasse *Element (XX)*, definiert als *Curriculares Element* mit *von Bundesland* = XX. *Element (BY)* (`LP_0000434`) umfasst also genau die curricularen Elemente Bayerns.
2. **Länderspezifische Klasse mit Funktion.** Jede Klasse aus der Terminologie eines Landes ist Unterklasse ihres Landes-Elements und trägt eine feste Funktion. *Lernbereich (BY)* ist beispielsweise ein *Element (BY)* mit *hat Funktion* = *Bereichsfunktion*.
3. **Generische Klasse über die Funktion.** Die CE-Klassen sind als *definierte Klassen* (`owl:equivalentClass`) über diese Funktion festgelegt: *CE-Bereich* ist genau ein *Curriculares Element* mit *hat Funktion* = *Bereichsfunktion*.

Ein Reasoner ordnet *Lernbereich (BY)* damit automatisch als Unterklasse von *CE-Bereich* ein – ohne dass dies von Hand modelliert werden muss. Wie die Funktionen aufgebaut sind, zeigt [Pattern 8](patterns.md#pattern-8-funktionen).

!!! note "Kompetenzspezifikation, Lerninhalt und Hinweis werden erst auf Ebene der Daten eingeordnet"

    Die Definitionen von *CE-Kompetenzspezifikation*, *CE-Lerninhalt* und *CE-Hinweis* verlangen neben der Funktion auch eine Einbettung in die Gliederung: Eine CE-Kompetenzspezifikation ist Teil eines CE-Bereichs und hat einen Titel, ein CE-Lerninhalt ist Teil eines CE-Bereichs oder CE-Lerninhalts, ein CE-Hinweis ist Teil einer Kompetenzspezifikation, eines Lerninhalts oder eines Bereichs. Diese Bedingungen sind an den Länderklassen nicht festgelegt. Deshalb ordnet ein Reasoner z. B. *Kompetenzerwartung (BY)* nicht als Unterklasse von *CE-Kompetenzspezifikation* ein, wohl aber jedes einzelne Element in den Daten, das die Bedingungen erfüllt. Für *CE-Bereich*, *CE-Fragment*, *CE-Verweis* und *CE-Leitperspektive* genügt die Funktion; hier erfolgt die Einordnung bereits auf Klassenebene.

### Typischer Aufbau eines Lehrplans

Ein *Lehrplan* gliedert sich in *CE-Fragmente*, die wiederum *CE-Bereiche* wie Kompetenzbereiche oder Themenfelder enthalten. Die Gliederung ist rekursiv: Bereiche können weiter untergliedert sein, bis auf die Ebene von *Kompetenzspezifikationen* oder *Lerninhalten*, an denen *Hinweise* hängen können.

```d2
Lehrplan: {
  style: {
    font-color: white
    fill: "#9F0E21"
    stroke: white
  }
}
CE-Fragment: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
CE-Bereich: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
CE-Kompetenzspezifikation: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
CE-Lerninhalt: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }
CE-Hinweis: { style: { stroke: "#9F0E21"; stroke-width: 5; font-color: "#9F0E21" } }

Lehrplan -> CE-Fragment: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Fragment -> CE-Bereich: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Bereich -> CE-Bereich: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Bereich -> CE-Kompetenzspezifikation: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Bereich -> CE-Lerninhalt: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Kompetenzspezifikation -> CE-Hinweis: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
CE-Lerninhalt -> CE-Hinweis: hat direkten Teil { style: { stroke: "#9F0E21"; opacity: 0.4; stroke-width: 3 } }
```

Neben dieser Hierarchie sind Lehrpläne auch netzartig verknüpft: Über *CE-Verweise* kann ein Element auf andere Elemente desselben oder eines anderen Lehrplans verweisen.

### Modularität

Die länderspezifischen Klassen sind klar von der Kern-Ontologie getrennt: Jede Länderklasse hängt nur an ihrem Landes-Element und an einer Funktion. Neue Länderklassen können daher ergänzt werden, ohne die Kern-Ontologie oder die Klassen anderer Länder zu verändern. Perspektivisch können die Länderanteile so als eigenständige Module gepflegt werden.


---

## Nachgenutzte Ontologien/Vokabulare

Die Lehrplan-Ontologie verwendet etablierte Ontologien, wo diese passende Konzepte bereitstellen, und führt nur dort eigene Klassen und Properties ein, wo das deutsche Lehrplansystem es erfordert. Das erhöht die Interoperabilität mit anderen Wissensgraphen und reduziert den Modellierungsaufwand.

### Basic Formal Ontology (BFO)

Die grundlegende Struktur folgt der Basic Formal Ontology (BFO), einer international verbreiteten Top-Level-Ontologie. In der Lehrplan-Ontologie sind Lehrpläne, curriculare Elemente, Schularten, Niveaus und Jahrgangsstufen Informationseinheiten; Lehr- und Lernprozesse sowie Bildungsgänge sind Prozesse; Kompetenzen sind Dispositionen, Schulabschlüsse und Schulartfunktionen sind Rollen.

??? info " ... mehr erfahren zu BFO als Top-Level-Ontologie? "

	## BFO als Top-Level-Ontologie

	Die Basic Formal Ontology (BFO) ist eine **Top-Level-Ontologie**, die einen strukturierten Rahmen zur Organisation von Entitäten anhand ihrer grundlegenden Eigenschaften bereitstellt. Sie enthält keine domänenspezifischen Inhalte, sondern definiert **hoch abstrakte Kategorien**, die die Entwicklung spezialisierter Ontologien wie die Lehrplan-Ontologie unterstützen.

	BFO unterscheidet Entitäten danach, ob sie über die Zeit hinweg bestehen oder sich in der Zeit entfalten, und unterteilt sie in **Continuants** und **Occurrents**.
	
	### **Continuants (Endurants)**

	Continuants sind Entitäten, die **zu jedem gegebenen Zeitpunkt existieren** und ihre Identität über die Zeit hinweg behalten. Es gibt drei Arten von Continuants: *Independent Continuants*, *Generically Dependent Continuants* und *Specifically Dependent Continuants*.

	#### **Independent Continuants (IC)**

	Dies sind Entitäten, die **unabhängig existieren** und keine andere Entität benötigen, um zu existieren.
	
	- **Material Entities** – Physische Objekte mit räumlicher Ausdehnung (z.B. Organismen, Gebäude, Werkzeuge)
	- **Immaterial Entities** – Grenzen oder Teile von Objekten, die durch menschliche Konvention definiert sind (z.B. der Äquator, die obere Hälfte einer Kugel).
	
	#### **Generically Dependent Continuants (GDC)**
	
	Diese Entitäten **hängen in ihrer Existenz von Independent Continuants ab**. Generically Dependent Continuants können in mehreren Instanzen existieren oder an verschiedenen Orten repliziert werden. *Beispiele*:
	
	  - Der Inhalt eines Buches (im Gegensatz zu einer einzelnen physischen Kopie)
	  - Ein Softwareprogramm (das auf mehreren Computern installiert sein kann)
	  - Eine musikalische Komposition (die auf verschiedenen Instrumenten gespielt werden kann)
	  - Ein Datensatz und einzelne Datenelemente
	  - Entitäten mit Informationsgehalt
	
	#### **Specifically Dependent Continuants (SDC)**
	
	Specifically Dependent Continuants sind **Qualities, Roles oder Dispositions**, die **nur in Beziehung zu einem bestimmten Independent Continuant existieren**. Sie können nicht unabhängig existieren und müssen stets in etwas anderem **inhärent sein**.
	
	- **Qualities** – Intrinsische Eigenschaften eines Independent Continuant. Sie beschreiben, **wie eine Entität zu einem bestimmten Zeitpunkt ist**. *Beispiele*: Die Farbe eines Blattes, das Gewicht einer Person, die Temperatur einer Flüssigkeit.
	
	- **Roles** – Situative Eigenschaften, die eine Entität **aufgrund von Kontext oder sozialer Konvention** hat. *Beispiele*: Die Rolle eines Lehrers, der Status eines Patienten in einem Krankenhaus, die Rolle einer Maschine während der Wartung.
	
	- **Dispositions and functions** – Potenzielle Verhaltensweisen oder Tendenzen, die eine Entität besitzt, auch wenn sie aktuell nicht realisiert sind. Functions sind Dispositions, die den spezifischen Zweck von etwas darstellen. *Beispiele*: Die Zerbrechlichkeit von Glas (es kann beim Fallen zerbrechen), die Löslichkeit von Salz (es löst sich in Wasser), die Fähigkeit einer Person, mehrere Sprachen zu sprechen, die Funktion eines Ofens zum Erhitzen, die Funktion eines Schraubenziehers zum Ein- und Ausdrehen von Schrauben.
	
	### **Occurrents (Perdurants)**
	
	Ein Occurrent ist eine Entität, die sich **in der Zeit entfaltet**, oder der Beginn bzw. das Ende einer solchen Entität.
	
	#### **Processes**
	
	Processes sind dynamische Aktivitäten mit zeitlicher Dauer. *Beispiele*: Ein Laufereignis, eine chemische Reaktion, Zellteilung.
	
	#### **Temporal Regions**
	
	Diese repräsentieren zeitliche Abschnitte. *Beispiele*: Eine Sekunde, eine Stunde, ein historischer Zeitraum.
	
	#### **Spatiotemporal Regions**
	
	Diese verbinden Raum und Zeit zu einer gemeinsamen Entität. *Beispiele*: Die Bahn eines bewegten Objekts, die Trajektorie eines Planeten.
	
	### **Relations in BFO**
	
	BFO definiert formale **Beziehungen** zwischen Entitäten, um Konsistenz zu gewährleisten. Einige zentrale Relations sind:
	
	- **continuant part of** – Beschreibt kompositorische Beziehungen. *Beispiel: Ein Rad ist Teil eines Autos.*
	- **occurrent part of** – Ein Prozess ist Teil eines anderen Prozesses. *Beispiel: Eine Konferenz umfasst mehrere Workshop-Events.*
	- **located in** – Beschreibt räumliche Einbettung. *Beispiel: Ein Buch ist `located_in` einer Bibliothek.*
	- **characteristic of** – Weist Specifically Dependent Continuants Independent Continuants zu. *Beispiel: `educator role` ist eine Charakteristik einer Lehrperson.*
	- **has participant** – Ordnet Continuants Prozessen zu. *Beispiel: Ein Student nimmt an einer Vorlesung teil.*
	
Repository: [https://github.com/bfo-ontology/BFO-2020](https://github.com/bfo-ontology/BFO-2020)

Dokumentation: [https://bfo-ontology.github.io/bfo-2020.html](https://bfo-ontology.github.io/bfo-2020.html)

### Relation Ontology (RO)

Die Relation Ontology (RO) ergänzt BFO um weitere Relationen. Die Lehrplan-Ontologie nutzt sie vor allem für die realweltlichen Entitäten: *has characteristic* verbindet eine Kompetenz mit einer Person, *has role* und *role of* verbinden Rollen wie die Schulartfunktion mit ihrem Träger, und *is concretized as* verbindet eine Schulart mit der Schulartfunktion.

### Information Artifact Ontology (IAO)

Da Lehrpläne, curriculare Elemente und die meisten weiteren Konzepte Informationseinheiten sind, sind sie als Unterklassen von *information content entity* (`IAO_0000030`) modelliert. Titel und Beschreibung sind *textual entities*, die Identifikationsnummer ist ein *symbol*, die Zeitspezifikation ein *data item*.

Zentral ist die IAO-Relation **beschreibt** (`IAO_0000136`, *is about*) und ihre Inverse **wird beschrieben von** (`LP_0000024`): Fast alle Properties, mit denen Lehrpläne und curriculare Elemente beschrieben werden, sind als deren Sub-Properties eingeordnet.

### Schulfach- und Schulart-Ontologien

Die Schulfach- und die Schulart-Ontologie stellen kontrollierte Vokabulare für die Schulfächer und Schularten aller 16 Länder bereit. Sie werden als eigenständige Ontologien gepflegt und von der Lehrplan-Ontologie nachgenutzt; in der Release-Datei der Lehrplan-Ontologie sind ihre Individuen enthalten.

#### Schulfach-Ontologie

Die Schulfach-Ontologie (`https://w3id.org/schulfach`) umfasst 16 Simple Knowledge Organization System (SKOS) Concept Schemes – eines je Land, z. B. *Schulfächer (Hamburg)* – mit insgesamt 898 Schulfächern. Jedes Schulfach ist zugleich Instanz der Klasse **Schulfach** (`LP_0000001`) und `skos:Concept` und über **von Bundesland** (`LP_0000029`) seinem Land zugeordnet. Die Bezeichnungen der Länder bleiben erhalten, auch wenn die Fächer inhaltlich vergleichbar sind, etwa *Sachunterricht*, *Heimat- und Sachunterricht* oder *Mensch, Natur und Technik*.

Über `skos:exactMatch` und `skos:closeMatch` sind die Fächer mit dem bundesweiten [KIM-Schulfachvokabular](https://w3id.org/kim/schulfaecher/) (KIM: Kompetenzzentrum Interoperable Metadaten) verknüpft, das als gemeinsames Referenzvokabular dient. So ist das Hamburger Fach *Deutsch* über `skos:exactMatch` mit dem KIM-Konzept *Deutsch* verbunden und darüber mit den Deutsch-Fächern aller anderen Länder.

Repository: [https://github.com/FWU-DE/schulfach-ontologie](https://github.com/FWU-DE/schulfach-ontologie)

SKOS-Vokabulare: [https://fwu-de.github.io/mem-skos-vocabs/](https://fwu-de.github.io/mem-skos-vocabs/)

#### Schulart-Ontologie

Die Schulart-Ontologie (`https://w3id.org/schulart`) folgt demselben Aufbau: 16 Concept Schemes mit insgesamt 89 Schularten, die zugleich Instanzen der Klasse **Schulart** (`LP_0000111`) und `skos:Concept` sind. Auch sie sind mit dem [KIM-Schulartenvokabular](https://w3id.org/kim/schularten/) verknüpft.

Zusätzlich ist jede Schulart über **hat Bildungsgangniveau** (`LP_0000833`) mit den Bildungsgangniveaus verbunden, die in ihr unterrichtet werden. In Hamburg ist das **Gymnasium** (`HH_0000003`) beispielsweise mit *Gymnasialniveau Sek I (HH)* und *Studienstufenniveau (HH)* verknüpft, die **Stadtteilschule** (`HH_0000002`) mit sechs Niveaus von *Mindestanforderungen (HH)* bis *Studienstufenniveau (HH)*.

So wird die Schulart-Ontologie zum Bindeglied zwischen Schularten, Bildungsgangniveaus und den curricularen Elementen: Trägt ein Lehrplanelement ein bestimmtes Bildungsgangniveau, lässt sich daraus ableiten, in welchen Schularten es relevant ist – und umgekehrt.

Repository: [https://github.com/FWU-DE/schulart-ontologie](https://github.com/FWU-DE/schulart-ontologie)

#### Verwendung von SKOS

Das **Simple Knowledge Organization System (SKOS)** ist ein W3C-Standard für kontrollierte Vokabulare, Thesauri und Klassifikationen. Die Schulfach- und Schulart-Ontologie nutzen SKOS für Bezeichnungen und Concept Schemes sowie die Mapping-Properties `skos:exactMatch` und `skos:closeMatch` für die Verknüpfung mit den KIM-Vokabularen.

### KIM-Vokabulare

Die **KIM-Vokabulare** der Arbeitsgruppe KIM der Deutschen Initiative für Netzwerkinformation (DINI) stellen bundesweit einheitliche Referenzkonzepte für Schulfächer, Schularten und Schulabschlüsse bereit. In der Lehrplan-Ontologie dienen sie als gemeinsamer Bezugspunkt: Die länderspezifischen Fächer und Schularten sind über SKOS-Mappings mit den KIM-Konzepten verknüpft. Anwendungen können entweder mit den Konzepten der Länder arbeiten oder über die KIM-Konzepte bundesweit abfragen, ohne die unterschiedlichen Bezeichnungen der Länder kennen zu müssen.

Repository: [https://github.com/dini-ag-kim/kmk-vocabs](https://github.com/dini-ag-kim/kmk-vocabs)

### QUDT

Für Maßeinheiten wird das Vokabular **QUDT** (Quantities, Units, Dimensions and Types) nachgenutzt. Die Klasse *Unit* und die Property *hat Einheit* (`qudt:hasUnit`) stammen aus QUDT; als Einheiten stehen *Stunde* und *Minute* aus QUDT sowie die eigene Einheit *Unterrichtsstunde* (`LP_0000535`) zur Verfügung.

Dokumentation: [https://qudt.org/](https://qudt.org/)


---

## Überblick über Klassen, Beziehungen, Hierarchien

Die vollständige Referenz aller Klassen und Properties mit ihren Definitionen bietet die [Widoco-Dokumentation](https://fwu-de.github.io/lehrplan-ontologie/index-de.html). Die folgenden Übersichten zeigen die wichtigsten generischen Klassen; die länderspezifischen Klassen sind nicht aufgeführt.

### Klassen

**Realweltliche Entitäten:**

- independent continuant (BFO)
    - material entity (BFO)
        - object (BFO)
            - Person
        - Organisation
            - Schule
            - Schulklasse
- specifically dependent continuant (BFO)
    - realizable entity (BFO)
        - disposition (BFO)
            - Kompetenz
        - role (BFO)
            - Schüler Rolle
            - Lehrer Rolle
            - Schulartfunktion
            - Schulabschluss
- process (BFO)
    - Lehrprozess
    - Lernprozess
    - Bildungsgang

**Informationseinheiten zum Bildungssystem:**

- information content entity (IAO)
    - Bundesland Bezeichnung
        - Berlin-Brandenburg
        - Ohne-Berlin-Brandenburg
    - Schulart
    - Schulfach
        - MINT-Fach
            - Naturwissenschaftsfach
        - Fremdsprachenfach
        - Gesellschaftswissenschaftsfach
        - BistaFach
    - Schulfachbezug
    - Bildungsgangspezifikation
        - Gymnasialer Bildungsgang
        - Realschulbildungsgang
        - Hauptschulbildungsgang
    - Schulabschlussspezifikation
        - Erster Schulabschluss
        - Mittlerer Schulabschluss
        - Allgemeine Hochschulreife
    - Jahrgangsstufe
    - Schulstufe
    - Oberstufenphase
        - Einführungsphase
        - Qualifikationsphase
    - Niveau
        - Bildungsgangniveau
            - Grundschulniveau
            - Hauptschulniveau
            - Realschulniveau
            - Gymnasialniveau Sek I
            - Gymnasialniveau Sek II
        - Fachniveau Sek II
            - Grundkursniveau
            - Leistungskursniveau
        - Anforderungsbereich
        - Fremdsprachenniveau
    - Niveaustufe BE/BB

**Informationseinheiten zu Lehrplänen:**

- information content entity (IAO)
    - Lehrplan
    - Bildungsstandard (KMK)
    - Curriculares Element
        - CE-Fragment
        - CE-Bereich
        - CE-Kompetenzspezifikation
            - Fachbezogene Kompetenzspezifikation
            - Fachübergreifende Kompetenzspezifikation
        - CE-Lerninhalt
        - CE-Hinweis
        - CE-Verweis
        - CE-Leitperspektive
        - Element (XX) – je eine Klasse pro Land und für die Bildungsstandards
    - Funktionsspezifikation
        - Strukturierungsfunktion
        - Beschreibungsfunktion
        - Bezugsfunktionen
    - Gültigkeitsbereich
    - Progression
    - textual entity (IAO)
        - Titel
        - Beschreibung
        - Themenfeld
    - symbol (IAO)
        - Identifikationsnummer
    - data item (IAO)
        - Zeitspezifikation
- Unit (QUDT)

### Instanzen (individuals)

Individuen sind die konkreten, fest definierten Instanzen, auf die die Lehrplandaten direkt per Internationalized Resource Identifier (IRI) verweisen.

**1. Länder** (`LP_0000040`)

Die 16 Länder; jedes Lehrplanelement verweist über *von Bundesland* auf eines davon.

| IRI          | Land             | IRI          | Land             |
|--------------|------------------------|--------------|------------------------|
| `LP_3000049` | Baden-Württemberg      | `LP_3000043` | Niedersachsen          |
| `LP_3000051` | Bayern                 | `LP_3000044` | Nordrhein-Westfalen    |
| `LP_3000048` | Berlin                 | `LP_3000046` | Rheinland-Pfalz        |
| `LP_3000057` | Brandenburg            | `LP_3000055` | Saarland               |
| `LP_3000056` | Bremen                 | `LP_3000047` | Sachsen                |
| `LP_3000045` | Hamburg                | `LP_3000053` | Sachsen-Anhalt         |
| `LP_3000050` | Hessen                 | `LP_3000054` | Schleswig-Holstein     |
| `LP_3000052` | Mecklenburg-Vorpommern | `LP_3000031` | Thüringen              |

**2. Jahrgangsstufen** (`LP_0000009`)

13 länderunabhängige Individuen: `LP_2000001` (Jahrgangsstufe 1) bis `LP_2000013` (Jahrgangsstufe 13). Da alle Lehrplandaten dieselben IRIs verwenden, lassen sich Lehrpläne länderübergreifend nach Jahrgangsstufe vergleichen.

**3. Schulstufen** (`LP_0000020`) **und Oberstufenphasen** (`LP_0000043`)

- `LP_0000036` Primarbereich
- `LP_0000045` Sekundarbereich I
- `LP_0000046` Sekundarbereich II
- `LP_0000032` Orientierungsstufe (MV)
- `LP_0000051` G8 Einführungsphase, `LP_0000050` G8 Qualifikationsphase
- `LP_0000055` G9 Einführungsphase, `LP_0000052` G9 Qualifikationsphase

**4. Bildungsgangniveaus** (`LP_0000028`)

Die Niveaus der Länder sind Individuen der fünf generischen Niveauklassen und zugleich der Klasse *Bildungsgangniveau (XX)* ihres Landes. Ein Niveau kann mehreren generischen Klassen angehören, wenn es mehrere Anspruchsniveaus abdeckt. Beispiele:

| IRI          | Niveau                             | generische Klasse(n)                         |
|--------------|------------------------------------|----------------------------------------------|
| `LP_0000025` | Mittelschulniveau (BY)             | Hauptschulniveau                             |
| `LP_0000030` | Realschulniveau (BY)               | Realschulniveau                              |
| `LP_0000023` | Gymnasialniveau Sek I (BY)         | Gymnasialniveau Sek I                        |
| `LP_0000016` | G Niveau (BW)                      | Hauptschulniveau                             |
| `LP_0000014` | E Niveau (BW)                      | Gymnasialniveau Sek I                        |
| `LP_0000147` | Grundlegendes Kompetenzniveau (RP) | Hauptschulniveau                             |
| `LP_0000143` | Erhöhtes Kompetenzniveau (RP)      | Gymnasialniveau Sek I                        |
| `LP_0000093` | Erhöhte Anforderungen (HH)         | Realschulniveau, Gymnasialniveau Sek I       |
| `LP_0000294` | Oberschulniveau (SN)               | Hauptschulniveau, Realschulniveau            |

**5. Niveaustufen BE/BB** (`LP_0000443`)

Die acht Stufen der Rahmenlehrpläne von Berlin und Brandenburg: `LP_0000464` (A), `LP_0000465` (B), `LP_0000466` (C), `LP_0000467` (D), `LP_0000468` (E), `LP_0000469` (F), `LP_0000470` (G) und `LP_0000616` (H).

**6. Anforderungsbereiche** (`LP_0000802`)

- `LP_0000803` Anforderungsbereich 1: Reproduktion
- `LP_0000804` Anforderungsbereich 2: Reorganisation und Transfer
- `LP_0000805` Anforderungsbereich 3: Reflexion und Problemlösung

**7. Fremdsprachenniveaus** (`LP_0010001`)

- `LP_0030317` A1 Anfänger
- `LP_0030316` A2 Grundlegende Kenntnisse
- `LP_0030315` B1 Fortgeschrittene Sprachverwendung
- `LP_0030314` B2 Selbständige Sprachverwendung
- `LP_0030312` C1 Fachkundige Sprachkenntnisse
- `LP_0030313` C2 Annähernd muttersprachliche Kenntnisse

**8. Funktionsspezifikationen** (`LP_0000478`)

Die Funktionen, über die die länderspezifischen Klassen an die CE-Klassen angebunden sind (siehe [Designprinzip](#modellierung-designprinzip) und [Pattern 8](patterns.md#pattern-8-funktionen)):

| Funktionsart                | IRI          | Funktion                              |
|-----------------------------|--------------|---------------------------------------|
| Strukturierungsfunktion     | `LP_0000627` | Fragmentfunktion                      |
|                             | `LP_0000497` | Bereichsfunktion                      |
| Beschreibungsfunktion       | `LP_0000479` | Kompetenzbeschreibungsfunktion        |
|                             | `LP_0000480` | Lerninhaltsbeschreibungsfunktion      |
|                             | `LP_0001014` | Hinweisbeschreibungsfunktion          |
|                             | `LP_0002158` | Verweisbeschreibungsfunktion          |
|                             | `LP_0030326` | Leitperspektivenbeschreibungsfunktion |
|                             | `LP_0000481` | Materialbeschreibungsfunktion         |
| Bezugsfunktion              | `LP_0000500` | Prozessbezugsfunktion                 |
|                             | `LP_0000501` | Inhaltsbezugsfunktion                 |
|                             | `LP_0002171` | Domänenbezugsfunktion                 |
| Verbindlichkeit             | `LP_0000533` | Verbindlich                           |
|                             | `LP_0000532` | Optional                              |

**9. Schulfächer und Schularten**

Siehe [Schulfach-Ontologie](#schulfach-ontologie) und [Schulart-Ontologie](#schulart-ontologie).

**10. Einheiten** (`qudt:Unit`)

*Stunde* (`qudt:HR`), *Minute* (`qudt:MIN`) und *Unterrichtsstunde* (`LP_0000535`).

### Beziehungen (properties)

Die Tabelle listet die Object- und Datatype-Properties der Lehrplan-Ontologie sowie die nachgenutzten Relationen, die in den Lehrplandaten verwendet werden. Ein Strich bedeutet, dass keine Domain oder Range festgelegt ist.

**Struktur**

| Property                     | IRI           | Domain        | Range | Oberproperty / Inverse                      |
|------------------------------|---------------|---------------|-------|---------------------------------------------|
| **hat direkten Teil**        | `LP_0000565`  | –             | –     | Sub-Property von *hat Teil*; invers: *direkt Teil von* (`LP_0000566`) |
| **hat Teil**                 | `BFO_0000051` | –             | –     | transitiv; invers: *ist Teil von* (`BFO_0000050`) |
| **hat Position**             | `LP_0000460`  | –             | xsd:int | Reihenfolge eines Teils innerhalb seines Elternelements |
| **hat Verweis**              | `LP_0030071`  | –             | CE-Verweis | Sub-Property von *wird beschrieben von* |
| **verweist auf**             | `LP_0030072`  | CE-Verweis    | –     | Sub-Property von *beschreibt*               |
| **hat Funktion**             | `LP_0000483`  | –             | Funktionsspezifikation | Sub-Property von *wird beschrieben von*; invers: *ist Funktion von* (`LP_0000495`) |

**Bildungskontext**

| Property                     | IRI           | Domain        | Range | Oberproperty / Inverse                      |
|------------------------------|---------------|---------------|-------|---------------------------------------------|
| **von Bundesland**           | `LP_0000029`  | –             | Bundesland Bezeichnung | Sub-Property von *wird beschrieben von* |
| **für Schulart**             | `LP_0000812`  | –             | Schulart | Sub-Property von *wird beschrieben von* |
| **hat Schulfach**            | `LP_0000537`  | –             | Schulfach oder Schulfachbezug | Sub-Property von *wird beschrieben von* |
| **hat Jahrgangsstufe**       | `LP_0000026`  | –             | Jahrgangsstufe | Sub-Property von *wird beschrieben von* |
| **hat Schulstufe**           | `LP_0000047`  | –             | Schulstufe | Sub-Property von *wird beschrieben von* |
| **hat Oberstufensphase**     | `LP_0000556`  | –             | Oberstufenphase | Sub-Property von *wird beschrieben von* |
| **für Bildungsgangabschnitt** | `LP_0000440` | Lehrplan      | –     | Sub-Property von *wird beschrieben von*     |
| **konkretisiert Lehrplan**   | `LP_0000017`  | –             | Lehrplan | Sub-Property von *concretizes* (RO)      |

**Niveaus und Abschlüsse**

| Property                     | IRI           | Domain        | Range | Oberproperty / Inverse                      |
|------------------------------|---------------|---------------|-------|---------------------------------------------|
| **hat Bildungsgangniveau**   | `LP_0000833`  | Schulart, Curriculares Element, Lehrplan, Bildungsstandard (KMK) oder Bildungsgangspezifikation | Bildungsgangniveau | Sub-Property von *wird beschrieben von* |
| **hat Niveau**               | `LP_0000840`  | Schulart, Curriculares Element, Lehrplan oder Bildungsstandard (KMK) | Niveau | Sub-Property von *wird beschrieben von*; invers: *ist Niveau von* (`LP_0000086`) |
| **hat Niveaustufe**          | `LP_0000578`  | Curriculares Element | Niveaustufe BE/BB | Sub-Property von *wird beschrieben von*; invers: *ist Niveaustufe von* (`LP_0000580`) |
| **benötigt Niveau**          | `LP_0000071`  | –             | –     | Sub-Property von *wird beschrieben von*     |
| **ermöglicht Abschluss**     | `LP_0000021`  | –             | Schulabschlussspezifikation | Sub-Property von *wird beschrieben von* |
| **hat Schulartfunktion**     | `LP_0000343`  | –             | Schulartfunktion | Sub-Property von *has role* (RO); invers: *ist Schulartrolle von* (`LP_0000555`) |

**Text, Identifikation und Zeit**

| Property                     | IRI           | Domain        | Range | Oberproperty / Inverse                      |
|------------------------------|---------------|---------------|-------|---------------------------------------------|
| **hat Titel**                | `LP_0030056`  | Curriculares Element oder Lehrplan | Titel | Sub-Property von *wird beschrieben von* |
| **hat Beschreibung**         | `LP_0030051`  | Curriculares Element oder Lehrplan | Beschreibung | Sub-Property von *wird beschrieben von* |
| **hat Nummer**               | `LP_0030057`  | Curriculares Element | Identifikationsnummer | Sub-Property von *wird beschrieben von* |
| **uri**                      | `LP_0000463`  | –             | –     | URL des Originaldokuments beim Herausgeber  |
| **hat Gültigkeitsbereich**   | `LP_0000550`  | –             | Gültigkeitsbereich | Sub-Property von *wird beschrieben von* |
| **von Datum**                | `LP_0000548`  | Gültigkeitsbereich | xsd:dateTimeStamp | Sub-Property von *hat Wert* |
| **bis Datum**                | `LP_0000549`  | Gültigkeitsbereich | xsd:dateTimeStamp | Sub-Property von *hat Wert* |
| **veröffentlicht am**        | `LP_0000553`  | Lehrplan      | xsd:dateTimeStamp | Sub-Property von *hat Wert*  |
| **hat Wert**                 | `LP_0000344`  | –             | –     | allgemeine Datatype-Property für Werte      |
| **hat Einheit**              | `qudt:hasUnit` | –            | –     | aus QUDT                                    |

**Basisrelationen**

| Property                     | IRI           | Domain        | Range | Oberproperty / Inverse                      |
|------------------------------|---------------|---------------|-------|---------------------------------------------|
| **beschreibt**               | `IAO_0000136` | information content entity | – | invers: *wird beschrieben von* |
| **wird beschrieben von**     | `LP_0000024`  | –             | –     | invers: *beschreibt*; Oberproperty fast aller beschreibenden Properties |


## Mapping unterschiedlicher Terminologien der Länder

So wie sich die Bildungssysteme der Länder unterscheiden, variieren auch die Lehrpläne. Jedes Land strukturiert seine Lehrpläne auf eigene Weise und verwendet teilweise unterschiedliches Vokabular für gleiche oder ähnliche Konzepte. Auch innerhalb eines Landes unterscheiden sich Aufbau und Begriffe von Fach zu Fach. Hinzu kommen Besonderheiten einzelner Länder, etwa konkrete Unterrichtsbeispiele oder detaillierte Zeitvorgaben, die es in anderen Lehrplänen nicht gibt.

Bei der Analyse der Lehrpläne aller Länder – zunächst für die Fächer Deutsch, Mathematik, Englisch (bzw. erste Fremdsprache) und Physik (bzw. Sachunterricht oder Naturwissenschaften) – wurden die inhaltlichen Kernkomponenten identifiziert, die in nahezu allen Lehrplänen vorkommen. Sie bilden die generischen **Curricularen Elemente**. Die Begriffe der Länder werden diesen über ihre Funktion zugeordnet. Die folgende Tabelle zeigt, wie viele länderspezifische Klassen (einschließlich der Klassen der Bildungsstandards) in rc6 jeweils eine Funktion tragen, mit einigen Beispielen:

| Funktion                              | generische Klasse         |       Klassen | Beispiele                                                                   |
|---------------------------------------|---------------------------|--------------:|-----------------------------------------------------------------------------|
| Fragmentfunktion                      | CE-Fragment               | 16            | *Lehrplanfragment (BY)*, *Lehrplanfragment (HH)*                            |
| Bereichsfunktion                      | CE-Bereich                | 119           | *Lernbereich (BY)*, *Kompetenzbereich (HH)*, *Leitidee (BW)*, *Inhaltsfeld (HE)* |
| Kompetenzbeschreibungsfunktion        | CE-Kompetenzspezifikation | 73            | *Kompetenzerwartung (BY)*, *Standard (BE)*, *Anforderung (HH)*, *Lernziel (RP)* |
| Lerninhaltsbeschreibungsfunktion      | CE-Lerninhalt             | 82            | *Inhalt zu den Kompetenzen (BY)*, *Kerninhalt (NI)*, *Gegenstand (BE)*      |
| Hinweisbeschreibungsfunktion          | CE-Hinweis                | 91            | *Bemerkung (SN)*, *Hinweis und Anregung (MV)*, *Unterrichtsanregung (BE)*   |
| Verweisbeschreibungsfunktion          | CE-Verweis                | 47            | *Verweis auf vernetzte Kompetenzen (BE)*, *Verweis auf Basiskonzept (NW)*   |
| Leitperspektivenbeschreibungsfunktion | CE-Leitperspektive        | 12            | *Leitperspektive (HH)*, *Querschnittsthema (MV)*, *Bildungs- und Erziehungsziel (SN)* |
| Materialbeschreibungsfunktion         | –                         | 4             | *Lernmaterial (BE)*, *Zusatzmaterial (BB)*                                  |

Die Bezugsfunktionen (*Prozessbezug*, *Inhaltsbezug*, *Domänenbezug*) kommen bei einem Teil der Klassen als zweite Funktion hinzu und geben an, worauf sich ein Element inhaltlich bezieht – z. B. *Prozessbezogene Kompetenz (NI)* oder *Leitidee (BW)* mit Inhaltsbezug.

### Integration der Bildungsstandards

**Die Rolle der Kultusministerkonferenz (KMK) und die Nutzung ihrer Bildungsstandards in der Ontologie**

Die Kultusministerkonferenz (KMK) ist das zentrale Gremium der 16 Länder für Bildung, Wissenschaft und Kultur. Da das Bildungswesen Ländersache ist, sorgt die KMK dafür, dass wichtige Aspekte bundesweit abgestimmt sind – unter anderem durch gemeinsame Rahmenvorgaben, die Abstimmung von Schulabschlüssen und bundesweit verbindliche [Bildungsstandards](https://www.kmk.org/themen/qualitaetssicherung-in-schulen/bildungsstandards.html).

Für viele Bildungsstandards stellt das IQB (Institut zur Qualitätsentwicklung im Bildungswesen) [maschinenlesbare Daten](https://iqb-vocabs.github.io/vokabulare/bildungsstandards.html) bereit, etwa für Deutsch, Mathematik, die erste Fremdsprache (Englisch/Französisch) und die Naturwissenschaften (Biologie, Chemie, Physik).

In der Ontologie werden die Bildungsstandards nach demselben Prinzip wie die Lehrpläne der Länder modelliert:

- Die Klasse **Bildungsstandard (KMK)** (`LP_0000571`) entspricht dem Lehrplan auf Länderebene.
- **Element (Bista)** (`LP_0000536`) fasst die curricularen Elemente der Bildungsstandards zusammen, analog zu *Element (XX)* für die Länder.
- Eigene Klassen wie *Kompetenzbereich (Bistas)*, *Standard (Bistas)*, *Leitidee (Bista)* oder *Basiskonzept (Bistas)* tragen Funktionen wie die Länderklassen und werden so den CE-Klassen zugeordnet.
- Die Fächer der Bildungsstandards sind in der Klasse **BistaFach** zusammengefasst, die Niveaus als eigene Individuen wie *Grundschulniveau (Bista)* oder *Gymnasialniveau Sek II (Bista)*.

Die Elemente der Bildungsstandards dienen damit als Referenzpunkte, mit denen Lehrplanbestandteile der Länder verknüpft werden können.

Die Bildungsstandards beziehen sich allerdings auf ganze Bildungsabschnitte – das Ende der Primarstufe, den Ersten und Mittleren Schulabschluss sowie die Allgemeine Hochschulreife –, während die Lehrpläne meist nach Jahrgangsstufen gegliedert sind. Zudem gibt es Bildungsstandards nur für die genannten Fächer. Sie reichen daher nicht als gemeinsamer Nenner aller Lehrpläne, sind aber eine wichtige Referenzquelle.


## Ausblick auf die folgenden Kapitel

Dieses Kapitel hat den Aufbau der Lehrplan-Ontologie beschrieben: die ontologischen Grundannahmen, die Schichten vom Bildungskontext bis zu den Relationen, die Anbindung der länderspezifischen Begriffe an den gemeinsamen Kern über Funktionen sowie die nachgenutzten Ontologien und Vokabulare. Die folgenden Kapitel zeigen, wie dieses Modell in der Praxis verwendet wird:

- Das Kapitel [Patterns](patterns.md) veranschaulicht an konkreten Modellierungsmustern, wie Lehrpläne, curriculare Elemente, Niveaus und Zeitangaben in den Daten dargestellt werden.
- Das Kapitel [SPARQL-Abfragen](sparql.md) (SPARQL: SPARQL Protocol and RDF Query Language; RDF: Resource Description Framework) zeigt, wie die Lehrplandaten länderübergreifend abgefragt werden können, etwa über die Funktionen und die gemeinsamen Klassen.
- Das Kapitel [Verwendung](usage.md) beschreibt die verfügbaren Release-Dateien, den Zugriff auf die Daten und ihre Validierung.
