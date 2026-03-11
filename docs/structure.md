# Idee

*Lehrplanwissen repräsentiern. -> was ist überhaupt ein lehrplan im ontolgischen Sinne? → information darüber wie ein prozess ablaufen soll. Lehrprozess und lernprozess*

# Struktur der Lehrplan Ontologie

## Modellierung

*Core, einzele BL, full, BFO, Schulart/fach, ...*

Die Ontologie ist modular aufgebaut: Die Strukturen und Inhalte jedes Bundeslandes werden in eigenen, voneinander getrennten Ontologien erfasst und durch eine übergeordnete Kern-Ontologie (Core) zusammengeführt. Diese Kern-Ontologie enthält diejenigen Elemente und Funktionen, die in allen Bundesländern grundsätzlich vorhanden sind – auch dann, wenn sie dort unterschiedliche Bezeichnungen, Strukturen oder Ausprägungen haben.

Um Lehrpläne bundesländerübergreifend gemeinsam durchsuchbar zu machen, ohne dabei die individuellen Begrifflichkeiten oder Modellierungen der Länder zu verändern, übernimmt die Kern-Ontologie eine verbindende Rolle: Sie definiert gemeinsame Funktionen und Beziehungstypen, über die die jeweiligen Landes-Elemente eindeutig zugeordnet und in ein gemeinsames semantisches System integriert werden.

Ein vereinfachtes Beispiel:

Viele Bundesländer verwenden für ein ähnliches inhaltliches Element – etwa eine Kompetenzbeschreibung – unterschiedliche Begriffe oder Strukturformen. Die Kern-Ontologie weist diesen Elementen eine gemeinsame funktionale Rolle zu, z. B. eine bestimmte Art von Kompetenzbeschreibung. Dadurch können die unterschiedlichen Landesmodelle eindeutig miteinander verknüpft werden. Auf dieser Grundlage werden einheitliche Abfragen möglich, obwohl die Datenstrukturen der Lehrpläne selbst nicht vereinheitlicht werden müssen.

Der modulare Aufbau und die Vernetzung über die Kern-Ontologie ermöglicht es perspektivisch, dass die Länder ihre Ontologien selbst verwalten, warten und anpassen können, ohne dass dadurch die Lehrplan-Ontologien der anderen Länder betroffen werden.

*Grafik*

Zu den bereits erwähnten Kernelementen (s.u. für Definitionen *Verlinkung fehlt*) gehören beispielsweise der Lehrplan, der als gedankliche Klammer vielfältige Lehrplan-Fragmente (“CE-Fragment”) umfasst. Solche Lehrplan-Fragmente sind als ordnende Elemente zu verstehen, die wiederum Kompetenzbereiche oder Themenfelder unter sich haben können. Kompetenzbereiche und Themenfelder können abermals jeweils Kompetenzbereiche oder Themenfelder untergeordnet haben, die auf unterster Ebene aber immer eine Kompetenzspezifikation oder einen Lerninhalt haben. 

Beispielhafter Aufbau von Lehrplänen dargestellt mit unseren Kern-Elementen:

*Grafiken*

Ein Lehrplan in der Kern-Ontologie setzt sich so abstrakt aus einer Abfolge verschiedener Lehrplanfragmente zusammen, die untereinander vernetzt werden können. Beispielsweise kann sich eine Kompetenzspezifikation auf einen bestimmten Lerninhalt beziehen, mit anderen Kompetenzspezifikationen oder auch mit Lehr- und Lernmaterialien verknüpft werden.


## Nachgenutzte Ontologien/Vokabulare

**BFO**

Top-Level-Ontologien sind allgemeine, abstrakte Ontologien, die grundlegende Kategorien und Beziehungen definieren, die für viele verschiedene Domänen anwendbar sind. Sie bieten eine einheitliche Struktur, um spezifische Ontologien miteinander zu verbinden und zu integrieren.

