# Eine ganz kurze Einführung


## Was ist eine Ontologie?

*Eine Ontologie ist eine formale, strukturierte Darstellung von Wissen innerhalb eines bestimmten Bereichs. Sie definiert Begriffe (Konzepte) und die Beziehungen zwischen ihnen, um eine gemeinsame, maschineninterpretierbare Bedeutung zu schaffen.*

*Ontologien werden in der Informatik und KI genutzt, um Daten zu organisieren, zu verknüpfen und logisch zu verarbeiten. Sie bestehen aus Klassen (Kategorien), Eigenschaften (Attribute, Relationen) und Regeln, die festlegen, wie Konzepte miteinander in Verbindung stehen.*

Eine Ontologie ist eine formal definierte auf Logik basierende Struktur, die Konzepte, Kategorien, Eigenschaften und Beziehungen innerhalb eines bestimmten Wissensbereichs (Domäne) unter Verwendung standardisierter Definitionen, Namens- und Regelkonventionen darstellt. Ontologien bieten eine gemeinsame Sprache zur einheitlichen Beschreibung von Daten, wodurch Rohdaten einfacher organisiert, interpretiert und zwischen verschiedenen Experimenten, Datenbanken und Forschungsdisziplinen ausgetauscht werden können.

Weiterlesen:

Guarino, Nicola, Daniel Oberle, und Steffen Staab. "What is an ontology?." Handbook on ontologies. Berlin, Heidelberg: Springer Berlin Heidelberg, 2009. 1-17.


## Warum brauchen wir Ontologien?

*→ Interoperabilität soll ermöglicht werden*

Ontologien sind für modernes Datenmanagement und Digitalisierung von entscheidender Bedeutung, da sie einen gemeinsamen konzeptionellen Rahmen bieten, der die Beziehungen zwischen Datenentitäten definiert und so die Interoperabilität und Konsistenz zwischen verschiedenen Systemen gewährleistet. Durch die Organisation von Daten anhand einer formalen Struktur erleichtern Ontologien die Integration, Suche und Analyse von Informationen und helfen Unternehmen dabei, rohe, heterogene Datensätze in kohärente digitale Wissensressourcen umzuwandeln. Sie unterstützen eine effektive Datenverwaltung, indem sie klare Definitionen, die Rückverfolgung von Datenherkunft und Qualitätskontrollen in digitalen Infrastrukturen ermöglichen. Im Kontext der digitalen Transformation fungieren Ontologien als universelle Sprache, die Daten, Systeme und Prozesse über Geschäftsbereiche hinweg verbindet, Silos abbaut und Automatisierung, fortschrittliche Analysen und KI-gesteuerte Entscheidungsfindung ermöglicht. Sie sind auch ein wesentlicher Bestandteil der Umsetzung der FAIR-Datenprinzipien (Findable, Accessible, Interoperable und Reusable), indem sie semantische Bedeutung direkt in Datenmodelle einbetten, was Transparenz, Reproduzierbarkeit und langfristige Datennachhaltigkeit fördert. Ohne Ontologien sehen sich Unternehmen mit fragmentierten Datenlandschaften konfrontiert, in denen digitale Informationen nicht effektiv wiederverwendet oder geteilt werden können, was die Zusammenarbeit und Innovation behindert.

**Warum keine Datenbanken?** 
Im Gegensatz zu Datenbanken, die primär der strukturierten Speicherung und effizienten Abfrage von Daten dienen, modellieren Ontologien die semantische Bedeutung der enthaltenen Informationen. Datenbanken definieren, wie Daten organisiert sind (z. B. Tabellen und Attribute), während Ontologien zusätzlich festlegen, was die Daten bedeuten und wie Konzepte logisch miteinander verbunden sind. Diese Festlegung von Bedeutung erfolgt nach standardierten Methoden. Dadurch ermöglichen Ontologien maschinelles Schlussfolgern, Konsistenzprüfungen und semantische Interoperabilität zwischen Systemen.

