
# create the reasoned version of the edit ontology
sh run.sh robot reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion InverseObjectProperties PropertyAssertion" --input ../../lp.owl query --update utils/remove-isabout.sparql --output ./tmp/tmp-reasoned.ttl

# generate the shacle shapes from the 
docker run --rm -v ./:/data ghcr.io/ashleycaselli/shacl:latest infer -datafile /data/tmp/tmp-reasoned.ttl -shapesfile /data/utils/owl2shacl/owl2sh-open.ttl > ../../shapes/auto-shapes/auto-shapes-open.ttl


