#!/usr/bin/perl
use warnings;
use strict;

use Getopt::Long;

my $ignore_dirs = q{};
my $verbose     = 0;

# get options
my $options = GetOptions ( "ignore=s"   => \$ignore_dirs,
                           "verbose"    => \$verbose );

if ( $verbose ) {
    warn "Received directories:\n", (map { " - '$_'\n" } @ARGV);
}

# set directories to ignore
my $ignore;

for my $ignore_dir ( split /,/, $ignore_dirs ) {
    $ignore->{ $ignore_dir }++;
}

@ARGV = grep { ! $ignore->{ $_ } } @ARGV;

# if there is no dir, bail out
@ARGV or print '.' and exit;

# setup the directories
my $first_dir = shift;

my @dirs = @ARGV;

my %dirs = ( $first_dir, ( map { ($_) x 2 } @dirs ), $first_dir );

# find out the current dir
chomp( my $pwd = `pwd` );

# print the next dir
print ($dirs{ $pwd } || $first_dir);
