set nocompatible

"""""""""""" Vundle """""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/moria'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/L9'
"Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'duff/vim-scratch'
Plugin 'Raimondi/YAIFA'
Plugin 'vim-scripts/taglist.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'semmons99/vim-ruby-matchit'
Plugin 'fs111/pydoc.vim'
Plugin 'tpope/vim-pastie'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-haml'
Plugin 'nvie/vim-flake8'
Plugin 'niklasb/bufkill.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ZoomWin'
Plugin 'vim-scripts/indenthaskell.vim'
"Plugin 'lukerandall/haskellmode-vim'
Plugin 'scrooloose/syntastic'
Plugin 'embear/vim-localvimrc'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'duganchen/vim-soy'
Plugin 'idris-hackers/idris-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'godlygeek/tabular'
Plugin 'leafgarland/typescript-vim'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'powerline/powerline'
Plugin 'chriskempson/base16-vim'
Plugin 'keith/swift.vim'
Plugin 'lyuts/vim-rtags'
Plugin 'saelo/smarttrim.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'isRuslan/vim-es6'
Plugin 'johngrib/vim-game-code-break'
Plugin 'tomlion/vim-solidity'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'

call vundle#end()
filetype plugin indent on

"""""""""""" General """"""""""

set nomodeline

if has("gui_running")
  set visualbell t_vb=
  set nomousehide

  set guifont=Consolas\ 12

  set guioptions-=l " no left scrollbar
  set guioptions-=L " no left scrollbar
  set guioptions-=r " no right scrollbar
  set guioptions-=R " no right scrollbar
  set guioptions-=T " no toolbar
  set guioptions-=m " no menu

  set lazyredraw
else
  set ttyfast
  set termencoding=utf-8
  set term=xterm-256color
  set t_Co=256
  set t_ut=
endif


set encoding=utf-8

"set autoread

" disabled for performance reasons
"set relativenumber

set switchbuf=useopen,usetab

let mapleader=","

" change to file directory when switching to a file buffer
autocmd BufEnter * silent! lcd %:p:h

"""""""""""" Persistency """"""""""""

set undofile
set undodir=~/.vimundo

set nobackup
set nowritebackup
set noswapfile

" Tell vim to remember certain things when we exit
"  '50   :  marks will be remembered for up to 50 previously edited files
"  "100  :  will save up to 100 lines for each register
"  :100  :  up to 100 lines of command-line history will be remembered
"  %     :  saves and restores the buffer list
"  n...  :  where to save the viminfo files
set viminfo='50,\"100,:100,n~/.viminfo,!
set history=1000


"""""""""""" Basic UI """"""""""""

set winaltkeys=no
set mouse=a

set scrolloff=3
set scrolljump=5
set sidescrolloff=5
set sidescroll=1

set hidden
set confirm

set showmode
set showcmd
set number

syntax on
set synmaxcol=1000
syntax sync minlines=200

set spr  " split right
set sb   " split below

set cmdheight=1
set winminheight=0

set shortmess=atIoOTts
set visualbell
" disabled for performance reasons
set nocursorline
set ruler

set statusline= "clear it first
set statusline=\ %{winnr()}:\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

set laststatus=2  " Always display the status line

set clipboard+=unnamed
set clipboard+=+

" command-line editing
set wildmenu
set wildmode=list:longest

" we can't add this to wildignore, seems like fugitive has problems with it.
let g:ctrlp_custom_ignore = '\.git$'

";;;;; color scheme ;;;;;"

if has("gui_running")
  colorscheme molokai
  "colorscheme base16-tomorrow-night
  "colorscheme base16-monokai
  set guicursor=a:block-Cursor
  set guicursor+=n-v:blinkon0  " cursors shouldn't blink.
else
  colorscheme molokai
  "colorscheme slate   " for < 256 colors
  set t_Co=256
endif


