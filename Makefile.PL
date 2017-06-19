use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::Template::Mustache',
  VERSION_FROM => 'lib/Mojolicious/Plugin/Template/Mustache.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {'Mojolicious' => '7.32'},
  test         => {TESTS => 't/*.t'}
);
