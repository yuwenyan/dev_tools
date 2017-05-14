"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author:
"					Leyuan Pan <leyuanpan@gmail.com>
"
" Version:
"					0.1 - 2016/09/01
"
" Comments:
"					This vimrc was created based on the amix version first developed by
"					Amir Salihefendic. The original amix version can be found here
"					<https://github.com/amix/vimrc>.
"
" Sections:
"					-> General
"					-> User interface
"					-> Colors and fonts
"					-> Files and backups
"					-> Text, tab and indent related
"					-> Visual mode related
"					-> Moving around, tabs and buffers
"					-> Status line
"					-> Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode.
set nocompatible

" Set how many lines of history VIM has to remember 
set history=999 

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set mapleader. With a map leader, it is possible to do extra key
" combinations, like <leader>w saves the current file
let mapleader=","
let g:mapleader=","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Set shell to be bash
if has("unix") || has("mac")
    set shell=bash
endif

set diffexpr=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertically using j/k
set so=7

" Turn on Wildmenu
set wildmenu

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Show line number
set number

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so that it acts as it should act
set backspace=eol,start,indent

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch
nnoremap <silent> <CR> :noh<CR><CR>

" Make search act like search in modern browsers
set incsearch

" Do not redraw while executing macros (good performance config)
set lazyredraw

" For regular expressoins, turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Turn off nice effect on status bar title
let performance_mode=1
let use_plugins_i_donot_use=0

" Have the mouse enabled all the time:
if exists("&mouse")
    set mouse=r
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

" Avoid garbled characters in Chinese language windows OS
"let $LANG='en'
"set langmenu=en
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

" Ignore compiled files
"set wildignore=*.o,*~,*.pyc
"if has("win16") || has("win32")
"	set wildignore+=.git\*,.hg\*,.svn\*
"else
"  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Colors, font and file format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Load all color schemes by SetColors
"SetColors all
"nmap <leader>9 :SetColors all

" Set color scheme
if has('gui_running')
    " GUI colors
    colorscheme gruvbox "desert, molokai, gruvbox
else
    " Non-GUI (terminal) colors
    colorscheme desert
endif


" Set background color
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Set font size
set guifont=Monospace\ 11

" Internationalization
if has("multi_byte")
	" Set bomb
  set fileencodings=utf-8,gb2312,cp936,big5,euc-jp,euc-kr,latin1
  " CJK environment detection and corresponding setting
  if v:lang =~ "^zh_CN"
    " Use cp936 to support GBK, euc-cn == gb2312
    set encoding=cp936
    set termencoding=cp936
    set fileencoding=cp936
  elseif v:lang =~ "^zh_TW"
    " cp950, big5 or euc-tw
    " Are they equal to each other?
    set encoding=big5
    set termencoding=big5
    set fileencoding=big5
  elseif v:lang =~ "^ko"
    " Copied from someone's dotfile, untested
    set encoding=euc-kr
    set termencoding=euc-kr
    set fileencoding=euc-kr
  elseif v:lang =~ "^ja_JP"
    " Copied from someone's dotfile, untested
    set encoding=euc-jp
    set termencoding=euc-jp
    set fileencoding=euc-jp
  endif
  " Detect UTF-8 locale, and replace CJK setting if needed
  if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
  endif
endif

"if you use vim in tty,
"'uxterm -cjk' or putty with option 'Treat CJK ambiguous characters as wide' on
if exists("&ambiwidth")
    set ambiwidth=double
endif

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=cheetah<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>

"Highlight current
if has("gui_running")
    if exists("&cursorline")
        set cursorline
    endif
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linebreak on 500 characters
set lbr
"set tw=500

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
"set softtabstop=4
set backspace=2

" Auto indent
set ai        

" Smart indent
set si

" Wrap line
set wrap

"C-style indenting
if has("cindent")
    set cindent
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevents automatic write backup before overwriting file
set nowb

" Turn backup on/off and set backup directory
"set nobackup
try
    set backupdir=~/.vim/runtime/backup
