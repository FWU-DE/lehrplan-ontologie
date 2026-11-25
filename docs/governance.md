# Governance und Weiterentwicklung

Eine Ontologie, auf die sich Daten und Anwendungen stützen, braucht verlässliche Regeln für ihre Pflege: Wer entscheidet über Änderungen? Wie entstehen neue Begriffe und Identifikatoren? Wie werden Versionen veröffentlicht, und was geschieht mit Begriffen, die nicht mehr benötigt werden? Dieses Kapitel beschreibt die Regeln, nach denen die Lehrplan-Ontologie (LP) gepflegt und weiterentwickelt wird.


## Verantwortung

Die Lehrplan-Ontologie wird im Projekt [MEM (Metadata for Educational Media)](https://mem.schule/) am [FWU Institut für Film und Bild in Wissenschaft und Unterricht](https://fwu.de/) entwickelt und gepflegt. Inhaltliche Entscheidungen, insbesondere zur Abbildung der Lehrpläne der Länder, werden mit der **Fachgruppe der Länder** abgestimmt, in der Lehrplanexpertinnen und Lehrplanexperten der Länder vertreten sind. Die ontologische Modellierung erfolgt in Zusammenarbeit mit Ontologie-Fachleuten der yovisto GmbH (siehe [Über uns](about.md)).


## Entwicklungsumgebung

Die Ontologie wird im öffentlichen [GitHub-Repository](https://github.com/FWU-DE/lehrplan-ontologie) mit dem [Ontology Development Kit (ODK)](https://github.com/INCATools/ontology-development-kit) entwickelt. Bearbeitet wird ausschließlich die Editor-Datei `src/ontology/lp-edit.owl`, etwa mit [Protégé](https://protege.stanford.edu/). Aus ihr erzeugt das ODK bei jedem Release die veröffentlichten Varianten (siehe [Release-Artefakte](usage.md#release-artefakte)) und führt dabei automatische Prüfungen durch. Zusätzlich werden die Patterns und Beispieldaten mit den SHACL-Shapes (SHACL: Shapes Constraint Language) des Repositorys validiert (siehe [Validierung](usage.md#validierung)).


## Identifikatoren

### Aufbau

Alle Klassen, Properties und festen Individuen der Ontologie haben einen Internationalized Resource Identifier (IRI) der Form

```text
https://w3id.org/lehrplan/ontology/LP_NNNNNNN
```

mit einer siebenstelligen Nummer, z. B. `LP_0000438` für *Lehrplan*. Die Identifikatoren sind bewusst **nicht sprechend**: Sie enthalten weder den Namen noch die Position eines Begriffs in der Hierarchie. Dadurch bleibt ein Identifikator gültig, wenn sich die Bezeichnung, die Definition oder die Einordnung eines Begriffs ändert. Die menschenlesbaren Bezeichnungen stehen in `rdfs:label`.

Ein einmal veröffentlichter Identifikator wird nicht gelöscht und nicht für einen anderen Begriff wiederverwendet.

### Vergabe

Damit mehrere Personen gleichzeitig an der Ontologie arbeiten können, ohne dass Identifikatoren doppelt vergeben werden, erhält jede Editorin bzw. jeder Editor einen eigenen Nummernbereich. Die Bereiche sind in der Datei [`src/ontology/lp-idranges.owl`](https://github.com/FWU-DE/lehrplan-ontologie/blob/main/src/ontology/lp-idranges.owl) festgelegt, aus der Protégé neue Identifikatoren automatisch vergibt:

| Bereich                      | Verwendung                                 |
|------------------------------|--------------------------------------------|
| `LP_0000001` – `LP_0009999`  | Editorenbereich 1                          |
| `LP_0010000` – `LP_0019999`  | Editorenbereich 2                          |
| `LP_0020000` – `LP_0029999`  | Editorenbereich 3                          |
| `LP_0030000` – `LP_0039999`  | Editorenbereich 4                          |
| `LP_0040000` – `LP_0049999`  | Editorenbereich 5                          |
| `LP_0050000` – `LP_0069999`  | Editorenbereich 6                          |
| `LP_0070000` – `LP_0999999`  | noch nicht vergeben                        |

Daneben gibt es feste Blöcke für Individuen, die in den Lehrplandaten häufig referenziert werden: Die Jahrgangsstufen 1 bis 13 liegen im Block `LP_2000xxx`, die sechzehn Länder im Block `LP_3000xxx` (z. B. `LP_3000047` für Sachsen).

Wer neu an der Ontologie mitarbeitet, erhält einen eigenen Bereich, bevor neue Begriffe angelegt werden.

### Identifikatoren der Daten

Die IRIs der Lehrpläne und curricularen Elemente in den Lehrplandaten gehören nicht zur Ontologie und folgen eigenen Namensräumen je Datenquelle (siehe [Knowledge Graph](knowledge-graph.md#herkunft-der-daten)). Schulfächer und Schularten werden in der [Schulfach-Ontologie](https://github.com/FWU-DE/schulfach-ontologie) und der [Schulart-Ontologie](https://github.com/FWU-DE/schulart-ontologie) gepflegt.


## Versionierung

Die Versionsnummern folgen dem Schema `MAJOR.MINOR.PATCH` der [semantischen Versionierung](https://semver.org/lang/de/). Bis zur ersten stabilen Version 1.0.0 erscheinen Vorabversionen mit dem Zusatz `rcN` (*Release Candidate*), aktuell **1.0.0rc6**.

Jede Version ist dreifach gekennzeichnet:

- durch die Versions-IRI (`owl:versionIRI`), z. B. `https://w3id.org/lehrplan/ontology/1.0.0rc6`,
- durch die Versionsangabe (`owl:versionInfo`), z. B. `1.0.0rc6`,
- durch ein gleichnamiges Tag mit Release im Repository, z. B. `v1.0.0rc6`.

Die Ontologie-IRI `https://w3id.org/lehrplan/ontology/` verweist immer auf die aktuelle Version. Wer eine bestimmte Version verwenden möchte, bindet die Dateien des entsprechenden Releases ein (siehe [Einbindung in eigene Ontologien](usage.md#einbindung-in-eigene-ontologien)). Die bisherigen Versionen und die Änderungen in rc6 sind im Abschnitt [Versionen](usage.md#versionen) aufgeführt.

Nach der stabilen Version 1.0.0 gilt:

- **PATCH** (z. B. 1.0.1): Korrekturen an Bezeichnungen, Definitionen oder Kommentaren ohne Auswirkung auf Daten,
- **MINOR** (z. B. 1.1.0): neue Begriffe oder Axiome, die bestehende Daten nicht ungültig machen,
- **MAJOR** (z. B. 2.0.0): Änderungen, die eine Anpassung bestehender Daten oder Abfragen erfordern, etwa die Umdeutung oder das Zurückziehen von Begriffen.


## Zurückziehen von Begriffen

Begriffe, die nicht mehr verwendet werden sollen, werden nicht gelöscht, sondern nach den Konventionen der [OBO Foundry](https://obofoundry.org/) (OBO: Open Biological and Biomedical Ontologies) als veraltet markiert:

- Der Begriff erhält `owl:deprecated true`.
- Die Bezeichnung wird mit dem Präfix „obsolete“ versehen, die Definition um den Grund ergänzt.
- Gibt es einen Nachfolger, verweist *term replaced by* (`IAO_0100001`) auf ihn; andernfalls kann *consider* (`oboInOwl:consider`) auf mögliche Alternativen hinweisen.
- Axiome, die den Begriff mit anderen Begriffen verbinden, werden entfernt, damit veraltete Begriffe keine Schlussfolgerungen mehr beeinflussen.

Der Identifikator bleibt dabei erhalten und auflösbar, sodass bestehende Daten weiterhin verständlich bleiben. Version 1.0.0rc6 enthält keine als veraltet markierten Begriffe.

Wird die Bedeutung eines bestehenden Identifikators geändert, wie in rc6 bei der Trennung von Spezifikation und realweltlicher Entität, ist dies in den Versionshinweisen mit den nötigen Schritten zur Umstellung beschrieben (siehe [Änderungen in Version 1.0.0rc6](usage.md#anderungen-in-version-100rc6)).


## Modellierungsregeln

Neue Begriffe folgen den Konventionen, die sich in der Ontologie etabliert haben:

- **Einordnung unter BFO und IAO.** Jede Klasse wird unter eine Klasse der Basic Formal Ontology (BFO) oder der Information Artifact Ontology (IAO) eingeordnet; Lehrpläne und ihre Bestandteile sind Informationseinheiten (siehe [Ontologisches Grundverständnis](structure.md#ontologisches-grundverstandnis)).
- **Bezeichnungen und Definitionen.** Jeder Begriff erhält ein deutsches `rdfs:label`; Definitionen werden als `skos:definition` angegeben, möglichst auf Deutsch und Englisch und nach dem Muster „Ein X ist ein Y, das …“. Bislang liegen Definitionen vor allem für die Kernklassen vor; die Ergänzung für die übrigen Klassen ist Teil der weiteren Arbeit.
- **Länderspezifische Begriffe.** Begriffe aus der Terminologie eines Landes tragen das Länderkürzel in Klammern, z. B. *Lernbereich (BY)*. Sie werden als Unterklasse von *Element (XX)* des Landes mit fester *Funktion* angelegt, damit ein Reasoner sie den generischen CE-Klassen zuordnen kann (siehe [Designprinzip](structure.md#modellierung-designprinzip)).
- **Properties.** Neue Properties werden als Sub-Properties der Basisrelationen von BFO, der Relation Ontology (RO) oder der IAO angelegt, beschreibende Properties in der Regel unter *wird beschrieben von* (`LP_0000024`).
- **Nachnutzung vor Neuanlage.** Existiert ein passender Begriff in einer nachgenutzten Ontologie oder einem Vokabular, wird dieser verwendet, statt einen neuen anzulegen (siehe [Nachgenutzte Ontologien und Vokabulare](structure.md#nachgenutzte-ontologienvokabulare)).
- **Patterns und Prüfung.** Änderungen am Modell werden in den [Patterns](patterns.md) nachgezogen und mit den SHACL-Shapes sowie einem Reasoner geprüft, bevor sie in ein Release eingehen.


## Mitwirken

### Fehler melden und Begriffe vorschlagen

Fehler, Fragen und Vorschläge für neue Begriffe werden als [Issue im Repository](https://github.com/FWU-DE/lehrplan-ontologie/issues) eingereicht. Ein guter Vorschlag für einen neuen Begriff enthält:

- eine Bezeichnung auf Deutsch und möglichst auf Englisch,
- eine Definition und, falls vorhanden, eine Quelle, etwa den Lehrplan, in dem der Begriff verwendet wird,
- die vorgeschlagene Einordnung, z. B. einen ähnlichen bestehenden Begriff,
- ein Beispiel aus den Lehrplandaten.

Bevor ein Vorschlag eingereicht wird, lohnt eine Suche in der [Referenzdokumentation](https://fwu-de.github.io/lehrplan-ontologie/index-de.html), ob der Begriff bereits existiert.

### Änderungen beitragen

Änderungen an der Ontologie werden als Pull Request eingereicht: Repository forken, einen eigenen Branch anlegen, die Editor-Datei `src/ontology/lp-edit.owl` bearbeiten und den Pull Request mit Bezug auf das zugehörige Issue stellen. Die [Hinweise zum Mitwirken](https://github.com/FWU-DE/lehrplan-ontologie/blob/main/CONTRIBUTING.md) beschreiben das Vorgehen im Detail; für die Zusammenarbeit gilt der [Verhaltenskodex](https://github.com/FWU-DE/lehrplan-ontologie/blob/main/CODE_OF_CONDUCT.md).

### Beteiligung der Länder

Die Länder bringen ihre Perspektive über die **Fachgruppe der Länder** ein. Länder, deren Lehrpläne in den Knowledge Graph aufgenommen werden sollen oder deren Terminologie in der Ontologie ergänzt oder korrigiert werden soll, wenden sich an die Redaktion MEM unter [redaktion@mem.schule](mailto:redaktion@mem.schule). Für die Aufnahme neuer Lehrplandaten beschreibt der Abschnitt [Erstellen eigener Lehrplandaten](usage.md#erstellen-eigener-lehrplandaten), wie Daten nach dem Modell der Ontologie aufgebaut werden.


## Ausblick auf die folgenden Kapitel

- Das [Glossar](glossar.md) erläutert die wichtigsten Begriffe und Abkürzungen der Lehrplan-Ontologie.
- Das Kapitel [Über uns](about.md) stellt die Menschen und Einrichtungen hinter der Ontologie vor.
