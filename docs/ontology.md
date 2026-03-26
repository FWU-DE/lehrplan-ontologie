# Eine ganz kurze Einführung


## Was ist eine Ontologie?

Eine Ontologie ist eine formal definierte, auf Logik basierende und strukturierte Darstellung von Wissen innerhalb eines bestimmten Fachbereichs (Domäne). Sie legt Begriffe bzw. Konzepte, Kategorien, Eigenschaften und die Beziehungen zwischen ihnen fest und nutzt dabei standardisierte Definitionen sowie Namens- und Regelkonventionen. Dadurch entsteht eine gemeinsame, maschineninterpretierbare Bedeutungsebene.
In der Informatik und Künstlichen Intelligenz dienen Ontologien dazu, Daten systematisch zu organisieren, zu verknüpfen und logisch zu verarbeiten. Sie bestehen typischerweise aus Klassen (Kategorien), Eigenschaften (Attributen und Relationen) sowie Regeln, die bestimmen, wie Konzepte miteinander in Verbindung stehen. Durch diese einheitliche, formalisierte Sprache werden Rohdaten leichter beschreibbar, interpretierbar und austauschbar – sowohl zwischen verschiedenen Experimenten und Datenbanken als auch über Fachdisziplinen hinweg.

## Warum brauchen wir Ontologien?

*→ Interoperabilität soll ermöglicht werden*