catch
endtry

" Turn swap on/off and set swap directory
"set noswapfile
try
    set directory=~/.vim/runtime/swap
catch
endtry

" Turn persistent undo on
" Means that you can undo even when you close a buffer/VIM
try
	set undodir=~/.vim/runtime/undo
	set undofile
catch
endtry

""""""""""""""""""""""""""""""
" -> Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
set statusline=\ %{HasPaste()}%F%m%r\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L\ \ Column:\ %c
"set statusline=
"set statusline+=%2*%-3.3n%0*\ " buffer number
"set statusline+=%f\ " file name
"set statusline+=%h%1*%m%r%w%0* " flags
"set statusline+=[
"set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&encoding}, " encoding
"set statusline+=%{&fileformat}] " file format
"if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
"    set statusline+=\ %{VimBuddy()} " vim buddy
"endif
"set statusline+=%= " right align
"set statusline+=%2*0x%-8B\ " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P " offset
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General Autocommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a"<esc>`<i"<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> For brackets auto-complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map auto complete of (, ", ', [
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General Abbrev
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Comment for C like language
if has("autocmd")
    au BufNewFile,BufRead *.js,*.htc,*.c,*.tmpl,*.css ino $c /**<cr> **/<esc>O
endif

"My information
ia xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
"iab xname Amir Salihefendic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
    let cwd=getcwd()
    return "e " . cwd
endfunc

func! DeleteTillSlash()
    let g:cmd=getcmdline()
    if has("unix") || has("mac")
        let g:cmd_edited=substitute(g:cmd, "(.*[/]).*", "", "")
    else
        let g:cmd_edited=substitute(g:cmd, "(.*[\]).*", "", "")
    endif
    if g:cmd == g:cmd_edited
        if MySys() == "unix" || MySys() == "mac"
            let g:cmd_edited=substitute(g:cmd, "(.*[/]).*/", "", "")
        else
            let g:cmd_edited=substitute(g:cmd, "(.*[\]).*[\]", "", "")
        endif
    endif
    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"cno $q <C->eDeleteTillSlash()<cr>
"cno $c e <C->eCurrentFileDir("e")<cr>
"cno $tc <C->eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cno <C-A> <Home>
cno <C-E> <End>
cno <C-K> <C-U>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Buffer related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast open a buffer by search for a name
"map <c-q> :sb

"Open a dummy buffer for paste
map <leader>q :e ~/buffer<cr>

"Restore cursor to file position in previous editing session
set viminfo='10,"100,:20,%,n~/.viminfo

" Buffer - reverse everything ... :)
map <F9> ggVGg?

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
if exists("&foldenable")
    set fen
endif

if exists("&foldlevel")
    set fdl=0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> change size of splitted windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-Left> :vertical resize -2
nmap <C-Right> :vertical resize +2
nmap <C-Up> :resize -2
nmap <C-Down> :resize +2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    au BufRead,BufNew *.vim map <buffer> <leader><space> :w!<cr>:source %<cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> HTML related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML entities - used by xml edit plugin
let xml_use_xhtml = 1
"let xml_no_auto_nesting = 1

" To HTML
let html_use_css = 0
let html_number_lines = 0
let use_xhtml = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M
noremap <leader>m :%s/\r//g<CR>

" Paste toggle - when pasting something in, don't indent.
"set pastetoggle=<F3>

" Remove indenting on empty line
map <F2> :%s/s*$//g<cr>:noh<cr>''

" Super paste
"ino <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

" clipboard with xclip
if has("unix")
    vmap <F6> :!xclip -sel c<CR>
    map <F7> :-1r!xclip -o -seln c<CR>'z
endif

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" Function to determine the OS type
function! MySys()
	if has("win16") || has("win32")
		return "windows"
	elseif has("linux")
		return "linux"
	elseif has("unix")
		return "unix"
	elseif has("mac")
		return "mac"
	else
		return ""
	endif
endfunction

