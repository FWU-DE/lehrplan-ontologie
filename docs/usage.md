# Verwendung

Dieses Kapitel beschreibt, wie die Lehrplan-Ontologie und die Lehrplandaten praktisch genutzt werden können: welche Dateien zur Verfügung stehen, wie die Ontologie und die Daten abgerufen werden, wie eigene Lehrplandaten erstellt und geprüft werden und unter welchen Bedingungen die Ontologie genutzt werden kann.


## Release-Artefakte

Die Ontologie wird mit dem [Ontology Development Kit (ODK)](https://github.com/INCATools/ontology-development-kit) entwickelt und im [GitHub-Repository](https://github.com/FWU-DE/lehrplan-ontologie) in mehreren Varianten bereitgestellt. Die Dateien liegen in der Web Ontology Language (OWL) im Format [RDF/XML](https://www.w3.org/TR/rdf-syntax-grammar/) (RDF: Resource Description Framework; XML: Extensible Markup Language) und teilweise zusätzlich im Format [Turtle](https://www.w3.org/TR/turtle/) vor:

| Datei | Inhalt | Geeignet für |
|-------|--------|--------------|
| `lp.owl` / `lp.ttl` | aktuelle Version; entspricht `lp-full` | die meisten Anwendungen |
| `lp-full.owl` / `lp-full.ttl` | vollständige Ontologie: alle Klassen, Properties und Axiome der Lehrplan-Ontologie, die verwendeten Begriffe aus der Basic Formal Ontology (BFO), der Relation Ontology (RO), der Information Artifact Ontology (IAO) und dem Vokabular QUDT (Quantities, Units, Dimensions and Types) sowie die Schulfächer und Schularten der Länder | Abfragen, Schlussfolgern, Validierung |
| `lp-base.owl` / `lp-base.ttl` | nur die Klassen, Properties und Individuen der Lehrplan-Ontologie selbst; nachgenutzte Begriffe sind nur referenziert, Schulfächer und Schularten nicht enthalten | Import in eigene Ontologien |
| `lp-simple.owl` / `lp-simple.ttl` | vereinfachte Variante ohne Äquivalenzaxiome (`owl:equivalentClass`) | Anwendungen, die nur die Klassenhierarchie benötigen |
| `lp-land-XX-full.owl` | länderspezifische Module, je eines pro Land (z. B. `lp-land-BY-full.owl`) | Arbeit mit den Begriffen eines einzelnen Landes |
| `lp-bista-full.owl` | Modul für die Bildungsstandards der Kultusministerkonferenz (KMK) | Arbeit mit den KMK-Bildungsstandards |

!!! note "Einschränkung von `lp-simple`"

    Da `lp-simple` keine Äquivalenzaxiome enthält, kann ein Reasoner die länderspezifischen Klassen damit nicht den gemeinsamen Klassen wie *CE-Bereich* zuordnen (siehe [Designprinzip](structure.md#modellierung-designprinzip)). Für länderübergreifende Auswertungen ist daher `lp-full` zu verwenden.


## Versionen

Die Versionen werden als [Releases im Repository](https://github.com/FWU-DE/lehrplan-ontologie/releases) veröffentlicht. Die Versionsnummern folgen dem Schema `1.0.0rcN`; „rc“ steht für *Release Candidate*, also eine Vorabversion vor der ersten stabilen Version 1.0.0.

| Version | Datum | Wesentliche Änderungen |
|---------|-------|------------------------|
| 1.0.0rc6 | 25.10.2026 | Trennung von Spezifikation und realweltlicher Entität bei Schulabschluss und Bildungsgang, direkte Teil-Beziehung, Einheiten aus QUDT, erweiterte Schulfach-Mappings |
| 1.0.0rc5 | 21.09.2026 | fehlendes allgemeines Axiom zur Sekundarstufe II ergänzt |
| 1.0.0rc4 | 14.09.2026 | Axiome von *CE-Hinweis* und weiteren Klassen bereinigt |
| 1.0.0rc3 | 28.07.2026 | Dokumentation und Patterns überarbeitet, zeitliche Angaben eingeführt |
| 1.0.0rc2 | 24.02.2026 | Import von Properties aus SKOS (Simple Knowledge Organization System), zahlreiche kleinere Verbesserungen |
| 1.0.0rc1 | 07.01.2026 | erste Vorabversion |

### Änderungen in Version 1.0.0rc6

Version rc6 enthält Änderungen, die bestehende Daten betreffen können:

- **Schulabschlüsse**: `LP_0000019` steht jetzt für die *Schulabschlussspezifikation*. Die neue Klasse `LP_0000008` *Schulabschluss* beschreibt die Rolle, die eine Person mit dem Abschluss erhält.
- **Bildungsgänge**: `LP_0000816` steht jetzt für die *Bildungsgangspezifikation*. Die neue Klasse `LP_0000567` *Bildungsgang* beschreibt den Prozess, den eine Person durchläuft.
- **Schularten**: Die *Schulartfunktion* (`LP_0000475`) ist jetzt eine Rolle statt einer Funktion im Sinne von BFO.
- **Rollen und Kompetenzen**: Lehrer- und Schülerrolle setzen eine Person als Träger voraus; eine Kompetenz setzt eine Person und eine Kompetenzspezifikation voraus.
- **Gliederung**: Die neuen Properties *hat direkten Teil* (`LP_0000565`) und *direkt Teil von* (`LP_0000566`) bilden die unmittelbare Gliederung ab.
- **Einheiten**: Zeitspezifikationen verweisen über `qudt:hasUnit` auf ihre Einheit.

Für die Umstellung bestehender Daten auf rc6 sind folgende Schritte nötig:

1. Daten prüfen, die die umgedeuteten IRIs (Internationalized Resource Identifiers) für Schulabschlüsse (`LP_0000019`), Bildungsgänge (`LP_0000816`) und Schularten (`LP_0000475`) verwenden.
2. Verweise auf Einheiten über `LP_0000041` durch `qudt:hasUnit` ersetzen.
3. Verweise über `LP_0000477` (*konkretisiert Schulart*) durch `LP_0000024` (*wird beschrieben von*) ersetzen.


## Zugriff

### IRIs der Ontologie

Die Ontologie-IRI `https://w3id.org/lehrplan/ontology/` wird über den Dienst [w3id.org](https://w3id.org/) dauerhaft auf die aktuelle Version weitergeleitet. Welches Format geliefert wird, richtet sich nach dem angefragten Inhaltstyp (*Content Negotiation*):

| Angefragter Inhaltstyp | Ergebnis |
|------------------------|----------|
| `text/turtle` | Ontologie im Format Turtle |
| `application/rdf+xml` | Ontologie im Format RDF/XML |
| `text/html` (Webbrowser) | Referenzdokumentation |

Die Versions-IRI (z. B. `https://w3id.org/lehrplan/ontology/1.0.0rc6`) und die IRIs der einzelnen Begriffe (z. B. `https://w3id.org/lehrplan/ontology/LP_0000438`) verweisen derzeit ebenfalls auf die aktuelle Version der Ontologie. Ältere Versionen sind über die Releases im Repository abrufbar.

### SPARQL-Endpunkt

Die Lehrplandaten der Länder sind gemeinsam mit der Ontologie über den [SPARQL-Endpunkt](https://mem.bmi.fwu.de/sparql) abfragbar (SPARQL: SPARQL Protocol and RDF Query Language). Der Endpunkt folgt dem [Protokoll von SPARQL 1.1](https://www.w3.org/TR/sparql11-protocol/) und kann im Webbrowser, über die Kommandozeile oder aus Programmen heraus genutzt werden. Wie die Daten dort in Graphen organisiert sind und wie typische Abfragen aussehen, beschreibt das Kapitel [SPARQL-Abfragen](sparql.md).

Abfrage mit `curl` auf der Kommandozeile, mit dem Ergebnis im Format CSV (Comma-Separated Values):

```bash
curl -s -G "https://mem.bmi.fwu.de/sparql" \
     -H "Accept: text/csv" \
     --data-urlencode "query=
PREFIX Lehrplan:       <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>
PREFIX sachsen:        <https://w3id.org/lehrplan/ontology/LP_3000047>
SELECT (COUNT(DISTINCT ?lehrplan) AS ?anzahl)
WHERE { ?lehrplan a Lehrplan: ; von_bundesland: sachsen: . }"
```

Dieselbe Abfrage in Python, nur mit der Standardbibliothek und mit dem Ergebnis im Format JSON (JavaScript Object Notation):

```python
import json
import urllib.parse
import urllib.request

abfrage = """
PREFIX Lehrplan:       <https://w3id.org/lehrplan/ontology/LP_0000438>
PREFIX von_bundesland: <https://w3id.org/lehrplan/ontology/LP_0000029>
PREFIX sachsen:        <https://w3id.org/lehrplan/ontology/LP_3000047>
SELECT (COUNT(DISTINCT ?lehrplan) AS ?anzahl)
WHERE { ?lehrplan a Lehrplan: ; von_bundesland: sachsen: . }
"""
url = "https://mem.bmi.fwu.de/sparql?" + urllib.parse.urlencode({"query": abfrage})
anfrage = urllib.request.Request(url, headers={"Accept": "application/sparql-results+json"})
with urllib.request.urlopen(anfrage, timeout=60) as antwort:
    ergebnis = json.load(antwort)

for zeile in ergebnis["results"]["bindings"]:
    print(zeile["anzahl"]["value"])
```

### Ontologie lokal verarbeiten

Die Ontologie lässt sich auch direkt laden und lokal abfragen, etwa mit der Python-Bibliothek [rdflib](https://rdflib.readthedocs.io/). Das folgende Beispiel listet die länderspezifischen Bezeichnungen für Lehrpläne auf:

```python
import rdflib

g = rdflib.Graph()
g.parse("https://w3id.org/lehrplan/ontology/")

abfrage = """
PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX Lehrplan: <https://w3id.org/lehrplan/ontology/LP_0000438>
SELECT ?klasse ?bezeichnung
WHERE {
  ?klasse rdfs:subClassOf Lehrplan: ;
          rdfs:label ?bezeichnung .
  FILTER(LANG(?bezeichnung) = "de")
}
ORDER BY ?bezeichnung
"""
for zeile in g.query(abfrage):
    print(zeile.bezeichnung)
```


## Einbindung in eigene Ontologien

Eigene Ontologien, die Begriffe der Lehrplan-Ontologie verwenden oder erweitern, importieren in der Regel `lp-base`. So werden nur die Begriffe der Lehrplan-Ontologie selbst übernommen; die nachgenutzten Ontologien wie BFO und IAO werden unabhängig davon eingebunden. Da die Ontologie- und Versions-IRIs auf die vollständige Ontologie verweisen, wird `lp-base` über die Datei eines bestimmten Releases importiert:

```turtle
@prefix owl: <http://www.w3.org/2002/07/owl#> .

<https://www.example.org/meine-ontologie> a owl:Ontology ;
    owl:imports <https://raw.githubusercontent.com/FWU-DE/lehrplan-ontologie/v1.0.0rc6/lp-base.owl> .
```

Wird die vollständige Ontologie benötigt, genügt der Import über die Versions-IRI `https://w3id.org/lehrplan/ontology/1.0.0rc6`.

Die Lehrplan-Ontologie verwendet bewusst nicht sprechende IRIs wie `LP_0000438`. Neue Begriffe in eigenen Erweiterungen sollten einen eigenen Namensraum erhalten und nicht im Namensraum der Lehrplan-Ontologie angelegt werden. Vorschläge für neue Begriffe in der Lehrplan-Ontologie selbst nimmt das Projekt über das Repository entgegen (siehe [Mitwirken](#mitwirken)).


## Erstellen eigener Lehrplandaten

Lehrplandaten werden nach den Patterns aus dem Kapitel [Patterns](patterns.md) erstellt. Für Daten, die mit den vorhandenen Lehrplandaten zusammen genutzt werden sollen, gelten folgende Regeln:

1. **Länderspezifische Klassen verwenden**: Jedes Element erhält die Klasse aus der Terminologie seines Landes, z. B. *Lernbereich (SN)* oder *Kompetenzerwartung (BY)*. Die Zuordnung zu den gemeinsamen Klassen wie *CE-Bereich* ergibt sich durch Schlussfolgern (siehe [Pattern 8](patterns.md#pattern-8-funktionen)).
2. **Kontext angeben**: Der Lehrplan trägt Land, Schulart, Schulfach und gegebenenfalls Jahrgangs- und Schulstufe (siehe [Pattern 1](patterns.md#pattern-1-lehrplan-eines-landes)). Für Schulfächer und Schularten werden die IRIs aus der Schulfach- und Schulart-Ontologie verwendet.
3. **Gliederung abbilden**: Elemente werden über *hat direkten Teil* miteinander verbunden; die Reihenfolge gibt *hat Position* an (siehe [Pattern 6](patterns.md#pattern-6-hierarchie-der-curricularen-elemente)).
4. **Titel als Informationseinheit**: Der Text eines Elements wird als *Titel* mit *hat Wert* angegeben. Das `rdfs:label` des Elements entspricht dem Wert seines Titels (siehe [Pattern 2](patterns.md#pattern-2-titel-beschreibung-und-identifikationsnummer)).
5. **Stabile IRIs vergeben**: Jedes Element erhält eine IRI, die bei späteren Aktualisierungen der Daten unverändert bleibt, damit andere Systeme dauerhaft darauf verweisen können. Bewährt hat sich, die IRI aus einer Kennung der Quelldaten abzuleiten.

Das folgende Beispiel zeigt einen minimalen sächsischen Lehrplan mit einem Lernbereich und einem Lernziel:

```turtle
@prefix rdfs:                       <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex:                         <https://www.example.org/> .
@prefix Lehrplan_SN:                <https://w3id.org/lehrplan/ontology/LP_0000818> .
@prefix Lernbereich_SN:             <https://w3id.org/lehrplan/ontology/LP_0002113> .
@prefix Lernziel_und_Lerninhalt_SN: <https://w3id.org/lehrplan/ontology/LP_0002115> .
@prefix Titel:                      <https://w3id.org/lehrplan/ontology/LP_0000346> .
@prefix von_bundesland:             <https://w3id.org/lehrplan/ontology/LP_0000029> .
@prefix sachsen:                    <https://w3id.org/lehrplan/ontology/LP_3000047> .
@prefix fuer_schulart:              <https://w3id.org/lehrplan/ontology/LP_0000812> .
@prefix oberschule_sn:              <https://w3id.org/schulart/SN_0000003> .
@prefix hat_schulfach:              <https://w3id.org/lehrplan/ontology/LP_0000537> .
@prefix mathematik_sn:              <https://w3id.org/schulfach/SN_0000012> .
@prefix hat_jahrgangsstufe:         <https://w3id.org/lehrplan/ontology/LP_0000026> .
@prefix jahrgangsstufe_5:           <https://w3id.org/lehrplan/ontology/LP_2000005> .
@prefix hat_direkten_teil:          <https://w3id.org/lehrplan/ontology/LP_0000565> .
@prefix hat_position:               <https://w3id.org/lehrplan/ontology/LP_0000460> .
@prefix hat_titel:                  <https://w3id.org/lehrplan/ontology/LP_0030056> .
@prefix hat_wert:                   <https://w3id.org/lehrplan/ontology/LP_0000344> .

# Lehrplan mit Kontextangaben
ex:lehrplan_1 a Lehrplan_SN: ;
    rdfs:label "Oberschule Mathematik" ;
    hat_titel: ex:titel_1 ;
    von_bundesland: sachsen: ;
    fuer_schulart: oberschule_sn: ;
    hat_schulfach: mathematik_sn: ;
    hat_direkten_teil: ex:lernbereich_1 .

# Lernbereich als erste Gliederungsebene
ex:lernbereich_1 a Lernbereich_SN: ;
    rdfs:label "Arbeiten mit natürlichen Zahlen" ;
    hat_titel: ex:titel_2 ;
    von_bundesland: sachsen: ;
    hat_jahrgangsstufe: jahrgangsstufe_5: ;
    hat_position: 1 ;
    hat_direkten_teil: ex:lernziel_1 .

# Lernziel innerhalb des Lernbereichs
ex:lernziel_1 a Lernziel_und_Lerninhalt_SN: ;
    rdfs:label "Kennen der Darstellung natürlicher Zahlen im Zehnersystem" ;
    hat_titel: ex:titel_3 ;
    von_bundesland: sachsen: ;
    hat_position: 1 .

# Titel als eigene Informationseinheiten; der Wert entspricht dem rdfs:label
ex:titel_1 a Titel: ; hat_wert: "Oberschule Mathematik" .
ex:titel_2 a Titel: ; hat_wert: "Arbeiten mit natürlichen Zahlen" .
ex:titel_3 a Titel: ; hat_wert: "Kennen der Darstellung natürlicher Zahlen im Zehnersystem" .
```

Liegen die Quelldaten in strukturierter Form vor, etwa als Tabellen oder in einem eigenen Datenformat, lassen sie sich mit Abbildungssprachen wie RML (RDF Mapping Language) oder YARRRML in diese Form überführen (siehe [Werkzeuge](ontology.md#werkzeuge)).


## Schlussfolgern

Viele Auswertungen setzen voraus, dass ein Reasoner die Daten zusammen mit der Ontologie verarbeitet hat. Erst dadurch werden etwa die länderspezifischen Elemente den gemeinsamen Klassen wie *CE-Bereich* zugeordnet, die transitive Relation *hat Teil* aus *hat direkten Teil* abgeleitet und inverse Relationen ergänzt. Der SPARQL-Endpunkt hält diese abgeleiteten Tripel bereits in eigenen Graphen vor (siehe [Aufbau des Endpunkts](sparql.md#aufbau-des-endpunkts)).

Für eigene Daten empfiehlt es sich, die Ableitungen einmalig zu berechnen und zusammen mit den Daten zu speichern (Materialisierung). Geeignet sind Reasoner, die die Variante OWL 2 DL (DL: Description Logics) vollständig unterstützen, etwa [Konclude](https://github.com/konclude/Konclude) oder HermiT, der zusammen mit dem Werkzeug [ROBOT](https://robot.obolibrary.org/reason) genutzt werden kann. Konclude klassifiziert die Ontologie in der Version rc6 in Bruchteilen einer Sekunde; HermiT kann wegen der zahlreichen Wertebeschränkungen (`owl:hasValue`) in den Klassendefinitionen deutlich länger benötigen.


## Validierung

Im Verzeichnis [`shapes/`](https://github.com/FWU-DE/lehrplan-ontologie/tree/main/shapes) des Repositorys liegen Shapes in der [Shapes Constraint Language (SHACL)](https://www.w3.org/TR/shacl/), mit denen sich Lehrplandaten auf ihre Übereinstimmung mit den Patterns prüfen lassen:

| Shape | Prüft, ob … |
|-------|-------------|
| `auto-shapes` | die Properties mit Werten der vorgesehenen Klassen verwendet werden (automatisch aus der Ontologie erzeugt) |
| `bereich` | jeder Bereich und jede Kompetenzspezifikation Teil eines übergeordneten Elements ist |
| `lehrplan bundesland` | jeder Lehrplan einem Land zugeordnet ist |
| `titles` | jeder Lehrplan und jedes curriculare Element einen Titel hat und das `rdfs:label` dem Wert des Titels entspricht |
| `textual entity` | jeder Titel und jede Beschreibung einen Textwert hat und sich auf ein Element bezieht |
| `verweis` | jeder Verweis einem Element zugeordnet ist und auf ein Ziel verweist |
| `nonull` | kein `rdfs:label` den Wert „null“ hat |

Da sich mehrere Shapes auf abgeleitete Klassen und Relationen beziehen, werden die Daten vor der Prüfung mit der Ontologie zusammengeführt und materialisiert. Der Ablauf entspricht dem Skript `test.sh` im Verzeichnis `shapes/`:

1. Ontologie und Daten zusammenführen, z. B. mit `robot merge`.
2. Die Ableitungen mit einem Reasoner berechnen, z. B. mit Konclude oder mit `robot reason`, und zu den Daten hinzufügen.
3. Das Ergebnis mit [pySHACL](https://github.com/RDFLib/pySHACL) gegen die Shapes prüfen, z. B. `python3 -m pyshacl -s shapes/bereich/shape.ttl daten-materialisiert.ttl`.


## Technische Referenz

Eine vollständige Liste aller Klassen und Properties mit ihren Definitionen bietet die mit Widoco erzeugte [Referenzdokumentation](https://fwu-de.github.io/lehrplan-ontologie/index-de.html).


## Lizenz und Zitation

Die Lehrplan-Ontologie steht unter der Lizenz [Creative Commons Namensnennung – Weitergabe unter gleichen Bedingungen 4.0 (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/deed.de). Sie darf genutzt, verändert und weitergegeben werden, sofern die Urheberschaft genannt wird und Bearbeitungen unter derselben Lizenz veröffentlicht werden.

Zitiervorschlag:

> Lehrplan Ontology. Version 1.0.0rc6, https://w3id.org/lehrplan/ontology


## Mitwirken

Fehler, Fragen und Vorschläge für neue Begriffe können als [Issue im Repository](https://github.com/FWU-DE/lehrplan-ontologie/issues) gemeldet werden. Die [Hinweise zum Mitwirken](https://github.com/FWU-DE/lehrplan-ontologie/blob/main/CONTRIBUTING.md) beschreiben, wie Fehlermeldungen und Änderungsvorschläge aufgebaut sein sollten; für die Zusammenarbeit gilt der [Verhaltenskodex](https://github.com/FWU-DE/lehrplan-ontologie/blob/main/CODE_OF_CONDUCT.md) des Projekts. Fachliche Fragen zu den Lehrplandaten beantwortet die Redaktion des Projekts MEM (Metadata for Educational Media) unter [redaktion@mem.schule](mailto:redaktion@mem.schule). Wie Identifikatoren vergeben, Versionen veröffentlicht und Änderungen abgestimmt werden, beschreibt das Kapitel [Governance und Weiterentwicklung](governance.md).


## Ausblick auf die folgenden Kapitel

- Das Kapitel [Knowledge Graph](knowledge-graph.md) beschreibt, welche Lehrplandaten im SPARQL-Endpunkt vorliegen, woher sie stammen und welche Besonderheiten die Daten der einzelnen Länder haben.
- Das Kapitel [Governance und Weiterentwicklung](governance.md) erläutert, wie die Ontologie gepflegt und versioniert wird und wie Länder und Fachleute mitwirken können.
- Das [Glossar](glossar.md) fasst die wichtigsten Begriffe und Abkürzungen zusammen.
