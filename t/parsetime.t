use Test::More tests => 4;
use Test::Script;

script_compiles('parsetime');

script_runs(['parsetime']);


script_runs(['parsetime', 't/files/times.txt']);
script_stdout_is "2 days, 21 hours, 56 minutes
3 weeks, 7 days, 6 hours, 15 minutes
4 days, 12 hours, 33 minutes
3 hours, 5 minutes
1 week, 5 days, 18 hours, 28 minutes, 41 seconds
16 hours, 28 minutes, 0 seconds
1 month, 4 weeks, 1 day, 10 hours
1 month, 4 weeks, 1 day, 10 hours, 38 minutes
38 minutes

2 days, 21 hours, 56 minutes
3 weeks, 7 days, 6 hours, 15 minutes
4 days, 12 hours, 33 minutes
3 hours, 5 minutes
1 week, 5 days, 18 hours, 28 minutes, 41 seconds
16 hours, 28 minutes, 0 seconds
1 month, 4 weeks, 1 day, 10 hours
1 month, 4 weeks, 1 day, 10 hours, 38 minutes
38 minutes
", 'several tests';
