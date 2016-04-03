" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>

" Pathogen setup
execute pathogen#infect()

syntax on 
filetype plugin indent on

" Line width convention
set colorcolumn=80
set colorcolumn=+1
highlight ColorColumn ctermbg=9

syn match tab display "\t"
hi link tab Error

set number
set autoread
set hidden
set ttyfast
set showmatch
set incsearch
set hlsearch
" case insensitive when matching files.
set ignorecase
" case sensitive if search string has cap letters
set smartcase
set mousehide "hide mouse while typing
set wildmode=list:full
set nu

" always show status line
set laststatus=2 showmode

set scrolloff=5               " scroll offsett, min lines above/below cursor
set scrolljump=5              " jump 5 lines when running out of the screen
set sidescroll=10             " minumum columns to scroll horizontally
set showmatch                 " flashes matching paren when one is typed
set showcmd                   " show command status
set ruler                     " show cursor position

" code folding
set nofen
set foldmethod=indent         " indent based folding

set copyindent " copy previous indent when audo indenting
set shiftround
set autoindent

" make split windows easier to navigate
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-m> <C-w>_

" nice backspacing
set bs=2

" saner up/down movement (screen-wise, not line-wise)
nmap j gj
nmap k gk

" Vi mode escape timeout
set timeoutlen=1000 ttimeoutlen=0

" Syntastic settings

let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_messages = { "type": "style" }

