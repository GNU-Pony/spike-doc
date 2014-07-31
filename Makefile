# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.



.PHONY: all
all: info pdf ps dvi


.PHONY: info
info: spike.info
%.info: info/%.texinfo info/fdl.texinfo
	makeinfo $<

.PHONY: pdf
pdf: spike.pdf
%.pdf: info/%.texinfo info/fdl.texinfo
	@mkdir -p obj
	cd obj && yes X | texi2pdf ../$<
	mv obj/$@ $@

.PHONY: ps
ps: spike.ps
%.ps: info/%.texinfo info/fdl.texinfo
	@mkdir -p obj
	cd obj && yes X | texi2pdf --ps ../$<
	mv obj/$@ $@

.PHONY: dvi
dvi: spike.dvi
%.dvi: info/%.texinfo info/fdl.texinfo
	@mkdir -p obj
	cd obj && yes X | $(TEXI2DVI) ../$<
	mv obj/$@ $@


.PHONY: all
clean:
	-rm -r obj *.{info,pdf,ps,dvi}

