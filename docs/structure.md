# Lehrplan Ontologie


Ein Lehrplan ist ontologisch nicht als Dokument zu verstehen, sondern als **Informationsobjekt mit normativer Funktion**. Das Dokument (z. B. PDF, Webseite oder Buch) dient lediglich als Träger dieser Information.

Ein Lehrplan stellt eine strukturierte Informationseinheit dar, die eine systematische Zusammenstellung curricularer Elemente umfasst. Er legt verbindlich fest, welche Kompetenzen und Inhalte Schülerinnen und Schüler in einem bestimmten Fach, einer Jahrgangsstufe, einer Schulart oder einem Bildungsgang eines Bundeslandes erwerben sollen.

Ein Lehrplan ist immer spezifisch auf die Bildungspolitik eines Bundeslandes bezogen und unterscheidet sich von bundeslandübergreifenden Bildungsstandards, die von der Kultusministerkonferenz (KMK) verabschiedet werden und als Grundlage für die Entwicklung konkreter Lehrpläne in den Ländern dienen.

Neben den verbindlichen curricularen Vorgaben enthalten Lehrpläne häufig Hinweise zur didaktisch-methodischen Gestaltung des Unterrichts sowie Verweise auf fachübergreifende oder verwandte Kompetenzen und Inhalte. Je nach Bundesland werden hierfür unterschiedliche Bezeichnungen verwendet, beispielsweise *Bildungsplan*, *Fachanforderungen*, *Kerncurriculum*, *Kernlehrplan*, *LehrplanPLUS*, *Rahmenlehrplan* oder *Rahmenplan*.

Ein Lehrplan bezieht sich auf den Lehrprozess, den Lernprozess, die Kompetenzentwicklung sowie die Leistungsbewertung. Er beschreibt jedoch nicht den tatsächlich stattfindenden Unterricht, sondern spezifiziert, wie Lehr- und Lernprozesse idealerweise gestaltet werden sollen, um die angestrebten Bildungsziele zu erreichen.

Ontologisch kann ein Lehrplan daher als **Prozessspezifikation** verstanden werden. Er enthält Informationen darüber, welche Prozesse stattfinden sollen, unter welchen Bedingungen sie ablaufen und welche Ergebnisse beziehungsweise Zielzustände angestrebt werden. Der tatsächlich durchgeführte Unterricht ist demgegenüber als **Instanz** eines solchen spezifizierten Prozesses zu verstehen.

Aus ontologischer Sicht müssen **Lehrprozess** und **Lernprozess** klar voneinander unterschieden werden. Der Lehrprozess ist ein didaktischer Prozess, der durch Lehrpersonen oder das Bildungssystem initiiert und gestaltet wird. Der Lernprozess hingegen findet innerhalb der lernenden Person statt und umfasst die kognitiven und motivationalen Vorgänge, die zum Erwerb neuer Fähigkeiten und Kenntnisse führen. Der Lehrprozess kann den Lernprozess unterstützen und beeinflussen, bestimmt ihn jedoch nicht vollständig.

Das Ergebnis eines erfolgreichen Lernprozesses kann der Erwerb einer neuen **Kompetenz** sein. Ontologisch ist eine Kompetenz kein Informationsobjekt, sondern eine Disposition beziehungsweise Fähigkeit eines Akteurs, in einer Klasse von Situationen erfolgreich zu handeln. Kompetenzen existieren somit als Eigenschaften beziehungsweise Dispositionen der lernenden Person.

Der Lehrplan enthält die Kompetenzen selbst nicht, sondern beschreibt sie in Form von **Kompetenzspezifikationen**. Eine Kompetenzspezifikation ist wiederum ein Informationsobjekt, das eine Kompetenz hinsichtlich ihres Inhalts, ihres Anwendungsbereichs sowie gegebenenfalls ihres angestrebten Niveaus präzisiert. Kompetenzspezifikationen sind Bestandteil des Lehrplans und dienen dazu, die angestrebten Lernergebnisse eindeutig zu beschreiben.

Die ontologische Modellierung trennt somit konsequent zwischen **realweltlichen Entitäten** (Akteure, Prozesse und Kompetenzen) und **Informationsobjekten** (Lehrplan, Kompetenzspezifikationen, Lernziele oder Bewertungsmaßstäbe). Dadurch wird deutlich, dass ein Lehrplan weder Kompetenzen noch Lernprozesse selbst enthält, sondern deren intendierte Ausgestaltung sowie die Beziehungen zwischen ihnen beschreibt. Diese Unterscheidung bildet die Grundlage für eine ontologisch konsistente Repräsentation von Lehrplanwissen.


## Aufbau und Struktur der Lehrplan Ontologie

Aus den beschriebenen ontologischen Überlegungen ergeben sich die Anforderungen an die Modellierung der Lehrplan-Ontologie. Ziel der Ontologie ist es, die zentralen Konzepte des deutschen Lehrplansystems sowie ihre Beziehungen formal und maschineninterpretierbar abzubilden. Dabei werden sowohl die semantischen Eigenschaften eines Lehrplans als normatives Informationsobjekt als auch die strukturellen Besonderheiten der Lehrpläne der einzelnen Bundesländer berücksichtigt.

Die Lehrplan-Ontologie ist als OWL-Ontologie implementiert und gliedert sich in fünf konzeptionelle Schichten. Diese Schichten bilden unterschiedliche Aspekte des Lehrplansystems ab – vom institutionellen Bildungskontext über die curriculare Struktur bis hin zu den Beziehungen zwischen den einzelnen Elementen.

### 1. Bildungskontext:  Schule, Fach und Bundesland
(Wo gilt der Lehrplan?)

* Bundesland
* Schulart
* Schulfach

Die erste Schicht der Lehrplan-Ontologie beschreibt den **institutionellen Geltungsbereich** eines Lehrplans. Sie modelliert den Bildungskontext, in dem ein Lehrplan Anwendung findet, und beantwortet die Frage, **für welches Bundesland, welche Schulart und welches Schulfach** ein Lehrplan gilt.

