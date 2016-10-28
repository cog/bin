use Test::More tests => 10;
use Test::Script;

script_compiles('count');

script_runs(['count']);
script_stdout_is '', 'no input, no output';

script_runs(['count', 't/files/a.txt']);
script_stdout_like qr/^(1: line [123]\n){3}$/, 'one file';
script_stdout_unlike qr/(?:1: line ([123])\n).*(?:1: line \1\n)/, 'one file, no repeated output';

script_runs(['count', 't/files/a.txt', 't/files/aa.txt']);
script_stdout_like qr/^(2: line [123]\n){3}$/, 'two equal files';

script_runs(['count', 't/files/a.txt', 't/files/aa.txt', 't/files/b.txt', 't/files/bb.txt', 't/files/c.txt']);
script_stdout_like qr/^(2: line [45]\n){2}(3: line [12]\n){2}4: line 3\n$/, 'several files';
