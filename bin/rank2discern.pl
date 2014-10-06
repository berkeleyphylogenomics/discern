#! /usr/bin/perl -w

my $rankfile = $ARGV[0];
my $intrepidauxfile = $ARGV[1];
my $chainid = $ARGV[2];


open (F, $rankfile) or die "Cannot find $rankfile";
my @ranks =  <F>; # Discern rank
close F;

open (F, $rankfile) or die "Cannot find $rankfile";
while (<F>)
{
  chomp;
  @line=split;
  push @before_sort,$line[1];
   
}
close F;
@after_sort=sort {$b<=>$a} @before_sort; 
for ($j=0;$j<@after_sort;$j++)
{
  $sort{$after_sort[$j]}=$j+1;
}

#print "Finish reading $rankfile\n";
open (G,  $intrepidauxfile) or die "Cannot find $intrepidauxfile";
while (<G>){
	next if (/^#/);
	push (@infos, $_); # Amino acid information
}
close G;
#print "Finish reading $intrepidauxfile\n";
for (my $i = 0; $i < @infos ; $i++){
  last if ($i==@ranks); # sometimes the numbers of resiudes in the sequence and
  # in the pdb structure are different
	my $rank  = $ranks[$i];
	my $info = $infos[$i];

	chomp $rank;
	chomp $info;

	my @info = split(/[|]/, $info); # amino acid
	my @rank = split(/\s/, $rank); # discern rank
 # print "Position in intrepid $info[0], Position in Disern $rank[0]\n";
  if ($rank[0]<$info[0])
  {
    until ($rank[0]==$info[0]) 
    {$rank=$ranks[$i+1];@rank = split(/\s/, $rank);}
  }
  if ($rank[0]>$info[0])
  {
    until ($rank[0]==$info[0])
    {$info=$infos[$i+1];@info = split(/[|]/, $info);} 
  }
	print $chainid."\t".$info[1]."\t".$info[3]."\t".$rank[1]."\t".$sort{$rank[1]}."\n";
}
