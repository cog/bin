#!/usr/bin/perl -p
# trim, by jac
use strict;

BEGIN { our $trim = shift || 80; }

our $trim;
s/(?<=.{$trim}).*//

# to do:

# special case of \t
# option to trim only on spaces
