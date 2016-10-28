use Test::More tests => 2;
use Test::Script;

script_compiles('check_aliases');

script_runs(['check_aliases']);
