#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'File::Slurp::SmallFile' );
}

diag( "Testing File::Slurp::SmallFile $File::Slurp::SmallFile::VERSION, Perl $], $^X" );
