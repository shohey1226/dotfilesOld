if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/shohey1226/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/shohey1226/.cache/dein')
  call dein#begin('/home/shohey1226/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/shohey1226/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim') 
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " powerline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  "theme
  call dein#add('morhetz/gruvbox')

  " display tree
  call dein#add('scrooloose/nerdtree')

  " 
  call dein#add('Shougo/denite.nvim')

  " autocompletion
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"===== start config =====

set encoding=utf-8
set autoindent
set expandtab
setlocal tabstop=2 shiftwidth=2 smarttab
filetype plugin indent on

 
"theming
syntax on
colorscheme gruvbox 
set background=dark
set t_Co=256
let g:airline_theme = 'wombat'


let g:deoplete#enable_at_startup = 1

" tree view
"autocmd vimenter * NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>

"keymapping

