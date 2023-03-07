let mapleader=" "                              " 设置leader键为空格键
set number
set relativenumber
set termguicolors

filetype plugin on
colorscheme gruvbox

call plug#begin("/home/kobruh/.vim/plugged/")
"Plug 'rhysd/vim-clang-format'
"Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'agude/vim-eldar'
"Plug 'EdenEast/nightfox.nvim'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim' " needed for previews
"Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
"Plug 'kevinhwang91/rnvimr'  " 文件浏览器
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'honza/vim-snippets'
"Plug 'neoclide/coc-denite'
"Plug 'ayu-theme/ayu-vim'
"Plug 'joshdick/onedark.vim'
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'itchyny/lightline.vim'
"Plug 'Yggdroot/indentLine' " Hate that shit (!) I think that was this one
Plug 'sheerun/vim-polyglot'
" Plug 'golang/lint'
"Plug 'mg979/vim-xtabline'  " 精致的顶栏
Plug 'mbbill/undotree'     " Undo Tree
"Plug 'liuchengxu/vista.vim' " 打开函数与变量列表
"Plug 'lambdalisue/suda.vim' " :sudowrite 或者 :sw 就等于sudo vim ...


Plug 'github/copilot.vim'
" |---> Requires: git clone https://github.com/github/copilot.vim.git ~/.config/nvim/pack/github/start/copilot.vim

call plug#end()

"----------------
"		COC-CONFIG   |
"--------------------------------
" :CocInstall coc-snippets	     |
" :CocInstall coc-json	         |
" :CocInstall coc-rust-analyzer	 |
" :CocInstall coc-python	       |
" :CocInstall coc-pairs	         |
" :CocInstall coc-clangd	       |
"--------------------------------
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"----------------
" NERD COMMENTER |
"-------------------------------------------------------------------
" Use compact syntax for prettified multi-line comments 					  |
" G C Comment out the current line or text selected in visual mode. |
"-------------------------------------------------------------------

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

map gc <Plug>NERDCommenterToggle

"---------------
"    COPILOT    |
"--------------------------------------
" Ctrl+D to select next suggestion	   |
" Ctrl+A to select previous suggestion |
" Ctrl+ESC to dismiss the panel		     |
" Ctrl+S to open the panel		         |
"--------------------------------------

" let b:copilot_enabled = v:true

imap <C-D> <Plug>(copilot-next)
imap <C-A> <Plug>(copilot-previous)
imap <C-ESC> <Plug>(copilot-dismiss)

inoremap <C-S> <Esc>:execute 'Copilot panel'<CR>

"----------------
"    AIRLINE     |
"---------------------------
" :AirlineTheme gruvbox		  |
" Use triangular separators |
"---------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_close_button = 1


