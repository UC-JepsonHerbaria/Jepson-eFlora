open(IN,"eflora_treatments.txt") || die;
#undef($/);
$/="";
while(<IN>){
next if m/^Admin/i;
#next if m/^UNABR/i;
s/PROOF:.*\n//;
$nativity="";
#$family=$ARGV;
	#`($all_lines=$_)=~s/ *\r\n/\n/g;
	#`@all_pars=split(/\n\n+/,$all_lines);
	#`foreach(@all_pars){
if(m/([A-Z]+ACEAE)/){
$family=$1;
#print "$family\n";
}
if(m/CAPTION: ([A-Z]+)/){
$caption=$1;
}

#next unless m/\bRARITY\b/;

#next if m/^UNABRIDGED/;
#next if m/^WAIF/;


    if(m/([A-Z-]+ .*)\nTAXON AUTHOR: (.*)/){
        #$name=&strip_name($1);
	print "\nclade: $caption\n$family $1 $2\n";
    if(m/^((SPONTANEOUS HYBRID|EXTIRP|CULTIV|JFP|AGRIC|HISTOR|GARDEN|WAIF|URBAN|NATIVE|NATURALIZED).*)\n([A-Z-]+ .*)/||
    m/\n((SPONTANEOUS HYBRID|EXTIRP|CULTIV|JFP|AGRIC|HISTOR|GARDEN|WAIF|URBAN|NATIVE|NATURALIZED).*)\n([A-Z-]+ .*)/){
$nativity=$1;
$nativity=~s/ *$//;
}
	if(s/.*NOTE.*xpanded author citation: (.*)\n//){
		print "$1\n";
	}
        #$TJM2{$name}=$family;
if(m/COMMON NAME: (.*)/){
print "Common: $1\n";
}
if(m/TIME: (.*)/){
#print "Flowering time: $1\n";
}
        while(s/SYNONYMS: +(.*)//){
            @syns=split(/; +/,$1);
            foreach(@syns){
                s/_//g;
		print "syn: $_\n" unless $seen{$_}++;
                #$TJM2{&strip_name($_)}=$family;
            }
        }
print "nativity: $nativity\n";

#NEED TO FIX THIS ERROR.  
#Non-terminal taxon names, like Prunella vulgaris are getting labeled as "endemic" because they dont have this line
#Prunella vulgaris is not native, therefore cannot be endemic
#it also has two subtaxa that are non-native and not endemic, therefore the species entry cannot be endemic
#Salvia dorrii is a native and the species is getting labeled as endemic.
#it has three subtaxa, all of which are not endemic, therefore the species cannot be endemic.
#species that have two or more subtaxa where one subtaxon is endemic and others are not, are getting labeled as endemic
#even species where one one subtaxon is in California and it is endemic, the species entry, if present, should not be labeled as endemic since there should be subtaxa outside of CA
#this oversight is pervasive and has been happening for some time.  multiple places in this code and most other eflora scripts need to be altered, essentially wherever endemic is calculated based on
#presence of these text lines
if(m/DISTRIBUTION OUTSIDE CALIFORNIA: ../){
$endem=0;
print  "endemicity: $endem\n";
}
else{
$endem=1;
print  "endemicity: $endem\n";
}
    }
    elsif(m/^((SPONTANEOUS HYBRID|EXTIRP|CULTIV|JFP|AGRIC|HISTOR|GARDEN|WAIF|URBAN|NATIVE|NATURALIZED).*)\n([A-Z-]+ .*)/||
     m/\n((SPONTANEOUS HYBRID|EXTIRP|CULTIV|JFP|AGRIC|HISTOR|GARDEN|WAIF|URBAN|NATIVE|NATURALIZED).*)\n([A-Z-]+ .*)/){
	print "\nclade: $caption\n$family $3\n";
        $name=&strip_name($3);
$nativity=$2;
$nativity=~s/ *$//;
#print "$name\n";
        #$TJM2{$name}=$family;
	if(s/.*NOTE.*xpanded author citation: (.*)//){
		print "$1\n";
	}
if(m/COMMON NAME: (.*)/){
print "Common: $1\n";
}
if(m/TIME: (.*)/){
#print "Flowering time: $1\n";
}
        while(s/SYNONYMS: +(.*)//){
            @syns=split(/; +/,$1);
            foreach(@syns){
                s/_//g;
print "syn: $_\n" unless $seen{$_}++;
                #$TJM2{&strip_name($_)}=$family;
            }
        }
print "nativity: $nativity\n";
if(m/DISTRIBUTION OUTSIDE CALIFORNIA: ../){
$endem=0;
print  "endemicity: $endem\n";
}
else{
$endem=1;
print  "endemicity: $endem\n";
}
    }
}
#}
#foreach(sort(keys(%TJM2))){
#print "$_\t$TJM2{$_}\n";
#}
sub strip_name{
local($_) = @_;

#add additional 'filial' authorities at this point so they parse correctly, JAA
s/Ait\. f\./Ait. filius/g;
s/Backh\. f\./Backh. filius/g;
s/Baker f\./Baker filius/g;
s/Bakh\. f\./Bakh. filius/g;
s/Balf\. f\./Balf. filius/g;
s/Burm\. f\./Burm. filius/g;
s/Brunner,? f\./Brunner filius/g;
s/Celakovsky f\./L.F. Celak./g;
s/Delar\. f\./Delar. filius/g;
s/Forst\. f\./Forst. filius/g;
s/Gaertn\. f\./Gaertn. filius/g;
s/Gagnaire f\./Gagnaire filius/g;
s/Haage f\./Haage filius/g;
s/Haller f\./Haller filius/g;
s/Hallier f\./Hallier filius/g;
s/Harr\. f\./Harr. filius/g;
s/Hedw\. f\./Hedw. filius/g;
s/Hirats\. f\./Hirats. filius/g;
s/Hook\. f\./Hook. filius/g;
s/Hook\. f\. ex/Hook. filius/g;
s/Jacq\. f\./Jacq. filius/g;
s/Kickx f\./Kickx filius/g;
s/Kampm\. f\./Kampm. filius/g;
s/Keng f\./Keng filius/g;
s/Klokov f\./Klokov filius/g;
#s/L\. f\. sulcat/f. sulcat/g;

s/L\. f\. var./L. filius var./g;
s/L\. f\. subsp./L. filius subsp./g;
s/L\. f\./L. filius/g;
s/L\. *filius azure/L. f. azure/g; #fix special cases where L. f. is a forma name not filius, Anagallis arvensis L. f. azurea Hyl.
s/L\. *filius vine/L. f. vine/g; #fix special cases where L. f. is a forma name not filius, Allium vineale L. f. vineale
s/L\. *filius comp/L. f. comp/g; #fix special cases where L. f. is a forma name not filius, Allium vineale L. f. compactum L.
s/L\. *filius tome/L. f. tome/g; #fix special cases where L. f. is a forma name not filius, Acer rubrum L. f. tomemtosum L. 
s/L\. *filius sang/L. f. sang/g; #fix special cases where L. f. is a forma name not filius, Acer negundo L. f. sanguineum L. Martin
s/L\. *filius masc/L. f. masc/g; #fix special cases where L. f. is a forma name not filius, Orchis morio L. f. mascula L.
s/L\. *filius lute/L. f. lute/g; #fix special cases where L. f. is a forma name not filius, Ophrys insectifera L. f. luteomarginata L. Lewis
s/L\. *filius micr/L. f. micr/g; #fix special cases where L. f. is a forma name not filius, Jasminum humile L. f. microphyllum L.C. Chia
s/L\. *filius sask/L. f. sask/g; #fix special cases where L. f. is a forma name not filius, Carex capillaris L. f. saskatschewana (Boeckeler) L.H. Bailey
s/L\. *filius negl/L. f. negl/g; #fix special cases where L. f. is a forma name not filius, Celtis occidentalis L. f. neglecta L.
s/L\. *filius duri/L. f. duri/g; #fix special cases where L. f. is a forma name not filius, Eryngium campestre L. f. duriberum L.
s/L\. *filius glab/L. f. glab/g; #fix special cases where L. f. is a forma name not filius, Dioscorea villosa L. f. glabrata L.
s/L\. *filius prae/L. f. prae/g; #fix special cases where L. f. is a forma name not filius, Silphium trifoliatum L. f. praecisum L.M. Perry
s/L\. *filius pinn/L. f. pinn/g; #fix special cases where L. f. is a forma name not filius, Quercus alba L. f. pinntifida L.
s/L\. *filius pinn/L. f. vill/g; #fix special cases where L. f. is a forma name not filius, Cardiospermum corindum L. f. villosum (Mill.) Radlk
s/Lestib\. f\./Lestib. filius/g;
s/Lindb\. f\./Lindb. filius/g;
s/Lindm\. f\./Lindm. filius/g;
s/Luer f\./Luer filius/g;
s/Michx\. f\./F. Michx./g;
s/Michaux f\./F. Michx./g;
s/Occhioni f\./Occhioni filius/g;
s/Pearsall f\./Pearsall filius/g;
s/Phil\. f\./Phil. filius/g;
s/Rchb\. f\./Rchb. filius/g;
s/Rech\. f\./Rech. filius/g;
s/Rehb\. f\./Rehb. filius/g;
s/Reichenb\. f\./Reichenb. filius/g;
s/Reichenbach f\./Reichenbach filius/g;
s/Scheuchzer f\./Scheuchzer filius/g;
s/Schultes f\./Schultes filius/g;
s/Schult\. f\./Schult. filius/g;
s/Wallr\. f\./Wallr. filius/g;
s/Wendl\. f\./Wendl. filius/g;



       s/^([A-Z][-A-Za-z]+) (X? ?[-a-z]+) ?.* ?(subvar\.|subsp\.|ssp\.|var\.|f\.|nothosubsp\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z]+) ([x ]*[-a-z]+).*/$1 $2/;
s/ssp\./subsp./;
return (ucfirst(lc($_)));
}
