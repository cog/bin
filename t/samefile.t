use Test::More tests => 9;
use Test::Script;

script_compiles('samefile');

script_runs(['samefile']);
script_stdout_is '', 'no input, no output';


script_runs(['samefile', 't/files/a.txt', 't/files/aa.txt']);
script_stdout_is '"t/files/a.txt" "t/files/aa.txt"
', 'matching files a aa';

script_runs(['samefile', 't/files/a.txt', 't/files/aa.txt', 't/files/b.txt', 't/files/bb.txt']);
script_stdout_is '"t/files/a.txt" "t/files/aa.txt"
"t/files/b.txt" "t/files/bb.txt"
', 'matching files a aa b bb';

script_runs(['samefile', 't/files/a.txt', 't/files/b.txt', 't/files/c.txt']);
script_stdout_is '', 'no matching files';
