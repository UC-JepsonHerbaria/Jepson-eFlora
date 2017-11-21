#undef($/);
$/="";
while(<>){
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
        #$name=&strip_name($3);
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
foreach(sort(keys(%TJM2))){
#print "$_\t$TJM2{$_}\n";
}
sub strip_name{
local($_) = @_;
       s/^([A-Z][-A-Za-z]+) (X?[-a-z]+).*(subsp\.|ssp\.|var\.|f\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z]+) ([x ]*[-a-z]+).*/$1 $2/;
s/ssp\./subsp./;
return (ucfirst(lc($_)));
}