**Warum keine Metadaten Schemata?**
Ontologien unterscheiden sich von Metadaten-Schemata vor allem durch ihren Grad an Formalisierung und ihre semantische Ausdrucksstärke. Metadaten-Schemata beschreiben in erster Linie, welche Informationen über Daten erfasst werden sollen – etwa Autor, Erstellungsdatum oder Dateiformat – und legen dafür strukturierte Felder und Bezeichnungen fest. Sie standardisieren somit die Beschreibung von Daten, enthalten jedoch meist keine formale Logik über die Bedeutung oder Beziehungen der beschriebenen Konzepte. Ontologien gehen darüber hinaus, indem sie Begriffe, Klassen und Relationen explizit definieren und logisch verknüpfen, sodass Maschinen Zusammenhänge interpretieren, Schlussfolgerungen ziehen und Konsistenz automatisch prüfen können. Während Metadaten-Schemata also hauptsächlich der einheitlichen Dokumentation dienen, ermöglichen Ontologien ein semantisches Verständnis und inferenzbasierte Verarbeitung von Wissen.

**Warum LLM-basierte Ansätze allein nicht ausreichen**
Ontologien und darauf aufbauende Wissensgraphen modellieren Wissen **explizit** und **strukturiert**: Konzepte, Entitäten und ihre Beziehungen werden formal definiert und in einem überprüfbaren Netzwerk gespeichert. Dadurch sind die enthaltenen Aussagen nachvollziehbar, logisch prüfbar und über längere Zeit stabil reproduzierbar. Schlussfolgerungen entstehen durch regelbasierte oder logische Inferenzmechanismen, deren Ergebnisse deterministisch und erklärbar sind. 

LLM-basierte Ansätze hingegen repräsentieren Wissen **implizit** in Form **statistischer Muster** innerhalb neuronaler Modelle. Sie erzeugen Antworten auf Basis von Wahrscheinlichkeiten und Kontextähnlichkeiten statt auf explizit gespeicherten Fakten oder formalen Regeln. Dadurch können sie flexibel mit unvollständigen, mehrdeutigen oder sprachlich variierenden Informationen umgehen und natürliche Sprache besonders gut verarbeiten. Allerdings fehlt ihnen eine garantierte Konsistenz, überprüfbare Wissensbasis oder langfristig stabile Referenzstruktur. Während Ontologien und Wissensgraphen daher vor allem für Governance, Nachvollziehbarkeit und interoperable Wissensintegration geeignet sind, spielen LLMs ihre Stärke in Interpretation, Exploration und sprachlicher Interaktion mit komplexen oder unscharfen Daten aus.

Gleichzeitig können LLMs erheblich von Ontologien profitieren. Ontologien stellen eine strukturierte, verlässliche Wissensgrundlage bereit, die LLMs als Kontext oder Referenz nutzen können, um Begriffe eindeutig zu interpretieren, Halluzinationen zu reduzieren und konsistentere Antworten zu erzeugen. Durch die Verknüpfung mit Wissensgraphen können LLMs ihre sprachliche Flexibilität mit überprüfbaren Fakten kombinieren, etwa indem sie ontologisch definierte Konzepte für Retrieval, Klassifikation oder semantische Validierung verwenden. Ontologien fungieren damit als stabiler semantischer Anker, der probabilistische Sprachmodelle um erklärbares und governancefähiges Wissen ergänzt.


## Warum brauchen wir eine Ontologie für Lehrpläne?

Wir brauchen eine Ontologie für Lehrpläne, weil das deutsche Bildungssystem stark föderal organisiert ist und dadurch viele unterschiedliche, teilweise inkompatible Strukturen, Begriffe und Dokumentationsformen existieren. Eine Ontologie schafft hier ein gemeinsames semantisches Modell, das Lehrinhalte, Kompetenzen, Fächer, Jahrgangsstufen und Bildungsziele eindeutig beschreibt und miteinander verknüpft.

