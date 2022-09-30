# Makefile for installing scripts

include config.mk

fwdl:
	go build -o fwdl/main fwdl/main.go

all: fwdl

clean:
	rm fwdl/main

install: fwdl
	mkdir -p ${PREFIX}
	# ddmenu
	cp ddmenu/ddmenu.sh ${PREFIX}/ddmenu
	chmod u+x ${PREFIX}/ddmenu
	# i3exit
	cp i3exit/i3exit.sh ${PREFIX}/i3exit
	chmod u+x ${PREFIX}/i3exit
	# mkplaylist
	cp mkplaylist/mkplaylist.sh ${PREFIX}/mkplaylist
	chmod u+x ${PREFIX}/mkplaylist
	# scrotclip
	cp scrotclip/scrotclip.sh ${PREFIX}/scrotclip
	chmod u+x ${PREFIX}/scrotclip
	# wg-toggle
	cp wg-toggle/wg-toggle.sh ${PREFIX}/wg-toggle
	chmod u+x ${PREFIX}/wg-toggle
	# fwdl
	cp fwdl/main ${PREFIX}/fwdl

uninstall:
	rm -rf ${PREFIX}

.PHONY: fwdl all clean install uninstall
