#!/usr/bin/perl -w
use strict;

my $file = shift || exit;

for (@ARGV) {
  open (STDIN, $file) || die $!;
  while (<>) {
    $_{$_}=1;
  }
  close STDIN;
}

open (STDIN, $file) || die $!;
while (<>) {
  print if $_{$_};
}
close STDIN;
