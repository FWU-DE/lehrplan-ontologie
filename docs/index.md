# Lehrplan Ontologie

***Eine Ontologie für Lehrpläne in Deutschland***

## Willkommen

Die **Lehrplan-Ontologie** ist eine **strukturierte** und **maschinenlesbare** **Wissensrepräsentation** **schulischer Lehrpläne** im Primar- und Sekundarbereich. Sie modelliert sowohl die inhaltlichen als auch die strukturellen Bestandteile curricularer Dokumente - darunter **Kompetenzen**, **Bildungsziele**, **Bildungsstandards** sowie deren Einbettung in **Fächer**, **Jahrgangsstufen** und **Schularten** – innerhalb eines einheitlichen semantischen Rahmens. Vor dem Hintergrund der föderalen Vielfalt des deutschen Bildungssystems harmonisiert die Ontologie unterschiedliche Terminologien und Lehrplanstrukturen, ohne länderspezifische Besonderheiten zu verlieren. Durch die Überführung heterogener Lehrplandaten in eine interoperable Wissensbasis schafft sie die Grundlage für Analyse, Vergleichbarkeit und die Entwicklung datenbasierter Bildungsanwendungen.

## Für wen ist diese Dokumentation

Diese Dokumentation richtet sich an alle Personen und Organisationen, die mit der Lehrplan-Ontologie arbeiten, sie verstehen oder weiterentwickeln möchten. Dazu gehören insbesondere **Entwicklerinnen und Entwickler**, die Anwendungen auf Basis der Ontologie erstellen oder **Lehrplandaten integrieren** möchten, ebenso wie **Forschende und Datenanalystinnen** und -analysten im Bildungsbereich, die curriculare Strukturen untersuchen oder vergleichen. Darüber hinaus richtet sich die Dokumentation an **Bildungsadministrationen**, **Fachredaktionen** sowie **Lehrplanexpertinnen und -experten**, die Einblick in die Modellierung curricularer Konzepte und deren semantische Abbildung erhalten möchten. Sie bietet sowohl eine fachliche Orientierung über die zugrunde liegenden Konzepte als auch technische Informationen zur Nutzung, Erweiterung und Integration der Ontologie in digitale Bildungsinfrastrukturen.

## Struktur der Dokumentation

*Diese Dokumentation befindet sich derzeit in der Entwicklung.*

Das aktuelle "Arbeitsdokument" finden Sie hier: [Lehrplan-Ontologie MEM](https://docs.google.com/document/d/1DCpY4IY7yhbZpzofvyE67PlCpyZ-rKtpLFunX4DW5nM/edit?usp=sharing)

Weitere Informationen finden Sie auch unter [https://mem.schule](https://mem.schule) oder wenden Sie sich bitte direkt an die Entwickler: [redaktion@mem.schule](mailto:redaktion@mem.schule)

Die Dokumentation soll sich in folgende Abschnitte gliedern:

- Allgemeine Einführung in Ontologien
	- Was ist eine Ontolgie überhaupt? 
- Konzeptuelle Grundlagen der Lehrplan Ontologie
	- Fachliches Verständnis, Scope, Zentrale Begriffe, Abgrenzung
- Ontologie-Modell
	- Verständnis der Wissensstruktur
 	- Überblick über Klassen, Beziehungen, Hierarchien
 	- Design Prinzipien 
 	- Mapping unterschiedlicher Terminologien der Länder 
- Beispiele / Patterns 
 	- Konkrete Modellierung von Lehrplanelementen
 	- SPARQL-Beispiele
- Nutzung der Ontologie
 	- Release Artefakte
- Anwendungsbeispiele / Use Cases
 	- Lehrplanvergleich zwischen Bundesländern
 	- Verknüpfung mit Bildungsmedien
 	- Curriculum-Analyse
 	- Empfehlungssysteme
- Governance & Weiterentwicklung 	
	- Konventionen, Versionierung
	- Modellierungsregeln
- Knowledge Graph
	- Datenquellen & Integration 
	- Zugriff und Endpoints
- Technische Referenz 
	- Widoco
- Glossar & weiterführende Links




## Metadaten der Ontologie

- Titel: **Lehrplan Ontologie**
- Abkürzung: **LP**
- Namespace: [https://w3id.org/lehrplan/ontology/](https://w3id.org/lehrplan/ontology/)
- Sprache: [OWL](https://www.w3.org/TR/owl-features/)
- Repository: [https://github.com/FWU-DE/lehrplan-ontologie](https://github.com/FWU-DE/lehrplan-ontologie)
- Letzte Version: 1.0.0rc2
- Ersteller: Jörg Waitelonis, Steffen Rörtgen, Cindy Bloes, Laura Junghanns
- Verwandte Projekte: 
	- Schulfach Ontologie [https://github.com/FWU-DE/schulfach-ontologie](https://github.com/FWU-DE/schulfach-ontologie)
	- Schularten Ontolgie [https://github.com/FWU-DE/schulart-ontologie](https://github.com/FWU-DE/schulart-ontologie)
- Lizenz: 
