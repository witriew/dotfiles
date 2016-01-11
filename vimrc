syntax on
set nocompatible
set title
set number
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=80
set colorcolumn=+5
set laststatus=2
set statusline=Editing:\ %r%t%m\ %=Location:\ Line\ %l/%L\ \ Col:\ %c\ (%p%%)
set hlsearch

set list listchars=tab:»·,trail:·,extends:…,nbsp:‗

set t_Co=256

set smarttab
filetype on
filetype indent on
filetype plugin on

"set foldmethod=syntax
"let python_highlight_all=1

"colorscheme wombat256

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
