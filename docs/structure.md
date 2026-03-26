# Ontologie-Modell
## Verständnis der Wissensstruktur

*Lehrplanwissen repräsentiern. -> was ist überhaupt ein lehrplan im ontolgischen Sinne? → information darüber wie ein prozess ablaufen soll. Lehrprozess und lernprozess. Kompetenz vs. Kompetenzspezifikation*

# Struktur der Lehrplan Ontologie

## Modellierung

Die Ontologie ist modular aufgebaut: Die Strukturen und Inhalte jedes Bundeslandes werden in eigenen, voneinander getrennten Ontologien erfasst und durch eine übergeordnete Kern-Ontologie (Core) zusammengeführt. Diese Kern-Ontologie enthält diejenigen Elemente und Funktionen, die in allen Bundesländern grundsätzlich vorhanden sind – auch dann, wenn sie dort unterschiedliche Bezeichnungen, Strukturen oder Ausprägungen haben.

Um Lehrpläne bundesländerübergreifend gemeinsam durchsuchbar zu machen, ohne dabei die individuellen Begrifflichkeiten oder Modellierungen der Länder zu verändern, übernimmt die Kern-Ontologie eine verbindende Rolle: Sie definiert gemeinsame Funktionen und Beziehungstypen, über die die jeweiligen Landes-Elemente eindeutig zugeordnet und in ein gemeinsames semantisches System integriert werden.

Ein vereinfachtes Beispiel:

Viele Bundesländer verwenden für ein ähnliches inhaltliches Element – etwa eine Kompetenzbeschreibung – unterschiedliche Begriffe oder Strukturformen. Die Kern-Ontologie weist diesen Elementen eine gemeinsame funktionale Rolle zu, z. B. eine bestimmte Art von Kompetenzbeschreibung. Dadurch können die unterschiedlichen Landesmodelle eindeutig miteinander verknüpft werden. Auf dieser Grundlage werden einheitliche Abfragen möglich, obwohl die Datenstrukturen der Lehrpläne selbst nicht vereinheitlicht werden müssen.

Der modulare Aufbau und die Vernetzung über die Kern-Ontologie ermöglicht es perspektivisch, dass die Länder ihre Ontologien selbst verwalten, warten und anpassen können, ohne dass dadurch die Lehrplan-Ontologien der anderen Länder betroffen werden.

*Grafik*

Zu den bereits erwähnten Kernelementen (s.u. für Definitionen *Curriculare Elemente*) gehören beispielsweise der Lehrplan, der als gedankliche Klammer vielfältige Lehrplan-Fragmente (“CE-Fragment”) umfasst. Solche Lehrplan-Fragmente sind als ordnende Elemente zu verstehen, die wiederum Kompetenzbereiche oder Themenfelder unter sich haben können. Kompetenzbereiche und Themenfelder können abermals jeweils Kompetenzbereiche oder Themenfelder untergeordnet haben, die auf unterster Ebene aber immer eine Kompetenzspezifikation oder einen Lerninhalt haben. 

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

## Überblick über Klassen, Beziehungen, Hierarchien

### Klassen

**Klassen, die den Lernprozess beschreiben:**

Hierarchische Übersicht: 

- independant continuant (BFO)
    - material entity (BFO)
        - object (BFO)
            - Person
        - Organisation (BFO)
            - Schule
            - Schulklasse
- specifically dependent continuant (BFO)
    - realizable entity (BFO)
        - disposition (BFO)
            - function (BFO)
                - Schulartfunktion
            - Kompetenz
        - role (BFO)
            - Schüler Rolle
            - Lehrer Rolle
- process (BFO)
    - Lehrprozess
    - Lernprozess

Definitionen:



**Klassen, die das Bildungssytem beschreiben:**

Hierarchische Übersicht: 

- generically dependent continuant (BFO)
    - information content entity (Informationseinheit) (BFO)
        - Schulfach
        - Schulart
        - Schulstufe
        - Jahrgangsstufe
        - Oberstufenphase
        - Niveau 
            - Bildungsgangniveau
            - Fachniveaus Sek II
            - Fremdsprachenniveau
- process (BFO)
    - Bildungsgang
        - Gymnasialer Bildungsgang
        - Hauptschulbildungsgang
        - Realschulbildungsgang
