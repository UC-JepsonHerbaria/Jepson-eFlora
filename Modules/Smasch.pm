package Smasch;
#mod Feb 11, 2004
use Exporter;
@ISA = ('Exporter');
#@EXPORT = qw(&strip_name @S_accession %S_accession_length %S_accession @S_folder %S_folder_length %S_folder %vouchers %magic_no @month &process_name &verify_bioname &get_TRS &get_elev &parse_lat &parse_long &load_data &load_cal &load_noauth_name %seen %datafile %coll_comm &load_collectors %PARENT &verify_cal_long &verify_cal_lat);
@EXPORT = qw(@S_accession %S_accession_length %S_accession @S_folder %S_folder_length %S_folder %magic_no &process_name &verify_bioname %seen %datafile %coll_comm);
####patterns######
our $genus = '[A-Z][a-z-]+';
our $species = '[a-z-]+';
our $rank = 'var\.?|ssp\.?|subsp\.?|f\.|forma|nothosubsp\.|subvar\.';
our $infra = '[a-z-]+';
our $author = '.*';
########
our $smasch_file="/Users/davidbaxter/DATA/smasch_taxon_ids.txt";





sub process_name{
        local($_)=@_;
s/ +$//;
       s/ ssp\./ subsp\. /;
        @name_fields= ();
#Planta alba Linnaeus var. nigra Gmelin
        if(@name_fields= m/^((($genus +$species) .* +($rank) +($infra)) +($author))/o){
                &verify_bioname($name_fields[2]);# check to see that bioname is valid;
                &verify_bioname($name_fields[4]);
                &verify_bioname("$name_fields[2] $name_fields[3] $name_fields[4]");
}
#Planta alba Linnaeus var. alba
        if(@name_fields= m/^((($genus +$species).* +($rank) +($infra)))/o){
               &verify_bioname($name_fields[2]);
                &verify_bioname($name_fields[4]);
                &verify_bioname("$name_fields[2] $name_fields[3] $name_fields[4]");
}
#Planta alba Linnaeus
        elsif( (@name_fields= m/^((($genus)() +($species)) +($author))/o)){
                &verify_bioname($name_fields[2]);
                &verify_bioname($name_fields[4]);
                &verify_bioname("$name_fields[2] $name_fields[4]");
}

        elsif( (@name_fields= m/^((($genus)() +? *($species)) +($author))/o)){
                &verify_bioname($name_fields[2]);
                &verify_bioname($name_fields[4]);
               &verify_bioname("$name_fields[2] $name_fields[4]");
}
#Planta sp\.
        elsif( (@name_fields= m/^($genus) sp\./o)){
                &verify_bioname($name_fields[0]);# check to see that bioname is valid;
}
#Planta alba
        elsif( (@name_fields= m/^((($genus)() +($species)))/o)){
                &verify_bioname($name_fields[2]);
                &verify_bioname($name_fields[4]);
                &verify_bioname("$name_fields[2] $name_fields[4]");
}
#Planta
       elsif( (@name_fields= m/^($genus)$/o)){
                &verify_bioname($name_fields[0]);# check to see that bioname is valid;
}
        elsif( (@name_fields= m/^((($genus)() +? *($species)))/o)){
                &verify_bioname($name_fields[2]);
                &verify_bioname($name_fields[4]);
                &verify_bioname("$name_fields[2] \327 $name_fields[4]");
		}
		else{
		unless (m/UNDETERMINED/){
		warn $_, "\t--\t $name_fields[0]", " is a not a verifiable name by 'sub process_name' in SMASCH.pm\n";
		}
}





while(<DATA>){
chomp;
($name,$length)=split(/\t/);
if($name=~s/accession:://){
push(@S_accession,$name);
$S_accession_length{$name}=$length;
$S_accession{$name}="";
}
elsif( $name=~s/folder:://){
push(@S_folder,$name);
$S_folder_length{$name}=$length;
$S_folder{$name}="";
}
}
#set defaults
@S_folder{$S_folder[6], $S_folder[7], $S_folder[9], $S_folder[11]} = ("0") x 4;

sub verify_bioname{
my($tnum)=$main::tnum;
open(OUT,">bulkload.err") || die "couldn't open the error file\n";
        $old_outfile = select(OUT);
        local($_)=@_;
#print "$_\n";
        if(m/ /){
                unless ($PARENT{$_}){
                        $NO_PARENT{$_}++;
                        print "(1) not found in name list\t--\t$tnum: >$_<\n";
                        warn "(1) not found in name list\t--\t$tnum: >$_<\n";
#foreach(keys(%PARENT)){
#warn "$_\n" if m/^[A-Z]/;
#}
                }
                else{
                #print "found >$_<\n";
                }
                foreach(split(/ /)){
                        next if m/(f\.|subsp\.|var\.)/;
                        print "(2) unrecognized Bioname element\t--\t$tnum: >$_<\n" unless $BE{$_};
                        warn "(2) unrecognized Bioname element\t--\t$tnum: >$_<\n" unless $BE{$_};
                        $NO_BE{$_}++ unless $BE{$_};
                }
        }
        elsif(m/^[A-Z]/){
                unless ($PARENT{$_}){
                        $NO_PARENT{$_}++;
                        print "(3) not found in name list\t--\t$tnum: >$_<\n";
                        warn "(3) not found in name list\t--\t$tnum: >$_<\n";
                }
                else{
                        #print "found >$_<\n";
                }
                $NO_BE{$_}++ unless $BE{$_};
                print "(4) unrecognized Bioname element\t--\t$tnum: >$_<\n" unless $BE{$_};
                warn "(4) unrecognized Bioname element\t--\t$tnum: >$_<\n" unless $BE{$_};
        }
select($old_outfile);
}
#

sub get_authors{
        local($_)=@_;
        s/ in .*//;
        $expair = "(.*) ex (.*)";
        $basionym_ascribed_a= $basio_pub_a= $ascribed_a= $pub_a="unknown";
        if(m/$expair/o){
                if(($basionym_ascribed_a, $basio_pub_a, $ascribed_a, $pub_a) = m/\($expair\) +$expair/o){
                        return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
                }
                elsif(($basio_pub_a, $ascribed_a, $pub_a) = m/\([^)]+\) +$expair/o){
                        return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
                }
                elsif(($basionym_ascribed_a, $basio_pub_a, $pub_a) = m/\($expair\) +(.*)/o){
                        return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
                }
                elsif(($ascribed_a, $pub_a) = m/$expair/o){
                        return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
                }
                else{
                        warn "strange ex $_\n";
                        return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
                }
        }
        else{
                if(($basio_pub_a, $pub_a) = m/\(([^)]+)\) +(.*)/o){
                        return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
                }
                elsif(($pub_a) = m/(.*)/o){
                        return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
                }
                else{
                        return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
                        warn "This is impossible: $_\n";
                }
        }
}
sub verify_author{
##%committee contains valid author strings
        local($_)=@_;
        $all_auts=$_;
        @authors=();
        push(@authors,$_);
        if(s/,? & (.*)//){
                $NO_COMM{$all_auts}++ unless $committee{$_};
                push(@authors,$1);
                foreach(split(/, +/,$_)){
                        push(@authors,$_);
                }
        }
        foreach (@authors){
                s/ in .*//;
                $NO_COMM{$_}++ unless $committee{$_};
        }
        @authors;
}


