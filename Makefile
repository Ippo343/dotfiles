HOME = $(shell echo ~/)

.PHONY: all
all: git bash vim

.PHONY: git
git:
	cp git/.gitconfig $(HOME)


.PHONY: bash
bash:
	cp bash/.bash* $(HOME)


.PHONY: vim
vim:
	cp vim/.vimrc $(HOME)

.PHONY: vim.plugins
vim.plugins:
	# Install pathogen
	mkdir -p $(HOME)/.vim/autoload $(HOME)/.vim/bundle
	curl -LSso $(HOME)/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	# Install plugins
	git clone https://github.com/scrooloose/nerdtree.git		$(HOME)/.vim/bundle/nerdtree
	git clone https://github.com/ntpeters/vim-better-whitespace.git $(HOME)/.vim/bundle/vim-better-whitespace
	git clone https://github.com/tpope/vim-fugitive.git 		$(HOME)/.vim/bundle/vim-fugitive
	vim -u NONE -c "helptags vim-fugitive/doc" -c q
	git clone https://github.com/plasticboy/vim-markdown.git	$(HOME)/.vim/bundle/vim-markdown
	mkdir -p $(HOME)/.vim/pack/tpope/start
	git clone https://tpope.io/vim/sensible.git			$(HOME)/.vim/pack/tpope/start
	vim -u NONE -c "helptags sensible/doc" -c q


.PHONY: clean
clean:
	# Uninstalls the vim plugins and deletes .vimrc
	# Leave the bash and git stuff untouched as that's way more sensitive
	rm -rf $(HOME)/.vim/
	rm -rf $(HOME)/.vimrc