- process boundary (BFO)
    - Schulabschluss
        - Erster Schulabschluss
        - Mittlerer Schulabschluss
        - Allgemeine Hochschulreife

Definitionen:

Schulart:
*Eine “Schulart” ist eine “Informationseinheit”. Sie ist eine durch bestimmte Merkmale gekennzeichnete Form der Schule, die deren organisatorische Struktur, pädagogische Ausrichtung, die Dauer des Bildungsgangabschnitts sowie die angestrebten Schulabschlüsse festlegt. Sie kann je nach Bildungssystem und Bundesland unterschiedliche Bezeichnungen und Konzepte umfassen, wie Grundschule, Gymnasium, Realschule, Hauptschule, Gesamtschule, Berufsschule oder Förderschule. Im allgemeinen Sprachgebrauch werden “Schulart” und “Schulform” synonym verwendet.*
Alternative Bezeichnungen: Schulform, Schultyp

Schulstufe:
*Die “Schulstufe” ist eine “Informationseinheit”. Sie bezeichnet eine bestimmte Phase der schulischen Laufbahn, in der Lernende bestimmte Ziele gemäß den Anforderungen des Bildungssystems erreichen sollen. Schulstufen dienen dazu, den Lernenden einen strukturierten Lernweg zu bieten, in dem die pädagogischen und didaktischen Anforderungen an die jeweiligen Altersgruppen angepasst sind. Die Schulstufe umfasst je nach Bildungsgang bzw. Bundesland festgelegte Jahrgangsstufen. Sie unterscheidet sich von:*
- dem “Bildungsgang” (der sich auf die Art des Abschlusses bezieht, z. B. Gymnasialer Bildungsgang oder Realschulbildungsgang), 
- dem "Bildungsgangniveau" (welches das Niveau eines Bildungsgangs beschreibt) und 
- dem “Fachniveau” (das die Tiefe und den Umfang eines spezifischen Fachs der Sekundarstufe II beschreibt).
*Im Bereich der allgemeinbildenden Schulen wird unterschieden zwischen der “Primarstufe” (auch Grundschule genannt), der “Sekundarstufe I” und der “Sekundarstufe II” (auch gymnasiale Oberstufe genannt).*
Alternative Bezeichnungen: Bildungsbereich, Schulbereich

Jahrgangsstufe:
*Eine “Jahrgangsstufe” ist eine “Informationseinheit”. Sie umfasst die Gesamtheit der Klassen und Kurse, in denen Lernende gemeinsam einen bestimmten Abschnitt ihrer schulischen Laufbahn durchlaufen. Eine Jahrgangsstufe bezeichnet eine systematische Einteilung der Lernenden und gibt an, in welcher Phase ihres Bildungswegs sie sich befinden und legt die für sie vorgesehenen Kompetenzen und Lerninhalte fest. Nach Abschluss eines Schuljahres erfolgt der Übergang in die nächste Jahrgangsstufe. In den Lehrplänen dient die Jahrgangsstufe als organisatorisches Element, das den Unterrichtsinhalt altersgerecht strukturiert. Je nach Schulart und Bundesland können Jahrgangsstufen unterschiedlich benannt werden, wie zum Beispiel “Klassenstufen”, oder zusammengefasst werden, beispielsweise in Form von Doppeljahrgangsstufen.*
Alternative Bezeichnung: Klassenstufe

Niveau:
*Das “Niveau” ist eine “Informationseinheit”. Sie bezeichnet eine Kategorisierung des Ausmaßes der Ausprägung eines oder mehrerer bestimmten Merkmale. Im Bildungskontext bezeichnet das “Niveau” das Level, die Komplexität, die Tiefe oder den Schwierigkeitsgrad eines Lerninhalts oder einer Kompetenz, die in einem Lehrplan oder Bildungsstandard festgelegt ist. Das Niveau gibt an, welche Anforderungen in Bezug auf Wissen, Fähigkeiten und Fertigkeiten an Lernende gestellt werden und kann sich in Anforderungsbereiche, Bildungsgang-, Fach-  und Fremdsprachenniveau differenzieren. Es drückt nicht aus, in welcher Jahrgangs- oder Schulstufe sich die Lernenden befinden.*