Die Klasse **Schulfach** (`LP_0000001`) bildet die Wurzelklasse aller Unterrichtsfächer und wird in Subklassen wie **MINT-Fach**, **Naturwissenschaftsfach**, **Fremdsprachenfach** und **Gesellschaftswissenschaftsfach** untergliedert. Ergänzend beschreibt die Klasse **Schulfachbezug** (`LP_0000540`) die Stellung eines Faches innerhalb eines Bildungsgangs, beispielsweise als Pflichtfach, Wahlpflichtfach oder erste, zweite beziehungsweise dritte Fremdsprache.

Die Klasse **Schulart** (`LP_0000111`) modelliert den Schultyp (z. B. Gymnasium oder Gesamtschule). Ergänzend beschreibt die Klasse **Bildungsgang** (`LP_0000816`) den schulischen Bildungsweg einer Schülerin oder eines Schülers. Sie umfasst unter anderem die Subklassen **Gymnasialer Bildungsgang**, **Hauptschulbildungsgang** und **Realschulbildungsgang**.

Der föderale Charakter des deutschen Bildungssystems wird durch die Klasse **Bundesland Bezeichnung** (`LP_0000040`) abgebildet. Die 16 deutschen Bundesländer sind als Individuen dieser Klasse modelliert und dienen der eindeutigen Zuordnung jedes Lehrplans zu seinem jeweiligen Geltungsbereich.


### 2. Curriculare Elemente als semantischer Kern der Ontologie

(Was beschreibt der Lehrplan?)

* Lehrplan
* Fragmente
* Bereiche
* Kompetenzspezifikationen
* Lerninhalte
* Hinweise

Die umfangreichste Schicht der Ontologie ist die Klasse **Curriculares Element** (`LP_0000261`). Sie ist der generische Oberbegriff für alle inhaltlichen Bausteine eines Lehrplans. Da die 16 Bundesländer ihre Lehrpläne strukturell sehr unterschiedlich aufgebaut haben, wird dies durch die Ontologie durch ein zweistufiges Muster harmonsiert:

Generische Superklassen fassen ähnliche Konzepte bundeslandübergreifend zusammen:

- **CE-Fragment** (`LP_0001015`): Abschnitte und Kapitel eines Lehrplans, die selbst keine inhaltliche Semantik tragen, aber Struktur geben – entspricht in jedem Bundesland dem länderspezifischen „Lehrplanfragment": Lehrplanfragment (BE), Lehrplanfragment (BY), Lehrplanfragment (HH), Lehrplanfragment (SN) usw.
- **CE-Bereich** (`LP_0000349`): Inhaltlich gegliederte Bereiche wie Kompetenzbereiche, Lernbereiche, Leitideen oder Themenfelder. Subklassen hiervon sind z.B. Kompetenzbereich (BE/HH/RP/SN/NW), Lernbereich (BY/SN/NI), Leitidee (BE/BW/HH/RP), Thema und Themenfeld in verschiedenen Ländervarianten sowie Inhalt (HH) oder Inhaltsfeld (HE/NW).
- **CE-Kompetenzspezifikation** (`LP_0000263`): Beschreibt Kompetenzen und Anforderungen, z.B. Anforderung/Mindestanforderung (HH), Kompetenzerwartung (BY), Kompetenz (RP), Standard (BE), Lernziel und Lerninhalt (SN).
- **CE-Lerninhalt** (`LP_0000332`): Inhaltliche Lerngegenstände.
- **CE-Hinweis** (`LP_0000852`): Didaktische Hinweise und Anmerkungen.

**Länderspezifische Lehrpläne** sind Subklassen von Lehrplan (`LP_0000438`): LehrplanPLUS (BY), Lehrplan (SN/RP/SL/ST/TH), Bildungsplan (BW/HH/HB), Rahmenlehrplan (BB), Kerncurriculum (NI/HE), Kernlehrplan (NW), Fachanforderung (SH), Rahmenplan (MV).

### 2. Curriculare Elemente als semantischer Kern der Ontologie

Die Klasse **Curriculares Element** (`LP_0000261`) bildet den semantischen Kern der Lehrplan-Ontologie. Sie dient als generische Oberklasse für alle inhaltlichen Bausteine eines Lehrplans und ermöglicht eine einheitliche Repräsentation curricularer Strukturen über alle Bundesländer hinweg.

Eine besondere Herausforderung besteht darin, dass die Lehrpläne der 16 Bundesländer unterschiedliche Terminologien und Strukturierungsprinzipien verwenden. Inhaltlich vergleichbare Konzepte werden häufig unterschiedlich benannt oder auf verschiedene Weise gegliedert. Die Ontologie begegnet dieser Heterogenität durch ein zweistufiges Modellierungsmuster: Auf einer abstrakten Ebene werden bundeslandübergreifende generische Klassen definiert, während die jeweiligen landesspezifischen Ausprägungen als Subklassen dieser generischen Konzepte modelliert werden. Dadurch bleiben sowohl die semantische Vergleichbarkeit als auch die länderspezifischen Besonderheiten erhalten.

Die wichtigsten generischen Klassen sind:

* **CE-Fragment** (`LP_0001015`): Modelliert strukturelle Bestandteile eines Lehrplans, beispielsweise Kapitel oder Abschnitte. Diese Elemente besitzen selbst keine fachliche Bedeutung, dienen jedoch der hierarchischen Gliederung eines Lehrplans. Länderspezifische Klassen wie *Lehrplanfragment (BE)*, *Lehrplanfragment (BY)* oder *Lehrplanfragment (HH)* sind jeweils Subklassen dieses generischen Konzepts.

* **CE-Bereich** (`LP_0000349`): Repräsentiert fachlich strukturierende Bereiche eines Lehrplans. Hierzu gehören beispielsweise Kompetenzbereiche, Lernbereiche, Leitideen, Themen oder Themenfelder. Entsprechende landesspezifische Klassen – etwa *Kompetenzbereich* (BE/HH/RP/SN/NW), *Lernbereich* (BY/SN/NI), *Leitidee* (BE/BW/HH/RP), *Thema*, *Themenfeld*, *Inhalt* (HH) oder *Inhaltsfeld* (HE/NW) – werden als Spezialisierungen dieser Oberklasse modelliert.

* **CE-Kompetenzspezifikation** (`LP_0000263`): Beschreibt die im Lehrplan formulierten Kompetenzanforderungen. Hierzu zählen unter anderem *Kompetenzerwartungen* (BY), *Standards* (BE), *Anforderungen/Mindestanforderungen* (HH), *Lernziele/Lerninhalt* (SN)  oder andere landesspezifische Formen der Kompetenzbeschreibung.