Ontologien sind für modernes Datenmanagement und Digitalisierung von entscheidender Bedeutung, da sie einen gemeinsamen konzeptionellen Rahmen bieten, der die Beziehungen zwischen Datenentitäten definiert und so die Interoperabilität und Konsistenz zwischen verschiedenen Systemen gewährleistet. Durch die Organisation von Daten anhand einer formalen Struktur erleichtern Ontologien die Integration, Suche und Analyse von Informationen und helfen dabei, heterogene Datensätze in kohärente digitale Wissensressourcen umzuwandeln. Sie unterstützen eine effektive Datenverwaltung, indem sie klare Definitionen, die Rückverfolgung von Datenherkunft und Qualitätskontrollen in digitalen Infrastrukturen ermöglichen. Im Kontext der digitalen Transformation fungieren Ontologien als universelle Sprache, die Daten, Systeme und Prozesse über Geschäftsbereiche hinweg verbindet, Silos abbaut und Automatisierung, fortschrittliche Analysen und KI-gesteuerte Entscheidungsfindung ermöglicht. Sie sind auch ein wesentlicher Bestandteil der Umsetzung der [FAIR-Datenprinzipien](https://www.go-fair.org/fair-principles/) (Findable, Accessible, Interoperable und Reusable), indem sie semantische Bedeutung direkt in Datenmodelle einbetten, was Transparenz, Reproduzierbarkeit und langfristige Datennachhaltigkeit fördert. Ohne Ontologien sehen sich "Datenarbeiter" mit fragmentierten Datenlandschaften konfrontiert, in denen digitale Informationen nicht effektiv wiederverwendet oder geteilt werden können, was die Zusammenarbeit und Innovation behindert.

**Warum keine Datenbanken?** 
Im Gegensatz zu Datenbanken, die primär der strukturierten Speicherung und effizienten Abfrage von Daten dienen, modellieren Ontologien die semantische Bedeutung der enthaltenen Informationen. Datenbanken definieren, wie Daten organisiert sind (z.B. Tabellen und Attribute), während Ontologien zusätzlich festlegen, was die Daten bedeuten und wie Konzepte logisch miteinander verbunden sind. Diese Festlegung von Bedeutung erfolgt nach standardierten Methoden. Dadurch ermöglichen Ontologien maschinelles Schlussfolgern (Reasoning), Konsistenzprüfungen und semantische Interoperabilität zwischen Systemen.

**Warum keine Metadaten Schemata?**
Ontologien unterscheiden sich von Metadaten-Schemata vor allem durch ihren Grad an Formalisierung und ihre semantische Ausdrucksstärke. Metadaten-Schemata beschreiben in erster Linie, welche Informationen über Daten erfasst werden sollen – etwa Autor, Erstellungsdatum oder Dateiformat – und legen dafür strukturierte Felder und Bezeichnungen fest. Sie standardisieren somit die Beschreibung von Daten, enthalten jedoch meist keine formale Logik über die Bedeutung oder Beziehungen der beschriebenen Konzepte. Ontologien gehen darüber hinaus, indem sie Begriffe, Klassen und Relationen explizit definieren und logisch verknüpfen, sodass Maschinen Zusammenhänge interpretieren, Schlussfolgerungen ziehen und Konsistenz automatisch prüfen können. Während Metadaten-Schemata also hauptsächlich der einheitlichen Dokumentation dienen, ermöglichen Ontologien ein semantisches Verständnis und inferenzbasierte Verarbeitung von Wissen. Im Allgemeinen lassen sich die Informationen für Metadatenschemata aus Ontologien ableiten, jedoch ist dies nur begrenz umgekeht möglich.

**Warum reichen LLM-basierte Ansätze nicht aus?**
Ontologien und darauf aufbauende Wissensgraphen modellieren Wissen **explizit** und **strukturiert**: Konzepte, Entitäten und ihre Beziehungen werden formal definiert und in einem überprüfbaren Netzwerk gespeichert. Dadurch sind die enthaltenen Aussagen nachvollziehbar, logisch prüfbar und über längere Zeit stabil reproduzierbar. Schlussfolgerungen entstehen durch regelbasierte oder logische Inferenzmechanismen, deren Ergebnisse deterministisch und erklärbar sind. 

KI-Ansätze basierend auf Large Language Models (LLMs) hingegen repräsentieren Wissen **implizit** in Form **statistischer Muster** innerhalb neuronaler Modelle. Sie erzeugen Antworten auf Basis von Wahrscheinlichkeiten und Kontextähnlichkeiten statt auf explizit gespeicherten Fakten oder formalen Regeln. Dadurch können sie flexibel mit unvollständigen, mehrdeutigen oder sprachlich variierenden Informationen umgehen und natürliche Sprache besonders gut verarbeiten. Allerdings fehlt ihnen eine garantierte Konsistenz, überprüfbare Wissensbasis oder langfristig stabile Referenzstruktur. Während Ontologien und Wissensgraphen daher vor allem für Governance, Auditierung, Nachvollziehbarkeit und interoperable Wissensintegration geeignet sind, spielen LLMs ihre Stärke in Interpretation, Exploration und sprachlicher Interaktion mit komplexen oder unscharfen Daten aus.

Gleichzeitig können LLMs erheblich von Ontologien profitieren. Ontologien stellen eine strukturierte, verlässliche Wissensgrundlage bereit, die LLMs als Kontext oder Referenz nutzen können, um Begriffe eindeutig zu interpretieren, Halluzinationen zu reduzieren und konsistentere Antworten zu erzeugen. Durch die Verknüpfung mit Wissensgraphen können LLMs ihre sprachliche Flexibilität mit überprüfbaren Fakten kombinieren, etwa indem sie ontologisch definierte Konzepte für Retrieval, Klassifikation oder semantische Validierung verwenden. Ontologien fungieren damit als stabiler semantischer Anker, der probabilistische Sprachmodelle um erklärbares und governancefähiges Wissen ergänzt.


## Warum brauchen wir eine Ontologie für Lehrpläne?

Wir brauchen eine Ontologie für Lehrpläne, weil das deutsche Bildungssystem stark föderal organisiert ist und dadurch viele unterschiedliche, teilweise inkompatible Strukturen, Begriffe und Dokumentationsformen existieren. Eine Ontologie schafft hier ein gemeinsames semantisches Modell, das Lehrinhalte, Kompetenzen, Fächer, Jahrgangsstufen und Bildungsziele eindeutig beschreibt und miteinander verknüpft.

Erstens ermöglicht sie **Vergleichbarkeit zwischen Bundesländern**. Obwohl ähnliche Kompetenzen vermittelt werden, verwenden Lehrpläne oft unterschiedliche Bezeichnungen, Strukturierungen oder Granularitäten. Eine Ontologie kann diese Unterschiede auf eine gemeinsame Bedeutungsebene abbilden und so nachvollziehbar machen, z.B. welche Lernziele in verschiedenen Ländern tatsächlich äquivalent sind.

Zweitens verbessert sie die **Interoperabilität digitaler Bildungsplattformen**. Lernmanagementsysteme, Schulbuchplattformen, Prüfungsbanken oder Bildungsportale nutzen unterschiedliche Datenmodelle. Durch eine gemeinsame ontologische Grundlage können Inhalte automatisch ausgetauscht, wiederverwendet und systemübergreifend gefunden werden.

Drittens unterstützt eine Lehrplan-Ontologie **intelligente Suche und Empfehlungssysteme**. Lernmaterialien lassen sich nicht nur nach Schlagworten, sondern nach Kompetenzen, Lernzielen oder curricularen Zusammenhängen finden. Beispielsweise kann ein System erkennen, dass ein Material zur „Bruchrechnung“ eine bestimmte mathematische Kompetenz adressiert, auch wenn dies sprachlich anders formuliert ist.

Viertens schafft sie **Transparenz und Nachvollziehbarkeit** für Bildungssteuerung und Evaluation. Bildungsstandards, Prüfungsanforderungen und Lernressourcen können eindeutig miteinander verknüpft werden, was Analysen zur Kompetenzentwicklung oder curricularen Abdeckung erleichtert.

Fünftens ist eine Ontologie eine wichtige Grundlage für den **sinnvollen Einsatz von KI im Bildungsbereich**. KI-Systeme – insbesondere LLMs – können Inhalte besser einordnen, klassifizieren oder generieren, wenn sie auf eine stabile, explizite Wissensstruktur zurückgreifen können, die pädagogische Begriffe eindeutig definiert.

Eine Ontologie für Lehrpläne überführt heterogene curriculare Dokumente in eine gemeinsame, maschinenverständliche Wissensbasis. Sie reduziert föderale Fragmentierung, ermöglicht digitale Zusammenarbeit und schafft die Voraussetzung für interoperable, nachvollziehbare und zukunftsfähige Bildungsinfrastrukturen in Deutschland.


## Grundkonzepte

Typischerweise beschreiben Ontologien Wissen mithilfe einiger zentraler Bausteine:

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

Individuen sind konkrete Instanzen von Klassen. Sie lassen sich also unter einer Klasse zusammenfassen. 

Beispiele:

```
„Max Müller“ ist eine Instanz der Klasse Person.
„Mathematik Klasse 7 Gymnasium“ ist eine Instanz der Klasse Lehrplan.
```
#### 3. Eigenschaften (Properties)

Es werden drei zentrale Typen unterschieden:

**Objekteigenschaften (Object Properties)**

→ Beziehungen zwischen zwei Individuen

```
A unterrichtet B
X hatTeil Y
Z hatKompetenz K
```

Dateneigenschaften (Datatype Properties)

→ Verbindung zu Datentypwerten

```
A hatName "Max Mustermann" 
A hatGeburtsdatum "01.01.1970" 
A hatPunktzahl 6 
```

Metaeigenschaften (Annotation Properties)

→ Verbindung zu Metadaten 

```
C hatLabel "Schulfach"
C hatDefinition "Ein Schulfach bezeichnet ein an Schulen unterrichteten Fachgebiet ..."
C wurdeErzeugtVon "Max Mustermann" 
C hatKommentar "Die Definition muss nochmal überarbeitet werden"
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
Kompetenzen sind ausschliesslich Eigenschaften einer Person
KannLesen ist eine Kompetenz
X hatEigenschaft KannLesen
```

→ kann ein Reasoner automatisch ableiten:

```
X ist eine Person.
```


## RDF / RDFS / OWL 

Um Ontologien auch maschineninterpretierbar abzuspeichern werden überlicherweise RDF(S) und OWL verwendet. 

### RDF(S) – Die Basisstruktur 

[RDF (Resource Description Framework)](https://www.w3.org/TR/rdf11-concepts/) ist ein Standard des [World Wide Web Consortium (W3C)](https://www.w3.org/) zur Repräsentation von Informationen im Web. RDF beschreibt Daten als Tripel: `Subjekt – Prädikat – Objekt`, z. B. `Max – istLehrkraft – SchuleA`. Damit lassen sich Fakten maschinenlesbar und universell identifizierbar darstellen. Üblicherweise werden die Teile eines Tripels durch einen IRI (International Resource Identifier) eindeutig gekennzeichnet, was Verwechslungen ausschließt und Interoperabilität zwischen verschiedenen Systemen unterstützt. Mehr Details zu RDF können in der [RDF-Spezifikation](https://www.w3.org/TR/rdf11-concepts/) gefunden werden.

RDFS (RDF Schema) ist eine Erweiterung von RDF, die einfache Semantik und Struktur bereitstellt. Es definiert Klassen, Unterklassen, Eigenschaften und Hierarchien, also die grundlegende Organisation von Konzepten in RDF. RDFS legt damit die Basis, auf der komplexere Ontologien basierend auf OWL aufbauen können.

RDF = Datenmodell für Fakten (Tripel)

RDFS = einfache Semantik/Schema für Klassen und Beziehungen

OWL = komplexe Semantik 

### OWL

Die [Web Ontology Language (OWL)](https://www.w3.org/TR/owl2-primer/) ist ein international standardisierter Formalismus zur Modellierung von Wissen. Sie wurde ebenfalls vom W3C entwickelt, um Daten nicht nur maschinenlesbar, sondern auch maschinenverständlich zu machen. OWL ermöglicht die formale Beschreibung von Konzepten, Beziehungen und logischen Regeln innerhalb einer Domäne und bildet damit die Grundlage für semantische Interoperabilität, automatisches Schlussfolgern und wissensbasierte Anwendungen.


Ontologien können basierend auf verschiedenen Logiken entworfen werden, z.B. Prädikatenlogik erster Stufe (First-Order Logic, FOL), regelbasierte Logiken (Rule-Based Logics), Beschreibungslogiken (Description Logics, DL), Logikprogrammierung (z.B. Prolog), etc..

OWL nutzt bewusst Beschreibungslogiken als zugrunde liegende Logik, weil sie einen optimalen Kompromiss zwischen Ausdrucksstärke und Berechenbarkeit bietet. Ziel ist es, Wissen formell und maschinenverständlich zu modellieren, ohne dass automatisches Reasoning unentscheidbar oder unpraktikabel wird. Während die volle Prädikatenlogik theoretisch beliebig komplexe Zusammenhänge darstellen könnte, wäre das Schlussfolgern in dieser Logik im Allgemeinen nicht berechenbar. Beschreibungslogiken sind hingegen audrucksstark genug, um Klassenhierarchien, Relationen, Einschränkungen und Typisierungen präzise zu modellieren, aber gleichzeitig so strukturiert, dass Reasoner zuverlässig neue Fakten ableiten, Inkonsistenzen erkennen und Klassifikationen automatisch erstellen können.

OWL folgt der Open World Assumption: Nur weil eine Information nicht vorliegt, bedeutet das nicht, dass sie falsch ist. Gleichzeitig ist das Schlußfolgern monoton, das heißt neue Informationen ändern bestehende Schlussfolgerungen nicht. Diese Eigenschaften machen OWL besonders geeignet für verteiltes, heterogenes Wissen. 

Ein weiteres wichtiges Designprinzip von OWL ist die Modularität: Mit den [OWL-2-Profilen](https://www.w3.org/TR/owl2-profiles/) EL, QL und RL lassen sich Ontologien je nach Anwendungsfall leichtgewichtig oder besonders ausdrucksstark gestalten. 



## Ontologieentwicklung in der Praxis

Die Entwicklung einer Ontologie ist kein rein technischer Prozess, sondern eine Kombination aus fachlicher Modellierung, logischer Formalisierung und iterativer Abstimmung mit Domänenexpert:innen. Ziel ist nicht, die „perfekte“ Ontologie auf Anhieb zu erstellen, sondern schrittweise ein gemeinsames, konsistentes Verständnis eines Wissensbereichs zu entwickeln.

Typischerweise folgt die Ontologieentwicklung mehreren wiederkehrenden Schritten:

**1. Domänenanalyse**
Zunächst wird geklärt, welcher Wissensbereich modelliert werden soll (Scope) und welche Fragestellungen die Ontologie unterstützen muss (sogenannte Competency Questions). Diese Fragen helfen zu bestimmen, welche Konzepte tatsächlich benötigt werden.

**2. Begriffserhebung (Conceptualization)**
Zentrale Begriffe, Beziehungen und Eigenschaften werden identifiziert. Häufig geschieht dies durch Analyse bestehender Dokumente, Datenmodelle oder Interviews mit Fachpersonen.

**3. Modellierung**
Die identifizierten Konzepte werden als Klassen, Eigenschaften und Axiome formalisiert. Dabei entstehen Hierarchien und logische Einschränkungen.

**4. Formalisierung in OWL/RDF**
Das konzeptuelle Modell wird in eine maschinenlesbare Form überführt.

**5. Evaluation und Reasoning**
Reasoner werden eingesetzt, um Inkonsistenzen zu erkennen und zu prüfen, ob die Ontologie die gewünschten Schlussfolgerungen erlaubt.

**6. Iterative Weiterentwicklung**
Ontologien sind lebende Artefakte. Neue Anforderungen, Datenquellen oder fachliche Erkenntnisse führen regelmäßig zu Anpassungen.

Ontologien entstehen selten isoliert. Erfolgreiche Projekte verbinden technische Modellierung mit kontinuierlicher fachlicher Abstimmung.

## Gute Modellierungsprinzipien (Best Practices)

Es ist wichtig zu verstehen, dass Ontologieentwicklung weniger vom Werkzeug als von guten Modellierungsentscheidungen abhängt. Einige grundlegende Prinzipien sind:

* **Klare Begriffsdefinitionen:**
Jeder Begriff sollte eindeutig beschrieben sein.
* **Trennung von Konzept und Instanz:**  Klassen beschreiben allgemeine Kategorien, Individuen konkrete Dinge.
* **Wiederverwendung bestehender Ontologien:**
Statt alles neu zu modellieren, sollten etablierte Ontolgien integriert werden (z. B. allgemeine Personen- oder Organisationsmodelle).
* **Minimal notwendige Komplexität:**
Eine einfache, verständliche Ontologie ist meist wertvoller als eine maximal ausdrucksstarke.
* **Explizite Annahmen:**
Implizites Fachwissen sollte formalisiert werden, damit Maschinen es interpretieren können.
* **Stabile Identifikatoren (IRIs):**
Konzepte sollten langfristig eindeutig referenzierbar bleiben.

Eine gute Ontologie ist daher nicht unbedingt die komplexeste, sondern diejenige, die von Menschen verstanden und von Maschinen zuverlässig genutzt werden kann.


## Werkzeuge 

Ontologien werden typischerweise mit spezialisierten Werkzeugen entwickelt und verwaltet. Zu den häufig verwendeten Komponenten gehören:

* Ontologie-Editoren (z. B. [Protégé](https://protege.stanford.edu/)) zur Modellierung
* Reasoner zur logischen Überprüfung (z.B. [Hermit](http://www.hermit-reasoner.com/), [Pellet](https://github.com/stardog-union/pellet))
* Triple Stores zur Speicherung von RDF-Daten (z.B. [Virtuoso](https://vos.openlinksw.com/owiki/wiki/VOS), [GraphDB](https://graphdb.ontotext.com/))
* [SPARQL](https://www.w3.org/TR/sparql11-query/) als Abfragesprache für Wissensgraphen

Diese Werkzeuge bilden zusammen die technische Grundlage des sogenannten Semantic Web-Ökosystems.

## Ontologien als Grundlage von Wissensgraphen

In vielen modernen Anwendungen bilden Ontologien die konzeptuelle Grundlage von Wissensgraphen.

Während eine Ontologie die Bedeutung und Struktur definiert (Schema-Ebene), enthalten Wissensgraphen die konkreten Fakten (Daten-Ebene). Erst durch diese Kombination entsteht ein semantisches Netzwerk, das sowohl Datenintegration als auch automatisches Schlussfolgern ermöglicht.

Ontologie → definiert was existiert und wie es zusammenhängt

Wissensgraph → enthält konkrete Instanzen und Fakten



## Ebenen von Ontologien

Ontologien lassen sich abhängig von ihrem Abstraktionsgrad und ihrer semantischen Ausdrucksstärke in aufeinander aufbauende Ebenen einteilen. Diese Ebenen unterscheiden sich darin, wie allgemein oder spezifisch die beschriebenen Konzepte sind und welche Rolle sie innerhalb einer Wissensarchitektur übernehmen.

**1) Top-Level-Ontologien**

Top-Level-Ontologien (TLOs) beschreiben sehr allgemeine, domänenübergreifende Konzepte auf einer hohen Abstraktionsebene. Sie modellieren grundlegende Kategorien der Realität, etwa Objekt, Prozess, Eigenschaft oder Zeit, die unabhängig von einem konkreten Anwendungsbereich gelten.

TLOs dienen als semantisches Fundament und schaffen gemeinsame Grundannahmen, auf denen unterschiedliche Ontologien aufbauen können. Dadurch ermöglichen sie Konsistenz, Vergleichbarkeit und Interoperabilität zwischen verschiedenen Domänenmodellen.

Ein bekanntes Beispiel ist die[ Basic Formal Ontology (BFO)](https://github.com/BFO-ontology/BFO), die insbesondere in wissenschaftlichen und biomedizinischen Anwendungen eingesetzt wird.

**2) Mid-Level-Ontologien**

Mid-Level-Ontologien vermitteln zwischen abstrakten Top-Level-Konzepten und konkreten Fachdomänen. Sie spezifizieren allgemeine Begriffe weiter und stellen wiederverwendbare Modellbausteine bereit, die in mehreren Domänen eingesetzt werden können.

Sie erhöhen die Modellierungsgranularität und erleichtern die modulare Verbindung verschiedener domänenspezifischer Ontologien. Typische Beispiele sind allgemeine Modelle für Organisationen, Personen, oder Informationsobjekte.

**3) Domänenontologien**

Domänenontologien beschreiben Wissen innerhalb eines spezifischen Fachgebiets. Sie enthalten detaillierte, fachlich präzise Konzepte sowie deren Beziehungen, Definitionen, Regeln und Axiome.

Hier wird explizites Expertenwissen formalisiert — beispielsweise für Bildung, Medizin, Recht oder Ingenieurwesen. Domänenontologien bilden meist die inhaltliche Grundlage konkreter Wissensgraphen und Fachanwendungen.

**4) Anwendungsontologien**

Ontologien auf Anwendungsebene sind stark auf einen konkreten Nutzungskontext zugeschnitten. Sie spezifizieren Domänenontologien weiter, um spezifische Anforderungen eines Systems, Projekts oder Datensatzes abzubilden.

Sie enthalten häufig sehr detaillierte Modellierungen, die direkt für Anwendungen wie Wissensgraphen, Datenintegration oder KI-gestützte Systeme genutzt werden.

### Warum diese Einteilung wichtig ist: Top-Down statt Bottom-Up

Die Unterscheidung der Ontologieebenen ist entscheidend für nachhaltige Ontologieentwicklung. Statt jede Ontologie isoliert „bottom-up“ aus einzelnen Datensätzen zu modellieren, verfolgt man idealerweise einen Top-Down-Ansatz:

Eine Top-Level-Ontologie liefert grundlegende Kategorien.
Mid-Level-Ontologien stellen wiederverwendbare Muster bereit.
Domänenontologien spezifizieren fachliches Wissen.
Anwendungsontologien passen das Modell an konkrete Systeme an.

Dieser schichtweise Aufbau verbessert Konsistenz, Wiederverwendbarkeit und Interoperabilität erheblich.

In vielen Projekten wie auch in der Lehrplan Ontologie wird beispielsweise BFO als Top-Level-Ontologie verwendet, während Relationen über die Relation Ontology (RO) definiert werden. Dadurch entstehen kompatible Wissensmodelle, die sich leichter (re-)kombinieren und erweitern lassen.

## Wo finde ich Ontologien

Ontologien werden in einer Vielzahl spezialisierter Repositorien, Kataloge und Forschungsinfrastrukturen veröffentlicht. Es hilfreich zu wissen, dass Ontologien selten über klassische Suchmaschinen, sondern meist über Ontologie-Registries oder Terminologie-Dienste gefunden werden.

Hier ist eine Übersicht einiger Recherchemöglichkeiten: 

* [TIB Terminology Service](https://terminology.tib.eu/ts)
* [Ontobee](https://ontobee.org/)
* [Linked Open Vocabularies (LOV)](https://lov.linkeddata.es/)
* [BioPortal](https://bioportal.bioontology.org/)



## Ontologie Entwicklung Werkzeuge und Ressourcen

- **[Protégé](https://protege.stanford.edu/software.php)** – Ein vielseitiger Ontologie-Editor, der OWL 2 unterstützt. Er ermöglicht die Visualisierung, Bearbeitung und Schlussfolgerung über Ontologiestrukturen.
- **[ODK](https://github.com/INCATools/ontology-development-kit)** – Das Ontology Development Kit (ODK) ist ein großartiges Tool zur Verwaltung des Lebenszyklus von Ontologien. Das ODK ist: 1) eine Toolbox mit verschiedenen ontologiebezogenen Tools wie ROBOT, owltools, dosdp-tools und vielen anderen, die als Docker-Image gebündelt sind, und 2) eine Reihe von ausführbaren Workflows zur Verwaltung der kontinuierlichen Integration, Qualitätskontrolle, Releases und dynamischen Importe von Ontologien.
- **[ROBOT](https://robot.obolibrary.org/)** – ROBOT ist ein Tool für die Arbeit mit Ontologien. Es kann als Befehlszeilentool oder als Bibliothek für jede Sprache auf der Java Virtual Machine verwendet werden.
- **[OTTR](https://ottr.xyz/)** – Sprache mit unterstützenden Tools zur Darstellung und Instanziierung von RDF-Graphen und OWL-Ontologie-Modellierungsmustern. Bietet eine Abstraktionsebene über den grundlegenden RDF-Funktionen.
- **[OOPS!](https://oops.linkeddata.es/)** – OOPS! Ontology Pitfall Scanner ist ein webbasiertes Tool, das unabhängig von jeder Ontologie-Entwicklungsumgebung ist und potenzielle Fallstricke aufspürt, die zu Modellierungsfehlern führen könnten.
- **[RDF Grapher](https://www.ldf.fi/service/rdf-grapher)** – RDF Grapher ist ein Webdienst zum Parsen von RDF-Daten und deren Visualisierung als Graph.
- **Python-Bibliotheken** – Bibliotheken wie [rdflib](https://github.com/RDFLib/rdflib) und [Owlready2](https://owlready2.readthedocs.io/) werden hauptsächlich für die semantische Datenverarbeitung, -integration und -validierung verwendet.
- **Versionskontrolle und Zusammenarbeit** – [GitHub](https://github.com/) wird für die Versionskontrolle, die Nachverfolgung von Problemen und die kollaborative Entwicklung verwendet, um Transparenz und strukturierte Aktualisierungen zu gewährleisten.

## Lesestoff und Materialien zu Ontologien für Einsteiger

- [Pizza Tutorial](https://www.michaeldebellis.com/post/new-protege-pizza-tutorial): Ein praktischer Leitfaden zum Erstellen von OWL-Ontologien mit Protégé 5.5 und Plugins
- ISE FIZ YouTube-Kanal: Playlist mit Vorlesungen [„Knowledge Graphs – Foundations and Applications”](https://www.youtube.com/watch?v=CiU1sMbL3k4&list=PLNXdQl4kBgzubTOfY5cbtxZCgg9UTe-uF)
- [OBO Academy’s Ontology Design Course](https://oboacademy.github.io/obook/lesson/ontology-design/): Ein interaktiver, kostenloser Lehrplan mit Lektionen zu Ontologiekonstruktion, Schlussfolgerungen und Designprinzipien (basierend auf den Standards der OBO Foundry und des Semantic Web)
- [Ontology Development 101](https://protege.stanford.edu/publications/ontology_development/ontology101.pdf): Der Leitfaden der Stanford University bietet eine grundlegende, schrittweise Methodik für die Erstellung Ihrer ersten Ontologie.
- YouTube-Kanal von [Barry Smith](https://www.youtube.com/channel/UCDYw4LTZfK27Q0lJ8pxQC8Q)
- Blogs von [Maria Keet](https://keet.wordpress.com/), [Michael DeBellis](https://www.michaeldebellis.com/), [Chris Mungall](https://douroucouli.wordpress.com/)
- Und natürlich zahlreiche Fachbücher, z.B.:
 	-  Hitzler, Pascal; Krötzsch, Markus; Rudolph, Sebastian – [Semantic Web: Grundlagen](https://www.semantic-web-grundlagen.de/)
	-  Robert Arp, Barry Smith, and Andrew Spear: [Building Ontologies with Basic Formal Ontology](http://ontology.buffalo.edu/BOBFO/detailed-table-of-contents.html) 
	-  Nicola Guarino; Daniel Oberle; und Steffen Staab. "What is an ontology?." Handbook on ontologies. Springer Berlin Heidelberg, 2009.
