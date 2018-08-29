" Introduction {
"   vim configuration
"   Hongyu Su
"   hongyu.su@me.com
" }


" Plugin management {
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif
    call plug#begin('~/.vim/plugged')
    Plug 'jacoborus/tender'     " Color
    Plug 'bling/vim-airline'    " theme
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    "Plug 'tpope/vim-sensible'
    "Plug 'scrooloose/syntastic'
    "Plug 'nvie/vim-flake8'
    "Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'godlygeek/tabular'
    "Plug 'ervandew/supertab'
    "Plug 'honza/vim-snippets'
    "Plug 'airblade/vim-gitgutter'
    "Plug 'tpope/vim-fugitive'
    "Plug 'flazz/vim-colorschemes' " http://vimcolors.com/?utf8=%E2%9C%93&bg=dark&colors=term&order=newest&page=3
    " You complete me need custom compiled vim on some systems and installing the plugin it needs to be compiled.
    "Plug 'valloric/youcompleteme'
    "In the folder .vim/plugged/youcompleteme run the command ./install.py
    "let g:ycm_python_binary_path = '/usr/bin/python3'
    "Plug 'davidhalter/jedi-vim'
    "Plug 'sirver/ultisnips'
    " Read https://github.com/honza/vim-snippets/blob/master/UltiSnips/tex.snippets
    " Read https://github.com/honza/vim-snippets/blob/master/UltiSnips/python.snippets
    call plug#end()
" }

" Nerdtree {
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    let g:NERDTreeIgnore = ['\.pyc$']
    let g:NERDTreeDirArrowExpandable = '+'
    let g:NERDTreeDirArrowCollapsible = '-'
    let g:python_version_2 = 1
    map <C-l> :NERDTreeToggle<CR>
"}

" Colors {
    let g:rehash256 = 1
    let g:solarized_termcolors=256
    set t_Co=256
    set background=dark
    colorscheme tender
    set t_BE= "Avoid 0~ and 1~ when copy pasting
" }

" Plugin setting {
    setlocal foldmethod=manual
    let g:airline#extensions#tabline#enabled = 1
    let g:pymode_rope = 0
    syntax enable
    syntax on
    let python_highlight_all=1
" }

" JSON format {
"nmap =j :%!python -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=2))"<CR>
" }

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    "set background=dark " we plan to use a dark background
    syntax on " syntax highlighting on
    syntax enable
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor 
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch) 
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the 
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line 
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match 
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
" }

" General {
    filetype plugin indent on " load filetype plugins/indent settings
    set backspace=indent,eol,start " make backspace a more flexible
    set backup " make backup files
    set backupdir=~/.vim/backup " where to put backup files
    set clipboard+=unnamed " share windows clipboard
    set directory=~/.vim/tmp " directory to place swap files in
    set fileformats=unix,mac,dos " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$,@,%,# " none of these are word dividers 
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
"             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest " turn on wild mode huge list
" }

" Vim UI {
    "set cursorcolumn " highlight the current column
    "set cursorline " highlight current line
    highlight Search term=standout ctermfg=3 cterm=standout
    highlight Visual term=standout ctermfg=4 cterm=standout
    set incsearch " BUT do highlight as you type you 
                   " search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines 
                     " betweens rows
    "set list " we do what to show tabs, to ensure we get them 
              " out of my files
   	set listchars=tab:>-,trail:- " show tabs and trailing 
	set matchtime=5 " how many tenths of a second to blink 
                     " matching brackets for
    set nohlsearch " do not highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 
                         " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    "set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current 
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in 
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
" }


" Text Formatting/Layout {
    set completeopt= " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return, 
                          " and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent, 
                      " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces 
                       "should a tab be (see expandtab)
    set tabstop=4 " real tabs should be 8, and they will show with 
                   " set list on
" }


" Flake8 checking {
    " Syntastic - https://lintlyci.github.io/Flake8Rules/
    let g:syntastic_python_checkers = ['flake8']
    " [E221] multiple spaces before operator
    " [E128] Continuation line under-indented for visual indent
    " [E221] multiple spaces before operator
    " [E265] block comment should start with '# '
    " [E501] Line too long (82 &gt; 79 characters)
    let g:syntastic_python_flake8_args="--ignore=E128,E221,E265,E501"
    "let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    "let g:syntastic_quiet_messages = { "type": "style" }
" }



" Spelling {
    " Spell checker
    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
    highlight clear SpellCap
    highlight SpellCap term=underline ctermfg=1 cterm=underline
    highlight clear SpellRare
    highlight SpellRare term=underline ctermfg=1 cterm=underline
    highlight clear SpellLocal
    highlight SpellLocal term=underline ctermfg=1 cterm=underline
    
    "switch spellcheck languages
    let g:myLang = 0
    let g:myLangList = [ "nospell", "en_us"]
    function! MySpellLang()  "loop through languages
      let g:myLang = g:myLang + 1
      if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
      if g:myLang == 0 | set nospell | endif
      if g:myLang == 1 | setlocal spell spelllang=en_us | endif
      echo "language:" g:myLangList[g:myLang]
    endf
    map <F2> :call MySpellLang()<CR>
" }

" Loading {
    " Tell vim to remember certain things when we exit, see http://vim.wikia.com/wiki/VimTip80
    set viminfo='20,\"300,:20,%,n~/.viminfo
    
    " when we reload, tell vim to restore the cursor to the saved position
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
" }

" Key Mappings {
    " ROT13 - fun
    map <F12> ggVGg?

    " space / shift-space scroll in normal mode
    "noremap <S-space> <C-b>
    "noremap <space> <C-f>

    " Make Arrow Keys Useful Again {
	noremap <left> <C-W>h
	noremap <right> <C-W>l
	map <down> :bp<ENTER>
	map <up> :bn<ENTER>
    " }
" }
