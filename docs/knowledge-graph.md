# Knowledge Graph

Die Lehrplan-Ontologie (LP) beschreibt, *wie* Lehrpläne strukturiert sind. Die Lehrpläne selbst liegen als Lehrplandaten in einem Wissensgraphen (*Knowledge Graph*) vor, der nach den Klassen und Properties der Ontologie aufgebaut ist. Dieses Kapitel beschreibt, welche Daten der Graph enthält, woher sie stammen und welche Besonderheiten bei der Nutzung zu beachten sind.


## Zugang

Der Knowledge Graph ist über den [SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql) (SPARQL: SPARQL Protocol and RDF Query Language; RDF: Resource Description Framework) des Projekts MEM (Metadata for Educational Media) öffentlich abfragbar. Die Daten liegen in benannten Graphen, je einer pro Land bzw. Datenquelle. Jeder Graph ist in die Lehrplandaten (`…/data`) und die daraus abgeleiteten Aussagen (`…/inferences`) unterteilt; der Graph ohne Zusatz enthält beides. Wie die Graphen aufgebaut sind und welche Aussagen abgeleitet werden, beschreibt der Abschnitt [Aufbau des Endpunkts](sparql.md#aufbau-des-endpunkts); Beispielabfragen enthält das Kapitel [SPARQL-Abfragen](sparql.md).


## Datenbestand

Der Knowledge Graph enthält derzeit die Lehrpläne von vier Ländern sowie die Bildungsstandards der Kultusministerkonferenz (KMK):

| Land bzw. Quelle                | Graph                                   | Lehrpläne | Curriculare Elemente | Tripel (`…/data`) |
|---------------------------------|-----------------------------------------|----------:|---------------------:|------------------:|
| Bayern (BY)                     | `https://w3id.org/lehrplan/by`          |     1.707 |               99.390 |         1.310.435 |
| Sachsen (SN)                    | `https://w3id.org/lehrplan/sn`          |       532 |              223.975 |         2.486.657 |
| Rheinland-Pfalz (RP)            | `https://w3id.org/lehrplan/rp`          |       229 |               25.409 |           328.355 |
| Berlin und Brandenburg (BE/BB)  | `https://w3id.org/lehrplan/graph/be`    |        46 |               12.164 |           304.005 |
| KMK-Bildungsstandards           | `https://w3id.org/lehrplan/graph/bista` |        46¹ |                2.036 |            46.522 |

¹ Teildokumente der Bildungsstandards (Instanzen von *Bildungsstandard (KMK)*) für die Fächer Biologie, Chemie, Deutsch, Englisch, Französisch, Mathematik und Physik.

Stand der Zahlen: 25.11.2026, ermittelt über den SPARQL-Endpunkt. Als curriculare Elemente sind alle Instanzen von *Curriculares Element* (`LP_0000261`) gezählt, einschließlich der abgeleiteten Typisierungen. Die Zahlen ändern sich, wenn Lehrpläne aktualisiert oder neue Daten aufgenommen werden; der aktuelle Stand lässt sich mit der Abfrage [Wie viele Lehrpläne gibt es in BY, SN, RP und BE/BB?](sparql.md#wie-viele-lehrplane-gibt-es-in-by-sn-rp-und-bebb) ermitteln.


## Herkunft der Daten

Die Lehrplandaten beruhen auf den Lehrplänen, die die Länder in eigenen Portalen veröffentlichen. Sie wurden in das Modell der Lehrplan-Ontologie überführt; maßgeblich für den Wortlaut und die Verbindlichkeit eines Lehrplans bleibt die Veröffentlichung des Landes.

| Land bzw. Quelle      | Veröffentlichung der Lehrpläne                                                                                   | IRI-Namensraum der Daten                     |
|-----------------------|------------------------------------------------------------------------------------------------------------------|----------------------------------------------|
| Bayern                | [LehrplanPLUS](https://www.lehrplanplus.bayern.de/)                                                              | `https://w3id.org/lehrplan/resource/by/`     |
| Sachsen               | [Lehrplandatenbank im Schulportal Sachsen](https://www.schulportal.sachsen.de/lplandb/)                          | `https://w3id.org/lehrplan/resource/sn/`     |
| Rheinland-Pfalz       | [Lehrpläne Rheinland-Pfalz](https://lehrplaene.bildung-rp.de/)                                                   | `https://w3id.org/lehrplan/resource/rp/`     |
| Berlin und Brandenburg | [Rahmenlehrplan online](https://bildungsserver.berlin-brandenburg.de/rlp-online/)                               | `https://w3id.org/lehrplan/data/be/`         |
| KMK-Bildungsstandards | [maschinenlesbare Bildungsstandards](https://iqb-vocabs.github.io/vokabulare/bildungsstandards.html) des Instituts zur Qualitätsentwicklung im Bildungswesen (IQB) | `https://w3id.org/iqb/` |

Die Internationalized Resource Identifiers (IRIs) der Lehrpläne und Elemente gehören zu den Daten, nicht zur Ontologie. Die Klassen, Properties und festen Individuen der Ontologie haben dagegen Identifikatoren der Form `https://w3id.org/lehrplan/ontology/LP_…` (siehe [Governance und Weiterentwicklung](governance.md#identifikatoren)).


## Besonderheiten der Länder

Alle Daten folgen demselben Kernmodell, bilden aber die Struktur der jeweiligen Lehrpläne ab. Für Abfragen über mehrere Länder sind daher die generischen Klassen (*CE-Bereich*, *CE-Kompetenzspezifikation* usw.) und die Properties des Kernmodells der geeignete Einstieg (siehe [Ontologie-Modell](structure.md)).

**Bayern.** Ein *LehrplanPLUS (BY)* gliedert sich in *Fachlehrpläne (BY)*. Schulfach, Jahrgangsstufe und Schulart sind am Fachlehrplan angegeben, nicht am Lehrplan selbst. Abfragen nach Fach oder Jahrgangsstufe setzen deshalb in Bayern am Fachlehrplan an (siehe [CQ 13](sparql.md#abfrage-cq-13), CQ: Competency Question).

**Sachsen.** Die sächsischen Lehrpläne gliedern sich in *Lernbereiche (SN)*. Lernziele und Lerninhalte sind in einem gemeinsamen Element *Lernziel und Lerninhalt (SN)* zusammengefasst; diese Elemente sind daher zugleich *CE-Kompetenzspezifikation* und *CE-Lerninhalt*. Bemerkungen zu den Lernzielen sind als *CE-Hinweis* abgebildet, Verweise auf überfachliche Bildungs- und Erziehungsziele als *CE-Verweis*.

**Rheinland-Pfalz.** Die Lehrpläne sind nach *Kompetenzbereichen (RP)* gegliedert, denen Kompetenzspezifikationen zugeordnet sind.

**Berlin und Brandenburg.** Die gemeinsamen Rahmenlehrpläne liegen in einem Graphen. Kompetenzspezifikationen sind Niveaustufen A bis H zugeordnet statt Jahrgangsstufen; die Zuordnung zu Jahrgangsstufen ergibt sich über die Bildungsgangniveaus (siehe [Pattern 11](patterns.md#pattern-11-niveaustufen-bebb) und das [Glossar](glossar.md#niveaustufe-und-bildungsgangniveau)).

**KMK-Bildungsstandards.** Die Bildungsstandards werden mit den IRIs des IQB übernommen und über die Klassen der Lehrplan-Ontologie typisiert, etwa als *Kompetenzbereich (Bistas)* oder *Verbindlicher inhaltlicher Aspekt (Bistas)* (siehe [Integration der Bildungsstandards](structure.md#integration-der-bildungsstandards)).


## Einschränkungen

- Der Knowledge Graph enthält bislang die Lehrpläne von vier der sechzehn Länder. Die Ontologie selbst deckt die Terminologie aller Länder ab, sodass weitere Länder ohne Änderung des Modells ergänzt werden können.
- Angaben zum Gültigkeitsbereich, zum Veröffentlichungsdatum und zur Adresse des Originaldokuments sind im Modell vorgesehen, in den aktuellen Daten aber noch nicht enthalten.
- Die Lehrplandaten bilden die veröffentlichten Lehrpläne strukturiert ab, ersetzen sie aber nicht. Bei Abweichungen gilt die Fassung des Landes.


## Ausblick auf die folgenden Kapitel

- Das Kapitel [Governance und Weiterentwicklung](governance.md) beschreibt, wie die Ontologie gepflegt, versioniert und weiterentwickelt wird und wie sich Länder und Fachleute beteiligen können.
- Das [Glossar](glossar.md) erläutert die wichtigsten Begriffe und Abkürzungen.
