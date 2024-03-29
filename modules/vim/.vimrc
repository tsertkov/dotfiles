"
" ~/.vimrc
"

scriptencoding utf-8
set encoding=utf-8

" Plugin
call plug#begin()
Plug 'tomtom/tcomment_vim'
Plug 'ervandew/supertab'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Jump back to the last position when opening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Theme
colorscheme slate

" Scrolling
set scrolloff=3
set sidescroll=3

" Read file when modified outside Vim
set autoread

" Do not keep any history
" set viminfo='0,:0,<0,@0,f0
set nobackup
set nowb
set noswapfile

" Allow backspacing over everything in INSERT mode
set backspace=indent,eol,start

" Show ruler and command visual aid
set ruler
set showcmd

" Disable bells
set noerrorbells
set visualbell
set t_vb=

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in INSERT mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" General
set colorcolumn=80        " visual indicator of column
set cursorline            " visual indicator of current line
set nowrap                " disable word wrap
set showmatch             " show bracket matches
"set completeopt-=preview  " dont show preview window
"set laststatus=2          " always show status line
"set lazyredraw            " don't update screen when executing macros
"set textwidth=0           " don't break lines after some maximum width
"set ttyfast               " increase chars sent to screen for redrawing
"set title                 " use filename in window title

" Folding
set foldignore=           " don't ignore anything when folding
set foldlevelstart=99     " no folds closed on open
set foldmethod=indent     " collapse code using indent levels
set foldnestmax=20        " limit max folds for indent and syntax methods

" Tabs
set autoindent            " copy indent from previous line
set expandtab             " replace tabs with spaces
set shiftwidth=2          " spaces for autoindenting
set smarttab              " <BS> removes shiftwidth worth of spaces
set softtabstop=2         " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2             " spaces for <Tab>

" Indent
set ai
set si

" Show line number and listchars
set list
set nu
set relativenumber

" Searches
set hlsearch              " highlight search results
set incsearch             " search whilst typing
set ignorecase            " case insensitive searching
set smartcase             " override ignorecase if upper case typed

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=30
let g:netrw_home='~/.cache/vim'

" Set default vertical split to right
set splitright

" Colours
set t_Co=256
set background=dark
highlight ColorColumn ctermbg=236
highlight CursorLine ctermbg=238 cterm=none
highlight CursorLineNr ctermbg=238 cterm=none

" Map Ctrl+[hjkl] to navigate windows vim style
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" Map Ctrl+[arrow] to navigate windows`
nnoremap <silent> <C-Left> <C-w>h
nnoremap <silent> <C-Down> <C-w>j
nnoremap <silent> <C-Up> <C-w>k
nnoremap <silent> <C-Right> <C-w>l

" Increase/descrease window split size
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Pageup/down will scroll half-page and center the current line on the screen
nnoremap <silent> <PageUp> <C-U>zz
vnoremap <silent> <PageUp> <C-U>zz
inoremap <silent> <PageUp> <C-O><C-U><C-O>zz

nnoremap <silent> <PageDown> <C-D>zz
vnoremap <silent> <PageDown> <C-D>zz
inoremap <silent> <PageDown> <C-O><C-D><C-O>zz

" F2 to remove all trailing whitespace
nnoremap <silent> <F2> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

let mapleader=","

" Quick exit
nmap <leader>q :q<CR>
nmap <leader>Q :q!<CR>

" Open netrw filebrowser in current window, with current file selected
nmap <leader>e :e .<CR>
nmap <leader>e :Lexplore .<CR>

" Rotate windows
nmap <leader>r <C-w>r

" Quick save the current file
nmap <leader>w :w<CR>
nmap <leader>W :w !sudo tee % >/dev/null<CR>

" Clear search highlights
nmap <silent> <leader><space> :noh<CR>

" Toggle show hidden files in netrw
nmap <leader>. gh

" Copy to OSX CLIPBOARD
vnoremap <leader>c "*y

" Tab indent
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Commend with CMD+-
nmap ¯ gcc
nmap <leader>/ gcc

" Mark line
nnoremap <silent> <leader>m :exe "let m = matchadd('WildMenu','\\%" . line('.') . "l')"<CR>

" Toggle cursorline
nmap <leader>k :set cursorline!<CR>

" Faster substitute.
nnoremap <leader>S :%s//<left>

" Tab Navigation --------------------------------------------------------- {{{

" Easily create a new tab.
map <Leader>tt :tabnew<CR>

" Easily close a tab.
map <Leader>tc :tabclose<CR>

" Easily move a tab.
noremap <Leader>tm :tabmove<CR>

" Easily go to next tab.
noremap <Leader>tn :tabnext<CR>

" Easily go to previous tab.
noremap <Leader>tp :tabprevious<CR>

" }}}

" vimdiff display
if &diff
  set diffopt=filler,foldcolumn:0
endif

" Show invisibles
set listchars=tab:\ \ ,trail:·
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Toggle whitespace chars visility
nmap <leader>; :call CycleWhitespace()<CR>
let g:show_whitespace = 0
function! CycleWhitespace()
  if g:show_whitespace
    let g:show_whitespace = 0
    set listchars=tab:\ \ ,trail:·
  else
    let g:show_whitespace = 1
    set listchars=eol:¬,tab:▸\ ,trail:·
  endif
endfunc

" Toggle/cycle line number modes
nmap <leader>l :call CycleLineNumbers()<CR>

function! CycleLineNumbers()
  if (&number == 1 && &relativenumber == 0)
    set relativenumber
  else
    if (&relativenumber == 1 && &number == 1)
      set norelativenumber
      set nonumber
    else
      set number
      set norelativenumber
    endif
  endif
endfunc

