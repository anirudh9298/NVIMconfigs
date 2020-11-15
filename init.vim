"CURRENT INIT VIM FILE FROM /.CONFIG/NVIM
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set tw=79
set fo-=l 
set colorcolumn=80

let loaded_netrwPlugin = 0
let g:netrw_banner=0
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree' "file Explorer to escape netrw
Plug 'morhetz/gruvbox'   "Best color scheme for vim
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocompleter and others. Requires Jedi, Yarn. 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Fuzzy finder. Requires further testing.
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree' "Useful chain of previous temp savestates of the file. 
Plug 'dense-analysis/ale' "Linter and autofix for coding. needs pylinter and/or equivalent.
Plug 'tpope/vim-fugitive' "GIT commands
Plug 'vim-airline/vim-airline' "status bar
Plug 'vim-airline/vim-airline-themes' "status bar
Plug 'jremmen/vim-ripgrep' "fast search
Plug 'SirVer/ultisnips' "Snippet tools for commands
Plug 'lervag/vimtex' "for tex compiling
Plug 'ludovicchabant/vim-gutentags' "Tag manager
Plug 'jiangmiao/auto-pairs' "Bracket pairing
Plug 'honza/vim-snippets' "Ultisnippets  

call plug#end()

"COLORSCHEME
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark
"let g:airline_theme='base16'
" VIMTEX
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"UTILS
let mapleader= " " 
nnoremap <leader>so :source %<CR>
nnoremap <leader><BS> :nohl<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pp :wincmd v<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> <Leader>F :vertical resize 75<CR>

nnoremap <leader>p0 :set tw=0<CR>
nnoremap <leader>tw :set tw=79<CR>
nnoremap <leader>ws :%s/\s\+$//e<CR>
"FZF
nnoremap <silent> <C-p> :Files<CR>

"UNDOTREE
nnoremap <leader>u :UndotreeShow<CR>

"COC
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<tab>" :
      \ coc#refresh()
"use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

"NERDTREETOGGLE
map <C-n> :NERDTreeToggle<CR>

"CODE FOLDING
"SPELLCHECK
setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"ALE LINTERS
let g:ale_linters = {'tex': ['lacheck']}
"ULTISNIPS
let g:UltiSnipsExpandTrigger = '<C-u>'
let g:UltiSnipsJumpForwardTrigger = '<C-u>'
let g:UltiSnipsJumpBackwardTrigger = '<C-U>'

"CLIPBOARD
set clipboard+=unnamedplus
let g:clipboard = {
    \ 'name': 'win32yank-wsl',
    \ 'copy': {
    \   '+': 'win32yank.exe -i --crlf',
    \   '*': 'win32yank.exe -i --crlf',
    \ },
    \ 'paste': {
    \   '+': 'win32yank.exe -o --lf',
    \   '*': 'win32yank.exe -o --lf',
    \ },
    \ 'cache_enabled':0,
    \}
"AUTO COMMENT CODES

map gc :call Comment()<CR>
map gC :call Uncomment()<CR>

function! Comment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
		silent s/^/\#/
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
		silent s:^:\/\/:g
	elseif ft == 'tex'
		silent s:^:%:g
	elseif ft == 'vim'
		silent s:^:\":g
	endif
endfunction

function! Uncomment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
		silent s/^\#//
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
		silent s:^\/\/::g
	elseif ft == 'tex'
		silent s:^%::g
	elseif ft == 'vim'
		silent s:^\"::g
	endif
endfunction
"
"CURRENT INIT VIM FILE FROM /.CONFIG/NVIM
