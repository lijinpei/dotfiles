" my .vimrc on arch linux, depends on:
" gvim
" vim-runtime
" vim-airline
" vim-airline-themes
" vim-tagbar
" vim-youcompleteme-git
" clang(for clang-format)
" vim-nerdtree
" vim-fcitx
" cscope

so /usr/share/vim/vim80/defaults.vim
set nu

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set guifont=Monospace\ 12
set visualbell 
set t_vb=
set tm=500
set hlsearch

syntax enable
set background=dark
colorscheme solarized

let g:ycm_confirm_extra_conf = 0
set noerrorbells visualbell

let g:airline_theme='solarized'
let g:airline#extensions#tagbar#flags = 'f'
set laststatus=2

"no folding when entering vim
set foldmethod=syntax
set foldlevelstart=99
set wildmode=longest,list,full
set wildmenu

let g:ycm_autoclose_preview_window_after_insertion = 1
set switchbuf=usetab
let g:airline#extensions#tagbar#enabled = 1
set laststatus=2

let g:clang_format_fallback_style = 'llvm'
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

:set tabstop=8
:set expandtab
:set shiftwidth=8
:set autoindent 
:set smartindent
:set cindent
