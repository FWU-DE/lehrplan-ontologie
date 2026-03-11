# Einführung in Ontologien


## Was ist eine Ontologie?

*Eine Ontologie ist eine formale, strukturierte Darstellung von Wissen innerhalb eines bestimmten Bereichs. Sie definiert Begriffe (Konzepte) und die Beziehungen zwischen ihnen, um eine gemeinsame, maschinenlesbare Bedeutung zu schaffen.*

*Ontologien werden in der Informatik und KI genutzt, um Daten zu organisieren, zu verknüpfen und logisch zu verarbeiten. Sie bestehen aus Klassen (Kategorien), Eigenschaften (Attribute, Relationen) und Regeln, die festlegen, wie Konzepte miteinander in Verbindung stehen.*

Eine Ontologie ist eine formal definierte logische Struktur, die Konzepte, Kategorien, Eigenschaften und Beziehungen innerhalb eines bestimmten wissenschaftlichen Bereichs unter Verwendung standardisierter Definitionen und Namenskonventionen darstellt. Ontologien bieten eine gemeinsame Sprache zur einheitlichen Beschreibung von Daten, wodurch Rohdaten einfacher organisiert, interpretiert und zwischen verschiedenen Experimenten, Datenbanken und Forschungsdisziplinen ausgetauscht werden können.

Weiterlesen:

Guarino, Nicola, Daniel Oberle, und Steffen Staab. "What is an ontology?." Handbook on ontologies. Berlin, Heidelberg: Springer Berlin Heidelberg, 2009. 1-17.


## Warum brauchen wir Ontologien?

*→ Interoperabilität soll ermöglicht werden*

Ontologien sind für modernes Datenmanagement und Digitalisierung von entscheidender Bedeutung, da sie einen gemeinsamen konzeptionellen Rahmen bieten, der die Beziehungen zwischen Datenentitäten definiert und so die Interoperabilität und Konsistenz zwischen verschiedenen Systemen gewährleistet. Durch die Organisation von Daten anhand einer formalen Struktur erleichtern Ontologien die Integration, Suche und Analyse von Informationen und helfen Unternehmen dabei, rohe, heterogene Datensätze in kohärente digitale Wissensressourcen umzuwandeln. Sie unterstützen eine effektive Datenverwaltung, indem sie klare Definitionen, die Rückverfolgung von Datenherkunft und Qualitätskontrollen in digitalen Infrastrukturen ermöglichen. Im Kontext der digitalen Transformation fungieren Ontologien als universelle Sprache, die Daten, Systeme und Prozesse über Geschäftsbereiche hinweg verbindet, Silos abbaut und Automatisierung, fortschrittliche Analysen und KI-gesteuerte Entscheidungsfindung ermöglicht. Sie sind auch ein wesentlicher Bestandteil der Umsetzung der FAIR-Datenprinzipien (Findable, Accessible, Interoperable und Reusable), indem sie semantische Bedeutung direkt in Datenmodelle einbetten, was Transparenz, Reproduzierbarkeit und langfristige Datennachhaltigkeit fördert. Ohne Ontologien sehen sich Unternehmen mit fragmentierten Datenlandschaften konfrontiert, in denen digitale Informationen nicht effektiv wiederverwendet oder geteilt werden können, was die Zusammenarbeit und Innovation behindert.

**Warum keine Datenbanken?** 
*→ eher für effizientes Abspeichern, aber nicht für Wissen modellieren*
...

**Warum kein Metadaten Schema?**
...

**Warum LLMs nicht ausreichen**
...

## Warum brauchen wir eine Ontologie für Lehrpläne?
...

## Ontologieebenen 

Basierend auf dem Grad der Abstraktion und der formalen Ausdruckskraft werden Ontologien in die folgenden vier Ebenen unterteilt:

