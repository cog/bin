SCRIPTS = anagrams check_aliases count feriados_portugueses fileintersect filewithout highlight moonphases nextcycledir pwhereis samefile timing trim

test:
	perl -MTest::Harness -e 'runtests(<t/*.t>)'

critic1:
	perlcritic -1 $(SCRIPTS)

critic2:
	perlcritic -2 $(SCRIPTS)

critic:
	perlcritic -3 $(SCRIPTS)

critic4:
	perlcritic -4 $(SCRIPTS)

critic5:
	perlcritic -5 $(SCRIPTS)

