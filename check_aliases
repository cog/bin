#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp qw/slurp/;

# CONFIG

# file to look for alias definitions in
my $alias_file = "$ENV{'HOME'}/.zshrc";
my $hist_file  = "$ENV{'HOME'}/.zsh_history";

my $top_size    = 6;
my $bottom_size = 6;

# SCRIPT

# check the existing aliases
my @aliases =
  map { s/alias\s+([^=]+)/$1/; $1 } grep { /^alias/ } slurp($alias_file);

my $aliases;
for (@aliases) {
    $aliases->{$_} = {
        total     => 0,
        last_used => 0,
    };
}

my @commands = slurp($hist_file);

my $c = 0;
for my $command ( map { s/\s.*\n?//; $_ } map { split /\|\s*/, $_ } @commands )
{
    $c++;

    if ( defined $aliases->{$command} ) {
        $aliases->{$command}{'total'}++;
        $aliases->{$command}{'last_used'} = $c;
    }

}

# see how many commands ago each alias was used
for my $alias ( keys %$aliases ) {
    $aliases->{$alias}->{'last_used'} = $c - $aliases->{$alias}->{'last_used'};
}

# display the data
display_selection( "top aliases",                 top_aliases() );
display_selection( "most recently used aliases",  most_recent_aliases() );
display_selection( "least used aliases",          bot_aliases() );
display_selection( "least recently used aliases", long_ago_aliases() );

# SUB ROUTINES

sub top_aliases         { sort_aliases( 'total',     1,  $top_size ) }
sub bot_aliases         { sort_aliases( 'total',     -1, $bottom_size ) }
sub most_recent_aliases { sort_aliases( 'last_used', -1, $top_size ) }
sub long_ago_aliases    { sort_aliases( 'last_used', 1,  $bottom_size ) }

sub sort_aliases {
    my $sort_param = shift;
    my $order      = -1 * shift;
    my $size       = shift;

    return (
        sort {
            $order *
              ( $aliases->{$a}->{$sort_param} <=> $aliases->{$b}->{$sort_param}
              )
        } keys %$aliases
    )[ 0 .. $size ];
}

sub display_selection {
    my $message = shift;
    my @keys    = @_;

    print "$message:\n\n";

    for my $key (@keys) {
        print
"    $key - $aliases->{$key}->{'total'} times, $aliases->{$key}->{'last_used'} commands ago\n";
    }

    print "\n";
}
