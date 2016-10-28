use Test::More tests => 17;
use Test::Script;

script_compiles('anagrams');

script_runs(['anagrams', 'a']);
script_stdout_is "a\n", 'a';

script_runs(['anagrams', 'ab']);
script_stdout_is "ab\nba\n", 'ab';

script_runs(['anagrams', 'aA']);
script_stdout_is "Aa\naA\n", 'aA';

script_runs(['anagrams', 'ba']);
script_stdout_is "ab\nba\n", 'ab';

script_runs(['anagrams', 'abc']);
script_stdout_is "abc\nacb\nbac\nbca\ncab\ncba\n", 'abc';

script_runs(['anagrams', 'aa']);
script_stdout_is "aa\n", 'aa';

script_runs(['anagrams', 'aba']);
script_stdout_is "aab\naba\nbaa\n", 'aba';

script_runs(['anagrams', 'a b']);
script_stdout_is " ab\n ba\na b\nab \nb a\nba \n", 'a b';
