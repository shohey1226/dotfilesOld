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

  call dein#add('scrooloose/nerdtree')

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

"theming
syntax on
colorscheme gruvbox 
set background=dark
set t_Co=256
let g:airline_theme = 'wombat'


autocmd vimenter * NERDTree