#sub get_TRS{
#T/R/Section: 3S 30E 24 SE/4
#local($_)=@_;
#my($coords)="";
#my($coord_notes)="";
#                                if(m/T(\d+[NSEW]) +R(\d+[NSEW])/){
 #                                       $coords= $1 . $2;
  #                                      if(m/R\d+[NSEW] (.*[Ss]ect[.ion]+ (\d+))/){
   #                                             if($coords){$coords .= $2;}else{$coords=$2;}
    #                                            if($coord_notes){
     #                                                   $coord_notes .= "<coords cont.: $1>; ";
      #                                          }
       #                                         else{$coord_notes = "<coords cont.: $1>; ";}
        #                                }
         #                               elsif(m/R\d+[NSEW] S(\d+)$/){
          #                                      if($coords){$coords .= $1;}else{$coords=$1;}
#                                        }
 #                                       elsif(m/R\d+[NSEW] S(\d+)(.*)/){
  #                                              if($coords){$coords .= $1;}else{$coords=$1;}
   #                                             if($coord_notes){
    #                                                    $coord_notes .= "<coords cont.: $2>; ";
     #                                           }
      #                                          else{$coord_notes = "<coords cont.: $2>; ";}
       #                                 }
        #                        }
         #                       elsif(m/^(\d+[NS]) *(\d+[EW]) *(\d+)$/){