Die Basic Formal Ontology (BFO) ist eine solche Top-Level-Ontologie, die zwischen Continuants (Dinge, die über die Zeit bestehen, z. B. Objekte) und Occurrents (Prozesse, die sich über die Zeit erstrecken) unterscheidet. Sie wird insbesondere in den Lebenswissenschaften und der Technik eingesetzt, um Forschungsdaten systematisch zu organisieren.

Die Nutzung einer Top-Level-Ontologie wie BFO ist sinnvoll, weil sie eine konsistente und interoperable Grundlage für verschiedene Ontologien schafft. Dies erleichtert die Datenintegration, Wiederverwendbarkeit und semantische Interoperabilität zwischen verschiedenen Systemen und Disziplinen.

**Die Schulfach-Ontologie**

*allen Fächern pro Bundesland + Mapping zu Kim-Schulfächer* 

Repository: https://github.com/FWU-DE/schulfach-ontologie 
SKOS-Vokabular: https://fwu-de.github.io/mem-skos-vocabs/ 

...

**Die Schulart-Ontologie**

*Schularten pro Bundesland + Mapping zu KIM-Schularte und Info zu Bildunsggangniveau und Jahrgangsstufen*

Repository:

...

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

## Umgang mit den bundeslandspezifischen Elementen

*Die Lehrpläne liegen in den Bundesländern auf unterschiedliche Art und Weise vor und unterscheiden sich auch in ihrer Struktur. Außerdem benutzt jedes Bundesland sein eigenes Vokabular, um die verschiedenen Elemente innerhalb der Lehrpläne zu beschreiben.*

So wie die Bildungssysteme sich von Bundesland zu Bundesland unterscheiden, so unterscheiden sich auch die Lehrpläne. Jedes Bundesland strukturiert seine Lehrpläne anders und benutzt unterschiedliches Vokabular, um dieselben oder ähnliche Konzepte zu beschreiben. Außerdem gibt es fächerübergreifende Unterschiede innerhalb der Bundesländer sowohl im Aufbau der Lehrpläne als auch im Hinblick auf die benutzten Begrifflichkeiten. All dies führt dazu, dass die Inhalte der Lehrpläne den von uns erarbeiteten Kern-Elementen (CE-Bereich, CE-Kompetenzspezifikation, CE-Lerninhalt und CE-Hinweis) nicht immer eindeutig zuzuordnen sind. Hinzu kommen einige Besonderheiten einzelner Bundesländer, wie zum Beispiel konkrete Anwendungsbeispiele im Schulunterricht oder Zeitangaben zu den zu erlernenden Inhalten, welche in den Lehrplänen anderer Bundesländern nicht vorkommen und die Einbindung in ein generisches Modell erschweren.

Durch die Analyse der Lehrpläne aller Bundesländer haben wir zentrale inhaltliche Strukturen identifiziert, die in nahezu jedem Lehrplan vorkommen. Die inhaltlichen Kernkomponenten tragen die Bezeichnung “Curriculare Elemente” (CE). Dazu gehören: 

*Grafik* 

Die nachfolgende Grafik zeigt, wie die zentralen Kernelemente der Ontologie dazu beitragen, bundeslandspezifische Terminologien konsistent abzubilden. Als Beispiel dienen Ausschnitte aus dem Deutsch-Lehrplan Mecklenburg-Vorpommerns. Unter jedem curricularen Element sind diejenigen Bezeichnungen aufgeführt, die in anderen Bundesländern für funktional vergleichbare Elemente verwendet werden. Diese Zuordnung ermöglicht es, die terminologischen Unterschiede der Länder beizubehalten und zugleich eine klare, strukturierte Vergleichbarkeit herzustellen.

*Grafik*

Erläuterungen zu konkreten Herausforderungen bei der Erstellung der Ontologie sowie die dazugehörigen Lösungen befinden sich hier. *Verlinkung*

