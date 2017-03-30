" Setup stuff
" ===========

" Use vim rather than vi settings
"set nocompatible

" Shell stuff here

" Set shell to zsh (fish and VIM don't play well together)
set shell=bash "Comment in WINDOWS
"Don't dump distracting text to terminal during searches!
"" set shellpipe=2>/dev/null>

" Plugins here
" =============

"Setup Vundle For Package Management

"Vundle begins here, turn off filetype temporarily
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
"set rtp+=$HOME/vimfiles/bundle/Vundle.vim/ "WINDOWS
let path='~\.vim\bundle' "Comment in WINDOWS
call vundle#begin()
"call vundle#begin('$HOME/vimfiles/bundle/') "WINDOWS
Plugin 'gmarik/vundle'

"My plugins
"==========

" Themes
""""""""
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'


" Syntax
""""""""
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rails'
""Plugin 'groenewege/vim-less'
""Plugin 'skammer/vim-css-color'
""Plugin 'kchmck/vim-coffee-script'
""Plugin 'jelera/vim-javascript-syntax'
""Plugin 'dag/vim-fish'
"Plugin 'elzr/vim-json'
""Plugin 'mustache/vim-mustache-handlebars'
""Plugin 'lepture/vim-jinja'
""Plugin 'vimlatex'

" Functionality
"""""""""""""""

" ### Indispensable
"""""""""""""""""""

"command-t is a file searcher
Plugin 'wincent/command-t'
" Ack.vim uses ack to search within files
Plugin 'mileszs/ack.vim'
"Airline provides a stylish appearance for the styleline
Plugin 'bling/vim-airline'
" Syntastic provides syntax info
Plugin 'scrooloose/syntastic'
"Integrate with tmux
Plugin 'christoomey/vim-tmux-navigator'
"Provides Sublime-Text like smart completion of braces, parens and such
Plugin 'Raimondi/delimitMate'
" Auto-Saving -> Use :AutoSaveToggle para activarlo
Plugin 'vim-scripts/vim-auto-save' 
" Table mode (:TableModeToggle & :Tableize)
Plugin 'dhruvasagar/vim-table-mode'
"vimtex - latex help
Plugin 'lervag/vimtex'
" Nerdtree provides a file explorer, which is sometimes useful. Mostly ctrlp handles file finding though
Plugin 'scrooloose/nerdtree'
" Surround is useful for adding surrounding tags to elements (especially html)
Plugin 'tpope/vim-surround'
" Allows vim-surround to be used with . command
Plugin 'tpope/vim-repeat'
" Provides easy shortcuts for commenting out lines
Plugin 'scrooloose/nerdcommenter'
"Adds convenience stuff for writers
Plugin 'reedes/vim-pencil'
" Distraction-free writing
Plugin 'junegunn/goyo.vim'

" Experimenting with these
""""""""""""""""""""""""""



" Not Using anymore/right now
"""""""""""""""""""""""""""""
" ctrlp is file fuzzy search
"Plugin 'kien/ctrlp.vim'
"
" Great helpful autocompletion
" Uses OmniComplete which is built-in in gVim
""set omnifunc=syntaxcomplete#Complete
"Plugin 'Valloric/YouCompleteMe'
"
" UltiSnips - Snippets engine
"Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'
"
"Gives smart completions for Javascript
""Plugin 'marijnh/tern_for_vim'
"
" fugitive provides git bindings in Vim.  Don't use too much, but useful for blame
"Plugin 'tpope/vim-fugitive'
"
"Plugin 'tpope/vim-unimpaired'
"
"Show git info in the gutter, sad that it and syntastic fight for space though
"Plugin 'airblade/vim-gitgutter'
"
"End Vundle
call vundle#end()
"Vundle ended so reenable filetypes

filetype plugin indent on
"Pull in matchit.vim, which is already bundled with Vim
runtime! macros/matchit.vim

" Appearance
" ==========

"We want syntax highlighting in 256 colors
syntax on
syntax enable
set t_Co=256
colorscheme evening
set background=dark
" Use base-16 for the color scheme, different themes in GUI and terminal
if has('gui_running')
    colorscheme monokai
else
    let base16colorspace=256  " Access colors present in 256 colorspace
    colorscheme koehler 
    "colorscheme base16-eighties
    "colorscheme base16-3024
endif

"Set Font
"""""""""
"set guifont=Liberation\ Mono:h12
"set guifont=Liberation\ Mono\ 12
"set guifont=Lucida\ Console:h14 " Windows Font
"set guifont=Ubuntu\ Mono\ 14 " Linux Ubuntu Font
set guifont=Menlo\ Regular:h16
set noshowmode                                  " Let airline handle the mode display

" General Config
" ==============

let mapleader='\'               " I just use the default Leader
set encoding=utf-8
set number                      " Line numbers are nice
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=100                 " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set laststatus=2                " Always show status line
set hidden                      " Buffers can exist in the background
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
set shortmess=filnxtToOI        " see :help shortmess

set visualbell                  " Visual Beep
set lines=40 columns=120
set clipboard=unnamed           " Use the system clipboard, can be changed to unnamedplus

" Mouse
" =====

" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


" Search Settings
" ===============

set incsearch        " Find the next match as we type the search
set hlsearch         " Highlight searches by default
set viminfo='100,f1  " Save up to 100 marks, enable capital marks
set ignorecase       " Ignore case while searching
set smartcase        " smart use of case while searching

"Limpiar el highligth de las búsquedas con ESC
nnoremap <esc> :noh<return><esc>

" Turn Off Swap Files
" ===================

set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Persistent Undo
" ===============

" Keep undo history across sessions, by storing in file
" Only works in MacVim (gui) mode
if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif

" Indentation and Display
" =======================

" We want to replace tabs with spaces and have 4 space width indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
"set nowrap                            " Don't wrap lines

" Folds
" =====

set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Completion
" ==========

"set wildmode=list:longest
set wildmode=longest,list,full
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*

" Scrolling
" =========

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1


" Custom commands
" ===============

"jj from insert mode to normal mode
inoremap jj <Esc>
inoremap <C-j> <Esc>
" pasar de un buffer a otro
nnoremap gt :bnext<cr>
nnoremap gT :bprevious<cr>

"Let K be the opposite of J
map K i<Enter><Esc>
"\rr => refresh vimrc
map <leader>rr :source ~/.vimrc<CR>
", acts also like leader \
nmap , <leader>

" Plugin Options
" ==============


" CTRL+P options

"let g:ctrlp_custom_ignore = {
"    \ 'file': '\.pyc$',
"    \ 'dir': 'node_modules\|\.DS_Store$\|\.git$'
"    \ }

" Airline options
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Markdown options
let g:vim_markdown_folding_disabled=1

"NerdTree Options
map <C-n> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1 "Put Nerdtree into a window


augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

nnoremap <silent> <leader>ps :SoftPencil<cr>
nnoremap <silent> <leader>ph :HardPencil<cr>
nnoremap <silent> <leader>pn :NoPencil<cr>
nnoremap <silent> <leader>pt :TogglePencil<cr>


"Syntax Specific


"Markdown options
let g:vim_markdown_folding_disabled=1

"TableMode Markdown Tables Format
let g:table_mode_corner="|"

let g:pencil#wrapModeDefault = 'hard'   " or 'soft'


set wrap linebreak nolist       " Softwrap text
"au FocusLost * silent! wa       " Save on Focus Lost
"set autowriteall                " Save on Focus Lost
"set autowrite                   " Save on Focus Lost

"Command-t options
let g:CommandTMaxFiles=200000
nnoremap <Leader>a :Ack!<Space>

