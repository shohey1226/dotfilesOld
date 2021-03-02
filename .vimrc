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

  " session
  call dein#add('xolox/vim-misc')
  call dein#add('xolox/vim-session')

  " file search 
  call dein#add('Shougo/denite.nvim')

  " ruby
  call dein#add('osyo-manga/vim-monster', { 'on_ft': 'ruby' })

  " autocompletion
  call dein#add('neoclide/coc.nvim', {'branch': 'release'})

  call dein#add('prettier/vim-prettier', { 
    \ 'do': 'yarn install', 
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] })

  " fzf
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " session control
  call dein#add('tpope/vim-obsession')

  " typescript
  call dein#add('leafgarland/typescript-vim')

  " vue
  call dein#add('posva/vim-vue')
  
  " erb
  call dein#add('Chiel92/vim-autoformat')
  
  " theme
  call dein#add('dracula/vim')
  call dein#add('connorholyday/vim-snazzy')

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
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,cp932

set expandtab
"https://stackoverflow.com/questions/37957844/set-expandtab-in-vimrc-not-taking-effect
set pastetoggle=<F2>
set softtabstop=2
set shiftwidth=2
filetype plugin indent on
set autoindent
set number

" Set tab per FileType 
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
 
"theming
syntax enable 
colorscheme dracula 
"colorscheme snazzy
"colorscheme molokai 
set background=dark
set t_Co=256
set langmenu=en_US.UTF-8
let g:airline_theme = 'wombat'
set hlsearch
hi Search ctermbg=Cyan
hi Search ctermfg=Black

" CoC
let g:coc_global_extensions = [
      \  'coc-lists'
      \, 'coc-json'
      \, 'coc-marketplace'
      \, 'coc-html'
      \, 'coc-css'
      \, 'coc-tsserver'
      \, 'coc-solargraph'
      \, 'coc-python'
      \, 'coc-snippets'
      \, 'coc-vetur'
      \ ]

" session
let g:session_autosave = 'no'
let g:session_autoload = 'no'
nnoremap <Leader>ss :SaveSession 

" change color of popup menu
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6
hi TabLine      ctermfg=White  ctermbg=DarkGray cterm=NONE
hi TabLineFill  ctermfg=White  ctermbg=DarkGray cterm=NONE
hi TabLineSel   ctermfg=Black  ctermbg=DarkGreen cterm=NONE
nnoremap H gT
nnoremap L gt

" Prettier
let g:prettier#config#tab_width = 2
let g:prettier#config#single_quote = 'false'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#print_width = 120 


" tree view
"autocmd vimenter * NERDTree
"autocmd VimEnter * NERDTree | wincmd p
nmap <silent> <C-E> :NERDTreeToggle %<CR>
"autocmd BufEnter * lcd %:p:h

" FZF 
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun

nnoremap <C-b> :Buffers<CR>
nnoremap <C-g> :Rg<Space>
nnoremap <leader><leader> :Commands<CR>
nnoremap <C-p> :call FzfOmniFiles()<CR>

let g:fzf_action = { 
  \ 'ctrl-o': 'tab split' 
  \ }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

let g:fzf_layout = { 'down': '~40%' }

" backup to ~/.tmp -
" https://stackoverflow.com/questions/821902/disabling-swap-files-creation-in-vim
set backup 
set backupdir=~/.tmp,/tmp
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" For Japanese
set ambiwidth=double

" speed up
let loaded_matchparen = 1
set ttyfast

" Issue on ctrl+space https://qiita.com/aristoclesshakya/items/9f0149b0d75d173a3f19
imap <Nul> <Nop>
nnoremap <c-space> <Nop>

