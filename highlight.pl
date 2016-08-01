#!/usr/bin/perl

use warnings;
use strict;

# colour definitions
our %attributes = (
                   '--clear'      => 0,    '--reset'      => 0,
                   '--bold'       => 1,    '--dark'       => 2,
                   '--underline'  => 4,    '--underscore' => 4,
                   '--blink'      => 5,    '--reverse'    => 7,
                   '--concealed'  => 8,

                   '--black'      => 30,   '--ob'  => 40,
                   '--red'        => 31,   '--or'  => 41,
                   '--green'      => 32,   '--og'  => 42,
                   '--yellow'     => 33,   '--oy'  => 43,
                   '--blue'       => 34,   '--ob'  => 44,
                   '--magenta'    => 35,   '--om'  => 45,
                   '--cyan'       => 36,   '--oc'  => 46,
                   '--white'      => 37,   '--ow'  => 47
                 );

our @default_colours = map { "--$_" } qw/green yellow blue magenta red cyan ob or og oy ob om oc/;

our $colour_for = {};

# arguments
my @arguments;

while ( my $argument = shift @ARGV ) {
    if ( $argument =~ /^--/ ) {
        my $colour = $argument;
        $argument = shift @ARGV;
        $colour_for->{$argument} = $colour;
    }
    else {
        $colour_for->{$argument} = colour_for($argument);
    }
    push @arguments, $argument;
}

# highlighting
while (<>) {
    for my $pattern (@arguments) {
        my $colour = colour_for($pattern);

        s/($pattern)/\e[$attributes{ $colour }m$1\e[0m/gi;
    }
    print;
}

# subroutines

sub next_colour {
    push @default_colours, shift @default_colours;

    return $default_colours[-1];
}

sub colour_for {
    return $colour_for->{ +shift } ||= next_colour();
}

__END__

=head1 NAME

highlight.pl - highlights regexen

=cut