#
 #                                       $coords = $1 . $2 .$3;
  #                              }
   #                             elsif(m/^(\d+[NS]) *(\d+[EW]) *(\d+) (.*)$/){
    #                                    $coords = $1 . $2 .$3;
     #                                                   $coord_notes .= "<coords cont.: $4>; ";
      #                          }
       #                         elsif(m/T(\d+[NSEW]), R(\d+[NSEW])/){
#
 #                                       $coords = $1 . $2;
  #                                      if(m/R\d+[NSEW],? (.*[Ss]ect[.ion]+ (\d+))/){
   #                                             if($coords){$coords .= $2;}else{$coords=$2;}
    #                                            if($coord_notes){
     #                                                   $coord_notes.= "<coords cont.: $1>; ";
      #                                          }
       #                                         else{
        #                                                $coord_notes= "<coords cont.: $1>; ";
         #                                       }
          #                              }
           #                     }
            #                    elsif(m/^([NSEW]+1\/4)/){
#                                        $coords= "";
 #                                       if($coord_notes){
  #                                              $coord_notes.= "<coords cont.: $1>; ";
   #                                     }
    #                                    else{
     #                                           $coord_notes= "<coords cont.: $1>; ";
      #                                  }
       #                         }
        #                        else{
#if(m/(...+)/){
#                                        $coords= "";
 #                                       if($coord_notes){
  #                                              $coord_notes .= "<coords cont.: $1>; ";
   #                                     }
    #                                    else{
     #                                           $coord_notes = "<coords cont.: $1>; ";
      #                                  }
#}
#                                }
#$coords=~s/^(\d+)([NWSE])(\d+)([NWSE])$/0$1${2}0$3$4/;
#$coords=~s/^(\d+)([NWSE])(\d+)([NWSE])(\d+)$/0$1${2}0${3}${4}0$5/;
#$coords=~s/0(\d\d)/$1/g;
#                        return($coords, $coord_notes);
#}


#sub parse_lat {
#local($decimal)="";
#local($degree)="";
#local($_)=shift;
#if(m/^0$/){
#return ("","");
#}
#if(m/^[0-9-][0-9]+[.0-9]*$/){
#return($_,"");
#}
#$ls=$_;
#if(s/^(\d+)[^0-9]+ (\d+)[^0-9]+ /$1 $2 /){
#warn "Starting lat: $ls :  $_\n";
#}
#                                        s/ca\. //;
 #                                       s/;$//;
  #                                      $old=$_;
