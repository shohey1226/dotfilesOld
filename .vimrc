if &compatible
  set nocompatible               " Be iMproved
endif

" loading issue - https://github.com/vim/vim/issues/3117
" https://github.com/roxma/vim-hug-neovim-rpc/issues/32
if has('python3')
  silent! python3 1
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

  " reopen at the last edit postion
  call dein#add('farmergreg/vim-lastplace')

  "theme
  "call dein#add('morhetz/gruvbox')
  call dein#add('flazz/vim-colorschemes')

  " display tree
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')

  " tabline
  call dein#add('mkitt/tabline.vim')

  " file search 
  call dein#add('Shougo/denite.nvim')

  " ruby
  call dein#add('osyo-manga/vim-monster', { 'on_ft': 'ruby' })

  " autocompletion
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call denite#custom#var('file/rec', 'command',  ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']) 

  " Ripgrep command on grep source
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
                  \ ['--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

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
set expandtab
set softtabstop=2
set shiftwidth=2
filetype plugin indent on
set autoindent
set number

" for ruby
"::autocmd Filetype ruby set softtabstop=2
"::autocmd Filetype ruby set sw=2
"::autocmd Filetype ruby set ts=2

 
"theming
syntax enable 
colorscheme dracula 
"colorscheme molokai 
set background=dark
set t_Co=256
set langmenu=en_US.UTF-8
let g:airline_theme = 'wombat'

let g:deoplete#enable_at_startup = 1

" change color of popup menu
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6
hi TabLine      ctermfg=White  ctermbg=DarkGray cterm=NONE
hi TabLineFill  ctermfg=White  ctermbg=DarkGray cterm=NONE
hi TabLineSel   ctermfg=Black  ctermbg=DarkGreen cterm=NONE

" tree view
"autocmd vimenter * NERDTree
"autocmd VimEnter * NERDTree | wincmd p
nmap <silent> <C-E> :NERDTreeToggle %<CR>
"autocmd BufEnter * lcd %:p:h

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

" For Japanese
set ambiwidth=double

" speed up
let loaded_matchparen = 1
set ttyfast
set lazyredraw
"set nocul!
