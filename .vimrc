" Automatically install vim plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'edkolev/tmuxline.vim'
Plug 'w0rp/ale'
Plug 'mhinz/vim-signify'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

set nocompatible

" Dates/Times 
imap \date  <C-R>=strftime("%d %B %Y")<CR>
imap \time  <C-R>=strftime("%H%M")<CR>
imap \st    StartTime: <C-R>=strftime("%H%M")<CR>
imap \et    EndTime: <C-R>=strftime("%H%M")<CR>
imap \ymd	<C-R>=strftime("%Y%m%d")<CR>

" Other
nnoremap <CR> :noh<CR><CR>

syntax on 
filetype on 
filetype plugin indent on " show existing tab with 4 spaces width

" code folding
set nofen
set foldmethod=indent         " indent based folding

set copyindent " copy previous indent when audo indenting
set shiftround
set autoindent

set tabstop=2             " when indenting with '>', use 4 spaces width
set shiftwidth=2          " On pressing tab, insert 4 spaces
set expandtab

" Color Scheme
set background=dark
colorscheme solarized
" hi Visual   ctermfg=NONE   ctermbg=239   cterm=NONE
" hi Search   ctermfg=7

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Set default split 
set splitbelow
set splitright

" Line width convention
" set colorcolumn=80

syn match tab display "\t"
hi link tab Error

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
" set nu

set scrolloff=5               " scroll offsett, min lines above/below cursor
set scrolljump=5              " jump 5 lines when running out of the screen
set sidescroll=10             " minumum columns to scroll horizontally
set showmatch                 " flashes matching paren when one is typed
set showcmd                   " show command status
set ruler                     " show cursor position

set encoding=utf-8

" make split windows easier to navigate
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-x> <C-w>q
nnoremap <C-v> :vsplit<CR>

" nice backspacing
set bs=2

" saner up/down movement (screen-wise, not line-wise)
nmap j gj
nmap k gk

" Vi mode escape timeout
set timeoutlen=1000 ttimeoutlen=0

" saner tab navigation
" nmap <S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
nmap <leader>z :tabnew %<CR>
nmap <leader>w :tabclose<CR>


let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'python': ['black'],
\}
let g:ale_python_flake8_use_global = 1

" Syntax highlighting for flow
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" fzf mappings
nnoremap <leader>t :Files<CR>
nnoremap <leader>b :Buffer<CR>
nnoremap <leader>s :Find<CR>

" Find command use fzf
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Use ripgrep for vim grep
set grepprg=rg\ --vimgrep


" YouCompleteMe
" let g:ycm_register_as_syntastic_checker = 0
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_min_num_identifier_candidate_chars = 4
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_error_symbol = 'x'
" let g:ycm_warning_symbol = '!'
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
" nnoremap <leader>pg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>

" NERDTree Settings
map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
let NERDTreeQuitOnOpen = 1

" airline Settings
let g:airline_powerline_fonts=1
let g:airline_theme='distinguished'

" tagbar setting
nmap <F8> :TagbarOpen fj<CR>
nmap <leader>o :TagbarToggle<CR>
