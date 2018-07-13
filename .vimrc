if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME . '/.cache/dein')
  call dein#begin($HOME . '/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add($HOME . '/.cache/dein/repos/github.com/Shougo/dein.vim')

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

  call denite#custom#var('file/rec', 'command',  ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']) 
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '*~', '*.o', '*.exe', '*.bak',
      \ '.DS_Store', '*.pyc', '*.sw[po]', '*.class',
      \ '.hg/', '.git/', '.bzr/', '.svn/',
      \ 'node_modules/', 'bower_components/', 'tmp/', 'log/', 'vendor/ruby',
      \ '.idea/', 'dist/',
      \ 'tags', 'tags-*'])
  call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')


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
nmap <silent> <C-E> :NERDTreeToggle<CR>

"keymapping
nmap <silent> <C-u><C-t> :<C-u>Denite filetype<CR>
nmap <silent> <C-u><C-p> :<C-u>Denite file_rec<CR>
nmap <silent> <C-u><C-j> :<C-u>Denite line<CR>
nmap <silent> <C-u><C-g> :<C-u>Denite grep<CR>
nmap <silent> <C-u><C-]> :<C-u>DeniteCursorWord grep<CR>
nmap <silent> <C-u><C-u> :<C-u>Denite file_mru<CR>
nmap <silent> <C-u><C-y> :<C-u>Denite neoyank<CR>
nmap <silent> <C-u><C-r> :<C-u>Denite -resume<CR>

" backup to ~/.tmp -
" https://stackoverflow.com/questions/821902/disabling-swap-files-creation-in-vim
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

