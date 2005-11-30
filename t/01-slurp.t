#!/usr/bin/perl
#Copyright (c) 2005 Jonathan T. Rockway

use Test::More tests=>10;
use File::Slurp::SmallFile qw(slurp);

# let's try everything in scalar context first
is(slurp("t/test/simple"), "this is the first line", "simple single line");
is(slurp("t/test/blank_lines"), "this is the first line", "blank lines");
is(slurp("t/test/complex"), "lots of blank lines before this", "blank lines");
is(slurp("t/test/zero"),0,"zero");
is(slurp("t/test/true"),"0 but true", "zero but true");
is(slurp("t/test/all_blank_lines"),undef,"all blank lines");


# ok, now in list context
my @simple = ("this is the first line",
	      "this is the second line",
	      "this is the third line",
	      "four",
	      "5",
	      "^",
	      "-7",
	      "!8",
	      "日本語", # " `nihongo', in japanese kanji, UTF-8"
	     );
my @blank_lines = ("this is the first line",
		   "this is the second line",
		   "three",
		   "four",
		   "five",
		   "six",
		   "seven",
		  );

my @all_blank_lines;

my @complex = ("lots of blank lines before this",
	       "leading",
	       "trailing",
	       "both",
	       "some tabs",
	       "more tabs",
	       "lots of tabs",
	       "tabs AND spaces",
	       "same deal",
	       "lah dee dah",
	       "embedded spaces should still work",
	       "as should\ttabs   like those",
	       "there's no reason not to   use\t both\t  in\ta row",
	      );

my @result = slurp("t/test/simple");
is_deeply(\@result, \@simple, "simple list context");

@result = slurp("t/test/blank_lines");
is_deeply(\@result, \@blank_lines, "blank lines in list context");

@result = slurp("t/test/all_blank_lines");
is_deeply(\@result, \@all_blank_lines, "all blank lines, in list context");

@result = slurp("t/test/complex");
is_deeply(\@result, \@complex, "testing complicated spacing stuff");
