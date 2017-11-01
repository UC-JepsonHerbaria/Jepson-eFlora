#!/usr/bin/perl

use DBI;
use strict;

my $driver   = "SQLite"; 
my $database = "eflora.db";
my $dsn = "DBI:$driver:dbname=$database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) 
                      or die $DBI::errstr;

print "Opened database successfully\n";


#query out all relevant fields and assign them to variables
my $stmt = qq(SELECT ta.TaxonID AS taxonID, ta.ScientificName AS scientificName, ta.TaxonAuthor AS scientificNameAuthorship, ta.CommonName AS vernacularName, 
			'en' AS language, 'Plantae' as kingdom 
			FROM eflora_taxa ta
			WHERE NativeStatus="NATIVE";);
my $sth = $dbh->prepare( $stmt );
my $rv = $sth->execute() or die $DBI::errstr;
if($rv < 0){
	print $DBI::errstr;
}
while(my @row = $sth->fetchrow_array()) {
#assign fields to variables
	my $taxonID = $row[0];
	my $scientificName = $row[1];
	my $scientificNameAuthorship = $row[2];
	my $vernacularName = $row[3];
#      print "taxonID = ". $row[0] . "\n";
 #     print "scientificName = ". $row[1] ."\n";
  #    print "scientificNameAuthorship = ". $row[2] ."\n";
   #   print "vernacularName =  ". $row[3] ."\n\n";
      print "taxonID = ". $taxonID . "\n";
      print "scientificName = ". $scientificName ."\n";
      print "scientificNameAuthorship = ". $scientificNameAuthorship ."\n";
      print "vernacularName =  ". $vernacularName ."\n\n";
}
print "Operation done successfully\n";
$dbh->disconnect();

#SELECT ta.TaxonID AS taxonID, ta.ScientificName AS scientificName, ta.TaxonAuthor, ta.CommonName AS vernacularName, 'en' AS language, 'Plantae' as kingdom,
#FROM eflora_taxa ta;