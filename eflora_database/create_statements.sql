--Fields needed for new eFlora page design
DROP TABLE eflora_taxa;

CREATE TABLE eflora_taxa (
	ID INTEGER PRIMARY KEY,
	TaxonID INTEGER,
	ScientificName TEXT,
	TaxonAuthor TEXT,
	FormattedDisplayName TEXT,
	CommonName TEXT,
	KeyGroup TEXT,
	NativeStatus TEXT,
	TJM2Author TEXT,
	ScientificEditor TEXT,
	Habit TEXT,
	PlantBody TEXT,
	Stem TEXT,
	SterileStem TEXT,
	FertileStem TEXT,
	Leaf TEXT,
	Spines TEXT,
	Inflorescence TEXT,
	StaminateHead TEXT,
	RayOrPistillateFlower TEXT,
	PistillateHead TEXT,
	StaminateInflorescence TEXT,
	PistillateOrBisexualInflorescence TEXT,
	PistillateInflorescence TEXT,
	Spikelet TEXT,
	FertileSpikelet TEXT,
	SterileSpikelet TEXT,
	DistalSpikelet TEXT,
	CentralSpikelet TEXT,
	LateralSpikelet TEXT,
	StaminateSpikelet TEXT,
	PistillateSpikelet TEXT,
	Flower TEXT,
	StaminateFlower TEXT,
	PistillateFlower TEXT,
	RayFlower TEXT,
	DiskFlower TEXT,
	Cone TEXT,
	PollenCone TEXT,
	SeedCone TEXT,
	BisexualFlower TEXT,
	Fruit TEXT,
	Seed TEXT,
	Sporangia TEXT,
	SporangiumCase TEXT,
	MaleSporangiumCase TEXT,
	FemaleSporangiumCase TEXT,
	Spores TEXT,
	Chromosomes TEXT,
	Ecology TEXT,
	RarityStatus TEXT,
	Elevation TEXT,
	BioregionalDistribution TEXT,
	OutsideCA TEXT,
	SpeciesInGenus TEXT,
	GeneraInFamily TEXT,
	Etymology TEXT,
	Toxicity TEXT,
	Synonyms TEXT,
	UnabridgedSynonyms TEXT,
	Reference TEXT, 
	UnabridgedReference TEXT,
	Note TEXT,
	UnabridgedNote TEXT,
	FloweringTime TEXT,
	FloweringTimeCode TEXT,
	FruitingTime TEXT,
	ConingTime TEXT,
	Weediness TEXT,
	IsTerminalTaxon INTEGER,
	HasKey INTEGER,
	RevisionNumber TEXT,
	RevisionDate TEXT,
	DistCode TEXT,
	DistArray TEXT,
	AcceptedNameTID INTEGER
	);

DROP TABLE eflora_illustrations;

CREATE TABLE eflora_illustrations (
	ID INTEGER PRIMARY KEY,
	TaxonID INTEGER,
	FileName TEXT
);

DROP TABLE eflora_taxonomy;

CREATE TABLE eflora_taxonomy (
	ID INTEGER PRIMARY KEY,
	TaxonID INTEGER,
	FamilyID INTEGER,
	GenusID INTEGER,
	SpeciesID INTEGER
);

DROP TABLE eflora_distributions;

CREATE TABLE eflora_distributions (
	ID INTEGER PRIMARY KEY,
	TaxonID INTEGER,
	CCo INTEGER,
	CaRF INTEGER,
	CaRH INTEGER,
	nChI INTEGER,
	sChI INTEGER,
	DMojexcDMtns INTEGER,
	DMtns INTEGER,
	DSon INTEGER,
	KR INTEGER,
	MPexcWrn INTEGER,
	NCo INTEGER,
	NCoRH INTEGER,
	NCoRI INTEGER,
	NCoRO INTEGER,
	PRexcSnJt INTEGER,
	SCo INTEGER,
	SCoRI INTEGER,
	SCoRO INTEGER,
	SNEexcWaI INTEGER,
	nSNF INTEGER,
	cSNF INTEGER,
	sSNF INTEGER,
	nSNH INTEGER,
	cSNH INTEGER,
	sSNH INTEGER,
	ScV INTEGER,
	SnBr INTEGER,
	SnFrB INTEGER,
	SnGb INTEGER,
	SnJV INTEGER,
	SnJt INTEGER,
	Teh INTEGER,
	WTR INTEGER,
	WaI INTEGER,
	Wrn INTEGER
);

DROP TABLE eflora_synonymy;

CREATE TABLE eflora_synonymy (
	ID INTEGER PRIMARY KEY,
	NativeStatus TEXT,
	ScientificName TEXT,
	AcceptedNameTID INTEGER
);
--these tables are CREATED in eflora.db