SCRIPTS = anagrams check_aliases count feriados_portugueses fileintersect filewithout highlight moonphases nextcycledir pwhereis samefile timing trim

test:
	perl -MTest::Harness -e 'runtests(<t/*.t>)'

critic:
	perlcritic $(SCRIPTS)
