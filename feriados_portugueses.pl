#!/usr/bin/perl -s
use strict;
use warnings;

use Date::Holidays::PT;
use Time::DayOfWeek qw(:dow);

our $help;

die "	$0
	$0 2015
	$0 2015 2016 2017
	$0 2010-2020
	$0 -help
" if $help;

# read the list of years
my @years = @ARGV;

# if the list of years is empty, replace with the current year
unless (@years) {
    @years = ( localtime(time) )[5] + 1900;
}

# if there's an argument of the form 1000-2000, expand to the full list
@years = map { /(\d+)-(\d+)/ ? ( $1 .. $2 ) : $_ } @years;

# for each year...
for my $year (@years) {

    # get the holidays for that year
    my $holidays = Date::Holidays::PT->holidays($year);

    print "Feriados Portugueses em $year:\n\n";

    for my $month ( sort { $a <=> $b } keys %$holidays ) {
        for ( sort { $a <=> $b } keys %{ $holidays->{$month} } ) {
            printf( "%02d/%02d/%04d (%s) - ",
                $_, $month, $year, Dow( $year, $month, $_ ) );
            print $holidays->{$month}->{$_};
            print "\n";
        }
    }
}
