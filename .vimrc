" Setup stuff
" ===========

" Use vim rather than vi settings
"set nocompatible

" Shell stuff here

" Set shell to zsh (fish and VIM don't play well together)
if !has('win32')
  set shell=bash "Comment in WINDOWS
endif
"Don't dump distracting text to terminal during searches!
"" set shellpipe=2>/dev/null>

" Plugins here
" =============

"Setup Vundle For Package Management

"Vundle begins here, turn off filetype temporarily
filetype off
if has('win32')
  set rtp+=$HOME/vimfiles/bundle/Vundle.vim/ "WINDOWS
  call vundle#begin('$HOME/vimfiles/bundle/') "WINDOWS
else
  "has('unix') "Includes Mac
  set rtp+=~/.vim/bundle/Vundle.vim/
  let path='~\.vim\bundle' "Comment in WINDOWS
  call vundle#begin()
endif
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"My plugins
"==========

" Themes
""""""""
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
"""Plugin 'reedes/vim-colors-pencil'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'


" Syntax
""""""""
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-sexp'
Plugin 'elixir-editors/vim-elixir'
Plugin 'mhinz/vim-mix-format' " Testing Mix Format for elixir
"""Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'sheerun/vim-polyglot'
"""Plugin 'groenewege/vim-less'
"""Plugin 'skammer/vim-css-color'
"""Plugin 'kchmck/vim-coffee-script'
"""Plugin 'jelera/vim-javascript-syntax'
"""Plugin 'elzr/vim-json'
"""Plugin 'mustache/vim-mustache-handlebars'
"""Plugin 'lepture/vim-jinja'
"""Plugin 'vimlatex'

" Functionality
"""""""""""""""

" ### Indispensable
"""""""""""""""""""

" Ack.vim uses ack to search within files
Plugin 'mileszs/ack.vim'
"Airline provides a stylish appearance for the styleline
Plugin 'vim-airline/vim-airline'
"Airline themes
Plugin 'vim-airline/vim-airline-themes'
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
" Distraction-free writing
Plugin 'junegunn/goyo.vim'
" Jump to words
Plugin 'easymotion/vim-easymotion'
" Autocomplete with tab
Plugin 'ervandew/supertab'
" Auto-tab with :Tabularize /{char}
Plugin 'godlygeek/tabular'
" fuzzy file finder
Plugin 'paradigm/SkyBison'
" ctrlp is file fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'
"SnipMate (for snippets), depending on mw-utils and tlip.
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Snippets for snipMate
Plugin 'honza/vim-snippets'
"Lorem Ipsum generator
Plugin 'vim-scripts/loremipsum'
"MRU - Recently used files
Plugin 'yegappan/mru'
"vim-space free . & , and make <Space> and <S-Space> repeat searches
"Plugin 'linktohack/vim-space'

" Experimenting with these
""""""""""""""""""""""""""
Plugin 'haya14busa/incsearch.vim'
""" TabNine - bloquea Macvim
"Plugin 'zxqfl/tabnine-vim' "TabNine - Machine Learning Autocomplete
"Plugin 'Valloric/YouCompleteMe'
"Completor - Autocomplete
Plugin 'maralla/completor.vim'

" Not Using anymore/right now
"""""""""""""""""""""""""""""
"
"
"Gives smart completions for Javascript
""Plugin 'marijnh/tern_for_vim'
"
" fugitive provides git bindings in Vim.  Don't use too much, but useful for blame
"Plugin 'tpope/vim-fugitive'
"
"Plugin 'tpope/vim-unimpaired'
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
    colorscheme molokai
else
    let base16colorspace=256  " Access colors present in 256 colorspace
    colorscheme molokai
    "colorscheme koehler 
    "colorscheme base16-eighties
    "colorscheme base16-3024
endif

"Set Font
"""""""""
"set guifont=Ubuntu\ Mono:h20 " Linux Ubuntu Font
if has('gui')
  if has('mac')
    set guifont=Menlo\ Regular:h18 " Mac Font
  elseif has('unix')
    set guifont=Liberation\ Mono\ 16 "Linux Font
  else
    set guifont=Lucida\ Console:h16 " Windows Font
  endif
endif
set noshowmode                  " Let airline handle the mode display

" General Config
" ==============

let mapleader=','               " Remap leader to ',' the default Leader is '\'
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
"set clipboard=unnamed           " Use the system clipboard, can be changed to unnamedplus
set clipboard^=unnamed,unnamedplus " Use system clipboard in all OSes (Mac, Windows AND Linux)

" Mouse
" =====

" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
if !has('nvim')
  set ttymouse=xterm2
endif


" Search Settings
" ===============

set incsearch        " Find the next match as we type the search
set hlsearch         " Highlight searches by default
set viminfo='100,f1  " Save up to 100 marks, enable capital marks
set ignorecase       " Ignore case while searching
set smartcase        " smart use of case while searching

"Quit search highlights 
nnoremap <esc> :noh<return><esc>
nmap <leader><leader><leader> :noh<CR><Esc>
nnoremap <C-c> :noh<CR><Esc>
nnoremap <leader>h :noh<CR><Esc>
nnoremap ºº :noh<CR><Esc>

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
set wrap linebreak nolist       " Softwrap text

" Folds
" =====

set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Completion
" ==========
"
set path+=** " Search down into subfolders & Provides tab-completion for all file-related tasks

set wildmode=list:longest
"set wildmode=longest,list,full
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*,*.so,*.swp,*.zip

" Scrolling
" =========

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1


" Custom commands
" ===============

"<ESC> control
inoremap jj <Esc>
cnoremap jj <C-c>
cmap <leader>. <C-c>
vmap <leader>. <esc>
imap <leader>. <esc>

cmap ºº <C-c>
vmap ºº <esc>
imap ºº <esc>

" pasar de un buffer a otro
nnoremap gt :bnext<CR>
nnoremap gT :bprevious<CR>

nnoremap <Leader>ac :Ack! -i <Space>

"Let K be the opposite of J
map K i<Enter><Esc>

" U is redo too
map U <C-R>

"\rr => refresh vimrc
if has('win32')
  map <leader>rr :source ~/_vimrc<CR>
else
  "has('unix') "Inludes has('mac')
  map <leader>rr :source ~/.vimrc<CR>
endif
map <leader>as :AutoSaveToggle<CR>
map <leader>max :set lines=999 columns=999<CR>
map <leader>min :set lines=40 columns=120<CR>
map <leader>e :edit<Space>
map <leader>t :CtrlP<CR>
map <leader>p :CtrlP<CR>
map <leader>f :call SkyBison("e ")<CR>
map <leader>mru :MRU<CR>
map <leader>b :b
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>qq :q!<CR>
map <leader><leader>q :q!<CR>
map <leader>wq :wq<CR>
map <leader>zz :wq<CR>
map <leader>s /
map <leader>S ?
map <leader>r :%s/
map <leader>x :
map <leader>m :@
"<leader>. normal -> ex-mode else -><esc>
map <leader>. :
"Toggle Word Wrap
map <leader>v :set wrap!<CR>
"Toggle line absolute and relative numbers (set number is already set) 
map <leader>n :set relativenumber!<CR>
"Spellcheck
map <leader>c :setlocal spell!<CR>
map <leader>cen :setlocal spell! spelllang=en<CR>
map <leader>ces :setlocal spell! spelllang=es_es<CR>

"incsearch options
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"easymotion options
"<leader><leader>s easymotion with n-chars
map  <leader><leader>s <Plug>(easymotion-sn)
omap <leader><leader>s <Plug>(easymotion-tn)


" Plugin Options
" ==============

" Airline options
let g:airline#extensions#tabline#enabled = 1 " Enable tabs in airline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
"let g:airline_powerline_fonts = 1 "Enable symbols, needs a patched font
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline_theme='dark' "Airline Theme
let g:airline#extensions#fzf#enabled = 0 "Fix airline error

"Markdown options
let g:vim_markdown_folding_disabled=1

"NerdTree Options
map <C-n> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1 "Put Nerdtree into a window

"CtrlP Options
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

"Syntax Specific

"Markdown options
let g:vim_markdown_folding_disabled=1

"TableMode Markdown Tables Format
let g:table_mode_corner="|"

" AutoSave don't change the update time to 200ms
" It's used for autosaving frecuency. Default=4000ms
let g:auto_save_no_updatetime = 1

"vim-space options
"let g:space_no_character_repeat_movements = 1

"rainbow-parentheses options
"Always on
au VimEnter * RainbowParenthesesToggleAll
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"vimtex options
let g:tex_flavor = "latex"

"Experimenting with auto-exit from insert mode
"Will exit from insert mode after 2seg of not typing
"set updatetime=2000
"autocmd CursorHoldI * stopinsert 

"Autosave disabled, can be enabled with :AutoSaveTogle
"au FocusLost * silent! wa       " Save on Focus Lost
"set autowriteall                " Save on Focus Lost
"set autowrite                   " Save on Focus Lost
