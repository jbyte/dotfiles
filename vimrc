set nocompatible
"set runtimepath='$HOME/'

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 1. plugin on github:
" Plugin 'user/repo'
" --------------------
" 2. plugin from http://vim-scripts.org/vim/scripts.html:
" Plugin 'plugin name'
" --------------------
" 3. git plugin not hosted on github:
" Plugin 'git://git-host.tld/repo.git'
" --------------------
" 4. git repos on your machine (i.e. when working on your own plugin):
" Plugin 'file:///home/path/to/plugin'
" --------------------
" 5. vim script in a subdirectory of Vundel.vim called vim:
" Plugin 'user/repo', {'rtp','vim/'}
" --------------------
" 6. install and avoid naming conflicts if you've already installed a
" different version somewhere else:
" Plugin 'user/repo', {'name': 'newName'}

Plugin 'ctrlpvim/ctrlp.vim'				" fuzzy search
Plugin 'scrooloose/nerdcommenter'		" easy commenting
Plugin 'vim-airline/vim-airline'		" fancy status line
Plugin 'bling/vim-bufferline'			" buffer list in status line
Plugin 'vim-airline/vim-airline-themes'	" status line themes
"Plugin 'ervandew/supertab'				" use tab for autocompletion
"Plugin 'scrooloose/nerdtree' 			" filesystem explorer
Plugin 'tpope/vim-fugitive' 			" git wrapper
"Plugin 'airblade/vim-gitgutter' 		" git diff in the sign column
Plugin 'tpope/vim-surround' 			" surround things with shit
"Plugin 'vim-scripts/AutoComplPop'		" autocompletion
"Plugin 'valloric/youcompleteme'         " autocompletion
Plugin 'msanders/snipmate.vim'          " code snippets
Plugin 'flazz/vim-colorscheme'          " color schemes


" Brief help:
" :PluginList			- lists configured plugins
" :PluginInstall		- installs plugins; append '!' to update or just :PluginUpdate
" :PluginSearch foo		- searches for foo; append '!' to refresh cache
" :PluginClean			- confirms removal of unused plugins; append '!' to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" all of your plugins must be added before this line
call vundle#end()
filetype plugin indent on
filetype plugin on

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin

" settings for CtrlP
" ------------------------------------------
" default mapping/command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" default working directory
let g:ctrlp_working_path_mode = 'rac'
" exclude files using vim's wildignore
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pdf,*.bak,*.pyc,*.class,*.o,*.gz
" exclude files unsing CtrlP's own g:ctrlp_custom_ignore
" (if a custom listing command is being used, excusions are ignored)
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" -------------------------------------------

" settings for bufferline
let g:bufferline_echo = 0

" settings for airline
set laststatus=2
set ttimeoutlen=50
"set guifont=Droid_Sans_Mono_Slashed_for_Powerline:h10
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_theme = 'lucius'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
"let g:airline_left_sep = '>>'
"let g:airline_left_alt_sep = '>'
"let g:airline_right_sep = '<<'
"let g:airline_right_alt_sep = '<'
"let g:airline_symbols.branch = 'B'
"let g:airline_symbols.readonly = 'RO'
"let g:airline_symbols.linenr = 'L'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>

" ene par uporabnih nastavitev
let mapleader=","
"colorscheme torte
colorscheme badwolf
"set mouse=
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set autoindent
set smartindent
set copyindent
set shiftround
set showmatch
set ignorecase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set wildmenu
set cmdheight=2
"set lazyredraw
set magic
"set guicursor=n-v-c:block-Cursor
set mat=2
set background=light
set foldenable
set foldlevelstart=7
set foldnestmax=10
set foldmethod=indent
set cursorline
set ff=unix
set cpoptions+=$

syntax enable

" omnifunc settings
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType java set omnifunc=javacomplete#Complete

nnoremap <Space> za
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>

try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

autocmd BufReadPost *
  \ if line("'\"")>0 && line("'\"") <= line("$") |
  \ 	exe "normal! g`\"" |
  \ endif
set viminfo^=%

" remove trailing whitespace on write (for c,c++,java,php,python files)
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> :%s/\s\+$//e
" shortcut for retab!
map <leader>rt : retab!<CR>

" ene par 'shortcutov' za urejanje tega file-a
nmap <silent> <leader>ev :e $HOME/_vimrc<CR>
"nmap <silent> <leader>ev :e /c/users/jaka vute/_vimrc<CR>
nmap <silent> <leader>sv :so $MYVIMRC<cr>


"zacetne nastavitve za line number in funkcija za togglat abs/rel line number
"+ insert mode vedno abs!!!
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
    set number
  endif
endfunction

set relativenumber number
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set number relativenumber

" par nastavitev za setvilcenje vrstic
highlight LineNr term=bold cterm=bold ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr term=NONE cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=Red guibg=NONE
highlight Comment term=NONE cterm=bold ctermfg=Green
highlight Search term=NONE cterm=bold ctermbg=Red

" cursor highlighting
highlight Cursor ctermfg=White ctermbg=Black
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" oznac ko gres preko dolocene dolzine znakov v vrstici
highlight ColorColumn ctermbg=LightRed
call matchadd('ColorColumn','\%101v',100)

" oznaci trenutno vrstico - visual mode
highlight Visual ctermfg=Black ctermbg=DarkYellow

" oznaci trnutno vrstico
highlight CursorLine term=bold cterm=standout ctermbg=17
highlight Cursor cterm=none ctermbg=White ctermfg=Black

"auto-save on focus lost
:au FocusLost * silent! wa

" match paranthesis/brackets
set showmatch

" se ene par random zadevc k znajo pomagar
set scrolloff=7

nnoremap <C-c> :noh<cr>

" toggle invisible characters (tab, EOL)
nmap <leader>l :set list!<CR>
" highlighting the invisible characters
hi NonText ctermfg=DarkGrey
hi SpecialKey ctermfg=DarkGrey

" remap-i za premikanje po splitih
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
