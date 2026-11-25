# Konzeptuelle Grundlagen

Dieses Kapitel beschreibt die konzeptuellen Grundlagen der Lehrplan-Ontologie: die Ausgangslage, aus der sie entstanden ist, ihre Ziele und Anwendungsszenarien, ihren Gegenstand und Umfang, die zentralen Begriffe, das Vorgehen bei ihrer Entwicklung einschließlich der Wahl der Top-Level-Ontologie sowie die Fragen, die sie beantworten soll. Die Lehrplan-Ontologie wird im Projekt [MEM (Metadata for Educational Media)](https://mem.schule/) des [FWU Institut für Film und Bild in Wissenschaft und Unterricht](https://fwu.de/) entwickelt, dem Medieninstitut der Länder.


## Ausgangslage

Das deutsche Bildungssystem ist föderal organisiert. Die Gestaltung der Lehrpläne liegt in der Verantwortung der 16 Länder, die jeweils eigene Fächerstrukturen, Begriffe und schulartspezifische Vorgaben entwickeln. Entsprechend vielfältig sind die Lehrpläne: Sie unterscheiden sich in Aufbau, Bezeichnungen, Umfang und didaktischer Ausrichtung.

Diese Heterogenität erschwert länderübergreifende Analysen und Vergleiche erheblich. Hinzu kommt ein sehr unterschiedlicher Digitalisierungsgrad: Während einige Länder ihre Lehrpläne als strukturierte digitale Daten bereitstellen, liegen sie in vielen Fällen nur als Dokumente im PDF-Format (Portable Document Format) vor. Derzeit verfügt nur etwa die Hälfte der Länder über systematisch digital aufbereitete Lehrplandaten. Für die übrigen Länder müssen die Inhalte manuell extrahiert, interpretiert und in digitale Strukturen überführt werden.

Die Ausgangslage ist damit geprägt von großer inhaltlicher Vielfalt, geringer technischer Standardisierung und teilweise fehlender Maschinenlesbarkeit.


## Ziele und Anwendungen

Ziel der Lehrplan-Ontologie ist es, die Lehrpläne aller Länder in einer einheitlichen, maschinell auswertbaren Struktur abzubilden. Die formale Modellierung der zentralen curricularen Elemente schafft einen gemeinsamen begrifflichen Rahmen, der die Unterschiede zwischen den Ländern systematisch erfasst und zugleich bewahrt: Unterschiedliche Bezeichnungen werden auf gemeinsame übergeordnete Begriffe abgebildet, ohne dass die Eigenheiten der einzelnen Lehrpläne verloren gehen. So lässt sich beispielsweise eine Kompetenz, die in zwei Ländern unterschiedlich benannt oder gegliedert ist, dennoch eindeutig erfassen und vergleichen.

Lehrplandaten werden dadurch interoperabel, vergleichbar und nachnutzbar. Daraus ergeben sich unter anderem folgende Anwendungen:

- digitale Werkzeuge für Unterricht und Schulverwaltung,
- die Verknüpfung von Lehrplänen mit Lernmaterialien und Bildungsmedien,
- datenbasierte Analysen und länderübergreifende Übersichten über curriculare Anforderungen,
- Empfehlungssysteme sowie Recherche- und Vergleichswerkzeuge für Lehrkräfte.

Langfristig soll die Lehrplan-Ontologie als Infrastruktur dienen, auf der solche Bildungsdienste aufbauen können.

### Anwendungsszenarien

Den Ausgangspunkt bildet der Projektkontext von MEM: Das Projekt erweitert die ländergemeinsame Bildungsmedieninfrastruktur [SODIX](https://www.sodix.de/), die Unterrichtsmaterialien zentral vorhält und über Schnittstellen für die Mediatheken der Länder bereitstellt. Die Bildungsmedien werden dort mit Metadaten beschrieben; MEM ergänzt diese Beschreibungen um Bezüge zu den Kompetenzen und Inhalten der Lehrpläne. Daraus ergeben sich unter anderem folgende Szenarien:

**Erschließung von Bildungsmedien**: Eine Redaktion oder ein Medienanbieter ordnet ein Unterrichtsmaterial den Kompetenzspezifikationen und Lerninhalten zu, die es abdeckt, beispielsweise einer bestimmten Kompetenzerwartung im bayerischen LehrplanPLUS. Da die Lehrplanelemente eindeutig identifiziert sind, ist diese Zuordnung präzise und maschinell auswertbar.

**Lehrplanbezogene Suche**: Eine Lehrkraft sucht Material zu einer Kompetenz aus dem Lehrplan ihres Landes. Statt einer langen, nur nach Schlagworten gefilterten Ergebnisliste erhält sie Treffer, die dieser Kompetenz zugeordnet sind. Über die gemeinsamen Bezugsgrößen der Ontologie, also Fach, Jahrgangsstufe, Anforderungsniveau und die übergreifenden Elementtypen, lassen sich perspektivisch auch passende Materialien finden, die anhand der Lehrpläne anderer Länder erschlossen wurden.

**Länderübergreifende Analyse**: Bildungsverwaltung oder Forschung vergleichen Lehrpläne verschiedener Länder, etwa welche Kompetenzbereiche ein Fach in einer bestimmten Jahrgangsstufe umfasst oder wie sich Anforderungen zwischen Bildungsgängen unterscheiden. Die Lehrplandaten sind dafür über einen [SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql) in der Abfragesprache SPARQL (SPARQL Protocol and RDF Query Language; RDF: Resource Description Framework) abfragbar; Beispiele zeigt das Kapitel [SPARQL-Abfragen](sparql.md).

**Einbindung in Drittsysteme**: Lernmanagementsysteme, Bildungsportale oder Werkzeuge zur Unterrichtsplanung können die Lehrplandaten über Schnittstellen abrufen und Lehrplanbezüge anzeigen oder auswerten, ohne die Lehrpläne selbst erfassen zu müssen.


## Gegenstand und Umfang

### Abgedeckte Lehrpläne

Die Lehrplan-Ontologie dient der strukturierten Wissensrepräsentation von Lehrplänen im weiteren Sinne für allgemeinbildende Schulen im Primar- und Sekundarbereich. Dazu zählen Kerncurricula, Rahmenpläne, Bildungspläne, Fachlehrpläne, Rahmenlehrpläne, Curricula sowie Bildungs- und Erziehungspläne. Darüber hinaus werden die länderübergreifenden Bildungsstandards der [Kultusministerkonferenz (KMK)](https://www.kmk.org/) abgebildet, die als gemeinsamer Bezugsrahmen für die Lehrpläne der Länder dienen (siehe [Integration der Bildungsstandards](structure.md#integration-der-bildungsstandards)).

### Inhaltliche Bestandteile

Die Ontologie bildet sowohl die fachlichen als auch die strukturellen Elemente der Lehrpläne ab:

- **Gliederung** der Lehrpläne in Abschnitte und fachliche Bereiche wie Kompetenzbereiche, Lernbereiche oder Themenfelder,
- **Kompetenzspezifikationen**, also die im Lehrplan formulierten Kompetenzerwartungen und Standards,
- **Lerninhalte**, an denen Kompetenzen erworben werden,
- **ergänzende Elemente** wie didaktische Hinweise, Verweise auf andere Elemente sowie übergreifende Bildungsziele und Leitperspektiven,
- den **schulischen Kontext**, in dem diese Elemente gelten: Land, Schulart, Schulfach, Jahrgangsstufe, Bildungsgang und Anforderungsniveau.

Wie diese Bestandteile modelliert sind, beschreibt das Kapitel [Ontologie-Modell](structure.md).

### Bundesweite und länderspezifische Strukturen

Die Lehrplan-Ontologie bildet sowohl länderübergreifende Strukturen als auch die Besonderheiten der einzelnen Länder ab. Sie ermöglicht damit sowohl bundesweite Analysen als auch detaillierte Vergleiche und Auswertungen, die die jeweiligen Regelungen eines Landes berücksichtigen.

### Abgrenzung

Nicht Gegenstand der Lehrplan-Ontologie sind derzeit die berufliche Bildung und die sonderpädagogische Förderung. Eine Ausnahme bilden die Lehrplandaten aus Sachsen, die auch Lehrpläne beruflicher Schulen umfassen. Die Ontologie stellt außerdem selbst keine Verknüpfungen zu Bildungsmedien oder Lernmaterialien her; sie bildet jedoch die Grundlage, auf der Anwendungen solche Verknüpfungen herstellen können.


## Zentrale Begriffe

Die Lehrplan-Ontologie verwendet einige Begriffe in einer präzisen Bedeutung, die vom allgemeinen Sprachgebrauch abweichen kann. Grundlegend ist dabei die Unterscheidung zwischen einer Sache und ihrer Beschreibung: Ein Lehrplan enthält keine Kompetenzen, sondern beschreibt sie. Die folgenden Erläuterungen geben einen Überblick; die formalen Definitionen enthält das Kapitel [Ontologie-Modell](structure.md).

**Lehrplan**: Eine systematische Zusammenstellung curricularer Elemente, die verbindlich festlegt, welche Kompetenzen und Inhalte Schülerinnen und Schüler in einem Fach, einer Jahrgangsstufe, einer Schulart oder einem Bildungsgang eines Landes erwerben sollen. Je nach Land heißt ein Lehrplan beispielsweise Bildungsplan, Kerncurriculum, LehrplanPLUS oder Rahmenlehrplan.

**Bildungsstandard**: Eine länderübergreifende Vorgabe der KMK, die festlegt, welche Kompetenzen Lernende bis zu einem bestimmten Abschluss erworben haben sollen. Bildungsstandards dienen den Ländern als Grundlage für ihre Lehrpläne.

**Curriculares Element**: Ein Bestandteil eines Lehrplans oder Bildungsstandards, etwa ein Kapitel, ein Kompetenzbereich, eine einzelne Kompetenzerwartung oder ein Lerninhalt. Die länderübergreifenden Arten curricularer Elemente tragen in der Ontologie das Präfix *CE-* (CE: Curriculares Element), z. B. *CE-Bereich* oder *CE-Kompetenzspezifikation*.

**Funktion**: Der Zweck, den ein curriculares Element im Lehrplan erfüllt, etwa die Gliederung in Bereiche, die Beschreibung einer Kompetenz oder ein didaktischer Hinweis. Über ihre Funktion werden die unterschiedlich benannten Elemente der Länder den gemeinsamen *CE-*Arten zugeordnet: Ein *Lernbereich* in Bayern und ein *Kompetenzbereich* in Hamburg erfüllen dieselbe Funktion.

**Kompetenz und Kompetenzspezifikation**: Eine Kompetenz ist die Fähigkeit einer Person, Wissen und Können zur Lösung von Problemen anzuwenden. Sie ist eine Eigenschaft der lernenden Person. Eine Kompetenzspezifikation ist dagegen die Beschreibung einer solchen Kompetenz im Lehrplan, typischerweise ein Satz wie „Die Schülerinnen und Schüler …“. Lehrplandaten enthalten die Beschreibungen von Kompetenzen, also Kompetenzspezifikationen, nicht die Kompetenzen selbst.

**Lerninhalt**: Ein konkretes Thema oder ein konkreter Gegenstand, anhand dessen Kompetenzen erworben werden, und damit die inhaltliche Grundlage des Unterrichts.

**Bildungsgang und Bildungsgangspezifikation**: Ein Bildungsgang ist die schulische Laufbahn, die eine Person tatsächlich durchläuft, etwa bis zum Mittleren Schulabschluss. Die Bildungsgangspezifikation beschreibt diese Laufbahn, also ihre Dauer, ihre Anforderungen und den angestrebten Abschluss. Ein Bildungsgang ist nicht an eine Schulart gebunden: Der gymnasiale Bildungsgang kann beispielsweise auch an einer Gesamtschule durchlaufen werden.

**Schulart**: Eine Form der Schule wie Grundschule, Gymnasium oder Gemeinschaftsschule, gekennzeichnet durch Organisation, pädagogische Ausrichtung und die erreichbaren Abschlüsse. Die Schularten werden je Land mit ihren offiziellen Bezeichnungen erfasst.

**Schulabschluss und Schulabschlussspezifikation**: Ein Schulabschluss ist der Status, den eine Person mit dem erfolgreichen Abschluss eines Bildungsgangs erwirbt. Die Schulabschlussspezifikation beschreibt den Abschluss und die Anforderungen für seine Verleihung, z. B. den Mittleren Schulabschluss oder die Allgemeine Hochschulreife.

**Niveau und Bildungsgangniveau**: Ein Niveau beschreibt den Anspruch, mit dem Inhalte und Kompetenzen in einem Lehrplan formuliert sind. Das Bildungsgangniveau ist das Niveau innerhalb eines Bildungsgangs; die Ontologie unterscheidet länderübergreifend Grundschul-, Hauptschul- und Realschulniveau sowie Gymnasialniveau für die Sekundarstufen I und II. Die Bezeichnungen der Länder, etwa *Mittelschulniveau* in Bayern oder *Erhöhte Anforderungen* in Hamburg, werden diesen Niveaus zugeordnet.


## Vorgehen

Die Lehrplan-Ontologie wurde in einem iterativen, eng begleiteten Prozess entwickelt. Grundlage war eine systematische Sichtung und vergleichende Analyse der Lehrpläne aller Länder durch Fachexpertinnen und Fachexperten. In mehreren Durchläufen wurden inhaltliche Bestandteile identifiziert, die in allen Lehrplänen vorkommen, auch wenn sie unterschiedlich benannt oder gegliedert sind. Diese Gemeinsamkeiten bildeten den Ausgangspunkt für die übergreifenden Begriffe, die anschließend mit den Besonderheiten der Länder abgeglichen und ergänzt wurden.

Ein zentraler Bestandteil des Vorgehens ist die kontinuierliche Zusammenarbeit mit einer Fachgruppe aus Lehrplanexpertinnen und Lehrplanexperten der Länder. Die Fachgruppe bringt die fachlichen Perspektiven der Länder ein und unterstützt bei der Klärung inhaltlicher Fragen sowie bei der Einordnung curricularer Strukturen. In den frühen Projektphasen fand der Austausch in kurzen Abständen statt, um grundlegende Anforderungen und Unterschiede frühzeitig abzustimmen. Auch im weiteren Verlauf bleibt die Fachgruppe eine wesentliche beratende Instanz für Rückmeldungen, Diskussionen und die fachliche Validierung.

## Wahl der Top-Level-Ontologie

Die Lehrplan-Ontologie baut auf der [Basic Formal Ontology (BFO)](https://basic-formal-ontology.org/) als Top-Level-Ontologie auf. Eine Top-Level-Ontologie legt die allgemeinsten Kategorien fest, etwa Objekt, Prozess oder Eigenschaft, auf denen die fachlichen Begriffe aufbauen (siehe [Ebenen von Ontologien](ontology.md#ebenen-von-ontologien)). Für die Wahl von BFO sprechen mehrere Gründe:

- **Standardisierung**: BFO ist als internationale Norm [ISO/IEC 21838-2](https://www.iso.org/standard/74572.html) der [International Organization for Standardization (ISO)](https://www.iso.org/) und der [International Electrotechnical Commission (IEC)](https://www.iec.ch/) standardisiert und wird stabil gepflegt.
- **Verbreitung**: BFO bildet die gemeinsame Grundlage zahlreicher Ontologien, insbesondere im Umfeld der [OBO Foundry](https://obofoundry.org/) (OBO: Open Biological and Biomedical Ontologies), einer Gemeinschaft, die Ontologien nach gemeinsamen Prinzipien entwickelt. Die Lehrplan-Ontologie ist dadurch mit diesen Ontologien kompatibel und kann etablierte Bausteine wie die [Relation Ontology (RO)](https://oborel.github.io/) und die [Information Artifact Ontology (IAO)](https://github.com/information-artifact-ontology/IAO) unmittelbar nachnutzen.
- **Schlankheit**: BFO umfasst nur rund 35 sehr allgemeine Klassen und enthält keine fachspezifischen Inhalte. Sie gibt damit einen klaren Rahmen vor, ohne die Modellierung der Domäne einzuschränken.
- **Klare Grundunterscheidungen**: BFO trennt konsequent zwischen fortdauernden Entitäten (z. B. Personen, Eigenschaften, Informationen) und Prozessen. Diese Trennung ist für Lehrpläne zentral: Ein Lehrplan ist eine Informationseinheit, der Unterricht ein Prozess und eine Kompetenz eine Eigenschaft einer Person. Die Ontologie hält diese Ebenen sauber auseinander (siehe [Ontologisches Grundverständnis](structure.md#ontologisches-grundverstandnis)).


## Kompetenzfragen

Kompetenzfragen (*Competency Questions*, CQ) beschreiben, welche Fragen eine Ontologie beantworten können soll. Sie dienen als Anforderungen an die Modellierung und als Prüfstein dafür, ob das Modell seinen Zweck erfüllt. Für die Lehrplan-Ontologie wurden unter anderem die folgenden Kompetenzfragen formuliert. Die Abfragen im Kapitel [SPARQL-Abfragen](sparql.md) verweisen mit den Nummern CQ 1 bis CQ 19 auf diese Fragen.

**Struktur und Verknüpfungen**

- <a id="cq-1"></a>**CQ 1:** Welche Verknüpfung besteht zwischen Element X und Element Y? ([zur Abfrage](sparql.md#abfrage-cq-1))
- <a id="cq-2"></a>**CQ 2:** Welcher Bereich aus Rheinland-Pfalz entspricht einem Element aus Bayern? ([zur Abfrage](sparql.md#abfrage-cq-2))
- <a id="cq-3"></a>**CQ 3:** Anhand welcher Lerninhalte lässt sich eine Kompetenz erwerben? ([zur Abfrage](sparql.md#abfrage-cq-3))
- <a id="cq-4"></a>**CQ 4:** Welche Kompetenzen sind Voraussetzung für den Erwerb von Kompetenz X? ([zur Abfrage](sparql.md#abfrage-cq-4))

**Vergleiche zwischen Schularten, Bildungsgängen und Ländern**

- <a id="cq-5"></a>**CQ 5:** Welche Unterschiede bestehen bei den Kompetenzspezifikationen im Fach Mathematik in der Jahrgangsstufe 7 zwischen den Schularten in Sachsen? ([zur Abfrage](sparql.md#abfrage-cq-5))
- <a id="cq-6"></a>**CQ 6:** Wie verläuft die Progression im Fach Mathematik in den verschiedenen Schularten in Sachsen? ([zur Abfrage](sparql.md#abfrage-cq-6))
- <a id="cq-7"></a>**CQ 7:** Welche Kompetenzen sind im Leistungskurs Physik in Bayern zusätzlich zum Grundkurs zu erwerben? ([zur Abfrage](sparql.md#abfrage-cq-7))
- <a id="cq-8"></a>**CQ 8:** Welche Kompetenzspezifikationen gelten in Sachsen im Fach Biologie in der Jahrgangsstufe 8, unterschieden nach Bildungsgang? ([zur Abfrage](sparql.md#abfrage-cq-8))
- <a id="cq-9"></a>**CQ 9:** Welche Kompetenzspezifikationen im Fach Englisch der Jahrgangsstufen 1 bis 9 kommen in Bayern vor, nicht aber in Brandenburg? ([zur Abfrage](sparql.md#abfrage-cq-9))
- <a id="cq-10"></a>**CQ 10:** Welche Kompetenzen werden im Fach Mathematik im Primarbereich erworben, und wie entwickeln sie sich in der Sekundarstufe I je nach Bildungsgang weiter? ([zur Abfrage](sparql.md#abfrage-cq-10))

**Inhalte eines Fachs oder Bereichs**

- <a id="cq-11"></a>**CQ 11:** Welche Kompetenzbereiche umfasst das Fach Mathematik in Rheinland-Pfalz? ([zur Abfrage](sparql.md#abfrage-cq-11))
- <a id="cq-12"></a>**CQ 12:** Welche Kompetenzspezifikationen gehören in Berlin zum Kompetenzbereich „Mathematisch modellieren“ in der Jahrgangsstufe 7? ([zur Abfrage](sparql.md#abfrage-cq-12))
- <a id="cq-13"></a>**CQ 13:** Welche Lerninhalte sind im Fach Biologie in der Jahrgangsstufe 5 in Bayern vorgesehen? ([zur Abfrage](sparql.md#abfrage-cq-13))
- <a id="cq-14"></a>**CQ 14:** Welche Kompetenzbereiche umfasst das Fach Französisch in Rheinland-Pfalz von der Primarstufe über die Sekundarstufe I bis zur Sekundarstufe II, gegliedert nach Jahrgangsstufen? ([zur Abfrage](sparql.md#abfrage-cq-14))
- <a id="cq-15"></a>**CQ 15:** Welche Kompetenzspezifikationen gehören zum Kompetenzbereich „Lesen“ im Fach Deutsch in der Primarstufe? ([zur Abfrage](sparql.md#abfrage-cq-15))
- <a id="cq-16"></a>**CQ 16:** In welchen Fächern wird in Sachsen das überfachliche Bildungs- und Erziehungsziel „Bildung für nachhaltige Entwicklung“ aufgegriffen? ([zur Abfrage](sparql.md#abfrage-cq-16))

**Niveaus**

- <a id="cq-17"></a>**CQ 17:** Wie hängen die Niveaustufen in Berlin und Brandenburg mit den Jahrgangsstufen zusammen? ([zur Abfrage](sparql.md#abfrage-cq-17))
- <a id="cq-18"></a>**CQ 18:** Welche Jahrgangsstufen umfasst die Niveaustufe C am Gymnasium in Berlin? ([zur Abfrage](sparql.md#abfrage-cq-18))
- <a id="cq-19"></a>**CQ 19:** Wie lassen sich Lerninhalte nach den Sprachniveaus des Gemeinsamen Europäischen Referenzrahmens für Sprachen (GER) filtern? ([zur Abfrage](sparql.md#abfrage-cq-19))

Ein Teil dieser Fragen lässt sich mit den vorhandenen Lehrplandaten bereits beantworten, andere beschreiben Anforderungen an die weitere Entwicklung der Ontologie und an die Erfassung der Daten.


## Ausblick auf die folgenden Kapitel

Dieses Kapitel hat dargelegt, aus welcher Ausgangslage die Lehrplan-Ontologie entstanden ist, welche Ziele sie verfolgt, was sie abbildet und welche Begriffe ihr zugrunde liegen. Die folgenden Kapitel beschreiben, wie diese Grundlagen umgesetzt sind:

- Das Kapitel [Ontologie-Modell](structure.md) erläutert den formalen Aufbau der Ontologie: die Schichten vom Bildungskontext bis zu den Relationen, das Zusammenspiel von gemeinsamem Kern und länderspezifischen Begriffen sowie die nachgenutzten Ontologien.
- Das Kapitel [Patterns](patterns.md) zeigt an konkreten Modellierungsmustern, wie Lehrplanelemente in den Daten dargestellt werden.
- Das Kapitel [SPARQL-Abfragen](sparql.md) zeigt, wie sich die Lehrplandaten abfragen und Kompetenzfragen wie die oben genannten beantworten lassen.
- Das Kapitel [Verwendung](usage.md) beschreibt die verfügbaren Release-Dateien, den Zugriff auf die Daten und ihre Validierung.