*Im Folgenden sind die Elemente jedes Bundeslandes stichpunktartig festgehalten und die bundeslandspezifischen Bezeichnungen aufgelistet, anhand von Beispielen erläutert und den Curricularen Elementen der Kernontologie zugeordnet. Hierfür wurden die Fächer Deutsch, Mathematik, Englisch (oder die erste Fremdsprache) und Physik (oder Sachunterricht oder Naturwissenschaften) berücksichtigt. Zu jedem Bundesland sind außerdem Informationen zu den bundeslandspezifischen Niveaus (Bildungsgangniveaus und Fachniveaus Sek II) sowie zum jeweiligen Bildungssystem (Schulfächer, Schularten, Schulabschlüsse), welche die Ontologie enthält, aufgelistet. Hier gelangen Sie direkt zu den einzelnen Dokumenten der Bundesländer.*

...

## Integration der Bildungsstandards

**Die Rolle der Kultusministerkonferenz (KMK) und die Nutzung ihrer Bildungsstandards in der Ontologie**

Die Kultusministerkonferenz (KMK) ist das zentrale Gremium der 16 deutschen Bundesländer für alle Fragen rund um Bildung, Wissenschaft und Kultur. Da das Bildungswesen in Deutschland Länderhoheit ist, sorgt die KMK dafür, dass wichtige Aspekte des Schul- und Bildungsbereichs bundesweit abgestimmt sind und vergleichbare Standards bestehen. Zu ihren Aufgaben gehören unter anderem die Entwicklung gemeinsamer Rahmenvorgaben, die Abstimmung von Schulabschlüssen sowie die Formulierung bundesweit verbindlicher [Bildungsstandards](https://www.kmk.org/themen/qualitaetssicherung-in-schulen/bildungsstandards.html).

Für viele dieser Bildungsstandards stellt das IQB (Institut zur Qualitätsentwicklung im Bildungswesen) bereits [digital nutzbare Daten](https://iqb-vocabs.github.io/vokabulare/bildungstandards.html) bereit. Diese liegen in strukturierten, maschinenlesbaren Formaten vor und ermöglichen dadurch eine effiziente Weiterverarbeitung, Verknüpfung und Analyse. Zu diesen Standards zählen beispielsweise Kompetenzbeschreibungen für die Fächer Deutsch, Mathematik, die erste Fremdsprache (Englisch/Französisch) sowie die naturwissenschaftlichen Fächer (Biologie, Chemie und Physik). Die Bereitstellung in standardisierter Form schafft die Grundlage dafür, Bildungsinhalte über Ländergrenzen hinweg vergleichbar zu machen und digitale Anwendungen zu unterstützen.

In unserer Ontologie dienen die Bildungsstandards der KMK als übergeordnete Referenzstruktur. Analog zur Vorgehensweise bei den einzelnene Bundesländern, werden auch die in den Bildungsstandards vorkommenden Elemente den übergeordneten Curricularen Elementen zugeordnet und als eindeutig definierte Entitäten im Datenmodell hinterlegt. Diese Referenzpunkte können anschließend mit Lehrplanbestandteilen der Bundesländer verknüpft werden. Dadurch unterstützen die Bildungsstandards eine konsistente Verwendung von Kompetenzbeschreibungen, Betitlungen von Bereichen und Erwartungsniveaus und ermöglichen eine vergleichbare Einordnung der Lehrplaninhalte.

Die Bildungsstandards beziehen sich dabei auf eine Bildungsstufe und sind bis zum Ende der Primarstufe, der Sekundarstufe I (aufgeteilt in den Ersten und Mittleren Schulabschluss) und der Sekundarstufe II (Allgemeine Hochschulreife) zu erwerben. Da die Lehrpläne der Bundesländer allerdings meist auf Ebene der Jahrgangsstufen ausdifferenziert sind, können die Bildungsstandards nicht genau gleich übernommen werden. Außerdem gibt es nur für die oben genannten Fächer Bildungsstandards. Aus diesen Gründen reichen die Bildungsstandards nicht als gemeinsamer Nenner aller Lehrpläne. Trotzdem bieten sie eine wichtige Referenzquelle.

**Die Curricularen Elemente der Bildungsstandards**

...


## Klassen

**Was sind Klassen in einer Ontologie?**

Klassen in Ontologien sind vergleichbar mit Kategorien oder Gruppen, die Dinge mit gemeinsamen Eigenschaften zusammenfassen. Sie funktionieren wie Behälter für Objekte (genannt "Instanzen"), die ähnliche Merkmale teilen.

Ein alltägliches Beispiel:

Stellen Sie sich vor, wir erstellen eine Ontologie für Fahrzeuge:
- "Fahrzeug" wäre eine übergeordnete Klasse
- "Auto", "Motorrad" und "Fahrrad" wären Unterklassen von "Fahrzeug"
- "Sportwagen" und "Limousine" könnten wiederum Unterklassen von "Auto" sein

Ihr eigenes Auto, beispielsweise ein bestimmter VW Golf mit einer spezifischen Seriennummer, wäre dann eine Instanz der Klasse "Auto".

**Hierarchie und Vererbung:**

Klassen sind typischerweise hierarchisch organisiert, wobei allgemeinere Klassen ("Fahrzeug") über spezielleren Klassen ("Auto") stehen. Unterklassen erben die Eigenschaften ihrer übergeordneten Klassen - wenn also alle Fahrzeuge eine Eigenschaft "hat Räder" haben, erben Autos automatisch diese Eigenschaft.

**Warum sind Klassen in Ontologien wichtig?**

Klassen ermöglichen:
- Eine strukturierte Organisation von Wissen
- Logisches Schlussfolgern über Beziehungen zwischen Objekten
- Wiederverwendung von Definitionen und Eigenschaften
- Konsistente Darstellung von Wissen in computerlesbarer Form

Diese Strukturierung macht es möglich, dass Maschinen Informationen "verstehen" und automatisch Schlussfolgerungen (“Reasoning”) ziehen können.

**Klassen in der Lehrplan Ontologie**

...


## Properties (Eigenschaften)

“Properties” (Eigenschaften) sind neben Klassen ein weiteres Kernelement von Ontologien. Sie beschreiben die Beziehungen zwischen Objekten oder deren Merkmale.

**Was sind “Properties” in einer Ontologie?**

“Properties” definieren:
1. Wie Objekte miteinander in Beziehung stehen (Objekteigenschaften)
2. Welche spezifischen Merkmale oder Datenwerte ein Objekt besitzt (Dateneigenschaften)

**Arten von “Properties”:**

*Objekteigenschaften (Object Properties)*

Diese verbinden Instanzen verschiedener Klassen miteinander und beschreiben ihre Beziehungen.

Beispiel:
- "istHergestelltVon" könnte eine Beziehung zwischen einem Auto und einem Hersteller beschreiben
- "hatTeil" könnte ein Auto mit seinen Komponenten wie Motor, Rädern usw. verbinden

*Dateneigenschaften (Data Properties)*

Diese verbinden Instanzen mit konkreten Datenwerten wie Zahlen, Texten oder Datumsangaben.

Beispiel:
- "hatBaujahr" (mit Wert "2022")
- "hatLeistung" (mit Wert "150 PS")
- "hatFarbe" (mit Wert "rot")

**Eigenschaften von “Properties”**

“Properties” können selbst verschiedene Merkmale haben:
- Transitivität: Wenn A mit B und B mit C verbunden ist, dann ist auch A mit C verbunden
- Symmetrie: Wenn A mit B verbunden ist, dann ist auch B mit A verbunden

**Warum sind “Properties” wichtig?**

“Properties”:
- Definieren das Netzwerk von Beziehungen zwischen Objekten
- Ermöglichen detaillierte Beschreibungen von Objekten
- Schaffen die Grundlage für Abfragen und logische Schlussfolgerungen
- Erlauben die Modellierung komplexer Zusammenhänge in der realen Welt

Durch die Kombination von Klassen und “Properties” entsteht ein reichhaltiges Wissensnetz, das sowohl für Menschen verständlich als auch für Computer verarbeitbar ist.

**Properties in der Lehrplan Ontologie**

...


## Instanzen

...