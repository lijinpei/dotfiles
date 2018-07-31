set nocompatible

" A tab produces a 2-space indentation
set softtabstop=2
set shiftwidth=2
set expandtab

set nu
set termguicolors
set wildmode=longest,list,full
set wildmenu

filetype on

augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END
set cinoptions=:0,g0,(0,Ws,l1
" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab

augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END
autocmd FileType make set noexpandtab
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to two spaces
command! Untab :%s/\t/  /g
" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/syntax/llvm.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/syntax/tablegen.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Enable syntax highlighting for reStructuredText files. To use, copy
" rest.vim (http://www.vim.org/scripts/script.php?script_id=973)
" to ~/.vim/syntax .
augroup filetype
 au! BufRead,BufNewFile *.rst     set filetype=rest
augroup END

"set showcmd
"set showmatch
"set showmode
"set incsearch
set ruler
"let mapleader = "\<C-K>"

call plug#begin()
"Plug 'altercation/vim-colors-solarized'
"Plug 'prabirshrestha/async.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'justinmk/vim-syntax-extra'
Plug 'pboettch/vim-cmake-syntax'
" Plug 'guns/xterm-color-table.vim'
"Plug 'jacobsimpson/nvim-example-lua-plugin'
"Plug 'autozimu/LanguageClient-neovim', {
"  \ 'branch': 'next',
"  \ 'do': 'bash install.sh',
"  \ }
"Plug 'yegappan/grep'
Plug 'mhinz/vim-grepper'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
"Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
"Plug 'iamcco/markdown-preview.vim'
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.vim'
Plug 'vim-scripts/paredit.vim'
"Plug 'vim-scripts/scribble.vim'
"Plug 'vim-scripts/slimv.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
let g:tagbar_foldlevel = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_autopreview = 0
let ccls = $HOME . '/Development/ccls/build/ccls'
let g:LanguageClient_serverCommands = {
    \ 'cpp': [ccls, '--log-file=/tmp/cq.log'],
    \ 'c': [ccls, '--log-file=/tmp/cq.log'],
    \ } 
let g:LanguageClient_loggingLevel = 'DEBUG'

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings 
let g:LanguageClient_settingsPath = $HOME . '/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let Grep_Default_Options = '--color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
nnoremap <silent><Leader>m :make <CR>
nnoremap <silent><Leader>g :Grepper -tool ag -highlight -query <C-R>"<CR>
nnoremap <silent><Leader>w :Grepper -tool ag -highlight -cword -noprompt<CR>
nnoremap <silent><Leader>b :Grepper -tool ag -highlight -cword -noprompt -buffer<CR>
nnoremap <silent><Leader>bs :Grepper -tool ag -highlight -cword -noprompt -buffers<CR>
nnoremap <silent><Leader>t :Tagbar<CR>
nnoremap <silent><Leader>c :CtrlP<CR>
nnoremap <silent><Leader>h :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent><Leader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent><Leader>r :call LanguageClient_textDocument_references()<CR>
nnoremap <silent><Leader>s :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent><Leader><F2> :call LanguageClient_textDocument_rename()<CR>

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_on_insert_enter = 1

syntax enable
colorscheme NeoSolarized
set background=dark
let g:airline_theme='solarized'
let g:airline#extensions#tagbar#flags = 'f'
set laststatus=2

tnoremap <Esc> <C-\><C-n>
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

let g:clang_format_fallback_style = 'llvm'
noremap <Leader>k :pyf /usr/share/clang/clang-format.py<cr>
inoremap <Leader>k <C-O>:pyf /usr/share/clang/clang-format.py<cr>


"set autoindent 
"set smartindent
"set cindent

highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight ColorColumn ctermbg=16 guibg=#000000
let &colorcolumn=join(range(81,999),",")

"let g:LanguageClient_serverCommands = {
"      \ 'c': ['cquery', '--language-server'],
"      \ 'cpp': ['cquery', '--init={}', '--log-file=/tmp/cq.log', '--record=/tmp/record'],
"      \ }
"let g:LanguageClient_loadSettings = 1
"augroup LanguageClient_config
"  au!
"  au BufEnter * let b:Plugin_LanguageClient_started = 0
"  au User LanguageClientStarted setl signcolumn=yes
"  au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
"  au User LanguageClientStopped setl signcolumn=auto
"  au User LanguageClientStopped let b:Plugin_LanguageClient_stopped = 0
"  au CursorMoved * if b:Plugin_LanguageClient_started | call LanguageClient_textDocument_signatureHelp() | endif
"augroup END

nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set guifont=Monospace\ 12
set visualbell 
