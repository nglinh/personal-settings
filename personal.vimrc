" Pathogen setup
execute pathogen#infect()

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
filetype plugin indent on

" Color Scheme
set background=dark
colorscheme solarized
hi Visual   ctermfg=NONE   ctermbg=239   cterm=NONE
hi Search   ctermfg=7

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Set default split 
set splitbelow
set splitright

" Line width convention
set colorcolumn=80

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

set scrolloff=5               " scroll offsett, min lines above/below cursor
set scrolljump=5              " jump 5 lines when running out of the screen
set sidescroll=10             " minumum columns to scroll horizontally
set showmatch                 " flashes matching paren when one is typed
set showcmd                   " show command status
set ruler                     " show cursor position

set encoding=utf-8

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

" nice backspacing
set bs=2

" saner up/down movement (screen-wise, not line-wise)
nmap j gj
nmap k gk

" Vi mode escape timeout
set timeoutlen=1000 ttimeoutlen=0

" NERDTree Settings
map <C-n> :NERDTreeToggle<CR>

" Syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1

" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_messages = { "type": "style" }

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = '!'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
nnoremap <leader>pg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>

" airline Settings
let g:airline_powerline_fonts=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:unite_source_history_yank_enable = 1
" let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)
