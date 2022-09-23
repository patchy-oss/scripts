# Makefile for installing scripts

BIN_PATH := ./bin

all: fwdl

fwdl:
	go build -o fwdl/main fwdl/main.go

install: fwdl
	mkdir -p ${BIN_PATH}
	# ddmenu
	cp ddmenu/ddmenu.sh ${BIN_PATH}/ddmenu
	chmod u+x ${BIN_PATH}/ddmenu
	# i3exit
	cp i3exit/i3exit.sh ${BIN_PATH}/i3exit
	chmod u+x ${BIN_PATH}/i3exit
	# mkplaylist
	cp mkplaylist/mkplaylist.sh ${BIN_PATH}/mkplaylist
	chmod u+x ${BIN_PATH}/mkplaylist
	# scrotclip
	cp scrotclip/scrotclip.sh ${BIN_PATH}/scrotclip
	chmod u+x ${BIN_PATH}/scrotclip
	# wg-toggle
	cp wg-toggle/wg-toggle.sh ${BIN_PATH}/wg-toggle
	chmod u+x ${BIN_PATH}/wg-toggle
	# fwdl
	cp fwdl/main ${BIN_PATH}/fwdl
