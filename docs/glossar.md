# Glossar

Das Glossar erläutert die wichtigsten Begriffe und Abkürzungen der Lehrplan-Ontologie (LP) in der Version **1.0.0rc6**. Die Erläuterungen fassen die Definitionen der Ontologie zusammen; ausführlicher behandelt sie das Kapitel [Ontologie-Modell](structure.md). Begriffe der Ontologie sind *kursiv* gesetzt, wenn sie als Klassenname gemeint sind.


## Abkürzungen

### Länder

Klassen und Individuen, die nur für ein Land gelten, tragen das Kürzel des Landes in Klammern, z. B. *Lernbereich (SN)*.

| Kürzel | Land                   | Kürzel | Land                   |
|--------|------------------------|--------|------------------------|
| BW     | Baden-Württemberg      | NI     | Niedersachsen          |
| BY     | Bayern                 | NW     | Nordrhein-Westfalen    |
| BE     | Berlin                 | RP     | Rheinland-Pfalz        |
| BB     | Brandenburg            | SL     | Saarland               |
| HB     | Bremen                 | SN     | Sachsen                |
| HH     | Hamburg                | ST     | Sachsen-Anhalt         |
| HE     | Hessen                 | SH     | Schleswig-Holstein     |
| MV     | Mecklenburg-Vorpommern | TH     | Thüringen              |

*BE/BB* bezeichnet die gemeinsamen Rahmenlehrpläne von Berlin und Brandenburg.

### Abschlüsse in Berlin und Brandenburg