Bildungsgangniveau:
*Das “Bildungsgangniveau” ist ein “Niveau”, das die Anforderungen innerhalb eines “Bildungsgangs” beschreibt und dabei den Unterschied in den Leistungsniveaus zwischen verschiedenen Bildungsgängen kennzeichnet. Es beschreibt in welcher Tiefe und mit welchem Anspruch die Lerninhalte und Kompetenzen innerhalb dieses Bildungsgangs behandelt werden. In der Ontologie wird unterschieden zwischen dem “Hauptschulniveau”, dem “Realschulniveau”, dem “Gymnasialniveau Sek I” und dem “Gymnasialniveau Sek II”. Diese entsprechen den grundlegenden, mittleren und erweiterten Anforderungen, die in einigen Lehrplänen der Sekundarstufe I zur Kategorisierung von Kompetenzen verwendet werden. Während das „Fachniveau Sek II“ die spezifischen Anforderungen in einem einzelnen Fach innerhalb des Gymnasialen Bildungsganges der Sekundarstufe II beschreibt, bezieht sich das „Bildungsgangniveau“ auf das Niveau eines gesamten Bildungsgangs, der auf einen bestimmten Abschluss abzielt.*
Unterklassen der Klasse "Bildungsgangniveau" sind die Klassen "Grundschulniveau", "Hauptschulniveau", "Realschulniveau", "Gymnasialniveau Sek I" und "Gymnasialniveau Sek II".

Fachniveau Sek II:
*Das “Fachniveau Sek II” ist ein “Niveau”. Es bezeichnet das Anforderungsniveau eines bestimmten Fachs in der Sekundarstufe II und bringt zum Ausdruck, ob ein “Curriculares Element” einem “Grundkurs” oder einem “Leistungskurs” zugeordnet ist. Die beiden Fachniveaus unterscheiden sich in der Komplexität und Tiefe des Unterrichts sowie im Umfang der Inhalte und der zu erbringenden Leistungen. Während das „Bildungsgangniveau“ das Niveau eines gesamten Bildungsgangs beschreibt, der auf einen bestimmten Abschluss abzielt, bezieht sich das „Fachniveau Sek II“ auf die spezifischen Anforderungen eines Fachs innerhalb des Gymnasialen Bildungsganges der Sekundarstufe II.*
Unterklassen der Klasse "Fachniveau Sek II" sind die Klassen "Grundkursniveau" und "Leistungskursniveau".

Fremdsprachenniveau:
*Das “Fremdsprachenniveau” ist ein “Niveau”. Es entspricht dem Gemeinsamen Europäischen Referenzrahmen für Sprachen (GER), der die Sprachbeherrschung einer Fremdsprache in sechs Stufen von A1 (Anfänger) bis C2 (annähernd muttersprachliches Niveau) systematisiert. Das Fremdsprachenniveau gibt an, in welchem Umfang Lernende die Sprache verstehen, sprechen, lesen und schreiben können, und dient als Vergleichsgrundlage innerhalb von Bildungsabschlüssen und internationalen Qualifikationen.*

Schulabschluss:
*Ein “Schulabschluss” ist ein “Prozessende”. Es ist ein offiziell anerkannter Bildungsabschluss, der am Ende eines bestimmten Bildungsgangs erworben wird. Er bestätigt den erfolgreichen Abschluss einer schulischen Laufbahn und dient als Qualifikationsnachweis für weiterführende Bildungswege oder den Eintritt in das Berufsleben. Schulabschlüsse unterscheiden sich je nach Schulart und Bundesland in ihren Anforderungen und Berechtigungen sowie der Bezeichnung. Zu den gängigen Schulabschlüssen im allgemeinbildenden Bereich in Deutschland gehören der “Erste Schulabschluss”, der “Mittlere Schulabschluss” sowie die “Allgemeine Hochschulreife” (Abitur). Weitere Abschlüsse können ebenfalls erworben werden, je nach Bundesland und Bildungsgang.*
Alternative Bezeichnung: Abschluss

**Klassen, die die Lehrpläne beschreiben:**

Hierarchische Übersicht: 

- information content entity (Informationseinheit) (BFO)
    - Lehrplan
    - Curriculares Element
        - CE-Fragment
        - CE-Bereich
        - CE-Kompetenzspezifikation
        - CE-Lerninhalt
        - CE-Hinweis
        - CE-Verweis
        - CE-Leitperspektive
    - Funktionsspezifikation
        - Beschreibungsfunktion
        - Strukturierungsfunktion
    - symbol (BFO)
        - Identifikationsnummer
    - textual entity (BFO)
        - Titel
        - Beschreibung
    - data item (BFO)
        - Zeitspezifikation
    - Unit 

