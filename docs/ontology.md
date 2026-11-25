# Einführung in Ontologien

Dieser Abschnitt gibt einen Überblick über Begriff, Nutzen und technische Umsetzung von Ontologien. Er vermittelt die wichtigsten Grundbegriffe als Orientierung für das Verständnis der Lehrplan-Ontologie und stellt, wo sinnvoll, Bezüge zu ihr her. Eine fundierte Einarbeitung in das Thema kann er nicht ersetzen; hierfür sei auf die [weiterführende Literatur](#weiterfuhrende-literatur-und-materialien) am Ende des Abschnitts verwiesen.


## Begriff

Eine Ontologie ist eine formale, auf Logik basierende Darstellung von Wissen in einem bestimmten Fachgebiet (Domäne). Sie legt fest, welche Begriffe in diesem Fachgebiet verwendet werden, was sie bedeuten und in welcher Beziehung sie zueinander stehen. Diese Festlegungen sind so präzise formuliert, dass sie sowohl für Menschen verständlich als auch maschinell auswertbar sind.

Alles, worüber eine Ontologie Aussagen trifft, wird als **Entität** bezeichnet: physische Objekte wie Personen oder Schulen ebenso wie Prozesse, Eigenschaften, Rollen oder Informationen wie ein Lehrplan.

Ontologien bestehen typischerweise aus **Klassen** (Kategorien), **Eigenschaften** (Relationen und Attribute) und **Axiomen** (Regeln), die den Zusammenhang der Begriffe bestimmen. Daten, die auf Grundlage einer Ontologie beschrieben sind, lassen sich einheitlich interpretieren, miteinander verknüpfen und zwischen Anwendungen, Datenbanken und Fachgebieten austauschen.


## Nutzen von Ontologien

Ontologien bilden einen gemeinsamen begrifflichen Rahmen für Daten aus unterschiedlichen Quellen. Sie unterstützen insbesondere:

- **Interoperabilität**: Systeme, die dieselbe Ontologie verwenden, können die Daten des jeweils anderen Systems korrekt interpretieren, auch wenn sie intern unterschiedlich aufgebaut sind.
- **Integration und Recherche**: Heterogene Datenbestände lassen sich zusammenführen und über gemeinsame Begriffe durchsuchen und auswerten.
- **Qualitätssicherung**: Eindeutige Definitionen und logische Regeln ermöglichen es, Widersprüche und Lücken in den Daten automatisch zu erkennen.
- **Nachnutzbarkeit**: Ontologien sind ein zentraler Baustein der [FAIR-Prinzipien](https://www.go-fair.org/fair-principles/) (Findable, Accessible, Interoperable, Reusable), da sie die Bedeutung von Daten explizit und dauerhaft festhalten.

Fehlt ein solcher Rahmen, bleiben Daten häufig auf einzelne Systeme beschränkt und lassen sich nur mit erheblichem Aufwand wiederverwenden oder austauschen.

### Abgrenzung zu Datenbanken

Datenbanken dienen in erster Linie der strukturierten Speicherung und effizienten Abfrage von Daten. Sie legen fest, *wie* Daten organisiert sind, etwa in Tabellen und Spalten. Ontologien legen darüber hinaus fest, *was* die Daten bedeuten und wie die Begriffe logisch zusammenhängen. Diese Bedeutung wird nach standardisierten Verfahren formalisiert und ermöglicht dadurch automatisches Schlussfolgern (Reasoning), Konsistenzprüfungen und semantische Interoperabilität zwischen Systemen. Ontologien und Datenbanken schließen sich dabei nicht aus: Die Daten der Lehrplan-Ontologie werden beispielsweise in einer Graphdatenbank (Triple Store) vorgehalten.

### Abgrenzung zu Metadatenschemata

Metadatenschemata beschreiben, welche Angaben über Daten erfasst werden, etwa Autor, Erstellungsdatum oder Dateiformat, und definieren dafür einheitliche Felder. Sie standardisieren die Beschreibung von Daten, enthalten jedoch in der Regel keine formale Logik über die Bedeutung der beschriebenen Begriffe. Ontologien gehen darüber hinaus: Sie definieren Begriffe und Relationen explizit und verknüpfen sie logisch, sodass Zusammenhänge maschinell interpretiert, Schlussfolgerungen gezogen und die Konsistenz geprüft werden können. Aus einer Ontologie lässt sich in der Regel ein Metadatenschema ableiten, umgekehrt ist dies nur eingeschränkt möglich.

### Abgrenzung zu großen Sprachmodellen (LLMs)

Ontologien und darauf aufbauende Wissensgraphen bilden Wissen **explizit** ab: Begriffe, Entitäten und ihre Beziehungen sind formal definiert und als überprüfbare Aussagen gespeichert. Schlussfolgerungen entstehen durch logische Verfahren, deren Ergebnisse reproduzierbar und nachvollziehbar sind.

Große Sprachmodelle (Large Language Models, LLMs) bilden Wissen dagegen **implizit** in Form statistischer Muster ab. Ihre Antworten beruhen auf Wahrscheinlichkeiten und nicht auf gespeicherten Fakten oder formalen Regeln. Sie verarbeiten natürliche Sprache sowie unvollständige oder mehrdeutige Informationen sehr flexibel, gewährleisten jedoch weder Konsistenz noch eine überprüfbare Wissensbasis.

Beide Ansätze ergänzen sich: Ontologien eignen sich für Nachvollziehbarkeit, Qualitätssicherung und verlässliche Datenintegration, LLMs für Interpretation, Exploration und sprachliche Interaktion. Ontologien können LLMs als verlässlicher Bezugsrahmen dienen, um Begriffe eindeutig zu interpretieren, Halluzinationen zu verringern und Antworten durch überprüfbare Fakten zu belegen.


## Nutzen einer Ontologie für Lehrpläne

Das deutsche Bildungssystem ist föderal organisiert. Jedes Land entwickelt eigene Lehrpläne mit eigenen Strukturen, Begriffen und Dokumentformen. Eine Ontologie stellt hierfür ein gemeinsames Modell bereit, das Kompetenzen, Inhalte, Fächer, Jahrgangsstufen und Bildungsziele eindeutig beschreibt und miteinander verknüpft. Daraus ergeben sich folgende Vorteile:

- **Vergleichbarkeit zwischen den Ländern**: Unterschiedliche Bezeichnungen, Gliederungen und Detaillierungsgrade werden auf eine gemeinsame Bedeutungsebene abgebildet. Dadurch wird nachvollziehbar, welche Anforderungen in verschiedenen Ländern einander entsprechen.
- **Interoperabilität digitaler Bildungsplattformen**: Lernmanagementsysteme, Schulbuchplattformen, Aufgabendatenbanken und Bildungsportale können Inhalte auf einer gemeinsamen Grundlage austauschen und systemübergreifend auffindbar machen.
- **Verbesserte Recherche und Empfehlungen**: Lernmaterialien lassen sich nicht nur nach Schlagworten, sondern nach Kompetenzen und curricularen Zusammenhängen finden. So kann beispielsweise ein Material zur Bruchrechnung einer bestimmten mathematischen Kompetenz zugeordnet werden, auch wenn diese darin anders bezeichnet ist.
- **Transparenz für Bildungssteuerung und Evaluation**: Bildungsstandards, Prüfungsanforderungen und Lernressourcen lassen sich eindeutig verknüpfen. Dies erleichtert Analysen zur Kompetenzentwicklung und zur curricularen Abdeckung.
- **Verlässlicher Einsatz von Künstlicher Intelligenz (KI)**: KI-Systeme können Inhalte zuverlässiger einordnen und erzeugen, wenn sie auf eine explizite Wissensstruktur mit eindeutig definierten pädagogischen Begriffen zurückgreifen.

Ziele und Umfang der Lehrplan-Ontologie werden im Abschnitt [Konzeptuelle Grundlagen](introduction.md) ausführlich beschrieben.


## Grundkonzepte

Ontologien beschreiben Wissen mit einer überschaubaren Zahl zentraler Bausteine.

### Klassen

Klassen repräsentieren allgemeine Begriffe oder Kategorien einer Domäne, beispielsweise:

- Person
- Schule
- Lehrplan
- Kompetenz

Klassen lassen sich hierarchisch ordnen. Alle Aussagen über eine Oberklasse gelten auch für ihre Unterklassen:

```text
Jede Lehrkraft ist eine Person.     (Lehrkraft ist Unterklasse von Person)
```

### Individuen

Individuen (Instanzen) sind die konkreten Entitäten, die einer Klasse angehören:

```text
„Max Müller“ ist eine Instanz der Klasse Person.
„Mathematik Klasse 7 Gymnasium“ ist eine Instanz der Klasse Lehrplan.
```

### Eigenschaften

Eigenschaften (Properties) verbinden Individuen miteinander oder mit Werten. Die Ontologiesprache OWL ([Web Ontology Language](https://www.w3.org/TR/owl2-overview/), siehe [unten](#owl-die-ontologiesprache)) unterscheidet drei Arten:

**Objekteigenschaften** (Object Properties) verbinden zwei Individuen:

```text
Max unterrichtet Klasse7b
Lehrplan hatTeil Lernbereich1
```

**Dateneigenschaften** (Datatype Properties) verbinden ein Individuum mit einem Wert, etwa einer Zahl, einem Text oder einem Datum:

```text
Max hatName "Max Mustermann"
Max hatGeburtsdatum "1970-01-01"
```

**Annotationseigenschaften** (Annotation Properties) enthalten Angaben für menschliche Leserinnen und Leser, etwa Bezeichnungen, Definitionen oder Kommentare. Sie haben keine logische Bedeutung und werden beim Schlussfolgern nicht berücksichtigt:

```text
Schulfach hatLabel "Schulfach"
Schulfach hatDefinition "Ein Schulfach ist ein an Schulen unterrichtetes Fachgebiet …"
Schulfach hatKommentar "Die Definition muss noch überarbeitet werden."
```

### Axiome

Axiome sind formale Aussagen über Klassen und Eigenschaften. Sie bilden den logischen Kern einer Ontologie und sind maschinell überprüfbar:

```text
Jede Lehrkraft ist eine Person.
Jeder Kurs wird von mindestens einer Lehrkraft unterrichtet.
Nichts kann zugleich Schüler und Lehrkraft sein.   (disjunkte Klassen)
```

### Schlussfolgern (Reasoning)

Programme zum automatischen Schlussfolgern (Reasoner, siehe [Werkzeuge](#werkzeuge)) werten die Axiome aus. Sie können

- neue Fakten ableiten,
- Klassen automatisch in die Hierarchie einordnen,
- Widersprüche (Inkonsistenzen) erkennen,
- implizites Wissen explizit machen.

Beispiel: Ist festgelegt, dass ausschließlich Personen Kompetenzen besitzen können, und besitzt X die Kompetenz „Lesen“, leitet der Reasoner ab, dass X eine Person ist:

```text
Nur Personen haben Kompetenzen.     (Axiom)
X hatKompetenz Lesen                (Fakt)
→ X ist eine Person.                (abgeleitet)
```

Die Lehrplan-Ontologie nutzt diesen Mechanismus, um die Begriffe der Länder einzuordnen: Da der bayerische *Lernbereich (BY)* die Bereichsfunktion trägt und *CE-Bereich* (CE: curriculares Element) als „curriculares Element mit Bereichsfunktion“ definiert ist, ordnet der Reasoner *Lernbereich (BY)* automatisch als Unterklasse von *CE-Bereich* ein (siehe [Pattern 8](patterns.md#pattern-8-funktionen)).


## Ontologien und Wissensgraphen

In vielen Anwendungen bilden Ontologien die Grundlage von Wissensgraphen:

- Die **Ontologie** legt fest, welche Arten von Entitäten es gibt und wie diese zusammenhängen (Schema-Ebene, auch *T-Box* für „terminologische Box“).
- Der **Wissensgraph** enthält die konkreten Entitäten und Fakten (Daten-Ebene, auch *A-Box* für „assertionale Box“, also die Menge der Faktenaussagen).

Erst im Zusammenspiel beider entsteht ein semantisches Netz, das Datenintegration und automatisches Schlussfolgern ermöglicht. Im Fall der Lehrplan-Ontologie bilden die Lehrplandaten der Länder den Wissensgraphen; sie sind über einen [SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql) abfragbar, eine Schnittstelle für Abfragen in der standardisierten Abfragesprache [SPARQL (SPARQL Protocol and RDF Query Language)](https://www.w3.org/TR/sparql11-overview/).


## RDF, RDFS und OWL

Für die maschinelle Verarbeitung werden Ontologien in standardisierten Formaten des [World Wide Web Consortium (W3C)](https://www.w3.org/) gespeichert:

| Standard | Aufgabe |
|----------|---------|
| [RDF (Resource Description Framework)](https://www.w3.org/TR/rdf11-concepts/) | Datenmodell: Aussagen als Tripel aus Subjekt, Prädikat und Objekt |
| [RDFS (RDF Schema)](https://www.w3.org/TR/rdf11-schema/) | einfaches Schema: Klassen, Unterklassen, Properties |
| OWL | ausdrucksstarke Ontologiesprache mit logischer Semantik |

### RDF – das Datenmodell

RDF beschreibt Daten als Tripel der Form `Subjekt – Prädikat – Objekt`, z. B. `Max – unterrichtetAn – SchuleA`. Subjekt und Prädikat, in der Regel auch das Objekt, werden durch eine **IRI** ([Internationalized Resource Identifier](https://www.rfc-editor.org/rfc/rfc3987)) bezeichnet. Eine IRI ist eine global eindeutige Kennung, vergleichbar mit einer Webadresse. Sie schließt Verwechslungen aus und ermöglicht es, Daten aus verschiedenen Quellen zusammenzuführen.

RDF kann in verschiedenen Syntaxen notiert werden. In dieser Dokumentation wird hauptsächlich die gut lesbare Syntax [**Turtle**](https://www.w3.org/TR/turtle/) verwendet. Das folgende Beispiel beschreibt einen sächsischen Lehrplan:

```turtle
@prefix lp:   <https://w3id.org/lehrplan/ontology/> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex:   <https://www.example.org/> .

ex:lehrplan-mathe a lp:LP_0000438 ;           # ist ein Lehrplan
    rdfs:label "Gymnasium Mathematik" ;
    lp:LP_0000029 lp:LP_3000047 .             # von Bundesland: Sachsen
```

Wie viele etablierte Ontologien verwendet die Lehrplan-Ontologie bewusst „nicht sprechende“ IRIs wie `LP_0000438`. Die lesbare Bezeichnung („Lehrplan“) ist als `rdfs:label` an der Klasse hinterlegt. Die IRI bleibt dadurch stabil, auch wenn sich die Bezeichnung ändert oder in mehreren Sprachen vorliegt.

### RDFS – das Schema

RDFS erweitert RDF um die Möglichkeit, Klassen und Properties zu definieren und hierarchisch zu ordnen (`rdfs:subClassOf`, `rdfs:subPropertyOf`) sowie Bezeichnungen (`rdfs:label`) und Kommentare anzugeben. RDFS bildet die Grundlage für OWL.

### OWL – die Ontologiesprache

OWL ist die vom W3C standardisierte Sprache für Ontologien. Sie ermöglicht es, Klassen über Bedingungen zu definieren, Eigenschaften näher zu charakterisieren (z. B. als transitiv oder als zueinander invers) und Klassen als disjunkt festzulegen.

Ontologien lassen sich grundsätzlich in verschiedenen Logiken formulieren, etwa in Prädikatenlogik erster Stufe, in regelbasierten Logiken oder in Beschreibungslogiken. Die maßgebliche Variante OWL 2 DL beruht auf **Beschreibungslogiken** (Description Logics, DL), da diese einen ausgewogenen Kompromiss zwischen Ausdrucksstärke und Berechenbarkeit bieten. Die volle Prädikatenlogik ist zwar ausdrucksstärker, das Schlussfolgern ist dort jedoch im Allgemeinen nicht entscheidbar, d.h. es kann nicht garantiert werden, dass ein entsprechender Schlussfolgerungsalgorithmus auch wirklich zu Ende kommt. Beschreibungslogiken reichen für Klassenhierarchien, Relationen und Einschränkungen aus und gewährleisten zugleich, dass Reasoner zuverlässig Fakten ableiten, Widersprüche erkennen und Klassen einordnen können.

Für das Verständnis von OWL sind zwei Grundannahmen wesentlich:

- **Open World Assumption**: Eine nicht angegebene Aussage gilt nicht als falsch, sondern als unbekannt. Ist für eine Lehrkraft beispielsweise nur das Fach Mathematik erfasst, folgt daraus nicht, dass sie kein weiteres Fach unterrichtet. Auf die Frage „Unterrichtet sie Physik?“ würde eine klassische Datenbank in der Regel mit „nein“ antworten (Closed World Assumption); aus Sicht von OWL lautet die Antwort „unbekannt“.
- **Monotonie**: Neue Aussagen machen bereits gezogene Schlussfolgerungen nicht ungültig; es können lediglich weitere hinzukommen.

Diese Eigenschaften machen OWL besonders geeignet für verteiltes, unvollständiges Wissen aus unterschiedlichen Quellen. Für die Prüfung, ob Daten vollständig sind – etwa ob jedes Element einen Titel besitzt –, wird ergänzend die [Shapes Constraint Language (SHACL)](https://www.w3.org/TR/shacl/) eingesetzt.

Für Anwendungen mit sehr großen Datenmengen definiert OWL 2 zudem drei [Profile](https://www.w3.org/TR/owl2-profiles/), die die Ausdrucksmittel so einschränken, dass sich das Schlussfolgern besonders effizient umsetzen lässt: OWL 2 EL (benannt nach der Beschreibungslogik *EL*) für Ontologien mit sehr vielen Klassen, OWL 2 QL (*Query Language*) für Abfragen über große Datenbestände und OWL 2 RL (*Rule Language*) für regelbasierte Systeme.


## Ebenen von Ontologien

Ontologien lassen sich nach ihrem Abstraktionsgrad in aufeinander aufbauende Ebenen einteilen.

**Top-Level-Ontologien** beschreiben sehr allgemeine, fachübergreifende Kategorien wie Objekt, Prozess, Eigenschaft oder Zeit. Sie legen gemeinsame Grundannahmen fest, auf denen unterschiedliche Ontologien aufbauen können. Ein bekanntes Beispiel ist die [Basic Formal Ontology (BFO)](https://basic-formal-ontology.org/), die vor allem in wissenschaftlichen und biomedizinischen Anwendungen verbreitet ist.

**Mid-Level-Ontologien** vermitteln zwischen diesen allgemeinen Kategorien und konkreten Fachgebieten. Sie stellen wiederverwendbare Bausteine bereit, etwa für Organisationen, Personen oder Informationsobjekte.

**Domänenontologien** beschreiben das Wissen eines Fachgebiets, beispielsweise Bildung, Medizin, Recht oder Ingenieurwesen, mit fachlich präzisen Begriffen, Definitionen und Axiomen.

**Anwendungsontologien** sind auf einen konkreten Nutzungskontext zugeschnitten und spezialisieren Domänenontologien für die Anforderungen eines Systems, eines Projekts oder eines Datenbestands.

### Bedeutung der Einteilung

Anstatt eine Ontologie isoliert aus einzelnen Datensätzen heraus zu entwickeln („bottom-up“), sollte sie idealerweise auf den höheren Ebenen aufbauen („top-down“):

1. Eine Top-Level-Ontologie liefert die grundlegenden Kategorien.
2. Mid-Level-Ontologien stellen wiederverwendbare Muster bereit.
3. Domänenontologien beschreiben das Fachwissen.
4. Anwendungsontologien passen das Modell an konkrete Systeme an.

Dieser schichtweise Aufbau verbessert Konsistenz, Wiederverwendbarkeit und Interoperabilität. Die Lehrplan-Ontologie baut beispielsweise auf BFO als Top-Level-Ontologie auf und nutzt Relationen aus der [Relation Ontology (RO)](https://oborel.github.io/) sowie die [Information Artifact Ontology (IAO)](https://github.com/information-artifact-ontology/IAO) für Informationseinheiten (siehe [Nachgenutzte Ontologien](structure.md#nachgenutzte-ontologienvokabulare)).

Die Gründe für die Wahl von BFO sind im Abschnitt [Wahl der Top-Level-Ontologie](introduction.md#wahl-der-top-level-ontologie) beschrieben.

## Ontologieentwicklung in der Praxis

Die Entwicklung einer Ontologie ist kein rein technischer Vorgang, sondern verbindet fachliche Modellierung, logische Formalisierung und die fortlaufende Abstimmung mit Fachexpertinnen und Fachexperten. Ziel ist nicht eine vollständige Ontologie im ersten Entwurf, sondern ein schrittweise wachsendes, gemeinsames Verständnis eines Wissensgebiets. Die Entwicklung umfasst typischerweise folgende Schritte:

1. **Domänenanalyse**: Festlegung des zu modellierenden Wissensgebiets (Scope) und der Fragen, die die Ontologie beantworten soll. Diese *Kompetenzfragen* bestimmen, welche Begriffe tatsächlich benötigt werden (siehe [Kompetenzfragen der Lehrplan-Ontologie](introduction.md#kompetenzfragen)).
2. **Begriffserhebung**: Identifikation der zentralen Begriffe, Beziehungen und Eigenschaften, etwa durch die Analyse vorhandener Dokumente und Datenmodelle oder durch Gespräche mit Fachleuten.
3. **Modellierung**: Formalisierung der Begriffe als Klassen, Eigenschaften und Axiome sowie deren Einordnung in eine Hierarchie.
4. **Formalisierung**: Überführung des Modells in OWL/RDF.
5. **Evaluation**: Prüfung mit Reasonern auf Widersprüche und auf die gewünschten Schlussfolgerungen sowie Prüfung anhand von Beispieldaten, ob sich die Kompetenzfragen beantworten lassen.
6. **Weiterentwicklung**: Anpassung an neue Anforderungen, Daten oder Erkenntnisse und Veröffentlichung neuer Versionen. Ontologien sind keine abgeschlossenen Artefakte, sondern werden kontinuierlich weiterentwickelt.

### Modellierungsprinzipien

Die Qualität einer Ontologie hängt weniger von den eingesetzten Werkzeugen ab als von fundierten Modellierungsentscheidungen. Bewährt haben sich folgende Prinzipien:

- **Eindeutige Definitionen**: Jeder Begriff ist klar und verständlich definiert.
- **Trennung von Klasse und Individuum**: Klassen beschreiben allgemeine Kategorien, Individuen konkrete Entitäten.
- **Wiederverwendung**: Etablierte Ontologien werden nachgenutzt, anstatt Begriffe neu zu modellieren.
- **Angemessene Komplexität**: Eine verständliche Ontologie ist in der Regel wertvoller als eine maximal ausdrucksstarke.
- **Explizite Annahmen**: Implizites Fachwissen wird formalisiert, damit es maschinell ausgewertet werden kann.
- **Stabile Identifikatoren**: Begriffe bleiben über ihre IRIs langfristig eindeutig referenzierbar.

Maßgeblich ist daher nicht die Komplexität einer Ontologie, sondern ihre Verständlichkeit für Menschen und ihre zuverlässige Nutzbarkeit durch Maschinen.


## Werkzeuge

**Modellierung und Entwicklung**

- [Protégé](https://protege.stanford.edu/): verbreiteter Ontologie-Editor für OWL 2 mit Visualisierung und integrierten Reasonern
- [Ontology Development Kit (ODK)](https://github.com/INCATools/ontology-development-kit): Werkzeugsammlung und Workflows für den gesamten Lebenszyklus einer Ontologie, einschließlich Qualitätskontrolle, Releases und Importen; die Lehrplan-Ontologie wird mit dem ODK entwickelt
- [ROBOT](https://robot.obolibrary.org/): Kommandozeilenwerkzeug für typische Aufgaben wie das Zusammenführen, Prüfen und Konvertieren von Ontologien
- [OTTR (Reasonable Ontology Templates)](https://ottr.xyz/): Sprache für wiederverwendbare Modellierungsmuster, aus denen RDF- und OWL-Daten erzeugt werden
- [rdflib](https://github.com/RDFLib/rdflib) und [Owlready2](https://owlready2.readthedocs.io/): Python-Bibliotheken zur Verarbeitung von RDF-Daten und Ontologien
- Versionsverwaltung mit Git, z. B. über [GitHub](https://github.com/): Nachverfolgung von Änderungen, Diskussion und gemeinsame Entwicklung

**Datenintegration**

- [RML (RDF Mapping Language)](https://rml.io/specs/rml/): Sprache zur deklarativen Abbildung strukturierter Daten wie [CSV (Comma-Separated Values)](https://www.rfc-editor.org/rfc/rfc4180), [JSON (JavaScript Object Notation)](https://www.json.org/json-de.html), [XML (Extensible Markup Language)](https://www.w3.org/XML/) oder relationaler Datenbanken nach RDF; die Weiterentwicklung erfolgt in der W3C Community Group [*Knowledge Graph Construction*](https://www.w3.org/community/kg-construct/) ([RML-Core](https://kg-construct.github.io/rml-core/spec/docs/))
- [YARRRML](https://rml.io/yarrrml/): kompakte, auf [YAML (YAML Ain’t Markup Language)](https://yaml.org/) basierende Notation für RML-Mappings, die sich leichter lesen und schreiben lässt und automatisch in RML übersetzt wird

**Prüfung und Schlussfolgern**

- Reasoner wie [HermiT](http://www.hermit-reasoner.com/), [Pellet](https://github.com/stardog-union/pellet) oder [Konclude](https://github.com/konclude/Konclude): logische Prüfung und automatische Klassifikation
- SHACL: W3C-Standard zur Prüfung, ob Daten festgelegten Vorgaben entsprechen
- [OOPS! (Ontology Pitfall Scanner)](https://oops.linkeddata.es/): Webdienst zur Erkennung typischer Modellierungsfehler

**Speicherung, Abfrage und Darstellung**

- Triple Stores wie [Virtuoso](https://vos.openlinksw.com/owiki/wiki/VOS) oder [GraphDB](https://graphdb.ontotext.com/): Datenbanken für RDF-Daten
- SPARQL: Abfragesprache für RDF-Daten und Wissensgraphen
- [Widoco](https://github.com/dgarijo/Widoco): Erzeugung einer Dokumentation im Webformat [HTML (Hypertext Markup Language)](https://html.spec.whatwg.org/) aus einer Ontologie
- [RDF Grapher](https://www.ldf.fi/service/rdf-grapher): Webdienst zur Darstellung von RDF-Daten als Graph


## Verzeichnisse und Terminologiedienste

Ontologien werden in der Regel nicht über allgemeine Suchmaschinen, sondern über Ontologie-Verzeichnisse und Terminologiedienste recherchiert, beispielsweise:

- [TIB Terminology Service](https://terminology.tib.eu/ts) der [Technischen Informationsbibliothek (TIB)](https://www.tib.eu/)
- [Ontobee](https://ontobee.org/)
- [Linked Open Vocabularies (LOV)](https://lov.linkeddata.es/)
- [BioPortal](https://bioportal.bioontology.org/)


## Weiterführende Literatur und Materialien

**Tutorials und Kurse**

- [Pizza-Tutorial](https://www.michaeldebellis.com/post/new-protege-pizza-tutorial): praxisorientierte Einführung in die Erstellung von OWL-Ontologien mit Protégé
- [Ontology Development 101](https://protege.stanford.edu/publications/ontology_development/ontology101.pdf): methodischer Leitfaden der Stanford University zur Entwicklung einer ersten Ontologie
- [OBO Academy – Ontology Design](https://oboacademy.github.io/obook/lesson/ontology-design/): frei zugänglicher Online-Kurs der Gemeinschaft der Open Biological and Biomedical Ontologies (OBO) zu Aufbau, Schlussfolgern und Designprinzipien von Ontologien
- [„Knowledge Graphs – Foundations and Applications“](https://www.youtube.com/watch?v=CiU1sMbL3k4&list=PLNXdQl4kBgzubTOfY5cbtxZCgg9UTe-uF): Vorlesungsreihe des Bereichs Information Service Engineering (ISE) am [FIZ Karlsruhe – Leibniz-Institut für Informationsinfrastruktur](https://www.fiz-karlsruhe.de/) auf YouTube
- [YouTube-Kanal von Barry Smith](https://www.youtube.com/channel/UCDYw4LTZfK27Q0lJ8pxQC8Q): Vorträge zu BFO und angewandter Ontologie

**Blogs**

- [Maria Keet](https://keet.wordpress.com/)
- [Michael DeBellis](https://www.michaeldebellis.com/)
- [Chris Mungall](https://douroucouli.wordpress.com/)

**Bücher**

- C. Maria Keet: [*An Introduction to Ontology Engineering*](https://people.cs.uct.ac.za/~mkeet/OEbook/). College Publications, 2018. Frei verfügbar unter der Creative-Commons-Lizenz [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.de) (Namensnennung – Nicht kommerziell – Weitergabe unter gleichen Bedingungen).
- Pascal Hitzler, Markus Krötzsch, Sebastian Rudolph, York Sure: [*Semantic Web: Grundlagen*](https://www.semantic-web-grundlagen.de/). Springer, 2008.
- Robert Arp, Barry Smith, Andrew D. Spear: [*Building Ontologies with Basic Formal Ontology*](https://mitpress.mit.edu/9780262527811/building-ontologies-with-basic-formal-ontology/). MIT Press, 2015.
- Nicola Guarino, Daniel Oberle, Steffen Staab: „What Is an Ontology?“ In: Steffen Staab, Rudi Studer (Hrsg.): *Handbook on Ontologies*. Springer, 2009.


## Ausblick auf die folgenden Kapitel

Dieser Abschnitt hat die allgemeinen Grundlagen eingeführt: was Ontologien sind, aus welchen Bausteinen sie bestehen, wie sie mit RDF, RDFS und OWL umgesetzt werden und nach welchen Prinzipien sie entwickelt werden. Die folgenden Kapitel wenden diese Grundlagen auf Lehrpläne an:

- Das Kapitel [Konzeptuelle Grundlagen](introduction.md) beschreibt Ausgangslage, Ziele und Umfang der Lehrplan-Ontologie, führt ihre zentralen Begriffe ein und begründet die Wahl von BFO als Top-Level-Ontologie.
- Das Kapitel [Ontologie-Modell](structure.md) zeigt, wie Klassen, Eigenschaften und Axiome in der Lehrplan-Ontologie konkret eingesetzt werden, etwa um die unterschiedlichen Begriffe der Länder über einen gemeinsamen Kern vergleichbar zu machen.