#s/NN/N/;
#s/WW/W/;
#s/ (\d) *([NS])/ 0$1$2/;
#s/0(\d\d)/$1/g;
#s/ 60 *([NS])/ 59.5$1/;
#s/ (\d\.\d+) *([NS])/ 0$1$2/;
#if(m/\d+ (\d) \d+/){
#s/(\d+) (\d) (\d+)/$1 0$2 $3/;
#}
#if(m/^(\d\d?) *([NS])$/){
#$decimal=$1; $degree="$1$2";
#return($decimal, $degree);
#}
#elsif(m/^(\d\d?) +([0-5]\d?) *([NS])$/){
#$degree="$1 $2$3";
#$decimal=&convert_to_decimal($degree);
#return($decimal, $degree);
#}
#elsif(m/^(\d\d?) +([0-5]\d?) ([0-5]\d?) *([NS])$/){
#$degree="$1 $2 $3$4";
#$decimal=&convert_to_decimal($degree);
#return($decimal, $degree);
#}
#elsif(m/^(\d\d+) +([0-5]\d?) ([0-5]\d?)(\.\d+) *([NS])$/){
#$degree="$1 $2 $3$4$5";
#$decimal=&convert_to_decimal($degree);
#$ch=1/3600 * $4;
#$decimal=$decimal + $ch;
#return($decimal, $degree);
#}
#elsif(m/^(\d\d?) ([0-5]\d?)(\.\d+) *([NS])$/){
#$second= int(60 * $3);
#$degree="$1 $2 ${second}$4";
#$decimal=&convert_to_decimal($degree);
#return($decimal, $degree);
#}
#else{
#warn "Unanticipated latitude nulled: $_\n";
#return ("","");
#}
#                                s!\.(\d+)['m]!"m" . int($1/100 * 60) ."s"!e;
#Latitude: 37 45.79N
#
#                                s!^(\d+) (\d+)(\.\d+) *([NS])$!$1 ." $2 " . int($3 * 60) . $4!e;
#                                #warn "$old : $_\n" unless $old eq $_;
#                                if(m/\d\.\d/){
#                                        s/ *([NS])//;
#                                        $decimal=$_;
#                                }
#                                else{
#                                        s/ ?([dms'"]) */ /g;
#                                        s/ +/ /g;
#                                        s/(.*) *S/-$1/;
#                                        s/(.*) +N/$1N/;
 #                                       $degree=$_;
#                                }
#$degree=~s/ (\d)([EWNS])/ 0$1$2/g;
#$degree=~s/ (\d) (\d\d)([EWNS])/ 0$1$2$3/g;
#return($decimal, $degree);
#}

#sub convert_to_decimal{
#my $decimal="";
#local($_)=shift;
#warn "convert1: $_\n";
#        if(s/S$//){
#                $sign="-";
#        }
#        else{
#                $sign="";
#                s/N$//;
#        }
#if(m/^(\d+) (\d+) (\d+)/){
#$decimal=$1 + $2/60 + $3/3600;
##warn "convert1: $_ $decimal\n";
#}
#elsif(m/^(\d+) (\d+)/){
#$decimal=$1 + $2/60;
#warn "convert1: $_ $decimal\n";
#}
#return ("$sign$decimal");
                        }
