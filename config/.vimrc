" ---------------------------------------------------------------------
" Plugin variables
" ---------------------------------------------------------------------
let NERDTreeShowHidden=1                         " Show dotfiles in NERDTree
let g:NERDTreeWinSize=36                         " Set the width of the NERDTree window

" Ensure .vim/ dirs
silent !mkdir -p ~/.vim/{backup,swap,undo} > /dev/null 2>&1

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs  'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify plugins
call plug#begin()
Plug 'https://github.com/danilo-augusto/vim-afterglow.git'
Plug 'https://github.com/catppuccin/vim.git', { 'as': 'catppuccin' }
Plug 'https://github.com/preservim/nerdtree.git'
call plug#end()

" Auto configure plugins on load
autocmd VimEnter * colorscheme catppuccin_latte

syntax on                                        " Enable syntax highlighting

set backupdir=~/.vim/backup//                    " Keep all backups here
set directory=~/.vim/swap//                      " Keep all swap files here
set undodir=~/.vim/undo//                        " Keep all undo files here

set nolist
set listchars=eol:$,nbsp:_,tab:>-,trail:~,extends:>,precedes:<

set nocompatible                                 " Set Vim rather than Vi settings; must go first
set noeb                                         " Set no audio or visual error beep
set bs=2                                         " Allow backspacing over everything in insert mode (compat)
set bs=indent,eol,start                          " Allow backspacing over everything in insert mode (modern)
set history=1000                                 " Keep N lines of command line history
set undolevels=1000                              " Allow N undo levels
set wildmenu                                     " Turn on tab completion
set wildmode=list:longest,list:full              " Configure tab completion


" ---------------------------------------------------------------------
" Cursor settings
" ---------------------------------------------------------------------

set cursorline
hi CursorLineNr cterm=NONE
hi CursorLine cterm=bold ctermbg=237

" ---------------------------------------------------------------------
" Basic text settings
" ---------------------------------------------------------------------

set textwidth=80                                 " Set text to wrap at 80 columns
set expandtab                                    " Convert tabs to spaces
set tabstop=4                                    " Tabs = 4 spaces
set shiftwidth=4                                 " Indent/outdent 4 spaces
set softtabstop=4                                " Tab key indents
set shiftround                                   " Indent/outdent to nearest tabstop
set smarttab                                     " Uses shiftwidth @ start of lines

set fo=trcn                                      " t = auto wrap text to text width
                                                 " r = auto insert comment leader on new lines
                                                 " c = auto wrap comments to text width
                                                 " c = recognize numbered lists

set number                                       " Enable line numbers
set nohidden                                     " Unload buffer when abandoned
set autoindent                                   " Copy indent from previous line
set smartindent                                  " Detect next indent for known languages
set hlsearch                                     " Highlight search results
set incsearch                                    " Show search matches as you type
set t_Co=256                                     " Make terminal more colorful
set laststatus=2                                 " Always show status line.

set title                                        " Set window title
set scrolloff=10                                 " Always show N lines above or below cursor

set ruler                                        " Show the cursor position all the time
set showcmd                                      " Display incomplete commands
set showmode                                     " Display current mode
set ls=2                                         " Always show status bar

set mouse=a                                      " Enable mouse in all modes
set pastetoggle=<F2>                             " Toggle formatting when pasting

filetype on                                      " Enable filetype detection
filetype indent on                               " Enable filetype-specific indenting
filetype plugin on                               " Enable filetype-specific plugin
filetype plugin indent on

" ---------------------------------------------------------------------
" Remap keys
" ---------------------------------------------------------------------

" Mapping commands
" map      : recursive map
" noremap  : non-recursive map
" <leader> : the \ key

" Mapping modifiers (prefix)
" n: normal only
" v: visual and select
" o: operator-pending
" x: visual only
" s: select only
" i: insert
" c: command-line
" l: insert, command-line, regexp-search, etc.

nnoremap <leader>erc :e! ~/.vimrc<cr>            " Edit .vimrc with \erc
nnoremap <leader>n :NERDTreeFocus<CR>            " Focus NERDTree
nmap <leader>rrc :so $MYVIMRC<CR>                " Reload .vimrc with \rrc

vmap Q gq                                        " Enable shift+q to rewrap selection in visual mode
nmap Q gqap                                      " Enable shift+q to rewrap paragraph in normal mode

nnoremap <C-q><C-q> :qa<CR>                      " Close all with Ctrl+qq
nnoremap <C-n> :NERDTreeToggle<CR>               " Toggle NERDTree
nnoremap <C-f> :NERDTreeFind<CR>                 " Find in NERDTree

" ---------------------------------------------------------------------
" Auto commands
" ---------------------------------------------------------------------

" Python specific settings
autocmd FileType python set autoindent smartindent et sts=4
  \ cinwords=class,def,elif,else,except,finally,for,if,try,while
