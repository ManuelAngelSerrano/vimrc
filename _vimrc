" .vimrc
" =======
" 1. core
" 2. plugins
" 3. options
" 4. appearance
" 5. plugin-settings
" 6. Key mappings
" 7. Automatic commands

" 1. core
" ========
if !has('win32')
  set shell=bash "Comment in WINDOWS
endif

let mapleader=" "               " Remap leader to <space> the default Leader is '\'

runtime! macros/matchit.vim "Pull in matchit.vim, which is already bundled with Vim

" 2. plugins
" ===========
" Plugin management with Vundle
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

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

" Themes
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'

" Syntax and Language Support
Plugin 'plasticboy/vim-markdown'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'lervag/vimtex' "Latex support
Plugin 'elixir-editors/vim-elixir'
"Plugin 'tpope/vim-rails'
"Plugin 'mhinz/vim-mix-format' " Testing Mix Format for elixir
""Plugin 'skammer/vim-css-color'
""Plugin 'jelera/vim-javascript-syntax'
"Plugin 'elzr/vim-json'
""Plugin 'mustache/vim-mustache-handlebars'
""Plugin 'lepture/vim-jinja'

" Editing and Navigating
Plugin 'Raimondi/delimitMate' "Provides Sublime-Text like smart completion of braces, parens and such
Plugin 'vim-scripts/vim-auto-save' " Auto-Saving -> Use :AutoSaveToggle para activarlo
Plugin 'scrooloose/nerdtree' " Nerdtree provides a file explorer
Plugin 'tpope/vim-surround' " Surround is useful for adding surrounding tags to elements (especially html)
Plugin 'tpope/vim-repeat' " Allows vim-surround to be used with . command
Plugin 'scrooloose/nerdcommenter' " Provides easy shortcuts for commenting out lines
Plugin 'easymotion/vim-easymotion' " Jump to words
Plugin 'vim-scripts/loremipsum' " Lorem Ipsum generator
Plugin 'Yggdroot/indentLine'
Plugin 'itchyny/lightline.vim'
Plugin 'haya14busa/is.vim'

" File management 
Plugin 'ctrlpvim/ctrlp.vim' " ctrlp is file fuzzy search
Plugin 'yegappan/mru' "MRU - Recently used files

" Not using right now
"Plugin 'dhruvasagar/vim-table-mode' " Table mode (:TableModeToggle & :Tableize)
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets' " Snippets for snipMate

call vundle#end()
filetype plugin indent on

" 3. options
" ===========
" General editor behaviour
set encoding=utf-8
set number                      " Line numbers are nice
set relativenumber 
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
" set lines=50 columns=140
set clipboard^=unnamed,unnamedplus " Use system clipboard in all OSes (Mac, Windows AND Linux)
set noshowmode                  " Let airline/lightline handle the mode display

" Mouse and terminal
"set ttyfast " Send more characters for redraws
set mouse=a " Enable mouse use in all modes
" Set this to the name of your terminal that supports mouse codes.
"if !has('nvim')
  "set ttymouse=xterm2 " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
"endif

" Search Settings
set incsearch        " Find the next match as we type the search
set hlsearch         " Highlight searches by default
"set viminfo='100,f1  " Save up to 100 marks, enable capital marks
"if has('nvim')
  "set shada='100,f1
"else
  "set viminfo='100,f1 " Save up to 100 marks, enable capital marks
"endif
set ignorecase       " Ignore case while searching
set smartcase        " smart use of case while searching

" Files, Swap, backup and undo
set noswapfile
set nobackup
set nowritebackup
" Next 2 lines only are needed if backup of swapfile are active 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"if has('gui_running')
  "set undodir=~/.vim/backups "Persistent Undo across sessions (storing in file), only works in gui MacVim
  "set undofile
"endif
if has('nvim')
  set undodir=~/.local/state/nvim/undo
else
  set undodir=~/.vim/undo
endif
set undofile

" Indentation and display (Replace tabs with 4 space width indentation)
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
"set nowrap                           " Don't wrap lines
"set wrap linebreak nolist             " Softwrap text
set listchars=tab:\ \ ,trail:·
"set nolist
set list
set wrap
set linebreak

" Folding
set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Completion
set path+=**              " Search down into subfolders & Provides tab-completion for all file-related tasks
set wildmode=list:longest "set wildmode=longest,list,full

set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*,*.so,*.swp,*.zip

" Scrolling (Start scrolling when we're getting close to margins)
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" 4. appearance
" ==============
"syntax on
syntax enable
"set t_Co=256 "We want syntax highlighting in 256 colors
set background=dark
colorscheme molokai

"if has('gui_running')
    "colorscheme molokai
"else
    "let base16colorspace = 256  " Access colors present in 256 colorspace
    "colorscheme molokai
"endif

" GUI fonts
if has('gui_running')
  if has('macunix')
    set guifont=JetBrains\ Mono:h20 " Mac Font
    "set macligatures
    "set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h18 " Mac Font
    "set guifont=Menlo\ Regular:h18 " Mac Font
    "set guifont=Fira\ Code\ Retina:h18 " Mac Font
  elseif has('unix')
    set guifont=Liberation\ Mono\ 16 "Linux Font
    "set guifont=Ubuntu\ Mono:h20 " Linux Ubuntu Font
  else
    set guifont=Lucida\ Console:h16 " Windows Font
  endif
