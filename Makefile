SCRIPTS = anagrams check_aliases count feriados_portugueses fileintersect filewithout highlight moonphases nextcycledir parsetime pwhereis samefile timing trim

test:
	perl -MTest::Harness -e 'runtests(<t/*.t>)'

clean:
	rm -rf cover_db/

critic:
	perlcritic $(SCRIPTS)
