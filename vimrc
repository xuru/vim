"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------
" 
" Keys...
" map <F2> to toggle NERDTree window
" map <F7> to run flake8 when in python code

" Get pathogen up and running
call pathogen#infect('~/.vim/bundle')
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

let g:Powerline_symbols = 'fancy'

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

syntax on
set background=dark						" I use dark background
:colorscheme zenburn
set enc=utf-8

" GUI options (only in effect when running in a GUI).
if has("gui_running")
    set guifont=Liberation_Mono:h11

    " Set Gui Options
    set guioptions=a

    " Set up the gui cursor to look nice
    set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

    " Add MacVim shift-movement
    let macvim_hig_shift_movement = 1

    " A itzy-bitzy amount of transparency
    set transparency=4
    
    " Anti-aliasing is niiiice
    set antialias
endif


" set 80 caracter line
"set colorcolumn=80
" set the search scan to wrap lines
set wrapscan

" I'm happy to type the case of things.  I tried the ignorecase, smartcase
" thing but it just wasn't working out for me
set noignorecase

" Make command line two lines high
set ch=1

" set visual bell
"set vb

" Disable visualbell and bell
set visualbell t_vb=

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Show the current mode
set showmode

" Switch on syntax highlighting
syntax on

" Hide the mouse pointer while typing
set mousehide

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=block

" Make the command-line completion better
set wildmenu

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
set textwidth=80

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

set grepprg=grep\ -nH\ $*

" System default for mappings is now the "," charater
let mapleader = ","

" Jump commands...
map <F3> g
map <F4> 

map <leader>j j
map <leader>k k
map <leader>h h
map <leader>l l

"----------------
" Command-T stuff
" ----------------
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>
set wildignore=*.pyc,*~

"-----------------------
" NERDTree configuration
"-----------------------

" Increase window size to 35 columns
let NERDTreeWinSize=35

" map <F2> to toggle NERDTree window
nmap <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\env','\.vim$', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '^dist$', '^build$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeHightlightCursorline=1

"-------------------
" Chef
" ------------------
au BufNewFile,BufRead */*cookbooks/*  call s:SetupChef()
function! s:SetupChef()
    " Mouse:
    " Left mouse click to GO!
    nnoremap <buffer> <silent> <2-LeftMouse> :<C-u>ChefFindAny<CR>
    " Right mouse click to Back!
    nnoremap <buffer> <silent> <RightMouse> <C-o>

    " Keyboard:
    nnoremap <buffer> <silent> <M-a>      :<C-u>ChefFindAny<CR>
    nnoremap <buffer> <silent> <M-f>      :<C-u>ChefFindAnySplit<CR>
endfunction

"-------------------
" Autocommands (all)
" ------------------
if has("autocmd")
    " In all files, try to jump back to the last spot cursor was in before exiting
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
    " don't fold vim files
    autocmd FileType vim set nofoldenable

    " Re-load vimrc file when you save
    "au BufWritePost ~/.vimrc :source ~/.vimrc
    "au BufWritePost ~/.gvimrc :source ~/.gvimrc
endif