1) **Top-Level-Ontologien (TLOs)** beschreiben allgemeine Konzepte, die verschiedenen Domänen übergreifen, auf der höchstmöglichen Abstraktionsebene. TLOs legen semantische Standards fest und integrieren universelle und grundlegende Konzepte, um die Verbindung und Interoperabilität einer Vielzahl denkbarer Domänenontologien sicherzustellen. [Basic Formal Ontology (BFO)](https://github.com/bfo-ontology/BFO-2020) ...

2) **Mid-Level-Ontologien (MLOs)** fügen den TLOs feinere Granularitäten hinzu und machen sie modularer, um die Verbindung komplexer und ausdrucksstarker Domänen-Level-Ontologien (DLOs) zu ermöglichen. Beispiele ...

3) **Domänenbezogene Ontologien (DLOs)** enthalten sehr ausdrucksstarkes und explizites Expertenwissen und repräsentieren Konzepte, Definitionen, Fakten, Aussagen, Axiome, Regeln und Beziehungen, die zu bestimmten Domänen gehören. Beispiele ...

4) **Ontologien auf Anwendungsebene (ALOs)** bieten hochdetaillierte Semantiken für bestimmte Anwendungsfälle und unterstützen die Entwicklung von Wissensgraphen. Beispiele ...

Warum ist das wichtig → Top-Down statt bottom up
BFO/RO

## Ontologie Sprache

