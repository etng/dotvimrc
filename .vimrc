syntax on
"common conf {{
set ai
set bs=2
set showmatch
set laststatus=2
set expandtab
set shiftwidth=4
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

"tabs, 通过ctrl+h/l来切换标签
"let mapleader=','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>te :tabe<CR>

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
"}
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <leader>t :TlistToggle<CR>
let g:syntastic_auto_loc_list=1
let Tlist_Use_Right_Window = 1
"}}
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

" tab navigation
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

au FileType php call AddPHPFunctionDict()

function AddPHPFunctionDict()
    set dict-=~/php.dict dict+=~/php.dict
    set complete-=k complete+=k
endfunction

command CDC cd %:p:h
