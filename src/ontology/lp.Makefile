## Customize Makefile settings for lp
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

.PRECIOUS: $(IMPORTDIR)/%_import.owl


$(IMPORTDIR)/iao_import.owl: $(MIRRORDIR)/iao.owl $(IMPORTDIR)/iao_terms.txt
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/iao_terms.txt --force true --copy-ontology-annotations true --individuals exclude --method BOT \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
 		remove --term http://www.w3.org/2002/07/owl#Nothing  --term http://purl.obolibrary.org/obo/PATO_0000001\
 		remove --select "RO:*"  \
		$(ANNOTATE_CONVERT_FILE); fi


CITATION="'Lehrplan Ontology. Version $(VERSION), https://w3id.org/lehrplan/ontology'"

ALL_ANNOTATIONS=--annotate-defined-by false \
	--ontology-iri https://w3id.org/lehrplan/ontology/ -V https://w3id.org/lehrplan/ontology/$(VERSION) \
	--annotation http://purl.org/dc/terms/created "$(TODAY)" \
	--annotation http://purl.org/dc/terms/bibliographicCitation "$(CITATION)"  \
#	--link-annotation owl:priorVersion https://w3id.org/lehrplan/ontology/$(PRIOR_VERSION) \

lp-land-%-full.owl: $(EDIT_PREPROCESSED)
	$(ROBOT) remove --input $< --select imports --trim false \
	merge --input components/bfo-edit.owl --input components/lehrplan-$*.owl --input imports/schulart-$*_import.owl --input imports/schulfach-$*_import.owl  \
	reason --reasoner ELK --equivalent-classes-allowed asserted-only --exclude-tautologies structural \
		relax \
		reduce -r ELK \
		$(SHARED_ROBOT_COMMANDS) annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@ ; \

release-land-%: lp-land-%-full.owl
		cp lp-land-$*-full.owl $(RELEASEDIR)

lp-ohne-land.owl: $(EDIT_PREPROCESSED)
	$(ROBOT) remove --input $< --select imports --trim false \
	merge --input components/bfo-edit.owl \
	reason --reasoner ELK --equivalent-classes-allowed asserted-only --exclude-tautologies structural \
		relax \
		reduce -r ELK \
		$(SHARED_ROBOT_COMMANDS) annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@ ; \



###### TEMPLATE for SUBJECTS
$(COMPONENTSDIR)/lehrplan-subjects.owl: $(TEMPLATEDIR)/lehrplan-subjects.tsv $(TMPDIR)/stamp-component-lehrplan-subjects.owl
	$(ROBOT) merge --input lp-edit.owl --input components/states.owl \
		 template --template $(TEMPLATEDIR)/lehrplan-subjects.tsv \
		 $(ANNOTATE_CONVERT_FILE)
.PRECIOUS: $(COMPONENTSDIR)/lehrplan-subjects.owl

$(TEMPLATEDIR)/lehrplan-subjects.tsv:
	curl -L 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSzRNSKTRnjC2E2XnYSXuX17RtIoQ3ZW2qvZnRQjREtZdtkXdcrPtXXeb5m8MXIzz_uImm-2oS2m7Dj/pub?output=tsv' -o $(TEMPLATEDIR)/lehrplan-subjects.tsv



update-ontology-annotations: 
	$(ROBOT) annotate --input ../../lp.owl $(ALL_ANNOTATIONS) --output ../../lp.owl && \
	$(ROBOT) annotate --input ../../lp.ttl $(ALL_ANNOTATIONS) --output ../../lp.ttl && \
	$(ROBOT) annotate --input ../../lp-simple.owl $(ALL_ANNOTATIONS) --output ../../lp-simple.owl && \
	$(ROBOT) annotate --input ../../lp-simple.ttl $(ALL_ANNOTATIONS) --output ../../lp-simple.ttl && \
	$(ROBOT) annotate --input ../../lp-full.owl $(ALL_ANNOTATIONS) --output ../../lp-full.owl && \
	$(ROBOT) annotate --input ../../lp-full.ttl $(ALL_ANNOTATIONS) --output ../../lp-full.ttl && \
	$(ROBOT) annotate --input ../../lp-base.owl $(ALL_ANNOTATIONS) --output ../../lp-base.owl && \
	$(ROBOT) annotate --input ../../lp-base.ttl $(ALL_ANNOTATIONS) --output ../../lp-base.ttl && \
	$(ROBOT) annotate --input ../../lp-land-BB-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Brandenburg" convert --format ofn --output ../../lp-land-BB-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-BE-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Berlin" convert --format ofn --output ../../lp-land-BE-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-BW-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Baden-Württemberg" convert --format ofn --output ../../lp-land-BW-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-BY-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Bayern" convert --format ofn --output ../../lp-land-BY-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-HB-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Bremen" convert --format ofn --output ../../lp-land-HB-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-HE-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Hessen" convert --format ofn --output ../../lp-land-HE-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-HH-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Hamburg" convert --format ofn --output ../../lp-land-HH-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-MV-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Mecklenburg-Vorpommern" convert --format ofn --output ../../lp-land-MV-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-NI-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Niedersachsen" convert --format ofn --output ../../lp-land-NI-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-NW-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Nordrhein-Westfalen" convert --format ofn --output ../../lp-land-NW-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-RP-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Rheinland-Pfalz" convert --format ofn --output ../../lp-land-RP-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-SH-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Schleswig-Holstein" convert --format ofn --output ../../lp-land-SH-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-SL-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Saarland" convert --format ofn --output ../../lp-land-SL-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-SN-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Sachsen" convert --format ofn --output ../../lp-land-SN-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-ST-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Sachsen Anhalt" convert --format ofn --output ../../lp-land-ST-full.owl && \
	$(ROBOT) annotate --input ../../lp-land-TH-full.owl $(ALL_ANNOTATIONS) --annotation http://purl.org/dc/terms/subject "Lehrplan Thüringen" convert --format ofn --output ../../lp-land-TH-full.owl 
	