* **CE-Lerninhalt** (`LP_0000332`): Modelliert die fachlichen Inhalte und Lerngegenstände, die Gegenstand des Unterrichts sind.

* **CE-Hinweis** (`LP_0000852`): Umfasst ergänzende Informationen wie didaktische, methodische oder organisatorische Hinweise.

Auch die Lehrpläne selbst werden auf einer gemeinsamen abstrakten Ebene modelliert. Die Klasse **Lehrplan** (`LP_0000438`) bildet die generische Oberklasse, deren Subklassen die unterschiedlichen Bezeichnungen der Bundesländer repräsentieren. Hierzu gehören unter anderem **LehrplanPLUS** (BY), **Bildungsplan** (BW, HH, HB), **Kerncurriculum** (NI, HE), **Kernlehrplan** (NV), **Rahmenlehrplan** (BE/BB), **Rahmenplan** (MV), **Fachanforderung** (SH) sowie die in mehreren Bundesländern verwendete Bezeichnung **Lehrplan**.



### 3. Zeitliche und stufenbezogene Einordnung

(Wann gilt etwas?)

* Jahrgang
* Schulstufe
* Abschluss

**Jahrgangsstufe** (`LP_0000009`) und **Schulstufe** (`LP_0000020`) strukturieren den zeitlichen Verlauf von Bildungsgängen. Die Schulstufe differenziert sich insbesondere in **Einführungsphase**, **Qualifikationsphase** und **Oberstufenphase** und bildet damit größere zeitliche Abschnitte schulischer Bildung ab.

Die Klasse **Schulabschluss** (`LP_0000019`) modelliert die erreichbaren Bildungsabschlüsse eines Bildungsgangs, darunter die **Allgemeine Hochschulreife**, das **Fachabitur**, der **Mittlere Schulabschluss** sowie der **Erste Schulabschluss**. Diese Abschlussformen werden in der Ontologie zusätzlich in länderspezifischen Subklassen konkretisiert, beispielsweise als *Allgemeine Hochschulreife (HH)* oder *Mittlerer Abschluss (SN)*.


### 4. Niveau-System

(Für welches Anspruchsniveau gilt etwas?)

* Bildungsgangniveau
* Fachniveau
* Fremdsprachenniveau

Die wichtigsten Subklassen sind das **Bildungsgangniveau** (`LP_0000028`), das grundlegende schulische Leistungsprofile beschreibt, beispielsweise das Gymnasialniveau der Sekundarstufe I, das Hauptschulniveau, das Realschulniveau sowie das Gymnasialniveau der Sekundarstufe II. Ergänzend hierzu modelliert das **Fachniveau Sek II** (`LP_0000265`) die kursbezogenen Anforderungsniveaus der gymnasialen Oberstufe, insbesondere Grundkurse und Leistungskurse sowie deren länderspezifische Ausprägungen.

Darüber hinaus existieren für die einzelnen Bundesländer spezifische Subklassen des Niveaubegriffs, da sowohl Terminologie als auch Zuordnung zu Abschlüssen föderal unterschiedlich ausgestaltet sind. Beispiele hierfür sind etwa die in Berlin verwendeten Niveaus BOA, BBR, EBBR und MSA.

Die Instanzen der Klasse **Fremdsprachenniveau** ('LP_0010001') geben an, in welchem Umfang Lernende die Sprache verstehen, sprechen, lesen und schreiben können, und dient als Vergleichsgrundlage innerhalb von Bildungsabschlüssen und internationalen Qualifikationen.

### 5. Relationen und Funktionen

(Wie hängen alle Elemente zusammen?)

hat Teil
hat Jahrgang
hat Fach
von Bundesland
hat Beschreibung
hat Funktionen


Die Ontologie verwendet eine Kombination aus Properties der BFO-basierten **Relation Ontology** sowie eigens definierter Relations- und Datentyp-Properties, die entsprechend als Sub-Properties dieser Basismodellierung eingeordnet sind. Dadurch wird eine konsistente Anbindung an etablierte ontologische Standards gewährleistet und zugleich die domänenspezifische Modellierung des Lehrplansystems ermöglicht.

Die wichtigsten Properties sind:

* **`bfo:BFO_0000051` (hat Teil)**: Zentrale mereologische Relation zur Abbildung von Teil-Ganzes-Strukturen. Sie modelliert die hierarchische Gliederung von Lehrplänen in Fragmente, Bereiche und Kompetenzelemente.

* **`LP_0000029` (von Bundesland)**: Verknüpft jeden Lehrplanknoten mit dem jeweiligen Bundesland als Geltungsbereich.

* **`LP_0000026` (hat Jahrgangsstufe)**: Ordnet curricularen Elementen spezifische Jahrgangsstufen zu und verankert sie damit im zeitlichen Verlauf des Bildungsgangs.

* **`LP_0000833` (hat Bildungsgangniveau)**: Gibt das für ein Element relevante Bildungsgang- bzw. Leistungsniveau an.

* **`LP_0000537` (hat Schulfach)** und **`LP_0000812` (für Schulart)**: Stellen die fachliche und institutionelle Einbettung der Lehrplanknoten sicher, indem sie diese mit Schulfach und Schulart verknüpfen.

* **`LP_0000021` (ermöglicht Abschluss)**: Modelliert die Beziehung zwischen Bildungsgängen und den jeweils erreichbaren Schulabschlüssen.

* **`LP_0030051` / `LP_0030056` / `LP_0030057` (hat Beschreibung / Titel / Nummer)**: Metadaten-Properties zur Repräsentation textueller und identifizierender Informationen curricularer Elemente.

Ergänzt wird dieses Relationsmodell durch das Konzept der **Schulartfunktion** (`LP_0000475`) sowie die zugehörige **Funktionsspezifikation** (`LP_0000478`). Diese umfasst unter anderem die Subklassen **Strukturierungsfunktion**, **Beschreibungsfunktion**, **Bezugsfunktion** und **Niveauspezifikationsfunktion**. Damit kann jedem curricularen Element explizit eine funktionale Rolle innerhalb des Lehrplans zugewiesen werden, etwa ob es strukturierende, beschreibende, referenzierende oder niveauspezifizierende Aufgaben erfüllt.

