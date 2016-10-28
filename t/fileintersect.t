use Test::More tests => 7;
use Test::Script;

script_compiles('fileintersect');

script_runs(['fileintersect', 't/files/a.txt', 't/files/b.txt']);
script_stdout_is "line 3\n", 'a b';

script_runs(['fileintersect', 't/files/a.txt', 't/files/c.txt']);
script_stdout_is "line 1\nline 2\n", 'a c';

script_runs(['fileintersect', 't/files/b.txt', 't/files/c.txt']);
script_stdout_is "", 'b c';

