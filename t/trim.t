use Test::More tests => 2;
use Test::Script;

script_compiles('trim');

script_runs(['trim']);