Weitere Informationen zur Struktur und Modellierung der Lehrplan-Ontologie befinden sich im Kapitel [Beispiele](https://fwu-de.github.io/lehrplan-ontologie/docs/patterns/).


---

## Modellierung / Designprinzip

Das Grundprinzip der Ontologie lässt sich so zusammenfassen: **Eine gemeinsame Abstraktion, viele länderspezifische Konkretisierungen.** Alle 16 Bundesländer nutzen dieselben generischen Klassen (Lehrplan, CE-Fragment, CE-Bereich, CE-Kompetenzspezifikation) und Properties (hat Teil, hat Jahrgangsstufe, hat Bildungsgangniveau), erhalten aber jeweils eigene Subklassen, die die lokale Terminologie bewahren. So kann die Ontologie sowohl bundeslandübergreifende Suchen (z.B. „alle Kompetenzbereiche zu Thema X in allen Ländern") als auch länderspezifische Auswertungen (z.B. „alle Lernbereiche im LehrplanPLUS Bayern") präzise ermöglichen.

Die Ontologie ist **modular** aufgebaut: Die Strukturen und Inhalte jedes Bundeslandes werden in eigenen, voneinander getrennten Ontologien erfasst und durch eine übergeordnete **Kern-Ontologie (Core)** zusammengeführt. Diese Kern-Ontologie enthält diejenigen Elemente und Funktionen, die in allen Bundesländern grundsätzlich vorhanden sind – auch dann, wenn sie dort unterschiedliche Bezeichnungen, Strukturen oder Ausprägungen haben.

Um Lehrpläne bundesländerübergreifend gemeinsam durchsuchbar zu machen, ohne dabei die individuellen Begrifflichkeiten oder Modellierungen der Länder zu verändern, übernimmt die Kern-Ontologie eine verbindende Rolle: Sie definiert gemeinsame Funktionen und Beziehungstypen, über die die jeweiligen Landes-Elemente eindeutig zugeordnet und in ein gemeinsames semantisches System integriert werden.

Ein vereinfachtes Beispiel:

Viele Bundesländer verwenden für ein ähnliches inhaltliches Element – etwa eine Kompetenzbeschreibung – unterschiedliche Begriffe oder Strukturformen. Die Kern-Ontologie weist diesen Elementen eine gemeinsame funktionale Rolle zu, z. B. eine bestimmte Art von Kompetenzbeschreibung. Dadurch können die unterschiedlichen Landesmodelle eindeutig miteinander verknüpft werden. Auf dieser Grundlage werden einheitliche Abfragen möglich, obwohl die Datenstrukturen der Lehrpläne selbst nicht vereinheitlicht werden müssen.

Der modulare Aufbau und die Vernetzung über die Kern-Ontologie ermöglicht es perspektivisch, dass die Länder ihre Ontologien selbst verwalten, warten und anpassen können, ohne dass dadurch die Lehrplan-Ontologien der anderen Länder betroffen werden.

```d2
BW: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

BY: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

BE: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

Kern-Ontologie: {
  style: {
    font-color: white
    opacity: 1
    fill: "#9F0E21"
    stroke: white
  }
}

Kern-Ontologie -> BY: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

Kern-Ontologie -> BW: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

Kern-Ontologie -> BE: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

```

Zu den bereits erwähnten Kernelementen (s.o. *Curriculare Elemente*) gehören beispielsweise der Lehrplan, der als gedankliche Klammer vielfältige Lehrplan-Fragmente (*CE-Fragment*) umfasst. Solche Lehrplan-Fragmente sind als ordnende Elemente zu verstehen, die wiederum Kompetenzbereiche oder Themenfelder unter sich haben können. Kompetenzbereiche und Themenfelder können abermals jeweils Kompetenzbereiche oder Themenfelder untergeordnet haben, die auf unterster Ebene aber immer eine Kompetenzspezifikation oder einen Lerninhalt haben. 

Beispielhafter Aufbau von Lehrplänen dargestellt mit unseren Kern-Elementen:

```d2
CE-Fragment 1: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Fragment 2: {
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

CE-Kompetenzspezifikation: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Lerninhalt: {
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

Lehrplan -> CE-Fragment 1: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

Lehrplan -> CE-Fragment 2: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

CE-Fragment 1 -> CE-Bereich 1: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

CE-Fragment 2 -> CE-Bereich 2: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

CE-Bereich 1 -> CE-Kompetenzspezifikation: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

CE-Bereich 2 -> CE-Lerninhalt: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}
```

```d2

CE-Fragment: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Bereich: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Kompetenzspezifikation: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Lerninhalt: {
  style: {
    stroke: "#9F0E21"
    stroke-width: 5
    font-color: "#9F0E21"
  }
}

CE-Hinweis: {
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

Lehrplan -> CE-Fragment: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

CE-Fragment -> CE-Bereich: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

CE-Bereich -> CE-Kompetenzspezifikation: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

CE-Bereich -> CE-Lerninhalt: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}

CE-Lerninhalt -> CE-Hinweis: {
  style: {
    stroke: "#9F0E21"
    opacity: 0.4
    stroke-width: 3
  }
}


```

Ein Lehrplan in der Kern-Ontologie setzt sich so abstrakt aus einer Abfolge verschiedener Lehrplanfragmente zusammen, die untereinander vernetzt werden können. Beispielsweise kann sich eine Kompetenzspezifikation auf einen bestimmten Lerninhalt beziehen, mit anderen Kompetenzspezifikationen oder auch mit Lehr- und Lernmaterialien verknüpft werden.


## Nachgenutzte Ontologien/Vokabulare

**BFO**

Top-Level-Ontologien sind allgemeine, abstrakte Ontologien, die grundlegende Kategorien und Beziehungen definieren, die für viele verschiedene Domänen anwendbar sind. Sie bieten eine einheitliche Struktur, um spezifische Ontologien miteinander zu verbinden und zu integrieren.

Die Basic Formal Ontology (BFO) ist eine solche Top-Level-Ontologie, die zwischen Continuants (Dinge, die über die Zeit bestehen, z. B. Objekte) und Occurrents (Prozesse, die sich über die Zeit erstrecken) unterscheidet. Sie wird insbesondere in den Lebenswissenschaften und der Technik eingesetzt, um Forschungsdaten systematisch zu organisieren.

Die Nutzung einer Top-Level-Ontologie wie BFO ist sinnvoll, weil sie eine konsistente und interoperable Grundlage für verschiedene Ontologien schafft. Dies erleichtert die Datenintegration, Wiederverwendbarkeit und semantische Interoperabilität zwischen verschiedenen Systemen und Disziplinen.

**Die Schulfach-Ontologie**

Die Schulfach-Ontologie (`https://w3id.org/schulfach/1.0.0`) ist ein kontrolliertes Vokabular für die Unterrichtsfächer aller 16 deutschen Bundesländer. Der Graph enthält genau **16 SKOS-ConceptSchemes** – eines pro Bundesland (z.B. `Schulfächer (Hamburg)`, `Schulfächer (Bayern)`) – und darin insgesamt 894 **Schulfach-Individuen**, die jeweils als Instanz von `LP_0000001 (Schulfach)` und `skos:Concept` typisiert sind. Jedes Fach ist über `LP_0000029 (von Bundesland)` an sein Bundesland gebunden und trägt ein `rdfs:label` mit dem länderspezifischen Fachnamen – denn derselbe Lehrgegenstand heißt in verschiedenen Ländern unterschiedlich (z.B. „Sachkunde" vs. „Heimat- und Sachkunde" vs. „Mensch-Natur-Technik").

Für die **Interoperabilität** über Ländergrenzen hinweg werden SKOS-Mapping-Properties genutzt: `skos:exactMatch` und `skos:closeMatch` verlinken länderspezifische Fächer sowohl untereinander als auch mit dem bundesweiten **KIM-Schulfachvokabular** (`w3id.org/kim/schulfaecher`), das als gemeinsamer Referenzpunkt dient. So lässt sich z.B. `HH:Deutsch` über `exactMatch` mit `BY:Deutsch` und dem KIM-Konzept `s1005 (Deutsch)` verknüpfen, ohne die länderspezifischen Bezeichnungen aufzugeben.

Repository: https://github.com/FWU-DE/schulfach-ontologie 

SKOS-Vokabular: https://fwu-de.github.io/mem-skos-vocabs/ 

**Die Schulart-Ontologie**

Die Schulart-Ontologie (`https://w3id.org/schulart/1.0.0`) folgt demselben Grundmuster, ist aber inhaltlich dichter: Auch hier gibt es **16 SKOS-ConceptSchemes** (eines pro Bundesland) mit 89 **Schulart-Individuen** (`LP_0000111 Schulart` + `skos:Concept`). Daneben enthält der Graph aber noch wesentlich mehr: Die Schularten sind direkt mit ihren **Bildungsgangniveaus** verknüpft (via `LP_0000833 (hat Bildungsgangniveau)`) und tragen damit bereits die Information, welche Leistungsniveaus an einer Schulart vergeben werden können.
Am Hamburger Beispiel wird das deutlich: Das **Gymnasium** (`HH_0000003`) hat die Niveaus `Gymnasialniveau Sek I (HH)` und `Studienstufenniveau (HH)` (welche die Sekundarstufe I und II auf dem gymnasialen Niveau abdecken), während die **Stadtteilschule** (`HH_0000002`) gleich fünf Niveaus führt – von Mindestanforderungen bis hin zu Erhöhten Anforderungen. Diese Verknüpfung macht die Schulart-Ontologie zum Bindeglied zwischen Schulart, Bildungsgangniveau und den Anforderungen in den Lehrplandaten: Ein Lehrplan-Element, das über `LP_0000833 (hat Bildungsgangniveau)` auf ein bestimmtes Niveau zeigt, lässt sich so direkt zur passenden Schulart zuordnen und umgekehrt.

Repository: https://github.com/FWU-DE/schulart-ontologie 

**time ontology**

...

**relation ontology**

...

**information artefact ontology**

...

**SKOS**

...

**KIM-Vokabulare**

...

## Überblick über Klassen, Beziehungen, Hierarchien

### Klassen

**Klassen, die den Lernprozess beschreiben:**

Hierarchische Übersicht: 

- independant continuant (BFO)
    - material entity (BFO)
        - object (BFO)
            - Person
        - Organisation (BFO)
            - Schule
            - Schulklasse
- specifically dependent continuant (BFO)
    - realizable entity (BFO)
        - disposition (BFO)
            - function (BFO)
                - Schulartfunktion
            - Kompetenz
        - role (BFO)
            - Schüler Rolle
            - Lehrer Rolle
- process (BFO)
    - Lehrprozess
    - Lernprozess


**Klassen, die das Bildungssytem beschreiben:**

Hierarchische Übersicht: 

- generically dependent continuant (BFO)
    - information content entity (Informationseinheit) (BFO)
        - Schulfach
        - Schulart
        - Schulstufe
        - Jahrgangsstufe
        - Oberstufenphase
        - Niveau 
            - Bildungsgangniveau
            - Fachniveaus Sek II
            - Fremdsprachenniveau
- process (BFO)
    - Bildungsgang
        - Gymnasialer Bildungsgang
        - Hauptschulbildungsgang
        - Realschulbildungsgang
- process boundary (BFO)
    - Schulabschluss
        - Erster Schulabschluss
        - Mittlerer Schulabschluss
        - Allgemeine Hochschulreife

**Klassen, die die Lehrpläne beschreiben:**

Hierarchische Übersicht: 

- information content entity (Informationseinheit) (BFO)
    - Lehrplan
    - Curriculares Element
        - CE-Fragment
        - CE-Bereich
        - CE-Kompetenzspezifikation
        - CE-Lerninhalt
        - CE-Hinweis
        - CE-Verweis
        - CE-Leitperspektive
    - Funktionsspezifikation
        - Beschreibungsfunktion
        - Strukturierungsfunktion
    - symbol (BFO)
        - Identifikationsnummer
    - textual entity (BFO)
        - Titel
        - Beschreibung
    - data item (BFO)
        - Zeitspezifikation
    - Unit 

Genaue **Definitionen** der einzelnen Klassen sind [hier](https://fwu-de.github.io/lehrplan-ontologie/index-de.html) zu finden. 

### Instanzen (individuals)

Die Individuen der Ontologie lassen sich in thematische Gruppen gliedern. Im Gegensatz zu den Klassen – die abstrakte Konzepte beschreiben – sind Individuen die konkreten Instanzen, auf die in den Lehrplandaten direkt per IRI verwiesen wird.

**1. Bundesländer (`LP_0000040`)**

Die 16 deutschen Bundesländer als fest definierte Individuen. Jedes Lehrplanelement trägt über `von Bundesland` eine dieser IRIs.

- `LP_3000049` Baden-Württemberg
- `LP_3000051` Bayern
- `LP_3000048` Berlin
- `LP_3000057` Brandenburg
- `LP_3000056` Bremen
- `LP_3000045` Hamburg
- `LP_3000050` Hessen
- `LP_3000052` Mecklenburg-Vorpommern
- `LP_3000043` Niedersachsen
- `LP_3000044` Nordrhein-Westfalen
- `LP_3000046` Rheinland-Pfalz
- `LP_3000055` Saarland
- `LP_3000047` Sachsen
- `LP_3000053` Sachsen-Anhalt
- `LP_3000054` Schleswig-Holstein
- `LP_3000031` Thüringen

**2. Jahrgangsstufen (`LP_0000009`)**

13 bundeslandunabhängige Individuen für die Jahrgänge 1–13. Alle Lehrplaninhalte referenzieren dieselben IRIs, was die länderübergreifende Vergleichbarkeit nach Jahrgangsstufe ermöglicht.

- LP_2000001 (Jahrgangsstufe 1) bis LP_2000013 (Jahrgangsstufe 13)

**3. Schulstufen (`LP_0000020`)**

Individuen, die mehrere Jahrgangsstufen zu pädagogischen Abschnitten bündeln:

- `LP_0000036` Primarbereich
- `LP_0000045` Sekundarbereich I
- `LP_0000046` Sekundarbereich II
- `LP_0000051` G8 Einführungsphase
- `LP_0000050` G8 Qualifikationsphase
- `LP_0000055` G9 Einführungsphase
- `LP_0000052` G9 Qualifikationsphase

**4. Bildungsgangniveaus (`LP_0000028`, Auswahl)**

Die fünf bundeslandunabhängigen Superklassen-Niveaus, von denen alle länderspezifischen Niveaus erben. Sie ermöglichen länderübergreifende Abfragen auf generischem Anspruchsniveau.

- `LP_0000073` – Grundschulniveau
- `LP_0000074` – Hauptschulniveau
- `LP_0000075` – Realschulniveau
- `LP_0000069` – Gymnasialniveau Sek I
- `LP_0000835` – Gymnasialniveau Sek II

Länderspezifische Beispiele:

- `LP_0000025` – Mittelschulniveau (BY) → Hauptschulniveau
- `LP_0000030` – Realschulniveau (BY) → Realschulniveau
- `LP_0000023` – Gymnasialniveau Sek I (BY) → Gymnasialniveau Sek I
- `LP_0000279` – Gymnasialniveau Sek I (SN) → Gymnasialniveau Sek I
- `LP_0000294` – Oberschulniveau (SN) → Realschulniveau
- `LP_0000143` – Erhöhtes Kompetenzniveau (RP) → Gymnasialniveau Sek I
- `LP_0000147` – Grundlegendes Kompetenzniveau (RP) → Hauptschulniveau
- `LP_0000093` – Erhöhte Anforderungen (HH) → Gymnasialniveau Sek I
- `LP_0000014` – E Niveau (BW) → Gymnasialniveau Sek I
- `LP_0000016` – G Niveau (BW) → Hauptschulniveau

**5. Niveaustufen BE/BB (`LP_0000443`)**

Die acht buchstabenbasierten Kompetenzstufen des gemeinsamen Berliner/Brandenburger Rahmenlehrplans:

- `LP_0000464` – Niveaustufe A 
- `LP_0000465` – Niveaustufe B 
- `LP_0000466` – Niveaustufe C 
- `LP_0000467` – Niveaustufe D 
- `LP_0000468` – Niveaustufe E 
- `LP_0000469` – Niveaustufe F 
- `LP_0000470` – Niveaustufe G 
- `LP_0000616` – Niveaustufe H 

**6. Anforderungsbereiche (`LP_0000802`)**

Drei bundesweit einheitliche KMK-Individuen zur Klassifizierung des kognitiven Anspruchs:

- `LP_0000803` – Anforderungsbereich 1: Reproduktion
- `LP_0000804` – Anforderungsbereich 2: Reorganisation und Transfer
- `LP_0000805` – Anforderungsbereich 3: Reflexion und Problemlösung

**7. Fremdsprachenniveaus (`LP_0010001`)**

Sechs GER-Stufen als bundeslandunabhängige Individuen:

- `LP_0030317` – A1 (Anfänger)
- `LP_0030316` – A2 (Grundlegende Kenntnisse)
- `LP_0030315` – B1 (Fortgeschrittene Sprachverwendung)
- `LP_0030314` – B2 (Selbständige Sprachverwendung)
- `LP_0030312` – C1 (Fachkundige Sprachkenntnisse)
- `LP_0030313` – C2 (Annähernd muttersprachliche Kenntnisse)

**8. Funktionsspezifikations-Individuen**

Die Individuen, die als OWL-Restriktionen in den Klassendefinitionen aller länderspezifischen CE-Klassen verankert sind und ihre semantische Rolle maschinenlesbar machen. Sie sind das zentrale Werkzeug für länderübergreifende Abfragen. (s. *Mapping unterschiedlicher Terminologien der Bundesländer* in Kapitel [Ontologie-Modell](https://fwu-de.github.io/lehrplan-ontologie/docs/structure/#mapping-unterschiedlicher-terminologien-der-bundeslander) oder *Pattern 8 - Funktionen* in Kapitel [Patterns](https://fwu-de.github.io/lehrplan-ontologie/docs/patterns/#pattern-8-funktionen))

Strukturierungsfunktionen:

- `LP_0000627` – Fragmentfunktion
- `LP_0000497` – Bereichsfunktion

Beschreibungsfunktionen:

- `LP_0000479` – Kompetenzbeschreibungsfunktion
- `LP_0000480` – Lerninhaltsbeschreibungsfunktion
- `LP_0001014` – Hinweisbeschreibungsfunktion
- `LP_0002158` – Verweisbeschreibungsfunktion
- `LP_0030326` – Leitperspektivenbeschreibungsfunktion

Bezugsfunktionen:

- `LP_0000500` – Prozessbezugsfunktion
- `LP_0000501` – Inhaltsbezugsfunktion
- `LP_0002171` – Domänenbezugsfunktion

**9. Schulfächer**

Für generisches KIM Vokabular, s. [GitHub Repo *Werteliste für allgemeinbildende Schulfächer*](https://github.com/dini-ag-kim/schulfaecher) und das [SKOS Vokabular dazu](https://skohub.io/dini-ag-kim/schulfaecher/heads/main/w3id.org/kim/schulfaecher/index.html).

s. *Schulfach-Ontologie* in Kapitel [Ontologie-Modell](https://fwu-de.github.io/lehrplan-ontologie/docs/structure/#nachgenutzte-ontologienvokabulare) und [SKOS Vokabular Schulfach Ontologie](https://fwu-de.github.io/mem-skos-vocabs/).

**10. Schularten**

s. *Schulart-Ontologie* in Kapitel [Ontologie-Modell](https://fwu-de.github.io/lehrplan-ontologie/docs/structure/#nachgenutzte-ontologienvokabulare) und [GitHub Repo Schulart Ontologie](https://github.com/FWU-DE/schulart-ontologie).

### Beziehungen (properties)

Hier sind die wichtigsten Properties aufgelistet:

- `BFO_0000051` – **hat Teil**: Die zentrale Strukturrelation der gesamten Ontologie. Sie verbindet übergeordnete mit untergeordneten Elementen: Lehrplan → CE-Fragment → CE-Bereich → CE-Kompetenzspezifikation. Transitiv und asymmetrisch.
- `BFO_0000050` – **ist Teil von**: Die inverse Property zu `hat Teil`. Ermöglicht die Navigation von einem Element aufwärts zu seinem Elternelement.
- `LP_0000029` – **von Bundesland** → `Bundesland Bezeichnung`: Bindet jeden Lehrplan und jedes Curriculare Element an ein Bundesland. 
- `LP_0000812` – **für Schulart** → `Schulart`: Verknüpft einen Lehrplan mit der Schulart, für die er gilt.
- `LP_0000537` – **hat Schulfach** → `Schulfach`: Verknüpft einen Lehrplan mit dem Unterrichtsfach.
- `LP_0000026` – **hat Jahrgangsstufe** → `Jahrgangsstufe`: Ordnet einen Lehrplan oder ein CE einer oder mehreren Jahrgangsstufen zu. Mehrfachbelegung möglich, z.B. für Doppeljahrgangsstufen.
- `LP_0000047` – **hat Schulstufe** → `Schulstufe`: Alternativ oder ergänzend zu `hat Jahrgangsstufe` – ordnet einem Element eine ganze Schulstufe zu (z.B. *Sekundarbereich I*).
- `LP_0000833` – **hat Bildungsgangniveau** → `Bildungsgangniveau`: Gibt an, auf welchem Leistungsniveau ein Element gilt – z.B. *Realschulniveau* oder *Gymnasialniveau Sek I*. Zentrales Property für die Vergleichbarkeit über Bundesländer hinweg.
- `LP_0000840` – **hat Niveau** → `Niveau`
Allgemeinere Variante; verbindet Niveaustufen-Individuen (BE/BB) mit ihren abschlussspezifischen Bildungsgangniveau-Individuen.
- `LP_0000578` – **hat Niveaustufe** (Domain: `Curriculares Element`, Range: `Niveaustufe (BE/BB)`): Spezifisch für Berlin und Brandenburg: ordnet einem CE die Buchstabenstufe (A–H) zu.
- `LP_0000580` – **ist Niveaustufe von**: Inverse Property zu `hat Niveau`; zeigt von einem Bildungsgangniveau-Individuum zurück auf seine generische Niveaustufe.
- `LP_0000071` – **benötigt Niveau**: Gibt an, welches Vorkenntnissniveau als Eingangsvoraussetzung für ein Element erwartet wird.
- `LP_0000021` – **ermöglicht Abschluss / endet mit Abschluss** → `Schulabschluss`: Verknüpft Bildungsgänge und Schularten mit den erreichbaren Schulabschlüssen. Beide Labels sind in der Ontologie für dieselbe Property definiert.
- `LP_0000024` – **wird beschrieben von**: Inverse zu `beschreibt` (`IAO_0000136`); von einer Schulart, Jahrgangsstufe oder einem Bundesland aus zeigt sie auf alle Lehrpläne, die diesen Kontext betreffen.
- `IAO_0000136` – **beschreibt**: BFO/IAO-Property; verbindet einen Lehrplan mit den Entitäten (Schulart, Bundesland), auf die er sich bezieht.
- `LP_0030056` – **hat Titel** → `Titel`: Trägt die Bezeichnung eines Lehrplans oder CE.
- `LP_0030051` – **hat Beschreibung** (Domain: `Curriculares Element`) → `Beschreibung`: Trägt längere erläuternde Texte, Hinweise und Beispiele zu einem CE.
- `LP_0030057` – **hat Nummer** (Domain: `Curriculares Element`) → `Identifikationsnummer`: Trägt die originale Nummerierung oder Codierung aus dem Quelldokument.
- `LP_0000463` – **uri**: Trägt den URL zum Originaldokument des Lehrplans beim Herausgeber.
- `LP_0000483` – **hat Funktion** → `Funktionsspezifikation`: Verknüpft länderspezifische CE-Klassen mit ihrer semantischen Rolle (Bereichsfunktion, Kompetenzbeschreibungsfunktion usw.). In der Regel als OWL-Restriktion in der Klassendefinition verankert, nicht als Datentripel.
- `LP_0030071` – **hat Verweis** → `CE-Verweis`: Hängt einen CE-Verweis an das Element, von dem aus er ausgeht.
- `LP_0030072` – **verweist auf** (Domain: CE-Verweis)
: eigt vom CE-Verweis-Individuum auf das eigentliche Ziel des Verweises.
- `LP_0000343` – **hat Schulartfunktion** → `Schulartfunktion`: Gibt an, welche Funktion eine Schulart im Bildungssystem übernimmt.
- `LP_0000477` – **konkretisiert Schulart** (Domain: `Schulartfunktion`, Range: `Schulart`): Verknüpft eine Schulartfunktion mit der konkreten Schulart, auf die sie sich bezieht.
- `LP_0000041` – **hat Einheit**: Verknüpft eine Zeitspezifikation mit ihrer Maßeinheit (z.B. Unterrichtsstunden, Schulwochen).
- `LP_0000141` – **entspricht KIM Schulart** (*Annotation Property*): Verknüpft eine Schulart mit dem entsprechenden Eintrag im bundesweiten KIM-Vokabular.

## Mapping unterschiedlicher Terminologien der Bundesländer

So wie sich die Bildungssysteme von Bundesland zu Bundesland unterscheiden, variieren auch die Lehrpläne. Jedes Bundesland strukturiert seine Lehrpläne auf eigene Weise und verwendet teilweise unterschiedliches Vokabular, um gleiche oder ähnliche Konzepte zu beschreiben. Darüber hinaus bestehen innerhalb der Bundesländer fächerübergreifende Unterschiede, sowohl im Aufbau der Lehrpläne als auch in den verwendeten Begrifflichkeiten. Dies führt dazu, dass die Inhalte der Lehrpläne nicht immer eindeutig den von uns definierten Kern-Elementen (CE-Bereich, CE-Kompetenzspezifikation, CE-Lerninhalt und CE-Hinweis) zugeordnet werden können. Zusätzlich erschweren spezifische Besonderheiten einzelner Bundesländer — wie etwa die Aufnahme konkreter Unterrichtsbeispiele oder detaillierter Zeitvorgaben für Lerninhalte, die in anderen Lehrplänen nicht enthalten sind — die Einbindung in ein generisches Modell.

Im Rahmen der Analyse der Lehrpläne aller Bundesländer wurden zentrale inhaltliche Strukturen identifiziert, die in nahezu allen Lehrplänen vorkommen. Dabei wurden die Fächer Deutsch, Mathematik, Englisch (bzw. die erste Fremdsprache) sowie Physik (bzw. Sachunterricht oder Naturwissenschaften) berücksichtigt. Die identifizierten inhaltlichen Kernkomponenten werden als „Curriculare Elemente“ (CE) bezeichnet. Dazu gehören: 

*Grafik* 

Die nachfolgende Grafik veranschaulicht, wie diese zentralen Elemente der Ontologie dazu beitragen, bundeslandspezifische Terminologien konsistent abzubilden. Als Beispiel dienen Ausschnitte aus dem Deutsch-Lehrplan Mecklenburg-Vorpommerns. Unter jedem curricularen Element sind die Bezeichnungen aufgeführt, die in anderen Bundesländern für funktional vergleichbare Elemente verwendet werden. Diese Zuordnung ermöglicht es, die terminologischen Unterschiede der Länder beizubehalten und zugleich eine klare und strukturierte Vergleichbarkeit herzustellen.

*Grafik*


### Integration der Bildungsstandards

**Die Rolle der Kultusministerkonferenz (KMK) und die Nutzung ihrer Bildungsstandards in der Ontologie**

Die Kultusministerkonferenz (KMK) ist das zentrale Gremium der 16 deutschen Bundesländer für alle Fragen rund um Bildung, Wissenschaft und Kultur. Da das Bildungswesen in Deutschland Länderhoheit ist, sorgt die KMK dafür, dass wichtige Aspekte des Schul- und Bildungsbereichs bundesweit abgestimmt sind und vergleichbare Standards bestehen. Zu ihren Aufgaben gehören unter anderem die Entwicklung gemeinsamer Rahmenvorgaben, die Abstimmung von Schulabschlüssen sowie die Formulierung bundesweit verbindlicher [Bildungsstandards](https://www.kmk.org/themen/qualitaetssicherung-in-schulen/bildungsstandards.html).

Für viele dieser Bildungsstandards stellt das IQB (Institut zur Qualitätsentwicklung im Bildungswesen) bereits [digital nutzbare Daten](https://iqb-vocabs.github.io/vokabulare/bildungstandards.html) bereit. Diese liegen in strukturierten, maschinenlesbaren Formaten vor und ermöglichen dadurch eine effiziente Weiterverarbeitung, Verknüpfung und Analyse. Zu diesen Standards zählen beispielsweise Kompetenzbeschreibungen für die Fächer Deutsch, Mathematik, die erste Fremdsprache (Englisch/Französisch) sowie die naturwissenschaftlichen Fächer (Biologie, Chemie und Physik). Die Bereitstellung in standardisierter Form schafft die Grundlage dafür, Bildungsinhalte über Ländergrenzen hinweg vergleichbar zu machen und digitale Anwendungen zu unterstützen.

In unserer Ontologie dienen die Bildungsstandards der KMK als übergeordnete Referenzstruktur. Analog zur Vorgehensweise bei den einzelnene Bundesländern, werden auch die in den Bildungsstandards vorkommenden Elemente den übergeordneten Curricularen Elementen zugeordnet und als eindeutig definierte Entitäten im Datenmodell hinterlegt. Diese Referenzpunkte können anschließend mit Lehrplanbestandteilen der Bundesländer verknüpft werden. Dadurch unterstützen die Bildungsstandards eine konsistente Verwendung von Kompetenzbeschreibungen, Betitlungen von Bereichen und Erwartungsniveaus und ermöglichen eine vergleichbare Einordnung der Lehrplaninhalte.

Die Bildungsstandards beziehen sich dabei auf eine Bildungsstufe und sind bis zum Ende der Primarstufe, der Sekundarstufe I (aufgeteilt in den Ersten und Mittleren Schulabschluss) und der Sekundarstufe II (Allgemeine Hochschulreife) zu erwerben. Da die Lehrpläne der Bundesländer allerdings meist auf Ebene der Jahrgangsstufen ausdifferenziert sind, können die Bildungsstandards nicht genau gleich übernommen werden. Außerdem gibt es nur für die oben genannten Fächer Bildungsstandards. Aus diesen Gründen reichen die Bildungsstandards nicht als gemeinsamer Nenner aller Lehrpläne. Trotzdem bieten sie eine wichtige Referenzquelle.