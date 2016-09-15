""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MIT License
"
" Copyright (c) 2016 Jaka Vute
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE."
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS (currently managed by vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
" - CtrlP settings
" - Airline settings
" - Syntastic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENVIRONMENT/EDITOR SETTINGS
" - set ...
" - autocmd ...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
" - mappings
" - normal mode mappings
" - insert mode mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HIGHLIGHTING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MYDIFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
"set runtimepath='$HOME/.vim/'

" automatcly load vim-plug if non-existent
if empty(glob('$HOME/.vim/autoload/plug.vim'))
    silent !sudo curl -fLo $HOME./vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" VIM-PLUG PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('$HOME/.vim/bundle/')

Plug 'ctrlpvim/ctrlp.vim'                 " fuzzy search
Plug 'scrooloose/nerdcommenter'           " easy commenting
Plug 'vim-airline/vim-airline'            " fancy status line
Plug 'vim-airline/vim-airline-themes'     " status line themes
Plug 'tpope/vim-fugitive'                 " git wrapper
Plug 'tpope/vim-surround'                 " surround things with shit
Plug 'msanders/snipmate.vim'              " code snippets
Plug 'flazz/vim-colorschemes'             " color schemes
Plug 'mhinz/vim-signify'                  " hunks
Plug 'rust-lang/rust.vim'                 " rust filetype detection, syntax highlighting, ...
Plug 'derekwyatt/vim-scala'               " scala filetype detection, syntax highlighting, ...
Plug 'rakr/vim-one'                       " one colorscheme
Plug 'gummesson/stereokai.vim'            " stereokai colorscheme
Plug 'scrooloose/syntastic'               " syntax checking
Plug 'KabbAmine/zeavim.vim', {'on': [
            \ 'Zeavim',
            \ '<Plug>Zeavim',
            \ '<Plug>ZVVisSelection',
            \ '<Plug>ZVKeyDocset',
            \ '<Plug>ZVMotion'
            \ ]}
Plug 'jwalton512/vim-blade'               " blade syntax, indent, ftdetect, ...
Plug 'othree/html5.vim'                   " html5 syntax and omnicompletion
Plug 'hsanson/vim-android'                " gradle things

"Plugin 'majutsushi/tagbar'                 " tags son
"Plugin 'vim-scripts/AutoComplPop'          " autocompletion
"Plugin 'valloric/youcompleteme'            " autocompletion
"Plugin 'airblade/vim-gitgutter'            " git diff in the sign column
"Plugin 'ervandew/supertab'                 " use tab for autocompletion
"Plugin 'scrooloose/nerdtree'               " filesystem explorer
"Plugin 'bling/vim-bufferline'              " buffer list in status line

call plug#end()

" PLUGIN SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings for airline
set laststatus=2
set ttimeoutlen=50
"set guifont=Droid_Sans_Mono_Slashed_for_Powerline:h10
set encoding=utf-8
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'lucius'
"let g:airline_theme = 'base16color'

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

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ENVIRONMENT/EDITOR SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - set ...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set mapleader
let mapleader=","
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
" work on windows
"behave mswin

" set netrw line numbers
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

" omni complete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
"autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
" set complete when spellchecking is enabled
set complete=.,w,b,u,t,i,kspell
syntax enable
" default dark background
"set background=dark
colorscheme badwolf

" gVim settings
if has('gui_running')
    colorscheme one
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
    let g:airline_theme = 'one'
endif

" dont wrap long lines
set nowrap
" use spaces when using the tab key
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" indent settings
set autoindent
set smartindent
set copyindent

set shiftround
set showmatch
" ignore case with search
set ignorecase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set title
" enable epilepsy on error
set visualbell
" disable defening sound on error
set noerrorbells
" command line <tab> autocmpletion
set wildmenu
set wildchar=<TAB>
set wildmode=list:longest,full
" two line command line
set cmdheight=2
set lazyredraw
" ???
set magic
set mat=2
" default fold settings
set foldenable
set foldlevelstart=1
set foldnestmax=10
set foldmethod=indent
" different highlight in cursor line
set cursorline
" set unix style line endings (LF not CRLF)
set ff=unix
set cpoptions+=$
" split window opening settings
set splitright
set splitbelow
" line numbering setting
set relativenumber number
set viminfo^=%
set scrolloff=7

" set netwr default view as tree
let g:netrw_liststyle= 1

" buffer switching settings
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - autocmd ...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" when opening a file sets cursor at the position where you closed it or at
" the start if first time opening
autocmd BufReadPost *
  \ if line("'\"")>0 && line("'\"") <= line("$") |
  \     exe "normal! g`\"" |
  \ endif

" set relative line number in normal mode and absolute in insert mode
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set number relativenumber

"auto-save on focus lost
:au FocusLost * silent! wa

" remove trailing whitespace on write (for c,c++,java,php,python files)
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> :%s/\s\+$//e
"autocmd BufRead,BufNewFile *.php set ft=php.html
"autocmd BufRead,BufNewFile *.blade.php set ft=blade.php.html
"autocmd BufRead,BufNewFile *.blade.php let b:syntastic_disabled_tiletypes=['html']

" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" shortcut for retab!
map <leader>rt : retab!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - normal mode mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" extra mapping for CtrlP
nnoremap <leader>b :CtrlPBuffer<CR>
" toggle uppercase on word
nnoremap <leader>u mmg~iw`m

" make Y bahave like D and C
nnoremap Y y$

" map enter key to make a new line in normal mode
nnoremap <CR> o<ESC>

nnoremap <Space> za
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap K i<CR><ESC>
nnoremap _ :Explore<CR>
nnoremap <leader>ds :Hexplore<CR>
nnoremap <leader>dv :Vexplore<CR>
nnoremap <leader>dt :Texplore<CR>

" toggle spell checking
nmap <silent> <leader>s :set spell!<CR>

" ene par 'shortcutov' za urejanje tega file-a
nmap <silent> <leader>ev :e $HOME/.vimrc<CR>
"nmap <silent> <leader>ev :e /c/users/jaka vute/_vimrc<CR>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

"nnoremap <C-c> :noh<cr>

nnoremap <leader>Z :Zeavim<CR>
" toggle invisible characters (tab, EOL)
nmap <leader>l :set list!<CR>

" remap for changing windows/splits
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - insert mode mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable arrow keys
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>

" HIGHLIGHTING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" par nastavitev za setvilcenje vrstic
highlight LineNr term=bold cterm=bold ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr term=NONE cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=Red guibg=NONE
"highlight Comment term=NONE cterm=bold ctermfg=Green
highlight Search term=NONE cterm=bold ctermbg=Red

" color if column exceeds 100 characters
highlight ColorColumn ctermbg=LightRed guibg=Red guifg=Black
call matchadd('ColorColumn','\%101v',100)

" oznaci trenutno vrstico - visual mode
highlight Visual ctermfg=Black ctermbg=DarkYellow

" highlight spell checking
highlight clear SpellBad
highlight SpellBad cterm=bold ctermbg=White ctermfg=Red gui=undercurl


" highlighting the invisible characters
hi NonText ctermfg=DarkGrey
hi SpecialKey ctermfg=DarkGrey


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: move to the mapping part of the vimrc
nnoremap <leader>gg :call Getter()<CR>
nnoremap <leader>ss :call Setter()<CR>
vnoremap <leader>gg :call Getter()<CR>
vnoremap <leader>ss :call Setter()<CR>

function! Getter()
    call GetSet('get')
endfunction

function! Setter()
    call GetSet('set')
endfunction

" TODO: better function name
function! GetSet(getset)
    if &filetype == 'java'
        let l:pos = getpos('.')

        let l:id = GetId()
        let l:type = GetType()
        let l:paste = GetPaste()
        if a:getset == 'get'
            let l:stmt = 'return ' . l:id . ';'
            let l:arg = ''
        else
            let l:stmt = 'this.' . l:id . ' = ' . l:id . ';'
            let l:arg = l:type . ' ' . l:id
        endif

        if a:getset == 'get'
            let l:paste = substitute(l:paste, '%type', l:type, '')
        else
            let l:paste = substitute(l:paste, '%type', 'void', '')
        endif
        let l:paste = substitute(l:paste, '%id', a:getset . toupper(l:id[0]) . l:id[1:], '')
        let l:paste = substitute(l:paste, '%arg', l:arg, '')
        let l:paste = substitute(l:paste, '%stmt', l:stmt, '')

        call PrintStmt(l:paste)

        call setpos('.', l:pos)
    endif
endfunction

function! GetId()
    normal! ^f;B
    return expand('<cword>')
endfunction

function! GetType()
    normal! ^f;gE
    return expand('<cword>')
endfunction

function! GetPaste()
    return "\npublic %type %id(%arg){\n%stmt\n}"
endfunction

function! PrintStmt(stmt)
    let @t = a:stmt

    call search('class')
    normal! $%O
    normal! "tp

    normal! =G
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
    "let cmd = $VIMRUNTIME . '\diff'
    let cmd = '/usr/bin/diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