Definitionen:

Lehrplan:
*Ein “Lehrplan” ist eine Informationseinheit, die eine systematische Zusammenstellung von curricularen Elementen umfasst. Er definiert verbindlich die Kompetenzen und Inhalte, die Schülerinnen und Schüler in einem bestimmten Fach, einer Jahrgangsstufe, einer Schulart oder einem Bildungsgang eines Bundeslandes erwerben sollen. Ein Lehrplan ist immer spezifisch auf die Bildungspolitik eines Bundeslandes bezogen und unterscheidet sich von bundeslandübergreifenden Bildungsstandards, die von der Kultusministerkonferenz (KMK) beschlossen werden und als gemeinsame Grundlage für die Entwicklung konkreter Lehrpläne in den Ländern dienen. Neben den verbindlichen Vorgaben enthält der Lehrplan häufig auch Hinweise zur didaktisch-methodischen Gestaltung des Unterrichts sowie Querverweise zu verwandten und fachübergreifenden Kompetenzen und Inhalten aus anderen Schulfächern. Je nach Bundesland können Lehrpläne unterschiedliche Bezeichnungen tragen, wie z. B. Bildungsplan, Fachanforderungen, Kerncurriculum, Kernlehrplan, LehrplanPLUS, Rahmenlehrplan oder Rahmenplan.*

Curriculares Element: 
*Ein “Curriculares Element” ist eine Informationseinheit, die bei der Beschreibung der Bestandteile eines Lehrplans oder Bildungsstandards verwendet wird. In der Ontologie fungiert das “Curriculare Element" als Superklasse, um die Elemente zu ordnen, aus denen sich Beschreibungen der zu erwerbenden Inhalte und Kompetenzen eines Lehrplans oder eines Bildungsstandards zusammensetzen. Ein “Curriculares Element” kann zudem eine Funktion besitzen, die seinen Zweck innerhalb des Lehrplans näher definiert. Dadurch können die bundeslandspezifischen Bestandteile der Lehrpläne abgebildet werden, da ihnen gemeinsame Funktionen zugeordnet werden können. Unterklassen des “Curricularen Elements”, die nicht bundeslandspezifisch sind, sind durch das Präfix “CE-” gekennzeichnet.*

CE-Fragment:
*Ein “CE-Fragment” ist ein “Curriculares Element" mit einer strukturierenden Funktion. Es dient zur Abgrenzung eines bestimmten Kontextes innerhalb eines Lehrplans oder Bildungsstandards, wie etwa Kapiteln oder thematischen Gliederungen.*

CE-Bereich:
*Ein “CE-Bereich” ist ein “Curriculares Element”. Ein “CE-Bereich” kann anderen “CE-Bereichen” über- oder untergeordnet sein.Das Element dient der Gliederung von Lehrplänen und Bildungsstandards, indem es “CE-Kompetenzspezifikationen” und/oder “CE-Lerninhalte” unter einem gemeinsamen inhaltlichen Fokus zusammenfasst, der durch den “CE-Bereich” definiert wird.*

CE-Kompetenzspezifikation:
*Eine “CE-Kompetenzspezifikation” ist ein “Curriculares Element”, das eine Kompetenz beschreibt. Es enthält üblicherweise einen Operator und beginnt zum Beispiel mit “Die Schülerinnen und Schüler [...]” oder “Die Lernenden [...]”. Die Ontologie unterscheidet zwischen “CE-Kompetenzspezifikation” und “Kompetenz”: Unter einer Kompetenz wird die Fähigkeit eines Lernenden verstanden, Wissen und Können zur Lösung von Problemen anzuwenden (vgl. KMK). Im Unterschied zur Kompetenz, die als Fähigkeit oder Fertigkeit im Lernenden selbst verankert ist, bildet die “CE-Kompetenzspezifikation” die Beschreibung dieser Kompetenz im Rahmen eines Lehrplans oder Bildungsstandards ab.*

