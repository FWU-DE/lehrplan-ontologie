# Note: For consistent results run with ROBOT v1.91 or higher
#wget https://github.com/ontodev/robot/releases/download/v1.9.6/robot.jar

# Download 
wget https://raw.githubusercontent.com/dini-ag-kim/schularten/refs/heads/main/schularten.ttl
wget https://raw.githubusercontent.com/dini-ag-kim/schulfaecher/refs/heads/main/schulfaecher.ttl
wget https://raw.githubusercontent.com/dini-ag-kim/schulabschluesse/refs/heads/main/schulabschluesse.ttl

echo "<> a <http://www.w3.org/2002/07/owl#Ontology> ." >>  schularten.ttl
echo "<> a <http://www.w3.org/2002/07/owl#Ontology> ." >>  schulfaecher.ttl
echo "<> a <http://www.w3.org/2002/07/owl#Ontology> ." >>  schulabschluesse.ttl

# Extract the terms 
java -jar robot.jar merge --input schularten.ttl  --input schulfaecher.ttl  --input schulabschluesse.ttl  extract --method TOP --term 'http://www.w3.org/2004/02/skos/core#Concept'  --output kim-extracted.ttl

# Create Extracted module and annotate with new ontology information
java -jar robot.jar merge --input kim-extracted.ttl annotate --ontology-iri https://w3id.org/lehrplan/ontology/lp/components/kim_import.owl --version-iri https://w3id.org/lehrplan/ontology/lp/components/kim_import.owl --output kim-extracted.ttl

java -jar robot.jar remove --term "http://www.w3.org/2004/02/skos/core#Concept" --input kim-extracted.ttl --output kim-extracted.ttl

# Annotates the output module with a commentary to the origin of the content
java -jar robot.jar annotate --input kim-extracted.ttl --annotation rdfs:comment "This file contains externally imported content from the KIM vocabularies for Schulfächer, Schulabschlüsse, and Schularten for import into the Lehrplan Ontology (LPO)." --output kim-extracted.ttl

# make skos:prefLabel to rdfs:label
java -jar robot.jar query --input kim-extracted.ttl --update update-label.sparql --output kim_import.ofn

# Annotates each axiom with the ontology IRI, using prov:wasDerivedFrom
#java -jar robot.jar annotate --input kim_import.owl --annotate-derived-from true --annotate-defined-by true --output kim_import.ofn

rm schularten.ttl
rm schulfaecher.ttl
rm schulabschluesse.ttl
rm kim-extracted.ttl 
mv kim_import.ofn kim_import.owl