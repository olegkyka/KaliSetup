""""""""""""""""""""""""""""""""""""""""
" Programming
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""

" Basic stuff
set clipboard+=unnamedplus
set encoding=utf-8
set nocompatible
set rnu nu
set wildmode=longest,list,full
set wildmenu
filetype plugin on
syntax on

" Plugins
call plug#begin('$HOME/vim/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'w0rp/ale'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'joshdick/onedark.vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/syntastic'
	Plug 'godlygeek/tabular'
call plug#end()

" Theme and Background
colorscheme onedark
set bg=dark

" Syntax

" Disable auto-commenting on new-line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splitting
set splitbelow splitright

" Automatically delete trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e



""""""""""""""""""""""""""""""""""""""""
" File Processing
""""""""""""""""""""""""""""""""""""""""

let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex



""""""""""""""""""""""""""""""""""""""""
" Programming
""""""""""""""""""""""""""""""""""""""""

" C
"autocmd FileType c _

" C++
"autocmd FileType cpp _

" Python
"autocmd FileType py _

" Javascript
"autocmd FileType js _

" HTML
"autocmd FileType html _

" XML
"autocmd FileType xml _




""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""
" Linguistics
""""""""""""""""""""""""""""""""""""""""

" Spell check
" map (some key) :setlocal spell! spelllang=en_us<CR>


""""""""""""""""""""""""""""""""""""""""
" Custom Key Bindings
""""""""""""""""""""""""""""""""""""""""

" ctrl-S now saves file
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
vmap <c-s> <Esc>:w<CR>
