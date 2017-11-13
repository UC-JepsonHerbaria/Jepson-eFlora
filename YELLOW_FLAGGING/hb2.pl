#!/usr/bin/perl
				@bloom_density=("255,255,255", "248,236,224", "246,227,206", "245,208,169","247,190,129","250,172,88","254,154,46","255,128,0","223,116,1","180,95,4","97,57,8");
       use CGI;                             # load CGI routines
$query = new CGI;                        # create new CGI object
       #print $query->header;
if($query->param('name')){
	if($query->param('FT')){
		$ft=$query->param('FT');
		foreach $i (split(/,/,$ft)){
			$FT{$i}++;
		}
	}
use GD;

       print $query->header(-type=>'image/gif');

           # create a new image
           $im = new GD::Image(400,25);

           # allocate some colors
           $white = $im->colorAllocate(255,255,255);
           $black = $im->colorAllocate(0,0,0);
           $red = $im->colorAllocate(255,0,0);
           $blue =  $im->colorAllocate(0,0,255);
	foreach $i (0 .. $#bloom_density){
		$bloom_density{$i}=$im->colorAllocate(eval($bloom_density[$i]));
	}
	#$color_percent_1= $im->colorAllocate($bloom_density[1]);
	#$color_percent_2= $im->colorAllocate($bloom_density[2]);

           # make the background transparent and interlaced
           $im->transparent($white);
           $im->interlaced('true');

	$offset=6;
	$left=1;
	foreach $i (0 .. 9){
		$left=$offset *$i;
		$right=$left + $offset;
           	$im->filledRectangle($left,0,$right,24,$bloom_density{$i});
		print elsewhere <<EOP;
$left, 0, $right, 24 
EOP
}

	$lookfor=lc($query->param('name'));
		while(<DATA>){
chomp;
			if(m/^$lookfor\t/){
				@fields=split(/\t/);
				@fields=split(/\t/,$_,100);
					$fields[13]=~s/[\(\)]*//g;
$im->string(gdSmallFont,358,10,"n=$fields[13]",$black);
$count=0;
				foreach(@fields[1 .. 12]){
					$percent=int((100 * $_) / $fields[13]);
					if($percent > 90){ $percent=10}
					elsif($percent > 80){ $percent=9}
					elsif($percent > 70){ $percent=8}
					elsif($percent > 60){ $percent=7}
					elsif($percent > 50){ $percent=6}
					elsif($percent > 40){ $percent=5}
					elsif($percent > 30){ $percent=4}
					elsif($percent > 20){ $percent=3}
					elsif($percent > 10){ $percent=2}
					elsif($percent > 0){ $percent=1}
					else{ $percent=0}
$left= 60 + ($count * 24);
$right=$left+24;
           $im->filledRectangle($left,0,$right,24,$bloom_density{$percent});
if($FT{$count}){
           $im->filledRectangle($left,22,$right,24,$blue);
}
$im->string(gdSmallFont,$left+5,10,"$fields[$count+1]",$black);

++$count;
				}
			}
		}
           # Put a black frame around the picture
           $im->rectangle(0,0,399,24,$black);
$left=60;
foreach $month ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"){
$left_string=$left+4;
$right=$left+24;
$im->string(gdTinyFont,$left_string,1,"$month",$black);
           $im->rectangle($left, 0, $right,24,$black);
$left += 24;
}
           binmode STDOUT;
print $im->gif;
	}
__END__
