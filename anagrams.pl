#!/usr/bin/perl
# jac
use strict;
use warnings;

# we calculate the permutations of the input parameter, remove the repeated ones
for ( sort ( u( map { join '', @$_ } p( split //, shift ) ) ) ) {

    # and then we simply print each of them
    print "$_\n";
}

# this removes repeated elements from a list
sub u {
    my %v;
    grep { !$v{$_}++ } @_;
}

# and this is a function that calculates permutations... it could be better...
sub p {
    @_
      ? map {
        my $n = $_;
        map { [ $_[$n], @$_ ] } p( @_[ 0 .. $n - 1, $n + 1 .. $#_ ] )
      } ( 0 .. $#_ )
      : [];
}
