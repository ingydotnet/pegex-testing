#!/usr/bin/env perl

use strict;
use lib 'pegex-pm/lib';
use Pegex::Parser;
use Pegex::Grammar;
use Pegex::Tree;
use Data::Dumper;
$Data::Dumper::Terse = 1;
$Data::Dumper::Indent = 0;
$Pegex::Parser::DebugColor = 'never';

my $grammar = Pegex::Grammar->new(
    text => do {local $/; open _, 'grammar.pgx'; <_>},
);

{
    package Action; use base 'Pegex::Tree';
    sub got_rgx3 {
        return;
    }
}

print "Perl:       ($ARGV[0]) '$ARGV[1]'\n";

my $parser = Pegex::Parser->new(
    grammar => $grammar,
    receiver => Action->new,
    debug => $ENV{DEBUG},
);

print(Dumper($parser->parse($ARGV[1], $ARGV[0])), "\n\n");