Die Ontologie ist in der [Web Ontology Language (OWL)](https://www.w3.org/OWL/) implementiert, einer leistungsstarken und weit verbreiteten Sprache zur Erstellung komplexer und interoperabler Ontologien. OWL unterstützt logisches Schlussfolgern und erleichtert die Integration maschinenlesbarer Daten mit semantischen Webtechnologien. Darüber hinaus können verschiedene Notationen und Formate verwendet werden. In der Regel wird PMDco auch in der [Turtle-Syntax (TTL)](https://www.w3.org/TR/turtle/) bereitgestellt.

## Hauptbestandteile einer Ontologie

- **Klasse:** Eine Klasse bietet einen Abstraktionsmechanismus zum Gruppieren von Ressourcen mit ähnlichen Eigenschaften. Jede Klasse ist mit einer Reihe von Individuen verbunden, die als Klassenausdehnung bezeichnet werden. Die Individuen in der Klassenausdehnung werden als Instanzen der Klasse bezeichnet. Eine Klasse hat eine beabsichtigte Bedeutung, d. h. das zugrunde liegende Konzept.

- **Objekteigenschaft:** Die Beziehung eines Individuums zu einem anderen Individuum. Eine Objekteigenschaft wird als Instanz der integrierten OWL-Klasse owl:ObjectProperty definiert.

- **Datentyp-Eigenschaft:** Datentyp-Eigenschaften verknüpfen Individuen mit Datenwerten. Eine Datentyp-Eigenschaft wird als Instanz der integrierten OWL-Klasse owl:DatatypeProperty definiert.

- **Instanz:** Individuelle Verwirklichung eines Konzepts. Das Konzept „Zugversuch” kann beispielsweise durch einen bestimmten Zugversuch instanziiert werden, der zu einem bestimmten Zeitpunkt an einem bestimmten Ort und mit bestimmten Parametern durchgeführt wurde. Alle Instanziierungen zusammen bilden die Ontologie-A-Box, in der Aussagen über Instanzen unter Verwendung der in der T-Box definierten Terminologie getroffen werden. Weiterlesen: MaterialDigital Initiative Glossary (ein umfassendes Glossar für ontologiebezogene Begriffe).

## Ontologie Entwicklung Werkzeuge und Ressourcen

- **[Protégé](https://protege.stanford.edu/software.php)** – Ein vielseitiger Ontologie-Editor, der OWL 2 unterstützt. Er ermöglicht die Visualisierung, Bearbeitung und Schlussfolgerung über Ontologiestrukturen.
- [ODK](https://github.com/INCATools/ontology-development-kit) – Das Ontology Development Kit (ODK) ist ein unglaublich großartiges Tool zur Verwaltung des Lebenszyklus Ihrer Ontologie. Das ODK ist: 1) eine Toolbox mit verschiedenen ontologiebezogenen Tools wie ROBOT, owltools, dosdp-tools und vielen anderen, die als Docker-Image gebündelt sind, und 2) eine Reihe von ausführbaren Workflows zur Verwaltung der kontinuierlichen Integration, Qualitätskontrolle, Releases und dynamischen Importe Ihrer Ontologie.
- Draw.io – Online-Tool zur Erstellung visueller Diagramme.
- OntoPanel – Ein grafisches Plug-in für diagrams.net, das die Ontologieentwicklung und -visualisierung für Fachexperten vereinfacht.
- Chowlk Converter – Chowlk Converter ist eine Webanwendung, die eine mit diagrams.net erstellte Ontologie-Konzeptualisierung als Eingabe nimmt und deren Implementierung in OWL generiert.
- OTTR – Sprache mit unterstützenden Tools zur Darstellung und Instanziierung von RDF-Graphen und OWL-Ontologie-Modellierungsmustern. Bietet eine Abstraktionsebene über den grundlegenden RDF-Funktionen.
- OOPS! – OOPS! ist ein webbasiertes Tool, das unabhängig von jeder Ontologie-Entwicklungsumgebung ist und potenzielle Fallstricke aufspürt, die zu Modellierungsfehlern führen könnten.
- RDF Grapher – RDF Grapher ist ein Webdienst zum Parsen von RDF-Daten und deren Visualisierung als Graph.
- OnToology – Ein System zur Automatisierung eines Teils des kollaborativen Ontologieentwicklungsprozesses. OnToology untersucht ein Repository mit einer OWL-Datei und erstellt Diagramme, eine vollständige Dokumentation und eine Validierung auf der Grundlage häufiger Fallstricke.
- ROBOT – ROBOT ist ein Tool für die Arbeit mit offenen biomedizinischen Ontologien. Es kann als Befehlszeilentool oder als Bibliothek für jede Sprache auf der Java Virtual Machine verwendet werden.
- **Python-Bibliotheken** – Bibliotheken wie `rdflib` und `Owlready2`werden hauptsächlich für die semantische Datenverarbeitung, -integration und -validierung verwendet.
- **Versionskontrolle und Zusammenarbeit** – GitHub wird für die Versionskontrolle, die Nachverfolgung von Problemen und die kollaborative Entwicklung verwendet, um Transparenz und strukturierte Aktualisierungen zu gewährleisten.

## Material zu Ontologien für Anfänger

- A Practical Ontology Development Guide: In Zusammenarbeit mit den Teilnehmern der MaterialDigital-Initiative wurde ein Leitfaden für die Entwicklung von Ontologien im Allgemeinen erstellt, der grundlegende Aspekte und empfohlene Vorgehensweisen enthält. Dieser Leitfaden kann erweitert und weiterentwickelt werden und wird vom Scientific Ontology Network gehostet.
- Ontology Development 101: Der Leitfaden der Stanford University bietet eine grundlegende, schrittweise Methodik für die Erstellung Ihrer ersten Ontologie.
- Pizza Tutorial: Ein praktischer Leitfaden zum Erstellen von OWL-Ontologien mit Protégé 5.5 und Plugins
- OBO Academy’s Ontology Design Course: Ein interaktiver, kostenloser Lehrplan mit Lektionen zu Ontologiekonstruktion, Schlussfolgerungen und Designprinzipien (basierend auf den Standards der OBO Foundry und des Semantic Web)
- ISE FIZ YouTube-Kanal: Playlist mit Vorlesungen „Knowledge Graphs – Foundations and Applications”
- YouTube-Kanal von Barry Smith
- YouTube-Kanal von PMD