Erstens ermöglicht sie **Vergleichbarkeit zwischen Bundesländern**. Obwohl ähnliche Kompetenzen vermittelt werden, verwenden Lehrpläne oft unterschiedliche Bezeichnungen, Strukturierungen oder Granularitäten. Eine Ontologie kann diese Unterschiede auf eine gemeinsame Bedeutungsebene abbilden und so nachvollziehbar machen, welche Lernziele in verschiedenen Ländern tatsächlich äquivalent sind.

Zweitens verbessert sie die **Interoperabilität digitaler Bildungsplattformen**. Lernmanagementsysteme, Schulbuchplattformen, Prüfungsbanken oder Bildungsportale nutzen unterschiedliche Datenmodelle. Durch eine gemeinsame ontologische Grundlage können Inhalte automatisch ausgetauscht, wiederverwendet und systemübergreifend gefunden werden.

Drittens unterstützt eine Lehrplan-Ontologie **intelligente Suche und Empfehlungssysteme**. Lernmaterialien lassen sich nicht nur nach Schlagworten, sondern nach Kompetenzen, Lernzielen oder curricularen Zusammenhängen finden. Beispielsweise kann ein System erkennen, dass ein Material zur „Bruchrechnung“ eine bestimmte mathematische Kompetenz adressiert, auch wenn dies sprachlich anders formuliert ist.

Viertens schafft sie **Transparenz und Nachvollziehbarkeit** für Bildungssteuerung und Evaluation. Bildungsstandards, Prüfungsanforderungen und Lernressourcen können eindeutig miteinander verknüpft werden, was Analysen zur Kompetenzentwicklung oder curricularen Abdeckung erleichtert.

Fünftens ist eine Ontologie eine wichtige Grundlage für den **sinnvollen Einsatz von KI im Bildungsbereich**. KI-Systeme – insbesondere LLMs – können Inhalte besser einordnen, klassifizieren oder generieren, wenn sie auf eine stabile, explizite Wissensstruktur zurückgreifen können, die pädagogische Begriffe eindeutig definiert.

Eine Ontologie für Lehrpläne überführt heterogene curriculare Dokumente in eine gemeinsame, maschinenverständliche Wissensbasis. Sie reduziert föderale Fragmentierung, ermöglicht digitale Zusammenarbeit und schafft die Voraussetzung für interoperable, nachvollziehbare und zukunftsfähige Bildungsinfrastrukturen in Deutschland.




## OWL-Ontolgien

Die Web Ontology Language (OWL) ist ein international standardisierter Formalismus zur Modellierung von Wissen im Semantic Web. Sie wurde vom World Wide Web Consortium (W3C) entwickelt, um Daten nicht nur maschinenlesbar, sondern auch maschinenverständlich zu machen. OWL ermöglicht die formale Beschreibung von Konzepten, Beziehungen und logischen Regeln innerhalb einer Domäne und bildet damit die Grundlage für semantische Interoperabilität, automatisches Schlussfolgern und wissensbasierte Anwendungen.

Ontologien können basierend auf verschiedenen Logiken entworfen werden, z.B. Prädikatenlogik erster Stufe (First-Order Logic, FOL), regelbasierte Logiken (Rule-Based Logics), Beschreibungslogiken (Description Logics, DL), Logikprogrammierung (z.B. Prolog), etc.. OWL nutzt bewusst Beschreibungslogiken als zugrunde liegende Logik, weil sie einen optimalen Kompromiss zwischen Ausdrucksstärke und Berechenbarkeit bietet. Ziel ist es, Wissen formell und maschinenverständlich zu modellieren, ohne dass automatisches Reasoning unentscheidbar oder unpraktikabel wird. Während die volle Prädikatenlogik theoretisch beliebig komplexe Zusammenhänge darstellen könnte, wäre das Schlussfolgern in dieser Logik im Allgemeinen nicht berechenbar. Beschreibungslogiken sind hingegen audrucksstark genug, um Klassenhierarchien, Relationen, Einschränkungen und Typisierungen präzise zu modellieren, aber gleichzeitig so strukturiert, dass Reasoner zuverlässig neue Fakten ableiten, Inkonsistenzen erkennen und Klassifikationen automatisch erstellen können.

