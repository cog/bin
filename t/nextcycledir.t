use Test::More tests => 2;
use Test::Script;

script_compiles('nextcycledir');

script_runs(['nextcycledir']);
