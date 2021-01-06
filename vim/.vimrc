let mapleader=" "

" Basic settings
set mouse=a
syntax on
set encoding=utf-8
"set number
"set termguicolors
colorscheme desert

" Use system clipboard
set clipboard+=unnamedplus

" Tab settings
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Enable and disable auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Enable and disable auto indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Autocompletion
set wildmode=longest,list,full

" Enable spell checking, s for spell check
map <leader>s :setlocal spell! spelllang=en_us<CR>

" Spell check
"map <leader>p :!clear && spellcheck %<CR>

"Alias replace all to
nnoremap <A-s> :%s//gI<Left><Left><Left>

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

