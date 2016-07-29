#!/usr/bin/perl -w
use strict;

# moonphases returns 5 moonphases
# moonphases X does calculations X days in the future

use Astro::MoonPhase;

my $time = time;

if (my $days = shift) {
  $time += $days * 24 * 60 * 60;
}

my @phases = phasehunt($time);
print "New Moon      = ", scalar(localtime($phases[0])), "\n";

print "First quarter = ", scalar(localtime($phases[1])), "\n";

print "Full moon     = ", scalar(localtime($phases[2])), "\n";

print "Last quarter  = ", scalar(localtime($phases[3])), "\n";

print "New Moon      = ", scalar(localtime($phases[4])), "\n";


