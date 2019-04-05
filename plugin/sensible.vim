" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Revision by Allen Chen for personal customized.
" Version:      1.2
" Version:      1.3
if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set hidden
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set wrap
set nobackup
set nowritebackup

set complete-=i
set wildmenu
set wildmode=longest:list,full
set formatoptions+=cro
set wildignore+=*.*~,*.lo,*.pyc*.swp,*png,*.jpg,*.obj,*.class,*.a,*.so,*.gif,*.xcf*.psd
set suffixes+=.pdf,.docx,.doc,.xls,.ppt

set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set path+=**
set mat=2
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler

if !&scrolloff
  set scrolloff=3
endif
if !&sidescrolloff
  set sidescrolloff=2
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,ucs-bom,cp936
set ffs=unix,mac,dos

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
set showcmd
set autoread
set virtualedit=block

set number
set relativenumber
set lazyredraw
set statusline=%F%m%r%h%W\ [%{&ff}][%Y][%{&fenc}][%04l,%04v,%p%%\ %L]
set laststatus=2
set cmdheight=2
set linespace=0
set winminheight=1
set showtabline=2
set cursorline
set cursorcolumn
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
set vb t_vb=
set noerrorbells
set mouse=a
set mousehide
set lbr
set background=dark
highlight Normal ctermbg=none
highlight NonText ctermbg=none
set colorcolumn=80
set tags=tags;/

set foldenable
set foldlevelstart=99
set foldnestmax=10
set foldmethod=manual

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" C-U and C-W insert mode with undo
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" vim:set ft=vim et sw=2:
