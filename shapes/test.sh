
#
# to test pattern 1 just execute e.g.: 
#
# sh test.sh pattern\ 1
#

ROBOT="java -jar $HOME/robot.jar"

echo "working on: $1"
mkdir -p tmp
echo "merging pmdco"
$ROBOT merge --catalog ../src/ontology/catalog-v001.xml --input ../src/ontology/lp-edit.owl --output tmp/merged-lp.ttl
echo '<?xml version="1.0" encoding="UTF-8"?> <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer="public"> <uri name="https://w3id.org/lehrplan/" uri="merged-lp.ttl" /> </catalog>' > tmp/catalog-v001.xml
echo "merging lp ontology into data"
$ROBOT --catalog tmp/catalog-v001.xml merge --input tmp/merged-lp.ttl --input "$1/shape-data.ttl" remove --select imports --output tmp/merged2.ttl 
echo "reasoning"
$ROBOT reason --input tmp/merged2.ttl --reasoner hermit --axiom-generators "SubClass SubDataProperty ClassAssertion PropertyAssertion InverseObjectProperties SubObjectProperty ObjectPropertyRange ObjectPropertyDomain" remove --term owl:topObjectProperty --output tmp/shape-data-reasoned.ttl 

echo "testing shacl shapes"
# uncomment if you want to test the provided shapes
python3 -m pyshacl  -s "$1/shape.ttl" tmp/shape-data-reasoned.ttl

echo "testing shacl shapes autoshapes"
# uncomment if you want to test autoshapes
# python3 -m pyshacl  -s autoshape/auto-shapes-open.ttl tmp/shape-data-reasoned.ttl


# if inconsistent use the following cmd for explanation
#  robot explain --mode inconsistency --input tmp/merged2.ttl --explanation errors.md