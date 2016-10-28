SCRIPTS = anagrams check_aliases count feriados_portugueses fileintersect filewithout highlight moonphases nextcycledir pwhereis samefile timing trim

test:
	perl t/anagrams.t
	perl t/check_aliases.t
	perl t/count.t
	perl t/feriados_portugueses.t
	perl t/fileintersect.t
	perl t/filewithout.t
	perl t/highlight.t
	perl t/moonphases.t
	perl t/nextcycledir.t
	perl t/pwhereis.t
	perl t/samefile.t
	perl t/timing.t
	perl t/trim.t

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

