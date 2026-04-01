# validates a data file against all shacl shapes.
#
# to test a datafile just execute e.g.: 
#
# sh test-data.sh path/to/data.ttl
#

ROBOT="java -jar $HOME/robot.jar"

echo "working on: $1"
mkdir -p tmp
echo "merging pmdco"
$ROBOT merge --catalog ../src/ontology/catalog-v001.xml --input ../src/ontology/pmdco-edit.owl --output tmp/merged-pmdco.ttl
echo '<?xml version="1.0" encoding="UTF-8"?> <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer="public"> <uri name="https://w3id.org/pmd/co" uri="merged-pmdco.ttl" /> </catalog>' > tmp/catalog-v001.xml
echo "merging pmdco into data"
$ROBOT --catalog tmp/catalog-v001.xml merge --input tmp/merged-pmdco.ttl --input "$1" remove --select imports --output tmp/merged3.ttl 
echo "reasoning"
$ROBOT reason --input tmp/merged3.ttl --reasoner hermit --axiom-generators "SubClass EquivalentClass DataPropertyCharacteristic EquivalentDataProperties SubDataProperty ClassAssertion PropertyAssertion EquivalentObjectProperty InverseObjectProperties SubObjectProperty ObjectPropertyRange ObjectPropertyDomain" remove --term owl:topObjectProperty --output tmp/data-reasoned3.ttl 

for f in ./*/shape.ttl ; do
	echo "testing shacl shapes $f" 
	python3 -m pyshacl  -s "$f" tmp/data-reasoned3.ttl
done