CE-Lerninhalt:
*Ein “CE-Lerninhalt” ist ein “Curriculares Element", das einen Lerninhalt in Form konkreter Themen beschreibt.  Der „CE-Lerninhalt“ liefert die inhaltliche Basis für die Gestaltung des Unterrichts. Anhand des "CE-Lerninhalts" können Kompetenzen erworben werden. Ein CE-Lerninhalt kann einen anderen CE-Lerninhalt enthalten, aber kein anderes Element (wie z.B. CE-Bereich oder CE-Kompetenzspezifikation).*

CE-Hinweis:
*Ein “CE-Hinweis” ist ein “Curriculares Element”, das ergänzende Informationen oder Anregungen zu einem “CE-Bereich”, einem “CE-Lerninhalt” oder einer “CE-Kompetenzspezifikation” beinhaltet. Der “CE-Hinweis” hat einen Empfehlungscharakter.*
**Beispiele:*
- praktische oder methodische Empfehlungen
- Vorschläge oder Hinweise zur Umsetzung im Unterricht
- Vertiefungsvorschläge
- Differenzierungsvorschläge

CE-Verweis:
*Ein “CE-Verweis” ist ein “Curriculares Element”, das einen Bezug von einem Curricularen Element zu einem anderen Element desselben Lehrplans, eines anderen Lehrplans oder externen Ressourcen herstellt. Dabei ist der “CE-Verweis” nicht selbst das verlinkte Objekt, sondern stellt eine Referenz darauf dar.*

CE-Leitperspektive:
**Eine “CE-Leitperspektive” ist ein “Curriculares Element”, das übergreifende Bildungsprinzipien beschreibt, die alle Fächer und Schulformen verbinden und gesellschaftlich relevante Themen wie Politik, Kultur, Umwelt und Wirtschaft aufgreifen. Die Bildungsprinzipien fördern Schlüsselkompetenzen, Werteorientierung und Persönlichkeitsentwicklung für ein selbstbestimmtes, verantwortungsbewusstes Leben. Als roter Faden sind sie fächerübergreifend in Unterricht und Schulleben verankert. Die konkreten Inhalte und Themen, die unter dem Begriff „Leitperspektiven“ zusammengefasst werden, sowie die Bezeichnungen dieser Konzepte unterscheiden sich je nach Bundesland. Beispiele für alternative Begriffe sind: (fach-)übergreifendes Thema, (fach-)übergreifendes Ziel, Bildungs- und Erziehungsziel oder Querschnittsthema.*



### (individuals)

### Beziehungen (properties)



## Mapping unterschiedlicher Terminologien der Bundesländer

### 

So wie die Bildungssysteme sich von Bundesland zu Bundesland unterscheiden, so unterscheiden sich auch die Lehrpläne. Jedes Bundesland strukturiert seine Lehrpläne anders und benutzt unterschiedliches Vokabular, um dieselben oder ähnliche Konzepte zu beschreiben. Außerdem gibt es fächerübergreifende Unterschiede innerhalb der Bundesländer sowohl im Aufbau der Lehrpläne als auch im Hinblick auf die benutzten Begrifflichkeiten. All dies führt dazu, dass die Inhalte der Lehrpläne den von uns erarbeiteten Kern-Elementen (CE-Bereich, CE-Kompetenzspezifikation, CE-Lerninhalt und CE-Hinweis) nicht immer eindeutig zuzuordnen sind. Hinzu kommen einige Besonderheiten einzelner Bundesländer, wie zum Beispiel konkrete Anwendungsbeispiele im Schulunterricht oder Zeitangaben zu den zu erlernenden Inhalten, welche in den Lehrplänen anderer Bundesländern nicht vorkommen und die Einbindung in ein generisches Modell erschweren.

Durch die Analyse der Lehrpläne aller Bundesländer haben wir zentrale inhaltliche Strukturen identifiziert, die in nahezu jedem Lehrplan vorkommen. Die inhaltlichen Kernkomponenten tragen die Bezeichnung “Curriculare Elemente” (CE). Dazu gehören: 

*Grafik* 

Die nachfolgende Grafik zeigt, wie die zentralen Kernelemente der Ontologie dazu beitragen, bundeslandspezifische Terminologien konsistent abzubilden. Als Beispiel dienen Ausschnitte aus dem Deutsch-Lehrplan Mecklenburg-Vorpommerns. Unter jedem curricularen Element sind diejenigen Bezeichnungen aufgeführt, die in anderen Bundesländern für funktional vergleichbare Elemente verwendet werden. Diese Zuordnung ermöglicht es, die terminologischen Unterschiede der Länder beizubehalten und zugleich eine klare, strukturierte Vergleichbarkeit herzustellen.

