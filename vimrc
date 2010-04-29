" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))

" Make , the personal leader key
let mapleader = ","
let maplocalleader = ","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Make ' more useful, swap it with `
nnoremap ' `
nnoremap ` '

set backup                   " keep a backup file
set hidden                   " Allow Vim to manage hidden buffers effectively
set history=500              " keep 500 lines of command line history
set ruler                    " show the cursor position all the time
set showcmd                  " display incomplete commands
set incsearch                " do incremental searching
set number                   " show line numbers

runtime macros/matchit.vim   " Enable extended % matching

filetype on                  " detect the type of file
filetype indent on           " Enable filetype-specific indenting
filetype plugin on           " Enable filetype-specific plugins

set cf                       " enable error files and error jumping
set ffs=unix,dos,mac         " support all three, in this order
set viminfo+=!               " make sure it can save viminfo
set isk+=_,$,@,%,#,-         " none of these should be word dividers, so make them not be
set title                    " show title in xterm

" Make completion useful
set wildmenu

" Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" make /-style searches case-sensitive only if there is a capital letter in the search expression
set ignorecase
set smartcase

set scrolloff=3              " Start scrolling 3 lines before the border

" Sane searching
set hlsearch                 " Hilight search term
set incsearch                " ... dynamically as they are typed
" turn of hlsearch temporarily
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Make trailing whitespace visible with ,s
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

set autoread                 " Automatically reread files that have been changed externally

" Make ^e and ^y scroll 3 lines instead of 1
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" shorten command-line text and other info tokens (see :help shortmess)
set shortmess=atI

" Only use one space after ., ? or ! with a join command
set nojoinspaces

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark          " we are using a dark background
syntax on                    " syntax highlighting on
if has('gui_running')
  colorscheme xoria256
else
  colorscheme asmdev
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set backup                  " make backup file
" where to put backup file
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" directory is the directory for temp file
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set makeef=error.err         " When using make, where should it dump the file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fo=tcrqn                 " See Help (complex)
set autoindent               " autoindent
set nosmartindent            " smartindent
set cindent                  " do c-style indenting
"set tabstop=2               " tab spacing (settings below are just to unify it)
set softtabstop=2            " unify
set shiftwidth=2             " unify
set expandtab                " use spaces instead of tabs
"set nowrap                  " do not wrap lines
set smarttab                 " use tabs at the start of a line, spaces elsewhere

" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"    Enable folding, but by default make it act like folding is off, because folding is
"    annoying in anything but a few rare cases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable               " Turn on folding
"set foldmethod=indent       " Make folding indent sensitive
set foldmethod=marker        " 
set foldlevel=100            " Don't autofold anything (but I can still fold manually)
"set foldopen-=search        " don't open folds when you search into them
"set foldopen-=undo          " don't open folds when you undo stuff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Encoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set encoding="utf8"         " We always want utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Instead of having to press 'ctrl-w h' to move to the window to the left, just press ctrl-h,
" etc.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable OmniCompletion for Ruby
autocmd FileType ruby set omnifunc=rubycomplete#Complete
" ... and Rails
autocmd FileType ruby let g:rubycomplete_rails = 1
" ... and to include Classes in global completions
autocmd FileType ruby let g:rubycomplete_classes_in_global = 1

" Syntax highlight shell scripts as per POSIX,
" not the original Bourne shell which very few use
let g:is_posix = 1

" bind control-l to hashrocket
imap <C-l> <Space>=><Space>

" Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

" allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x
vnoremap X "_X

" don't move the cursor after pasting
" (by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[

" Config for Clojure
let g:clj_highlight_builtins = 1            " Hilight builtin functions
let g:clj_highlight_contrib = 1             " Hilight contrib functions
let g:clj_paren_rainbow = 1                 " Hilight different levels of parens differently
" let vimclojure#NailgunClient = "~/bin/ng" " Tell VimClojure where it can find the NailGun client
let g:clj_want_gorilla = 1                  " Enable interactive mode

" NERD_Tree support
map <Leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set gfn=Inconsolata:h13.00
"set gfn=Monaco:h10.00

" Hide the menu bar
set guioptions-=T

set ch=2                     " Make command line two lines high

set mousehide                " Hide the mouse when typing text

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim specific stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_macvim")
  " bind command-] to shift right
  nmap <D-]> >>
  vmap <D-]> >>
  imap <D-]> <C-O>>>

  " bind command-[ to shift left
  nmap <D-[> <<
  vmap <D-[> <<
  imap <D-[> <C-O><<

  " open tabs with command-<tab number>
  map <D-S-]> gt
  map <D-S-[> gT
  map <D-1> 1gt
  map <D-2> 2gt
  map <D-3> 3gt
  map <D-4> 4gt
  map <D-5> 5gt
  map <D-6> 6gt
  map <D-7> 7gt
  map <D-8> 8gt
  map <D-9> 9gt
  map <D-0> :tablast<CR>

  " Enable default OS X shift-movement/replacement behavior
  let macvim_hig_shift_movement = 1

  " Return focus to previous window when MacVim window is closed
  au VimLeave * maca hide:
endif