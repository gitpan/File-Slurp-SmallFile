use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'File::Slurp::SmallFile',
    AUTHOR              => 'Jonathan Rockway <jon-cpan@jrock.us>',
    VERSION_FROM        => 'lib/File/Slurp/SmallFile.pm',
    ABSTRACT_FROM       => 'lib/File/Slurp/SmallFile.pm',
    PL_FILES            => {},
    PREREQ_PM => {
		  'Exporter' => 0,
		  'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'File-Slurp-SmallFile-*' },
);
