SH   = bash
PSQL = psql

PACKAGE := conreality
VERSION := $(shell cat VERSION)

SOURCES := $(wildcard src/*.sql)
OUTPUTS := schema.sql

schema.sql: src/schema.sh $(SOURCES)
	$(SH) $< > $@

all: build

build: $(OUTPUTS)

check:
	@echo "not implemented" # TODO

dist:
	@echo "not implemented" # TODO

install:
	@echo "not implemented" # TODO

clean:
	@rm -f *~ $(OUTPUTS)

distclean: clean

mostlyclean: clean

.PHONY: check dist install clean distclean mostlyclean
