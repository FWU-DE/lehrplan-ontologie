

VERSION=1.0.0rc3
PRIOR_VERSION=1.0.0rc2
ONTBASE=https://w3id.org/lehrplan/ontology/
ANNOTATE_ONTOLOGY_VERSION="annotate -V $ONTBASE$VERSION --annotation owl:versionInfo $VERSION"

sh run.sh make clean

sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE ANNOTATE_ONTOLOGY_VERSION="$ANNOTATE_ONTOLOGY_VERSION" prepare_release

sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-BB
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-BE
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-BW
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-BY
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-HB
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-HE
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-HH
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-MV
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-NI
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-NW
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-RP
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-SH
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-SL
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-SN
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-ST
sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE release-land-TH
#sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE lp-ohne-land.owl

#sh run.sh make VERSION=$VERSION PRIOR_VERSION=$PRIOR_VERSION update-ontology-annotations
sh run.sh make VERSION=$VERSION  update-ontology-annotations

#sh run.sh make clean
# finally refresh imports again, so that version IRIs are updated back to "normal". 
sh run.sh make refresh-imports

## generate the shacl shapes from the ontology
sh utils/generate-auto-shapes.sh
