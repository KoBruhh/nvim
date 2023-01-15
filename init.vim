let mapleader=" "                              " 设置leader键为空格键
set nocompatible "设置不兼容
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'agude/vim-eldar'
Plug 'EdenEast/nightfox.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'kevinhwang91/rnvimr'  " 文件浏览器
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'neoclide/coc-denite'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' } 
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'golang/lint'
Plug 'mg979/vim-xtabline'  " 精致的顶栏
Plug 'mbbill/undotree'     " Undo Tree
Plug 'liuchengxu/vista.vim' " 打开函数与变量列表
Plug 'lambdalisue/suda.vim' " :sudowrite 或者 :sw 就等于sudo vim ...
call plug#end()

" We bind it to <leader>e here, feel free to change this
nmap <leader>e :CocCommand explorer<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" === rnvimr
" " ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" === rnvimr end


" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

" === UndoTree end


" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:scrollstatus_size = 15

" === Vista.vim end



" coc-translator
nmap ts <Plug>(coc-translator-p)

" coc-translator end


" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

nmap<leader>rn <Plug>(coc-rename)

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()

" Take <tab> for word complete only
" The 'complete' option controls where the keywords are searched (include files, tag files, buffers, and more).
" The 'completeopt' option controls how the completion occurs (for example, whether a menu is shown).

if exists('did_completes_me_loaded') || v:version < 700
  finish
endif
let did_completes_me_loaded = 1

function! s:completes_me(shift_tab)
  let dirs = ["\<c-p>", "\<c-n>"]

  if pumvisible()
    if a:shift_tab
      return dirs[0]
    else
      return dirs[1]
    endif
  endif

  " Figure out whether we should indent.
  let pos = getpos('.')
  let substr = matchstr(strpart(getline(pos[1]), 0, pos[2]-1), "[^ \t]*$")
  if strlen(substr) == 0 | return "\<Tab>" | endif

  if a:shift_tab
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfunction

inoremap <expr> <plug>completes_me_forward  <sid>completes_me(0)
inoremap <expr> <plug>completes_me_backward <sid>completes_me(1)

imap <Tab>   <plug>completes_me_forward


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



let g:coc_snippet_next = '<tab>'

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap s<up> :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap s<down> :set splitbelow<CR>:split<CR>
noremap s<left> :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap s<right> :set splitright<CR>:vsplit<CR>

" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER><up> <C-w>k
noremap <LEADER><down> <C-w>j
noremap <LEADER><left> <C-w>h
noremap <LEADER><right> <C-w>l


" 新建标签页,移动标签页
" Create a new tab with tn
noremap tn :tabe<CR>
" 移动标签页
noremap t<left> :-tabnext<CR>
noremap t<right> :+tabnext<CR>

" 折叠代码
" Folding
noremap <silent> <LEADER>o za

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>
" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>


" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)

" Create keymap for open specified list with list options, like:
nnoremap <silent> <space>g  :<C-u>CocList --normal gstatus<CR>

nmap <leader>s :w!<cr> 

let g:fmt_commands = {
      \ 'rust': 'rustfmt',
      \ 'go': 'gofmt -w',
      \ 'c': 'clang-format -i -style=google',
      \ 'cpp': 'clang-format -i -style=google',
      \ 'javascript': 'prettier --write',
      \ 'typescript': 'prettier --write',
      \ 'ruby': 'rufo',
      \ }

noremap <F3> :Autoformat<CR>
nmap Q :q!<cr>
nmap <leader>q :wq!<cr>
nmap , <HOME>
nmap . <END>
nmap <leader>r :GoRun<cr>


set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu


" IndentLine {{
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

let g:airline_theme='onedark'

" colorscheme dracula
colorscheme industry
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
