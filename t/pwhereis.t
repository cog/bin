use Test::More tests => 2;
use Test::Script;

script_compiles('pwhereis');

script_runs(['pwhereis']);
