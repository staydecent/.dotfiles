set nocompatible
set modelines=0
set wildcharm=<C-z>

filetype off 

" save swap files globally
set directory^=$HOME/.vim/tmp//

" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Folds
set foldmethod=indent
set foldnestmax=12

" steve losh settings
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set t_vb=
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set relativenumber
"set undofile

" steve losh search settings
nnoremap <leader>f /\v
nnoremap <leader>h :%s/
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" steve losh line settings
set wrap
set textwidth=80
set formatoptions=qrn1
set listchars=

" steve losh mappings
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap <leader>ft Vatzf " HTML, fold tag

" buffers
nnoremap <leader>q :b#<cr>
nnoremap <leader>d :bn<cr>
nnoremap <leader>a :bp<cr>
nnoremap <leader>e :buffer <C-z>

" files
nnoremap <leader>o :e %:h/<C-z>
nnoremap <leader>n :e %:h/

" vim-plug
"call plug#begin('~/.data/plugged')
"
"Plug 'tpope/vim-surround'           " cs, ds, S
"Plug 'tpope/vim-commentary'         " gcc, gc
"Plug 'christoomey/vim-system-copy'  " cP, cV
"
"Plug 'ervandew/supertab'
"Plug 'terryma/vim-multiple-cursors' " <C-n>
"Plug 'mattn/emmet-vim'              " <C-f>,
"
"Plug 'SirVer/ultisnips'             " snippet engine
"Plug 'honza/vim-snippets'           " community snippets
"
"Plug 'junegunn/seoul256.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'MaxMEllon/vim-jsx-pretty'
"
"call plug#end()

let g:user_emmet_leader_key='<C-f>'

" colorscheme settings
syntax enable
syntax on
set background=dark
colorscheme default
filetype plugin indent on

" status line
set laststatus=2

" background fixes
"hi Normal ctermbg=none
"hi NonText ctermbg=none
"hi Folded ctermbg=none
"hi StatusLine ctermbg=none cterm=none
"hi SignColumn ctermbg=none cterm=none
