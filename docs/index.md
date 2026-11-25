# Lehrplan-Ontologie

***Eine Ontologie für Lehrpläne in Deutschland***

Die **Lehrplan-Ontologie** ist eine **strukturierte** und **maschinenlesbare** **Wissensrepräsentation** **schulischer Lehrpläne** im Primar- und Sekundarbereich. Sie modelliert sowohl die inhaltlichen als auch die strukturellen Bestandteile curricularer Dokumente – darunter **Kompetenzen**, **Lerninhalte**, **Bildungsstandards** sowie deren Einbettung in **Fächer**, **Jahrgangsstufen** und **Schularten** – innerhalb eines einheitlichen semantischen Rahmens.

Vor dem Hintergrund der föderalen Vielfalt des deutschen Bildungssystems harmonisiert die Ontologie unterschiedliche Terminologien und Lehrplanstrukturen, ohne länderspezifische Besonderheiten zu verlieren. Durch die Überführung heterogener Lehrplandaten in eine interoperable Wissensbasis schafft sie die Grundlage für Analyse, Vergleichbarkeit und die Entwicklung datenbasierter Bildungsanwendungen.


## Für wen ist diese Dokumentation?

Die Dokumentation richtet sich an alle, die mit der Lehrplan-Ontologie arbeiten, sie verstehen oder weiterentwickeln möchten. Je nach Hintergrund empfehlen sich unterschiedliche Einstiege:

| Sie sind …                                                                 | Empfohlener Einstieg                                                                                                                             |
|----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| neu im Thema Ontologien                                                    | [Einführung in Ontologien](ontology.md) → [Konzeptuelle Grundlagen](introduction.md)                                                                 |
| Bildungsadministration, Fachredaktion oder Lehrplanexpertin bzw. -experte | [Konzeptuelle Grundlagen](introduction.md) → [Ontologie-Modell](structure.md)                                                                    |
| Entwicklerin oder Entwickler, die Lehrplandaten integrieren möchten        | [Ontologie-Modell](structure.md) → [Beispiele / Patterns](patterns.md) → [Verwendung](usage.md)                                                  |
| Forschende oder Datenanalystin bzw. -analyst                               | [Beispiele / Patterns](patterns.md) → [SPARQL-Abfragen](sparql.md)                                                                               |


## Aufbau der Dokumentation

### 1. Einführung in Ontologien

[Einführung in Ontologien](ontology.md): Begriff und Nutzen von Ontologien und wie sie sich von Datenbanken, Metadatenschemata und LLM-basierten (LLM: Large Language Model) Ansätzen unterscheiden. Außerdem: Resource Description Framework (RDF), RDF Schema (RDFS) und Web Ontology Language (OWL), Ontologieebenen, Werkzeuge und Lesestoff.

### 2. Konzeptuelle Grundlagen

[Konzeptuelle Grundlagen](introduction.md): fachliches Verständnis und Abgrenzung.

