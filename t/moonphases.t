use Test::More tests => 2;
use Test::Script;

script_compiles('moonphases');

script_runs(['anagrams']);