Die Bildungsgangniveaus von Berlin und Brandenburg sind nach dem angestrebten Abschluss benannt (siehe [Niveaustufe und Bildungsgangniveau](#niveaustufe-und-bildungsgangniveau)).

| Kürzel | Abschluss                                                                  | Land        | Niveaus |
|--------|----------------------------------------------------------------------------|-------------|---------|
| BOA    | berufsorientierender Abschluss                                             | Berlin      | A–E     |
| BBR    | Berufsbildungsreife                                                        | Berlin      | A–F     |
| EBBR   | erweiterte Berufsbildungsreife                                             | Berlin      | A–G     |
| MSA    | mittlerer Schulabschluss                                                   | Berlin      | A–G     |
| EBR    | erweiterte Berufsbildungsreife                                             | Brandenburg | A–G     |
| FOR    | Fachoberschulreife                                                         | Brandenburg | A–G     |
| FOR-Q  | Fachoberschulreife mit Berechtigung zum Besuch der gymnasialen Oberstufe   | Brandenburg | A–H     |

Hinzu kommt in beiden Ländern das *Gymnasialniveau Sek I* mit den Stufen A–H.

### Weitere Abkürzungen

| Kürzel   | Bedeutung                                                                                                        |
|----------|------------------------------------------------------------------------------------------------------------------|
| CE       | Curriculares Element (engl. *curricular element*), Präfix der generischen Elementklassen wie *CE-Bereich*        |
| CQ       | Competency Question, Kompetenzfrage an die Ontologie (siehe [Kompetenzfragen](introduction.md#kompetenzfragen)) |
| ESA      | erster Schulabschluss, Abschlussbezug in den Bildungsstandards                                                   |
| GER      | [Gemeinsamer Europäischer Referenzrahmen für Sprachen](https://www.coe.int/en/web/common-european-framework-reference-languages) |
| IQB      | [Institut zur Qualitätsentwicklung im Bildungswesen](https://www.iqb.hu-berlin.de/)                             |
| KIM      | [Kompetenzzentrum Interoperable Metadaten](https://dini.de/ag/kim/), Arbeitsgruppe der Deutschen Initiative für Netzwerkinformation (DINI) |
| KMK      | [Kultusministerkonferenz](https://www.kmk.org/)                                                                  |
| LP       | Lehrplan-Ontologie; zugleich Präfix ihrer Identifikatoren (`LP_0000438`)                                         |
| Sek I    | Sekundarstufe I, in der Regel die Jahrgangsstufen 5 bis 10                                                       |
| Sek II   | Sekundarstufe II, die gymnasiale Oberstufe                                                                       |


## Begriffe

### Anforderungsbereich

Eines der drei Niveaus, nach denen die KMK Aufgaben und Lernziele nach dem Grad der Eigenständigkeit einteilt: *Anforderungsbereich 1: Reproduktion*, *Anforderungsbereich 2: Reorganisation und Transfer* und *Anforderungsbereich 3: Reflexion und Problemlösung*.

### Bildungsgang

Der Prozess, in dem eine Person eine strukturierte schulische Laufbahn durchläuft, z. B. den gymnasialen Bildungsgang. Der Bildungsgang ist ein realweltlicher Vorgang; die Festlegungen, die ihn regeln, bildet die **Bildungsgangspezifikation** als Informationseinheit ab. Der Lernprozess einer einzelnen Person ist nicht Teil des Bildungsgangs (siehe [Pattern 14](patterns.md#pattern-14-der-lernprozess)).

### Bildungsgangniveau

Ein *Niveau*, das den Anspruch innerhalb eines Bildungsgangs beschreibt. Die generischen Bildungsgangniveaus sind *Grundschulniveau*, *Hauptschulniveau*, *Realschulniveau*, *Gymnasialniveau Sek I* und *Gymnasialniveau Sek II*. Die Niveaus der Länder sind ihnen zugeordnet, z. B. *Mittelschulniveau (BY)* als Hauptschulniveau (siehe [Pattern 10](patterns.md#pattern-10-bildungsgangniveaus-bildungsgange-und-abschlusse)).

### Bildungsstandards

Die von der KMK verabschiedeten, länderübergreifend verbindlichen [Bildungsstandards](https://www.kmk.org/themen/qualitaetssicherung-in-schulen/bildungsstandards.html) legen fest, welche Kompetenzen Schülerinnen und Schüler bis zu einem bestimmten Abschluss erworben haben sollen. Sie bilden den gemeinsamen Bezugsrahmen für die Lehrpläne der Länder. In der Ontologie sind sie Instanzen der Klasse *Bildungsstandard (KMK)* (siehe [Integration der Bildungsstandards](structure.md#integration-der-bildungsstandards)).

### Curriculares Element

Eine Informationseinheit, die einen Bestandteil eines Lehrplans oder Bildungsstandards beschreibt. Curriculare Elemente sind über *hat Teil* geschachtelt und erhalten über ihre **Funktion** eine der folgenden generischen Klassen:

- *CE-Fragment*: strukturgebender Abschnitt ohne eigene fachliche Bedeutung, z. B. ein Kapitel,
- *CE-Bereich*: fachliche Gliederungsebene wie Kompetenzbereich, Lernbereich oder Themenfeld,
- *CE-Kompetenzspezifikation*: Beschreibung einer Kompetenz, z. B. „Die Schülerinnen und Schüler …“,
- *CE-Lerninhalt*: konkretes Thema, an dem Kompetenzen erworben werden,
- *CE-Hinweis*: ergänzende Information mit Empfehlungscharakter, z. B. ein methodischer Vorschlag,
- *CE-Verweis*: Bezug auf ein anderes Element, einen anderen Lehrplan oder eine externe Ressource,
- *CE-Leitperspektive*: übergreifendes Bildungsziel (siehe [Leitperspektive](#leitperspektive)).

### Fachniveau Sek II

Ein *Niveau*, das den Kurstyp eines Fachs in der gymnasialen Oberstufe angibt: *Grundkursniveau* (grundlegendes Anforderungsniveau) oder *Leistungskursniveau* (erhöhtes Anforderungsniveau). Anders als das Bildungsgangniveau bezieht es sich auf ein einzelnes Fach.

### Fremdsprachenniveau

Ein *Niveau* nach dem GER mit den sechs Stufen A1 bis C2.

### Funktion

Die Rolle, die ein curriculares Element innerhalb eines Lehrplans erfüllt, z. B. *Bereichsfunktion* oder *Kompetenzbeschreibungsfunktion*. Über die Funktion werden die unterschiedlich benannten Elemente der Länder den generischen CE-Klassen zugeordnet (siehe [Pattern 8](patterns.md#pattern-8-funktionen)).

### Gültigkeitsbereich

Der Zeitraum, in dem ein Lehrplan gilt, angegeben über *von Datum* und *bis Datum*. Mehrere Lehrpläne können denselben Gültigkeitsbereich haben (siehe [Pattern 13](patterns.md#pattern-13-gultigkeitsbereich)).

### Jahrgangsstufe

Ein Abschnitt der schulischen Laufbahn, der in der Regel einem Schuljahr entspricht. Die Ontologie enthält die Jahrgangsstufen 1 bis 13 als feste Individuen.

### Kompetenz

Die Fähigkeit einer Person, Wissen und Können zur Lösung von Problemen anzuwenden. Eine Kompetenz ist keine Information, sondern eine Eigenschaft der lernenden Person. Ein Lehrplan beschreibt Kompetenzen durch **Kompetenzspezifikationen**: Die *CE-Kompetenzspezifikation* ist Teil des Lehrplans, die Kompetenz wird von ihr beschrieben.

### Kompetenzfrage

Eine Frage, die die Ontologie zusammen mit den Lehrplandaten beantworten können soll, z. B. „Welche Lerninhalte hat Biologie in Jahrgangsstufe 5 in Bayern?“. Die Kompetenzfragen dienen als Anforderungen an das Modell und als Prüfstein für die Daten (siehe [Kompetenzfragen](introduction.md#kompetenzfragen) und die zugehörigen [SPARQL-Abfragen](sparql.md)).

### Land

Eines der sechzehn Länder der Bundesrepublik Deutschland, das für seine Lehrpläne zuständig ist. In der Ontologie sind die Länder feste Individuen, auf die Lehrpläne und Elemente über *von Bundesland* verweisen.

### Lehrplan

Eine systematische Zusammenstellung curricularer Elemente, die verbindlich festlegt, welche Kompetenzen und Inhalte in einem Fach, einer Jahrgangsstufe, einer Schulart oder einem Bildungsgang eines Landes erworben werden sollen. Die Länder verwenden unterschiedliche Bezeichnungen, die in der Ontologie als Unterklassen von *Lehrplan* abgebildet sind:

| Bezeichnung       | Länder                 |
|-------------------|------------------------|
| Bildungsplan      | BW, HB, HH             |
| Fachanforderungen | SH                     |
| Kerncurriculum    | HE, NI                 |
| Kernlehrplan      | NW                     |
| Lehrplan          | RP, SL, SN, ST, TH     |
| LehrplanPLUS      | BY                     |
| Rahmenlehrplan    | BE, BB                 |
| Rahmenplan        | MV                     |

In Bayern gliedert sich ein LehrplanPLUS zusätzlich in **Fachlehrpläne** (*Fachlehrplan (BY)*), an denen Schulfach, Jahrgangsstufe und Schulart angegeben sind.

### Leitperspektive

Ein übergreifendes Bildungsziel wie Bildung für nachhaltige Entwicklung oder Medienbildung, das sich durch mehrere Fächer und Jahrgangsstufen zieht. Die Länder verwenden dafür unterschiedliche Bezeichnungen, etwa *Leitperspektive* (BW, HH), *Querschnittsthema* (MV) oder *überfachliches Bildungs- und Erziehungsziel* (SN). In der Ontologie sind sie *CE-Leitperspektiven*; Elemente der Fachlehrpläne verweisen über *CE-Verweise* auf sie.

### Niveau

Die Oberklasse aller Anspruchs- und Leistungsstufen. Ein Niveau beschreibt, in welcher Tiefe und mit welchem Anspruch Inhalte und Kompetenzen behandelt werden. Unterklassen sind *Bildungsgangniveau*, *Fachniveau Sek II*, *Anforderungsbereich* und *Fremdsprachenniveau*.

### Niveaustufe und Bildungsgangniveau

Die gemeinsamen Rahmenlehrpläne von Berlin und Brandenburg ordnen Kompetenzen nicht nach Jahrgangsstufen, sondern nach acht **Niveaustufen A bis H** (*Niveaustufe BE/BB*). Eine Niveaustufe beschreibt einen Entwicklungsstand der Kompetenz, unabhängig von Schulart und Abschluss.

Ein **Bildungsgangniveau** beschreibt dagegen den Anspruch eines Bildungsgangs. In Berlin und Brandenburg verbinden die Bildungsgangniveaus beides: *MSA E* ist das Niveau der Niveaustufe E auf dem Weg zum mittleren Schulabschluss. Über diese Niveaus lassen sich Niveaustufen den Jahrgangsstufen und den Niveaus anderer Länder zuordnen (siehe [Pattern 11](patterns.md#pattern-11-niveaustufen-bebb)).

### Schulart und Schulfach

Die Schularten und Schulfächer der Länder stammen aus der [Schulart-Ontologie](https://github.com/FWU-DE/schulart-ontologie) und der [Schulfach-Ontologie](https://github.com/FWU-DE/schulfach-ontologie). Beide sind mit den bundesweiten Vokabularen der KIM verknüpft, sodass sich etwa *Gymnasium (SN)* und *Gymnasium (BY)* derselben Schulart zuordnen lassen.

### Titel

Die menschenlesbare Bezeichnung eines curricularen Elements oder Lehrplans, angegeben über *hat Titel*. Das `rdfs:label` eines Elements entspricht in den Daten dem Wert seines Titels.


## Ausblick auf die folgenden Kapitel

Das Kapitel [Über uns](about.md) stellt die Menschen und Einrichtungen vor, die die Lehrplan-Ontologie entwickeln, und nennt Ansprechpartner für Fragen und Rückmeldungen.
