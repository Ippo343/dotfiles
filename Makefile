HOME = ~

.PHONY: all
all: vim git bash

.PHONY: vim
vim:
	cp vim/.vimrc $(HOME)/

.PHONY: git
git:
	cp git/.gitconfig $(HOME)/


.PHONY: bash
bash:
	cp bash/.bash* $(HOME)/