- [Ausgangslage](introduction.md#ausgangslage) und [Ziele](introduction.md#ziele-und-anwendungen)
- [Anwendungsszenarien](introduction.md#anwendungsszenarien): Erschließung von Bildungsmedien, lehrplanbezogene Suche, länderübergreifende Analyse
- [Gegenstand und Umfang](introduction.md#gegenstand-und-umfang): welche Lehrpläne und Inhalte abgedeckt sind und was nicht dazugehört
- [Zentrale Begriffe](introduction.md#zentrale-begriffe): Lehrplan, curriculares Element, Kompetenz und Kompetenzspezifikation, Bildungsgang, Niveau u. a.
- [Vorgehen](introduction.md#vorgehen): vergleichende Analyse der Lehrpläne, Zusammenarbeit mit der Fachgruppe der Länder und mit Ontologie-Fachleuten
- [Wahl der Top-Level-Ontologie](introduction.md#wahl-der-top-level-ontologie): Gründe für die Basic Formal Ontology (BFO)
- [Kompetenzfragen](introduction.md#kompetenzfragen): welche Fragen die Ontologie beantworten können soll

### 3. Ontologie-Modell

[Ontologie-Modell](structure.md): wie das Wissen strukturiert ist.

- [Ontologisches Grundverständnis](structure.md#ontologisches-grundverstandnis): Informationseinheiten und die realweltlichen Entitäten, die sie beschreiben
- [Die fünf Schichten](structure.md#aufbau-und-struktur-der-lehrplan-ontologie): Bildungskontext, curriculare Elemente, zeitliche Einordnung, Niveaus, Relationen
- [Designprinzip](structure.md#modellierung-designprinzip): gemeinsame Kern-Ontologie mit länderspezifischen Konkretisierungen
- [Nachgenutzte Ontologien und Vokabulare](structure.md#nachgenutzte-ontologienvokabulare): BFO, Relation Ontology (RO), Information Artifact Ontology (IAO), Schulfach- und Schulart-Ontologie, Kompetenzzentrum Interoperable Metadaten (KIM), Quantities, Units, Dimensions and Types (QUDT)
- [Klassen, Individuen und Beziehungen](structure.md#uberblick-uber-klassen-beziehungen-hierarchien)
- [Mapping der Terminologien der Länder](structure.md#mapping-unterschiedlicher-terminologien-der-lander) und [Integration der KMK-Bildungsstandards](structure.md#integration-der-bildungsstandards) (KMK: Kultusministerkonferenz)

### 4. Patterns und SPARQL-Abfragen

- [Patterns](patterns.md): konkrete Modellierung von Lehrplanelementen, jeweils mit Diagramm, Erläuterung und RDF-Daten
- [SPARQL-Abfragen](sparql.md) (SPARQL: SPARQL Protocol and RDF Query Language): Beispielabfragen zu Lehrplänen, Fächern, Schularten, Inhalten und Struktur sowie Abfragen zu den [Kompetenzfragen](introduction.md#kompetenzfragen) – jeweils mit direktem Link zum Endpunkt

### 5. Verwendung

[Verwendung](usage.md): wie mit der Ontologie und den Lehrplandaten gearbeitet wird.

- [Release-Artefakte](usage.md#release-artefakte) und [Versionen](usage.md#versionen), einschließlich der Änderungen in Version 1.0.0rc6
- [Zugriff](usage.md#zugriff): Auflösung der Internationalized Resource Identifiers (IRIs), [SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql) und Beispiele für die Nutzung aus Programmen
- [Einbindung in eigene Ontologien](usage.md#einbindung-in-eigene-ontologien) und [Erstellen eigener Lehrplandaten](usage.md#erstellen-eigener-lehrplandaten)
- [Schlussfolgern](usage.md#schlussfolgern) und [Validierung](usage.md#validierung) mit SHACL-Shapes (SHACL: Shapes Constraint Language)
- [Technische Referenz](usage.md#technische-referenz), [Lizenz und Zitation](usage.md#lizenz-und-zitation) sowie [Mitwirken](usage.md#mitwirken)
- Anwendungsbeispiele (Lehrplanvergleich zwischen Ländern, Verknüpfung mit Bildungsmedien, Curriculum-Analyse, Empfehlungssysteme) – *in Vorbereitung*

### 6. Knowledge Graph

[Knowledge Graph](knowledge-graph.md): die Lehrplandaten im SPARQL-Endpunkt.

- [Datenbestand](knowledge-graph.md#datenbestand): Lehrpläne und curriculare Elemente von Bayern, Sachsen, Rheinland-Pfalz, Berlin/Brandenburg und die KMK-Bildungsstandards
- [Herkunft der Daten](knowledge-graph.md#herkunft-der-daten) und [Besonderheiten der Länder](knowledge-graph.md#besonderheiten-der-lander)
- [Einschränkungen](knowledge-graph.md#einschrankungen) des aktuellen Datenbestands

### 7. Governance und Weiterentwicklung

[Governance und Weiterentwicklung](governance.md): Regeln für Pflege und Weiterentwicklung der Ontologie.

- [Verantwortung](governance.md#verantwortung) und [Entwicklungsumgebung](governance.md#entwicklungsumgebung)
- [Identifikatoren](governance.md#identifikatoren): Aufbau und Vergabe der `LP_`-Nummern
- [Versionierung](governance.md#versionierung) und [Zurückziehen von Begriffen](governance.md#zuruckziehen-von-begriffen)
- [Modellierungsregeln](governance.md#modellierungsregeln) und [Mitwirken](governance.md#mitwirken), auch für die Länder

### 8. Glossar

[Glossar](glossar.md): Abkürzungen der Länder und der Berliner und Brandenburger Abschlüsse sowie zentrale Begriffe wie Lehrplan, curriculares Element, Leitperspektive, Niveaustufe und Bildungsgangniveau.

### 9. Über uns

[Über uns](about.md): die Menschen und Einrichtungen hinter der Lehrplan-Ontologie, Dank und Kontakt.


## Metadaten der Ontologie

|                     |                                                                                                                       |
|---------------------|-----------------------------------------------------------------------------------------------------------------------|
| Titel               | **Lehrplan-Ontologie** (engl. *Curriculum Ontology*)                                                                  |
| Abkürzung / Präfix  | **LP** / `lp:`                                                                                                        |
| Namespace           | [https://w3id.org/lehrplan/ontology/](https://w3id.org/lehrplan/ontology/)                                            |
| Sprache             | [OWL 2](https://www.w3.org/TR/owl2-overview/)                                                                         |
| Aktuelle Version    | 1.0.0rc6                                                                                                              |
| Lizenz              | [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)                                                       |
| Repository          | [https://github.com/FWU-DE/lehrplan-ontologie](https://github.com/FWU-DE/lehrplan-ontologie)                          |
| Ersteller           | Steffen Rörtgen, Jörg Waitelonis, Almut Steinlein, Cindy Bloes, Johann Bergh, Laura Junghanns                          |
| Zitiervorschlag     | Lehrplan Ontology. Version 1.0.0rc6, https://w3id.org/lehrplan/ontology                                               |

Verwandte Ontologien und Vokabulare:

- [Schulfach-Ontologie](https://github.com/FWU-DE/schulfach-ontologie) – Schulfächer aller 16 Länder
- [Schulart-Ontologie](https://github.com/FWU-DE/schulart-ontologie) – Schularten aller 16 Länder
- [KIM-Vokabulare](https://github.com/dini-ag-kim/kmk-vocabs) – bundesweite Referenzvokabulare der Arbeitsgruppe KIM der Deutschen Initiative für Netzwerkinformation (DINI)


## Kontakt

Die Lehrplan-Ontologie wird im Projekt [MEM (Metadata for Educational Media)](https://mem.schule) des [FWU Institut für Film und Bild in Wissenschaft und Unterricht](https://fwu.de) entwickelt. Fragen und Rückmeldungen richten Sie bitte an [redaktion@mem.schule](mailto:redaktion@mem.schule). Fehler und Änderungswünsche können Sie auch als [Issue im Repository](https://github.com/FWU-DE/lehrplan-ontologie/issues) melden.
