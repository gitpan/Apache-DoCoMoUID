use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Apache::DoCoMoUID',
    'VERSION_FROM' => 'DoCoMoUID.pm', # finds $VERSION
    'PREREQ_PM' => {
        'mod_perl' => 0,
    },
);
