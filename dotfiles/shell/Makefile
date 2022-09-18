ifndef VERBOSE
.SILENT:
endif

main:
	sh build

install: main
ifneq ($(wildcard ${HOME}/.zshrc),)
	cp '${HOME}/.zshrc' '${HOME}/.zshrc.bck'
endif
	cp './.zshrc' '${HOME}/.zshrc'

uninstall:
	sh -c "[[ -f '${HOME}/.zshrc.bck' ]] && rm '${HOME}/.zshrc' && cp '${HOME}/.zshrc.bck' '${HOME}/.zshrc' && rm '${HOME}/.zshrc.bck'"

clean:
	sh -c "[[ -f '${PWD}/.zshrc' ]] && rm '${PWD}/.zshrc'"
