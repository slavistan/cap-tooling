PREFIX = /usr/local

all:

install: cdsx
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f cdsx $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/cdsx

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/cdsx

.PHONY: all cdsx install uninstall
