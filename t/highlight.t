use Test::More tests => 2;
use Test::Script;

script_compiles('highlight');

script_runs(['highlight']);
