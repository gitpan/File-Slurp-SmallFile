package File::Slurp::SmallFile;

use warnings;
use strict;
use Exporter;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(slurp);

=head1 NAME

File::Slurp::SmallFile - Slurps a file, omitting blank lines.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Slurps a file, omitting blank lines.  In scalar context, only slurps
the first non-blank line.  In list context, slurps each line into an
array.  Each line is chomp'd and blank lines are ignored.

     use File::Slurp::SmallFile qw(slurp);
     
     my $first_line = slurp("/path/to/a/file");
     my @all_lines  = slurp("/path/to/another/file");
    
=head1 EXPORT

=head2 slurp

Not exported by default, but you can export it by specifing its name
as an argument to Exporter.

=head1 FUNCTIONS

=head2 slurp

Reads chomped, non-blank lines from a file.  Returns the first in scalar
context, or all of them in array context.

Dies if the file can't be opened.  See DIAGNOSTICS.

=cut

sub slurp {
    my $filename = shift;
    
    open my $file, '<', "$filename" or die "Couldn't open $filename: $!";
    
    my @lines = <$file>;
    my @result;
    
    foreach my $line (@lines){
	chomp $line;
	$line =~ s/( ^\s+ | \s+$ )//gx;  # strip leading and trailing spaces
	if ($line || $line eq "0"){
	    if(!wantarray){
		return $line;
	    }
	    push(@result, $line);
	}
    }

    return @result;
}

=head1 DIAGNOSTICS

=head2 "Couldn't open $filename: $!"

$filename couldn't be opened due to an operating system error ($!).

=head1 AUTHOR

Jonathan Rockway, C<< <jon-cpan@jrock.us> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-file-slurp-smallfile@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=File-Slurp-SmallFile>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2005 Jonathan Rockway, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of File::Slurp::SmallFile
