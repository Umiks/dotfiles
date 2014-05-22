set nocompatible

call pathogen#runtime_append_all_bundles()

filetype on
filetype plugin on
filetype indent on

set autoread

set autoindent
set smartindent
set smarttab

set nowrap
set tabstop=4
set softtabstop=4
set linespace=1
set shiftwidth=4
set expandtab
set ruler
set cursorline
set paste "для режима "вставки"

set showmatch
set hlsearch
set incsearch
set ignorecase

set lz
set listchars=tab:\ \ ,trail:~
set list

set wildmenu
set laststatus=2
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r

set nobackup
set noswapfile

set foldcolumn=1
set foldmethod=syntax
set foldnestmax=10
set nofoldenable

set scrolljump=5
set scrolloff=3

set synmaxcol=1000

call pathogen#runtime_append_all_bundles()

set background=light
colorscheme solarized

let g:airline_theme='light'

set t_Co=256
syntax off "чтобы не было глюков при правке собраных js файлов в 10к+ строк

set linebreak
set pastetoggle=<F3>

set backspace=indent,eol,start

" Загрузка предыдущей сессии
set viminfo='10,\"100,:20,%,n~/.viminfo

map QQ :q <Cr>
map <silent> <C-t> <ESC> :tabedit .<Cr>
map <silent> ] <ESC> :tabnext <Cr>
map <silent> [ <ESC> :tabNext <Cr>

"защита от очептяк
command W w
command Q q
command WQ wq
command Wq wq


" шорткаты для комманд
command SO syntax on
command SF syntax off


"для того, чтобы в русской раскладке работали служебные клавиши
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .

" Мои горячие клавиши
map <F2> :w <CR>
map ,so :syntax on<CR>
map ,sf :syntax off<CR>

map > <C-W>>
map < <C-W><
