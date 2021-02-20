ifndef VERBOSE
.SILENT:
endif

main: 
	sh build

install:
	cp ${HOME}/.bashrc ${HOME}/.bashrc.bck
	cp bashrc ${HOME}/.bashrc
	cp bash_aliases.sh ${HOME}/.bash_aliases

uninstall:
ifeq ("$(wildcard $(${HOME}/.bashrc.bck))","")
	rm ${HOME}/.bashrc
	cp ${HOME}/.bashrc.bck ${HOME}/.bashrc
	rm ${HOME}/.bashrc.bck
endif

clean:
	rm bashrc
