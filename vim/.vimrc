" Configuration {{{
set nocompatible
syntax enable    "syntax
set exrc         "allows to setup a local vimrc 

set tabstop=8    "tab spaces
set autoindent
set cindent      "C-aware indentation

set number       "line number
set cursorline   "highlight current line

set wildmenu    "menu autocomplete
set showmatch

set incsearch   "search as characters are entered
"set hlsearch    "highlight matches
set ignorecase   "only for /
set smartcase    "do not ignore case if uppercase in /

set mouse=a

set scrolloff=5

set termguicolors "true colors

set colorcolumn=80

set relativenumber
set backspace=indent,eol,start

"More natural splits
set splitbelow
set splitright

set foldenable          " enable folding

"omni-completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt+=longest,menuone

" Enter behaves as C-y
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" }}}

" Plugins {{{
runtime macros/matchit.vim

"
" Vundle
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'simplyzhao/cscope_maps.vim'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Shougo/deoplete.nvim'
Plugin 'deoplete-plugins/deoplete-tag'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'qpkorr/vim-bufkill'

"Colorschemes
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Plugins conf  {{{
"Airline
set laststatus=2
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 79,
      \ 'x': 60,
      \ 'y': 88,
      \ 'z': 45,
      \ 'warning': 80,
      \ 'error': 80,
      \ }
let g:airline#extensions#tagbar#enabled = 0

"gitgutter
set updatetime=250

"NERDtress
let g:NERDTreeWinPos = "right"

let g:tagbar_left = 1
let g:tagbar_sort = 0
autocmd FileType tagbar setlocal nocursorline nocursorcolumn


"Cscope
set nocscopetag
set csto=1
set cscopequickfix=s-,c-,d-,i-,t-,e-

"Deoplete
let g:deoplete#enable_at_startup = 1

"Ultisnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsListSnippets = "<F2>"

"Bufkill
let g:BufKillCreateMappings = 0

" }}}

" Functions {{{
function! MyGrep(arg)
     cexpr system("rg --vimgrep -g '!tags' " . expand(a:arg))
     execute 'redraw!'
endfunction

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}

" Mappings {{{
"Mapping generic
let mapleader=","
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
" Split window vertically
nmap <Leader>v <C-w>v
" Split window horizontally
nmap <Leader>s <C-w>s
nmap <Leader>x <C-W>}
nmap <Leader>c <C-w>c

nmap <Leader>w :w<CR>
nmap <Leader>z :BD<CR>

nmap <S-j> 4<C-e>
nmap <S-k> 4<C-y>

"QuickFix toggle
nmap <F1> : call QuickfixToggle()<CR>

"Preview close
nmap <F2> <C-w>z

"Registers
nmap <F4> :reg<CR>

"Vugitive
nmap <F7> :Gblame<CR>

"TagBar
nmap <F8> :TagbarToggle<CR>

map <F9> :NERDTreeToggle<CR>

"FZF
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>b :Buffers<CR>

nmap <Leader>g : call MyGrep('<cword>')<CR>
nmap <Leader>G : call MyGrep(input("grep: "))<CR>

inoremap jj <esc>

map <F5> :!ctags .<CR><CR>
map <F6> :!cscope -bR<CR>:cs reset<CR><CR>

nmap <Left> <<
nmap <Right> >>
nmap <Up> [e
nmap <Down> ]e

"Deoplete navigate pop-up
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" }}}

" Autocmds {{{
"Quickfix window
augroup vimrc
    autocmd!
    autocmd QuickFixCmdPost * botright copen 8
    autocmd FileType gitcommit setlocal colorcolumn=50,72 | setlocal spell
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif " Notification after file change
augroup END
" }}}

"Colors {{{
set background=dark
colorscheme gruvbox
" }}}

" vim:foldmethod=marker:foldlevel=0
