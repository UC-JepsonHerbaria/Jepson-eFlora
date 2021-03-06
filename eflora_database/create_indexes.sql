CREATE INDEX TaxonID ON eflora_taxa (TaxonID ASC);
CREATE INDEX GenusID ON eflora_taxonomy (GenusID ASC);
CREATE INDEX FamilyID ON eflora_taxonomy (FamilyID ASC);
CREATE INDEX SpeciesID ON eflora_taxonomy (SpeciesID ASC);
CREATE INDEX taxonomy_TID ON eflora_taxonomy (TaxonID ASC);
CREATE INDEX ScientificName ON eflora_taxa (ScientificName ASC);
CREATE INDEX AcceptedNameTID ON eflora_taxa (AcceptedNameTID ASC);
CREATE INDEX dist_TID ON eflora_distributions (TaxonID ASC);
