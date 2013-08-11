set nocompatible " This is vim, not vi  
filetype off

nnoremap <C-n> gt
nnoremap <C-p> gT
 
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'Shougo/neocomplcache'
"Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
"JSLint
Bundle 'basyura/jslint.vim'

"color
Bundle 'tomasr/molokai'
 
" Examples
" vim-scripts リポジトリ (1)
"Bundle "rails.vim"
" github の任意のリポジトリ (2)
"Bundle "tpope/vim-fugitive"
" github 以外のリポジトリ (3)
"Bundle "git://git.wincent.com/command-t.git"
 
filetype plugin indent on
let $GIT_SSL_NO_VERIFY = 'true' " Vundle対策

"==========================
" 表示まわり
"=========================
syntax on
"set number
"set nowrap
set nobackup
set noswapfile
set autoread

autocmd! BufWritePost ~/.vimrc source ~/.vimrc
augroup END

set autoindent smartindent
set smarttab
set softtabstop=4 tabstop=4 shiftwidth=4
set expandtab
set backspace=indent,eol,start
set ignorecase smartcase
set incsearch
" 最初にもどれ
set wrapscan
" 対応する括弧の表示
set showmatch
set showcmd
set showmode
set hlsearch
set wrapscan
set browsedir=buffer
set laststatus=2
set wildmode=list,full
set virtualedit+=block
set modeline
set splitbelow
set splitright
set scrolloff=10000000
set encoding=utf8

" 前回開いた場所を記憶する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ exe "normal! g'\"" |
    \ endif
endif

" # の行で改行したときなどに # をつけないように
autocmd FileType * setlocal formatoptions-=r
autocmd FileType * setlocal formatoptions-=o

" Set filetype 
autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead *.t set filetype=perl
autocmd BufNewFile,BufRead *.html.ep set filetype=html

" 全角スペースと行末空白をハイライト
highlight ZenkakuSpace ctermbg=darkgrey
match ZenkakuSpace /\s\+$\|　/

" Status line
set background=light
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

"==========================
" Config for neocomplcache 
"==========================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

 " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" perldoc 
" K キーを押したらPerldoc が起動するように設定
noremap K :Perldoc<CR>
" vim が認識する単語境界の文字の種類を設定
setlocal iskeyword-=/
" Perl のモジュール名全体(Foo::Bar)を単語として認識させたいため、: を追加  
setlocal iskeyword+=:

"=========================================
" JSLint
"=========================================
augroup MyGroup
  autocmd! MyGroup
  autocmd FileType javascript call s:javascript_filetype_settings()
augroup END

function! s:javascript_filetype_settings()
  autocmd BufLeave     <buffer> call jslint#clear()
  autocmd BufWritePost <buffer> call jslint#check()
  autocmd CursorMoved  <buffer> call jslint#message()
endfunction

