#!/usr/bin/env perl

use strict;
use warnings;
use autodie qw(open close);


my $template_file = "template";
my $h_data_file   = "h_data";

# call subroutine open_n_work with parameters:
# a file, and an anonymous subroutine 
open_n_work(
    $h_data_file,
    sub {  # anonymous subroutine
        my @h_data = split;
        substitute( \@h_data );
    }
);

sub open_n_work {
    my ( $file, $coderef ) = @_;
    open my $fh, '<', $file;
    while (<$fh>) {
        chomp;
        $coderef->($_);
    }
}

sub substitute {
    my ($h_data_ref) = @_;
    open my $fh, '<', $template_file;

    while (<$fh>) {
        s/\$h11/$h_data_ref->[0]/g;
        s/\$h21/$h_data_ref->[1]/g;
        s/\$h22/$h_data_ref->[2]/g;
        s/\$h33/$h_data_ref->[3]/g;
        print $_;
    }

}
