use Test::More tests => 7;
use Test::Script;

script_compiles('filewithout');

script_runs(['filewithout', 't/files/a.txt', 't/files/b.txt']);
script_stdout_is "line 1\nline 2\n", 'a c';

script_runs(['filewithout', 't/files/a.txt', 't/files/c.txt']);
script_stdout_is "line 3\n", 'a c';

script_runs(['filewithout', 't/files/b.txt', 't/files/c.txt']);
script_stdout_is "line 3\nline 4\nline 5\n", 'b c';