endif

" 5. plugin-settings
" ===================
" vim-markdown: show the actual Markdown delimiters
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1

"NERDTree
let NERDTreeHijackNetrw = 1 " Put Nerdtree into a window

"CtrlP settings in case the plugin is enabled
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

"TableMode Markdown Tables Format
let g:table_mode_corner="|"

" AutoSave
let g:auto_save_no_updatetime = 1 " AutoSave don't change the update time to 200ms. Default=4000ms

"VimTeX
let g:tex_flavor = "latex"

"indentLine options
let g:indentLine_char = '│'

"lightline options
let g:lightline = { 'colorscheme': 'powerlineish', }

" 6. Key mappings
" ===============
" Leave insert/command mode - <ESC> control
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
cnoremap jj <C-c>
"cmap <leader>. <C-c>
"vmap <leader>. <esc>
"imap <leader>. <esc>
"cmap ºº <C-c>
"vmap ºº <esc>
"imap ºº <esc>

"Clear search highlights 
nnoremap <esc> :noh<return><esc>
nmap <leader><leader><leader> :noh<CR><Esc>
nnoremap <C-c> :noh<CR><Esc>
nnoremap <leader>h :noh<CR><Esc>
"nnoremap ºº :noh<CR><Esc>
"<leader>. normal -> ex-mode else -><esc>

" Buffers
nnoremap gt :bnext<CR>
nnoremap gn :bnext<CR>
nnoremap gT :bprevious<CR>
nnoremap gp :bprevious<CR>
map <leader>b :b
" <leader>w: next buffer, not write
nnoremap <leader>w :bnext<CR>

" Editing behaviour
nnoremap K i<Enter><Esc> "Let K be the opposite of J
nnoremap U <C-R> " U is redo too
nnoremap gh 0
nnoremap gl $
nnoremap ge G

" Reload/open vimrc
if has('win32')
  map <leader>rr :source ~/_vimrc<CR>
  map ,r :source ~/_vimrc<CR>
else
  "has('unix') "Includes has('mac')
  map <leader>rr :source ~/.vimrc<CR>
  map ,r :source ~/.vimrc<CR>
endif
map <BS>r :source ~/.vimrc<CR>
map <BS>o :e ~/.vimrc<CR>

" Files, windows and commands
map <leader>e :edit<Space>
map <leader>f :edit<Space>
map <leader>v :vsplit<CR>
nnoremap <leader>s :write<CR>
"map <leader>w :w<CR>
map <C-s> :w<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>qq :quit!<CR>
map <leader><leader>q :q!<CR>
"map <leader>s /
"map <leader>S ?
map <leader>S /
map <leader>r :%s/
"map <leader>m :@
map <leader>. :
map <leader>x :

" Toggles
map <leader>as :AutoSaveToggle<CR>
map <leader>- :AutoSaveToggle<CR>
map <leader>max :set lines=999 columns=999<CR>
map <leader>min :set lines=50 columns=140<CR>
"Toggle Word Wrap
map <leader>z :set wrap!<CR> 
"Toggle line absolute and relative numbers (set number is already set)
map <leader>n :set relativenumber!<CR> 
map <leader>l :set relativenumber!<CR>
"Spellcheck
map <leader><leader>c :setlocal spell!<CR>
"map <leader>cen :setlocal spell! spelllang=en<CR>
"map <leader>ces :setlocal spell! spelllang=es_es<CR>

"Comments
nmap <leader>c <Plug>NERDCommenterToggle
vmap <leader>c <Plug>NERDCommenterToggle
nmap ,c <Plug>NERDCommenterToggle
vmap ,c <Plug>NERDCommenterToggle
nmap <D-7> <Plug>NERDCommenterToggle
vmap <D-7> <Plug>NERDCommenterToggle

"NERDTree
map <C-n> :NERDTreeToggle<CR>

"EasyMotion options
"<leader><leader>s easymotion with n-chars
map  <leader><leader>s <Plug>(easymotion-sn)
omap <leader><leader>s <Plug>(easymotion-tn)
nmap ,,w <Plug>(easymotion-w)
nmap <leader><leader>w <Plug>(easymotion-w)
"Return is easymotion with words (the same as <leader><leader>w)
nmap <CR> <Plug>(easymotion-w)
vmap <CR> <Plug>(easymotion-w)
nmap gw <Plug>(easymotion-w)
vmap gw <Plug>(easymotion-w)

" CtrlP
nmap <leader>t :CtrlP<CR>
nmap <leader>p :CtrlP<CR>

" Not used
"map <leader>mru :MRU<CR>
nmap <leader>m :MRU<CR>


" 7. Automatic commands
" =======================
" Keep delimitMate active in Markdown, but do not treat the backtick as a quote.
augroup delimitmate_markdown
  autocmd!
  autocmd FileType markdown let b:delimitMate_quotes = "\" '"
augroup END

"rainbow-parentheses options "Always on
augroup rainbow_parentheses
  autocmd!
  autocmd VimEnter * RainbowParenthesesToggleAll
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
augroup END
"au VimEnter * RainbowParenthesesToggleAll
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