"""""""""""" Project editing """"""""""""""""

set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,moc_*
set wildignore+=*.o,*.f_*,*~,*.ogg,*.mp4,*.mov,*.class,*/.hg/*,*/.svn/*,*/docs/_*/*
set wildignore+=*/_darcs/*,*/.git/*,*/objs/*,*/wf/*,*.obj,*.hash,*.meta
set wildignore+=*/node_modules/*,*.pdf,*/vendor/*,*.out
set tags+=tags;


"""""""""""" Trailing whitespace """"""""""""

" configure list facility
"highlight SpecialKey term=standout ctermbg=yellow guibg=yellow
set listchars=tab:>-,trail:~

" trim trailing whitespace in the current file
function! RTrim()
  %s/\v\s+$//e
  noh
endfunction

" trim trailing whitespace in the given range
function! RTrimRange() range
  exec a:firstline.",".a:lastline."substitute /\\v\\s+$//e"
endfunction

" strip whitespace manually
nmap <silent> <leader>W :call RTrim()<cr>
vmap <silent> <leader>W :call RTrimRange()<cr>


"""""""""""" Basic text editing """"""""""""

" wrapping
set wrap
set textwidth=79
set lbr " don't split words
set formatoptions=qrn1
set colorcolumn=85
set showbreak=…
"set virtualedit=all

" completion
set complete=.,w,b,t,i
"set completeopt=menu,longest,preview

" folding
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set foldmethod=indent
set foldlevel=20  " everything folded out by default

" movement
set whichwrap+=<,>,[,],h,l  " backspace and cursor can go lines up or down
set nostartofline
set backspace=indent,eol,start

" figure indentation on opening
"autocmd BufReadPost * :silent !Yaifa


"""""""""""" Indentation """"""""""""

set expandtab
set autoindent
set softtabstop=2
set shiftwidth=2
set shiftround

" EMACS-style indentation
"set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e
"set indentkeys=!<Tab>,o,O
"map <Tab> i<Tab><Esc>^

" fix EMACS-style indentation for misbehaving filetypes
"autocmd FileType * setlocal indentkeys+=!<Tab>


"""""""""""" Searching """"""""""""

set ignorecase
set smartcase
set gdefault  " global search by default
set incsearch
set showmatch
set hlsearch

" don't use special regex syntax
nnoremap / /\V
vnoremap / /\V

" break out of a search
nnoremap <leader><space> :noh<cr>


"""""""""""" Color schemes """"""""""""

let moria_fontface = 'mixed'

"""""""""""" NERDTree """"""""""""

nmap <leader>n :NERDTreeFind<CR>:NERDTreeFind<CR>
nmap <leader>N :NERDTreeClose<CR>

"""""""""""" CtrlP """""""""""""""

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_files = 0
let g:ctrlp_mruf_max = 250


"""""""""""" localvimrc """"""""""

let g:localvimrc_persistent = 1

"""""""""""" EasyMotion """"""""""

let g:EasyMotion_leader_key = '\'

"""""""""""" Haskell """""""""""""

let g:haddock_browser = 'chromium'

augroup HSK
  "au BufEnter *.hs compiler ghc
  au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
  au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
augroup END


"""""""""""" LaTeX """""""""""""""

au FileType tex set indentexpr=

"""""""""""" Syntastic """""""""""

let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

