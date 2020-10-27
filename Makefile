BIN = ptree
PREFIX ?= ./.

all: $(BIN)

$(PREFIX)/bin/%: %
	mkdir -p $(@D)
	cp $< $@
	chmod 555 $@

install: $(PREFIX)/bin/ptree