OWL folgt der Open World Assumption: Nur weil eine Information nicht vorliegt, bedeutet das nicht, dass sie falsch ist. Gleichzeitig ist das Schlußfolgern monoton, das heißt neue Informationen ändern bestehende Schlussfolgerungen nicht. Diese Eigenschaften machen OWL besonders geeignet für verteiltes, heterogenes Wissen. 

OWL basiert auf RDF/RDFS. RDF (Resource Description Framework) ist ein Standard des W3C zur repräsentation von Informationen im Web. RDF beschreibt Daten als Tripel: Subjekt – Prädikat – Objekt, z.B. „Max – istLehrkraft – SchuleA“. Damit lassen sich Fakten maschinenlesbar und universell identifizierbar darstellen.

RDFS (RDF Schema) ist eine Erweiterung von RDF, die einfache Semantik und Struktur bereitstellt. Es definiert Klassen, Unterklassen, Eigenschaften und Hierarchien, also die grundlegende Organisation von Konzepten in RDF. RDFS legt damit die Basis, auf der komplexere Ontologien wie OWL aufbauen können.

Ein weiteres wichtiges Designprinzip von OWL ist die Modularität: Mit den OWL-2-Profilen EL, QL und RL lassen sich Ontologien je nach Anwendungsfall leichtgewichtig oder besonders ausdrucksstark gestalten. Die formale Natur von OWL sorgt zudem für Nachvollziehbarkeit, Governance und langfristige Stabilität: Aussagen sind überprüfbar, logisch konsistent und erklärbar, was besonders für Audits, rechtliche Anforderungen und nachhaltige Datenarchitekturen entscheidend ist.

## Grundkonzepte

OWL beschreibt Wissen mithilfe einiger zentraler Bausteine:

#### 1. Klassen (Classes)

Klassen repräsentieren allgemeine Konzepte oder Kategorien einer Domäne.

Beispiele:

* Person
* Schule
* Lehrplan
* Kompetenz

Klassen können hierarchisch organisiert werden (Subklassenbeziehungen):

```
Jede Lehrkraft ist eine Person.
```

#### 2. Individuen (Individuals)

Individuen sind konkrete Instanzen von Klassen.

Beispiele:

```
„Max Müller“ ist eine Instanz der Klasse Person.
„Mathematik Klasse 7“ ist eine Instanz der Klasse Lehrplan.
```
#### 3. Eigenschaften (Properties)

OWL unterscheidet zwei zentrale Typen:

**Objekteigenschaften (Object Properties)**

→ Beziehungen zwischen zwei Individuen

```
unterrichtet 
hatTeil
hatKompetenz
```

Dateneigenschaften (Datatype Properties)

→ Verbindung zu Datentypwerten

```
hatName
hatGeburtsdatum
hatPunktzahl
```

#### 4. Axiome

Axiome sind formale Aussagen über Klassen und Beziehungen. Sie bilden den logischen Kern einer Ontologie.

Beispiele:

```
Jede Lehrkraft ist eine Person.
Ein Kurs wird von mindestens einer Lehrkraft unterrichtet.
Schüler und Lehrkraft sind disjunkte Klassen.
```

Diese Aussagen sind maschinell überprüfbar.

### Schlusfolgern (Reasoning)

Automatische Schlussfolgerungssysteme (Reasoner, Inference-Engines) können:

* neue Fakten ableiten,
* Klassifikationen automatisch berechnen,
* Inkonsistenzen erkennen,
* implizites Wissen explizit machen.

Beispiel:

Wenn definiert ist:

```
Jede Lehrkraft ist eine Person
Anna ist eine Lehrkraft
```

→ kann ein Reasoner automatisch ableiten:

```
Anna ist eine Person.
```


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
