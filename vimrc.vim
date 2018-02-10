" #######################################################################
" Created        :     Oct. 15, 2017
" Modified       :     Sat Feb 10 09:54:06 PST 2018
" NOTE:    a singe vimrc file for easy tracking and sync
"
" Index:
"       === Quick Setting
"       ??? Key mapping ref
"       ### General
"       ### Plugin:
"                  1 NERDTree
"                  2 GtagsCscope
"                  3 ctrlp
"                  4 tagbar
"                  5 vim-signature
"                  6 vim-syntax-extra
"                  7 YouCompleteMe
"                  8 Colorschemes
"                  9 Airline (themes, powerline fonts)
"                 10 nerdcommenter
"                 11 indentLine
" #######################################################################
" ===== Quick Setting =====
execute pathogen#infect()
call pathogen#helptags()
syntax enable
syntax on
filetype plugin indent on

" === Set color scheme:
" desert, molokai, gruvbox, colorsbox-material, herald, pacific, lucius, ||torte
if has('gui_running')
    colorscheme colorsbox-material
else
    set t_Co=256
    colorscheme lucius
endif
set background=dark
let g:airline_theme='bubblegum'

" === tab and space
" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set backspace=2

" === Wrap line
set wrap

" ??? Key mapping ref
" ------------------------------------------------------------------------------------------------
let mapleader=","                            " e.g., <leader>w to save file
let g:mapleader=","
let g:ctrlp_map = '<c-p>'                    " CtrlP
" Map <Space>/C-<Space> to search
map <space> /
" Spell checking
map <leader>ss :setlocal spell!<cr>

""" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
""" Let 'tl' toggle between current and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
""" Change window size
nmap <C-Left> :vertical resize -2
nmap <C-Right> :vertical resize +2
nmap <C-Up> :resize -2
nmap <C-Down> :resize +2
"Open a dummy buffer for paste
map <leader>q :e ~/buffer<cr>

map <C-b> :NERDTreeToggle<CR>
map <F9> :TagbarToggle<CR>
" airline buffer
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
""" Buffers
map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>

" Compile:KEY
map <F5> :call CompileRunGcc()<CR>

" ### General
" ------------------------------------------------------------------------------------------------
set history=500                  " Lines of history to remember
set so=7                         " Lines to the curors
set encoding=utf8
set guifont=Monospace\ 11        " Font size

set autoread                     " Auto read changed file
set nocompatible                 " Not VI's compatible mode
set wildmenu                     " Turn on Wildmenu
set ruler                        " Show current position
set cmdheight=2                  " Height of the command bar
set number                       " Show line number
set hid                          " Hide abandoned buf
set backspace=eol,start,indent   " Normal backspace
set whichwrap+=<,>,h,l
set ignorecase                   " case insensitive search
set smartcase

let performance_mode=1           " No nice effect on status bar title
let use_plugins_i_donot_use=0
set laststatus=2                 " Always show the status line

set hlsearch                     " Highlight search
set incsearch
nnoremap <silent> <CR> :noh<CR><CR>
set ai                           " Auto indent
set si                           " Smart indent

set lazyredraw                   " No redraw (performance)
set magic                        " For regular expressoins
set showmatch                    " Show matching brackets
set mat=2                        " tenths of a second show matching
set foldcolumn=1                 " Left margin

set nowb                         " No automatic write backup
set noerrorbells                 " No error sound
set novisualbell
set t_vb=
set tm=500

" Return to last edit position when opening files
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" special statusbar for special windows
if has("autocmd")
	au FileType qf
				\ if &buftype == "quickfix" |
				\ setlocal statusline=%2*%-3.3n%0* |
				\ setlocal statusline+=\ \[Compiler\ Messages\] |
				\ setlocal statusline+=%=%2*\ %<%P |
				\ endif

	fun! FixMiniBufExplorerTitle()
		if "-MiniBufExplorer-" == bufname("%")
			setlocal statusline=%2*%-3.3n%0*
			setlocal statusline+=\[Buffers\]
			setlocal statusline+=%=%2*\ %<%P
		endif
	endfun

	au BufWinEnter *
				\ let oldwinnr=winnr() |
				\ windo call FixMiniBufExplorerTitle() |
				\ exec oldwinnr . " wincmd w"
endif

" Nice window title
if has('title') && (has('gui_running') || &title)
	set titlestring=
	set titlestring+=%f\ " file name
	set titlestring+=%h%m%r%w " flags
	set titlestring+=\ -\ %{v:progname} " program name
endif

set wildignore=*.o,*~,*.pyc      " Ignored files
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Have the mouse enabled all the time:
if exists("&mouse")
    set mouse=r
endif

" apply the changes of vimrc immediately
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Set shell to be bash
if has("unix") || has("mac")
    set shell=bash
endif

" Allow color schemes to do bright colors without forcing bold.
" (sensible.vim)
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
    set t_Co=16
endif

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set t_Co=256
    set guitablabel=%M\ %t
endif

if has("gui_running")
    set lines=999 columns=999
else
    if exists("+lines")
        set lines=50
    endif
    if exists("+columns")
        set columns=100
    endif
endif

"C-style indenting
if has("cindent")
    set cindent
endif

"Comment for C like language
if has("autocmd")
    au BufNewFile,BufRead *.js,*.htc,*.c,*.tmpl,*.css ino $c /**<cr> **/<esc>O
endif

""" Parenthesis/bracket
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

""" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

""" functions
func! Cwd()
    let cwd=getcwd()
    return "e " . cwd
endfunc

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
           exec "!gcc % -DLOCAL -o   %<"
           exec "!time ./%<"
        elseif &filetype == 'cpp'
           exec "!g++ % -std=c++11 -DLOCAL -Dxiaoai -o    %<"
           exec "!time ./%<"
        endif
endfunc

" ### Plugin
" ------------------------------------------------------------------------------------------------
" ===== NERDTree ====
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos = "left" "where NERD tree window is placed on the screen
"let NERDTreeWinSize = 31 "size of the NERD tree
"close the nerdtree if it is the only tab left in the window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ===== GtagsCscope =====
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Ignore_Case = 1
let GtagsCscope_Auto_Load = 1
set cscopetag

" ===== tagbar =====
let g:tagbar_autofocus = 1

" ===== Airline =====
let g:airline_section_c = '%f'
" airline fonts
let g:airline_powerline_fonts = 0
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11  " config font for gvim
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" buffer
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" ===== indentLine =====
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceChar = '.'

" ------------------------------------------------------------------------------------------------

