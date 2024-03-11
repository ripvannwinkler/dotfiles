set nocompatible
filetype off

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

" begin plugins
call vundle#begin()

" this line is required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

call vundle#end()
" end plugins

syntax on
filetype plugin indent on
let mapleader='\' " remap leader key
colorscheme habamax " set color scheme

" general 
set modelines=0 " do not set options from src file
set number " enable line numbers
set ruler " enable file stats
set encoding=utf-8 " default char encoding

" whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set noshiftround

" cursor
set scrolloff=5 " keep this many lines above and below the current line
set backspace=indent,eol,start " allow backspace over indents, eol and starting pos

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
"
let &t_SI = "\e[5 q" " insert mode
let &t_EI = "\e[1 q" " other modes

nnoremap j gj "move line up
nnoremap k gk "move line down

" window / buffers
set hidden " allow hidden buffers
set ttyfast " fast terminal connection
set laststatus=2 " show status bar
set showmode " show insert, replace, etc.
set showcmd " show current command

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" visualize whitespace
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR> " Toggle tabs and EOL

" macros
map <leader><space> :let @/=''<cr> " clear search
map <leader>q gqip " format current paragraph
