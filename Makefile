default:
	@echo 'Do "make dist" to generate distribution file.'
	@echo 'Do "make bat" to (re)generate */*.bat.'

dist:
	./makedist.sh

bat:
	for m in */Makefile; \
		do ./make2bat.rb < "$$m" | nkf --msdos > `dirname $$m`/make.bat; \
	done

clean:
	rm -f *.zip

distclean: clean
	rm -f */*.bat