*Grafik*

*Im Folgenden sind die Elemente jedes Bundeslandes stichpunktartig festgehalten und die bundeslandspezifischen Bezeichnungen aufgelistet, anhand von Beispielen erläutert und den Curricularen Elementen der Kernontologie zugeordnet. Hierfür wurden die Fächer Deutsch, Mathematik, Englisch (oder die erste Fremdsprache) und Physik (oder Sachunterricht oder Naturwissenschaften) berücksichtigt. Zu jedem Bundesland sind außerdem Informationen zu den bundeslandspezifischen Niveaus (Bildungsgangniveaus und Fachniveaus Sek II) sowie zum jeweiligen Bildungssystem (Schulfächer, Schularten, Schulabschlüsse), welche die Ontologie enthält, aufgelistet. Hier gelangen Sie direkt zu den einzelnen Dokumenten der Bundesländer.*

...

### Integration der Bildungsstandards

**Die Rolle der Kultusministerkonferenz (KMK) und die Nutzung ihrer Bildungsstandards in der Ontologie**

Die Kultusministerkonferenz (KMK) ist das zentrale Gremium der 16 deutschen Bundesländer für alle Fragen rund um Bildung, Wissenschaft und Kultur. Da das Bildungswesen in Deutschland Länderhoheit ist, sorgt die KMK dafür, dass wichtige Aspekte des Schul- und Bildungsbereichs bundesweit abgestimmt sind und vergleichbare Standards bestehen. Zu ihren Aufgaben gehören unter anderem die Entwicklung gemeinsamer Rahmenvorgaben, die Abstimmung von Schulabschlüssen sowie die Formulierung bundesweit verbindlicher [Bildungsstandards](https://www.kmk.org/themen/qualitaetssicherung-in-schulen/bildungsstandards.html).

Für viele dieser Bildungsstandards stellt das IQB (Institut zur Qualitätsentwicklung im Bildungswesen) bereits [digital nutzbare Daten](https://iqb-vocabs.github.io/vokabulare/bildungstandards.html) bereit. Diese liegen in strukturierten, maschinenlesbaren Formaten vor und ermöglichen dadurch eine effiziente Weiterverarbeitung, Verknüpfung und Analyse. Zu diesen Standards zählen beispielsweise Kompetenzbeschreibungen für die Fächer Deutsch, Mathematik, die erste Fremdsprache (Englisch/Französisch) sowie die naturwissenschaftlichen Fächer (Biologie, Chemie und Physik). Die Bereitstellung in standardisierter Form schafft die Grundlage dafür, Bildungsinhalte über Ländergrenzen hinweg vergleichbar zu machen und digitale Anwendungen zu unterstützen.

In unserer Ontologie dienen die Bildungsstandards der KMK als übergeordnete Referenzstruktur. Analog zur Vorgehensweise bei den einzelnene Bundesländern, werden auch die in den Bildungsstandards vorkommenden Elemente den übergeordneten Curricularen Elementen zugeordnet und als eindeutig definierte Entitäten im Datenmodell hinterlegt. Diese Referenzpunkte können anschließend mit Lehrplanbestandteilen der Bundesländer verknüpft werden. Dadurch unterstützen die Bildungsstandards eine konsistente Verwendung von Kompetenzbeschreibungen, Betitlungen von Bereichen und Erwartungsniveaus und ermöglichen eine vergleichbare Einordnung der Lehrplaninhalte.

Die Bildungsstandards beziehen sich dabei auf eine Bildungsstufe und sind bis zum Ende der Primarstufe, der Sekundarstufe I (aufgeteilt in den Ersten und Mittleren Schulabschluss) und der Sekundarstufe II (Allgemeine Hochschulreife) zu erwerben. Da die Lehrpläne der Bundesländer allerdings meist auf Ebene der Jahrgangsstufen ausdifferenziert sind, können die Bildungsstandards nicht genau gleich übernommen werden. Außerdem gibt es nur für die oben genannten Fächer Bildungsstandards. Aus diesen Gründen reichen die Bildungsstandards nicht als gemeinsamer Nenner aller Lehrpläne. Trotzdem bieten sie eine wichtige Referenzquelle.

**Die Curricularen Elemente der Bildungsstandards**

...