""""""""""" Solidity """""""""""""

augroup solidity
  au!
  autocmd BufNewFile,BufRead *.sol set syntax=solidity
augroup END

"""""""""""" Mozilla """""""""""""

autocmd BufNewFile,BufRead *.ipdl set syntax=cpp
autocmd BufNewFile,BufRead *.ipdlh set syntax=cpp
autocmd BufNewFile,BufRead *.jsm set syntax=javascript

"""""""""""" Mappings """"""""""""

" Edit the vimrc file
nmap <silent> <leader>Qe :e $MYVIMRC<CR>
nmap <silent> <leader>Qs :so $MYVIMRC<CR>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" faster movement
nmap <silent> <c-j> 4j
nmap <silent> <c-k> 4k

" optimize access to : commands
nnoremap ; :
vnoremap ; :

" enable some useful navigation bindings
cnoremap <c-a>      <home>
cnoremap <c-e>      <end>
cnoremap <c-h>      <left>
cnoremap <c-j>      <down>
cnoremap <c-k>      <up>
cnoremap <c-l>      <right>

" insert mode bindings
inoremap <c-a>      <esc>^i
inoremap <c-e>      <end>
inoremap <c-h>      <left>
inoremap <c-j>      <down>
inoremap <c-k>      <up>
inoremap <c-l>      <right>
inoremap <c-u>      <esc>c$

inoremap <c-o>      <esc>o
inoremap <c-cr>     <esc>O
inoremap <s-cr>     <esc>:call append(line('.')-1, '')<cr>i

" make a new section
nnoremap <leader>u o<esc>^c$<esc>O

" split two lines
nmap K i<Enter>

" duplicate line
nmap <leader>j yyp

" use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap

" use ,d (or ,dd or ,dj or 20,dd) to delete a line without
" adding it to the yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" search / replace shortcut
nnoremap <leader>e :%s/

" folding
nnoremap <Space> za
vnoremap <Space> za

" nicer indentation
"nnoremap < <<
"nnoremap > >>
vnoremap < <gv
vnoremap > >gv
"vnoremap y ygv

" quick yanking to the end of the line
nmap Y y$

" fuzzy finding
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>m :CtrlPMRU<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

"nnoremap <leader>f :execute 'Unite' '-start-insert file_rec/async:'.unite#util#path2project_directory(getcwd())<cr>
"nnoremap <leader>m :Unite -start-insert file_mru<cr>
"nnoremap <leader>b :Unite -quick-match buffer<cr>
"nnoremap <leader>O :Unite -start-insert outline<cr>
"nnoremap <leader>g :Unite grep<cr>

" YankRing
nmap <leader>r :YRShow<CR>

" Syntastic
nmap <leader>c :SyntasticCheck<cr>

" Gundo
nnoremap <f4> :GundoToggle<cr>

" Ack
nmap <leader>a :Ack<space>

" Scratch
nmap <leader>S :Sscratch<cr>

" OS copy and paste
map <leader>p "+p
vnoremap <leader>y "+y

" reselect pasted text
nnoremap <leader>v V`]

" exit insert / visual mode
inoremap kj <esc>
vnoremap v <esc>

" vertical split
nnoremap <leader>w <C-w>v<C-w>l
" horizontal split
nnoremap <leader>q :sp<cr>

" navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <leader>gg :Git<space>
nmap <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gb :Gbrowse<cr>
nmap <leader>gbl :Gblame<cr>
nmap <leader>gm :Gmove<cr>
nmap <leader>gq :Gremove<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gr :Gread<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gp :Git push<cr>

nmap <leader>dead I1.8457939563e-314<esc>

vmap <leader>gg :Git<space>
vmap <leader>gs :Gstatus<cr>
vmap <leader>ge :Gedit<cr>
vmap <leader>gd :Gdiff<cr>
vmap <leader>gc :Gcommit<cr>
vmap <leader>gb :Gbrowse<cr>
vmap <leader>gbl :Gblame<cr>
vmap <leader>gm :Gmove<cr>
vmap <leader>gq :Gremove<cr>
vmap <leader>gl :Glog<cr>
vmap <leader>gr :Gread<cr>
vmap <leader>gw :Gwrite<cr>
vmap <leader>gp :Git push<cr>

" easy switching between windows
nnoremap <leader>t <c-w><c-w>

" save shortcut
nnoremap <leader>s :w<cr>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" prepare a TopCoder file
"nnoremap <leader>o :set expandtab shiftwidth=2 sts=2<cr>:%s/\t/  /<cr>:call RTrim()<cr>

compiler gcc
set errorformat^=%-G%f:%l:\ required\ from%m

" font shortcuts
command! Hifont set guifont=Consolas\ 16
command! Bigfont set guifont=Consolas\ 12
command! Smallfont set guifont=Monospace\ 9
command! Tinyfont set guifont=Terminus\ 8

""" powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

set spelllang=en_us

""" gitgutter

set updatetime=300

""" ccls

"if executable('ccls')
   "au User lsp_setup call lsp#register_server({
      "\ 'name': 'ccls',
      "\ 'cmd': {server_info->[&shell, &shellcmdflag, 'ccls -v=10 -log-file-append=/tmp/ccls.log']},
      "\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      "\ 'initialization_options': { 'cacheDirectory': '/home/niklas/ccls-cache' },
      "\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      "\ })
"endif

""" Ack/ag

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
