set nocompatible

set expandtab
set textwidth=120       " set textwidth and display another background color after 121 column.
set colorcolumn=+1
let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=232 guibg=#2c2d27

set tabstop=4
set shiftwidth=4
set wildmenu            " enhanced command completion
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set listchars=tab:=.,trail:.
set list

set t_Co=256
colorscheme molokai

set history=50
set number
set ruler
set hidden              " enable multiple modified buffers
set autowriteall        " Automatically save before commands like :next and :make

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gb2312,sjis

set modeline
set background=dark
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set incsearch
set hlsearch

set nobackup            " do not write backup files
set noswapfile          " do not write .swp files

syntax on

filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "airblade/vim-gitgutter"
Bundle 'derekwyatt/vim-scala'
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-haml'
Bundle "garbas/vim-snipmate"
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'millermedeiros/vim-statline'
Bundle 'tpope/vim-fugitive'
Bundle 'taglist.vim'
Bundle 'sukima/xmledit'
Bundle 'majutsushi/tagbar'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Gasol/vim-scripts'
Bundle 'Gasol/vim-php'
Bundle 'tpope/vim-cucumber'
set wildignore+=*/vim-php/doc/*
Bundle 'jnwhiteh/vim-golang'
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'gnuchangelog'
Bundle 'sprsquish/thrift.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'Efficient-python-folding'
Bundle 'tpope/vim-markdown'

" vim-snipmate dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

" Det added
Bundle 'L9'
Bundle 'othree/vim-autocomplpop'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ap/vim-css-color'

nmap <Tab><Tab> <C-W><C-W>
let mapleader = ","
let maplocalleader = "\\"
" nerdcommenter
" ,/ to invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" ,t to show tags window
let Tlist_Show_Menu=1
nmap <leader>t :TlistToggle<CR>

filetype plugin indent on

" python syntax highlight
let python_highlight_all = 1
let python_sync_slow = 1

" autocomplete
autocmd FileType py setl omnifunc=pythoncomplete
autocmd FileType python syntax keyword pythonDecorator True None False self
autocmd FileType python setl sw=4 ts=4 sts=4 tw=120 sta et nosi
autocmd FileType css setl omnifunc=csscomplete
autocmd FileType perl setl sw=4 ts=4 et
autocmd FileType c setl sw=4 ts=4 et
autocmd BufNewFile,BufRead *.go setl filetype=go sw=4 ts=4
autocmd BufNewFile,BufRead *.mako setl filetype=mako
autocmd BufNewFile,BufRead *.gradle setl filetype=groovy sw=4 ts=4 et
autocmd BufNewFile,BufRead *.thrift if &ft == 'conf' | setl filetype=thrift
autocmd BufNewFile,BufRead *.json setl ft=javascript sw=4 ts=4 et
autocmd BufNewFile,BufRead *.md setl filetype=markdown

map th :tabprev<CR>
map tl :tabnext<CR>
nnoremap <silent> <F12> :TlistToggle<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove tailing spaces
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * :%s/\s\+$//e

let NERDTreeIgnore=['\~$', '\.lo$', '\.la$', '\.pyc']

let Tlist_Use_Right_Window = 1
let os = substitute(system('uname'), "\n", "", "")
if os == "FreeBSD"
	let Tlist_Ctags_Cmd = "/usr/local/bin/exctags"
endif

let g:vundle_default_git_proto = 'git'
let g:changelog_username = 'Det Hsieh <dethsieh@kkbox.com>'

let g:gitgutter_enabled = 0

if filereadable($HOME.'/.vimrc_local')
	source $HOME/.vimrc_local
endif