#sub parse_long {
#local($decimal)="";
#local($degree)="";
#local($_)=shift;
#if(m/^0$/){
#return ("","");
#}
#if(m/^[0-9-][0-9]+[.0-9]*$/){
#return($_,"");
#}
#s/ to *$//;
#$ls=$_;
#if(s/^(\d+)[^0-9]+ (\d+)[^0-9]+ /$1 $2 /){
#warn "Starting long: $ls :  $_\n";
#}
#                                        s/ca\. //;
#                                        s/;$//;
#                                        $old=$_;
#s/ (\d) *([EW])/ 0$1$2/;
#s/ 60 *([EW])/ 59.5$1/;
#s/ (\d\.\d+) *([EW])/ 0$1$2/;
#if(m/\d+ (\d) \d+/){
#s/(\d+) (\d) (\d+)/$1 0$2 $3/;
#}
#s/0(\d\d)/$1/g;
#if(m/^([01]?\d\d?) *([EW])$/){
#$decimal=$1; $degree="$1$2";
#if($decimal > 180){
#$decimal=$degree="";
#warn "Unanticipated longitude nulled: $_\n";
#}
#$decimal="-$decimal";
#return($decimal, $degree);
#}
#elsif(m/^([01]?\d\d?) +([0-5]\d?) *([EW])$/){
#$degree="$1 $2$3";
#$decimal=&convert_to_decimal($degree);
#if($decimal > 180){
#$decimal=$degree="";
#warn "Unanticipated longitude nulled: $_\n";
#}
#$decimal="-$decimal";
#return($decimal, $degree);
#}
#elsif(m/^([01]?\d\d?) +([0-5]\d?) ([0-5]\d?) *([EW])$/){
#$degree="$1 $2 $3$4";
#$decimal=&convert_to_decimal($degree);
#print "converted: $decimal\n";
#if($decimal > 180){
#$decimal=$degree="";
#warn "Unanticipated longitude nulled: $_\n";
#}
#$decimal="-$decimal";
#return($decimal, $degree);
#}
#elsif(m/^([01]?\d\d?) +([0-5]\d?) ([0-5]\d?)(\.\d+) *([EW])$/){
#$degree="$1 $2 $3$4$5";
#$decimal=&convert_to_decimal($degree);
#$ch=1/3600 * $4;
#$decimal=$decimal + $ch;
#if($decimal > 180){
#$decimal=$degree="";
#warn "Unanticipated longitude nulled: $_\n";
#}
#$decimal="-$decimal";
#return($decimal, $degree);
#}
#elsif(m/^([01]?\d\d?) ([0-5]\d?)(\.\d+) *([EW])$/){
#$second= int(60 * $3);
#$degree="$1 $2 ${second}$4";
#$decimal=&convert_to_decimal($degree);
#if($decimal > 180){
#$decimal=$degree="";
#warn "Unanticipated longitude nulled: $_\n";
#}
#$decimal="-$decimal";
#return($decimal, $degree);
#}
#else{
#warn "Unanticipated longitude nulled: $_\n";
#return ("","");
#}
#s!\.(\d+)['m]!"m" . int($1/100 * 60) ."s"!e;
#s!^(\d+) (\d+)(\.\d+) *([EW])$!$1 ." $2 " . int($3 * 60) . $4!e;
#warn "$old : $_\n" unless $old eq $_;
#if(m/\d\.\d/){
#s/(.*) *W/-$1/;
#s/(.*) *E/$1/;
#$decimal=$_;
#warn "decimal: $decimal\n";
#}
#else{
#s/ ?([dms'"]) */ /g;
#s/ +/ /g;
#s/ *([EW])/$1/;
#$degree=$_;
#}
#$degree=~s/ (\d)([ EW])/ 0$1$2/g;
#return($decimal, $degree);
#}

1;
__DATA__
accession::accession_id 15
accession::specimen_id  0
accession::coll_committee_id    100
accession::coll_num_person_id   60
accession::objkind_id   20      Mounted on Paper Stored in a Box or Bag Preserved in Liquid Microscope Slide Preparation Photograph Illustration Photocopy
accession::inst_abbr    8
accession::coll_num_prefix      5
accession::coll_num_suffix      5
accession::coll_number  6
accession::loc_country  20
accession::loc_state    20
accession::loc_county   60
accession::loc_other    60
accession::loc_place    60
accession::loc_distance 160
accession::loc_elevation        30
accession::loc_coords   25
accession::loc_verbatim 255
accession::phenology    10
accession::notes        255
accession::loc_coords_trs       8
accession::loc_meridian 20
accession::loc_lat_deg  10
accession::loc_long_deg 11
accession::loc_lat_decimal      10
accession::loc_long_decimal     10
accession::coord_flag   8       None TRS Degrees Decimal TRS/Deg
accession::catalog_date 11
accession::catalog_by   30
accession::datestring   40
accession::early_jdate  7
accession::late_jdate   7
accession::bioregion    5
accession::mod_date     11
accession::mod_by       30
accession::datum        10
accession::lat_long_ref_source  20
accession::max_error_distance   10
accession::max_error_units      10
folder::accession_id    15
folder::folder_name_date        10
folder::taxon_id        160     full taxon name minus ex author
folder::taxon_modifier_id       45
folder::genus_id        35
folder::anno_note       255
folder::addl_taxon_id   160
folder::parent_name_id  160
folder::parent_name_modifier    10
folder::parent_seqno    1
folder::inhouse_notes   255
folder::collectionkind_id       1
folder::mod_date        11
folder::mod_by  30
folder::CA      30
