#!/usr/bin/env perl

use strict;
use warnings;
use autodie qw(open close);
use Carp qw(croak);
use 5.012;

my $template_file="template";
my $h_data_file="h_data";

open my $fh2, '<', $h_data_file;


while(<$fh2>){
	my ($h11,$h21,$h22,$h33)=split ' ', $_;
	substitute($h11,$h21,$h22,$h33); # no need for & here
	#say $h11,$h21,$h22,$h33;
}
 
close $fh2;
 
sub substitute{
	my($h11,$h21,$h22,$h33)=@_;
	open my $fh1, '<', $template_file;

	while(<$fh1>){
		s/\$h11/$h11/g;	
		s/\$h21/$h21/g;	
		s/\$h22/$h22/g;
		s/\$h33/$h33/g;
		print $_;
	};
		
}
