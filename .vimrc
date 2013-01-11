syntax on
"common conf {{
set lazyredraw
set magic
set ai
set bs=2
set showmatch
set laststatus=2
set expandtab
set smarttab
set lbr
set tw=500
set smartindent
set wrap
set shiftwidth=4
set tabstop=4
set cursorline
set number
set autoread
set ignorecase
set fileencodings=utf-8,gbk
set hls
set incsearch
set helplang=cn
set foldmethod=syntax
set mouse=
"}}

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"config plugins{{
"status line
"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'unicode'
"}
filetype plugin indent on

"pathogen{
call pathogen#infect()
" call pathogen#helptags()
"}

try
        colorscheme symfony
catch
endtry

map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <leader>t :TlistToggle<CR>
let g:syntastic_auto_loc_list=1
let Tlist_Use_Right_Window = 1
"}}

" tab navigation
map <leader>tl :tabnext<CR>
map <leader>th :tabprev<CR>
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmoveCR>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %p:h<cr>;pwd<cr>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remap VIM 0 to first non-blank character
map 0 ^

" Map <Space> to / (search)
map <space> /


" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
      exe "normal mz"
        %s/\s\+$//ge
          exe "normal `z"
      endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

au FileType php call AddPHPFunctionDict()


function AddPHPFunctionDict()
    set dict-=~/php.dict dict+=~/php.dict
    set complete-=k complete+=k
endfunction

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>           

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

if has("win16") || has("win32")
else
    let g:yankring_history_dir = '~/.vim/tmp/'
endif

try
    set undodir=~/.vim/tmp/undos
    set undofile
catch
endtry
