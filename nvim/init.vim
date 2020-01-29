" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
 
call plug#begin('~/.config/nvim/plugged')

" Default VIM settings
Plug 'tpope/vim-sensible'

" Super Power
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax Plugins
Plug 'ericfreese/typescript-vim'
Plug 'plasticboy/vim-markdown'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'tbastos/vim-lua'
Plug 'pangloss/vim-javascript'

" Powerline plugin
Plug 'itchyny/lightline.vim'

" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" Navigation
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'romgrk/vim-easytags' 
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'ctrlpvim/ctrlp.vim'

" Text utils
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'     " Better search/replace case sensitive preserve

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-bbye'


" Themes
Plug 'trevordmiller/nova-vim'
Plug 'icymind/NeoSolarized'

" Writing Focus
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'


" Plug 'tpope/vim-git'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" autocmd BufWritePre *.js CocCommand prettier.formatFile
" autocmd BufWritePre *.tsx CocCommand prettier.formatFile
" autocmd BufWritePre *.ts CocCommand prettier.formatFile
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" augroup SyntaxSettings
"     autocmd!
"     autocmd BufNewFile,BufRead *.tsx set filetype=typescript
" augroup END

call plug#end()


" ----------------------------------------------------------------------------
" General
" ----------------------------------------------------------------------------
set exrc
set secure
set shell=fish
set t_Co=256
set termguicolors
set nocompatible 
filetype on
filetype plugin on
filetype indent on 
filetype plugin indent on
syntax on 
set number 
set path+=** 
set wildmenu 
set autoindent
set ignorecase
set hlsearch
set gdefault
set incsearch
set winwidth=84 
set nobackup 
set nowritebackup
" Better display for messages
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
" set noswapfile 
set winheight=10
set mouse=a
set nofoldenable    " disable folding
" Disable menu.vim
if has('gui_running') 
	set guioptions=Mc 
endif

" Disable pre-bundled plugins
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_man = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwSettings = 1
let g:loaded_rrhelper = 1
let g:loaded_shada_plugin = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1 
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
" }}}
" ----------------------------------------------------------------------------
" Clipboard
" ----------------------------------------------------------------------------
vnoremap <C-c> "*y
nnoremap <C-S-v> <C-v>
nnoremap <C-v> "*p

" ----------------------------------------------------------------------------
" Leader right way
" ----------------------------------------------------------------------------
let mapleader=","

nnoremap : ,
xnoremap : ,
onoremap : ,

nnoremap , :
xnoremap , :
onoremap , :
map q: <Nop>
nnoremap Q <nop>

" ----------------------------------------------------------------------------
" Splits
" ----------------------------------------------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
set splitbelow
set splitright

:nnoremap <F8> :vertical wincmd f<CR>

" ----------------------------------------------------------------------------
" Buffer management
" ----------------------------------------------------------------------------
:nnoremap <Leader>q :Bdelete<CR>


" ----------------------------------------------------------------------------
" Tab management
" ----------------------------------------------------------------------------
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn :tabnew<CR>
nnoremap td  :tabclose<CR>
nnoremap tm  :tabm<Space>
nnoremap H gT
nnoremap L gt
nnoremap <A-F1> 1gt
nnoremap <A-F2> 2gt
nnoremap <A-F3> 3gt
nnoremap <A-F4> 4gt
nnoremap <A-F5> 5gt
nnoremap <A-F6> 6gt
nnoremap <A-F7> 7gt
nnoremap <A-F8> 8gt
nnoremap <A-F9> 9gt
nnoremap <A-F0> 10gt

nnoremap <F8> :TagbarToggle<CR>
nnoremap <F12> :NERDTreeToggle<CR>
nnoremap <F10> :NERDTreeFind<CR>

" ----------------------------------------------------------------------------
" Make the 81st column stand out
" ----------------------------------------------------------------------------
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" ----------------------------------------------------------------------------
" Highlight matches when jumping to next
" ----------------------------------------------------------------------------
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#\%('.@/.'\)'
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" ----------------------------------------------------------------------------
" Indents
" ----------------------------------------------------------------------------
vnoremap < <gv
vnoremap > >gv
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab
" set smartindent

" ----------------------------------------------------------------------------
" Whitespace
" ----------------------------------------------------------------------------
set nowrap
set nojoinspaces                      " J command doesn't add extra space 

" ----------------------------------------------------------------------------
" Easymotion
" ----------------------------------------------------------------------------
nmap s <Plug>(easymotion-s2)
"
" " Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ----------------------------------------------------------------------------
" Status line
" ----------------------------------------------------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%*
" ----------------------------------------------------------------------------
" Writing
" ----------------------------------------------------------------------------
autocmd! User GoyoEnter Limelight 
autocmd! User GoyoLeave Limelight!


" ----------------------------------------------------------------------------
" Unordered
" ----------------------------------------------------------------------------
set cursorline 
set encoding=utf-8
set fileencoding=utf-8
set guifont=Operator\ Mono\ 13
set guioptions-=Be 
set guioptions=aAc 
"set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:• 
set directory^=$HOME/.config/nvim/tmp//
set backupdir=$HOME/.config/nvim/backup// 
set undodir=$HOME/.config/nvim/undo//
set showmatch
set smartcase
"set term=xterm-256color
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}
let g:vim_g_open_command = "google-chrome-beta"

let g:easytags_async=1
let g:easytags_auto_highlight=0

" Allow saving in root
command! -nargs=0 Sw w !sudo tee % > /dev/null


" ----------------------------------------------------------------------------
" FuzzySearch
" ----------------------------------------------------------------------------

" fzf config
nmap <C-p> :Files<cr> imap <c-x><c-l> <plug>(fzf-complete-line)

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,php,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

set rtp+=/usr/bin/fzf "Fuzzy search

" ----------------------------------------------------------------------------
" Stuff
" ----------------------------------------------------------------------------
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_highlight_close_tag = 1
" let g:javascript_plugin_flow = 1
let g:flow#enable = 0
let g:flow#omnifunc = 0
let g:coc_node_args = ['--max-old-space-size=4096']

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif


" highlight Normal ctermfg=grey ctermbg=black
" highlight nonText ctermbg=NONE

let g:vitality_tmux_can_focus = 1

" Color indent
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey


let g:EasyMotion_do_mapping = 0 " Disable default mappings

" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } 

" Plugin key-mappings. Note: It must be "imap" and "smap".  It uses <Plug>
" mappings.
" imap <C-k><Plug>(neosnippet_expand_or_jump) 
" smap <C-k><Plug>(neosnippet_expand_or_jump) 
" xmap <C-k> <Plug>(neosnippet_expand_target)
"

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
set hidden


"Session settings
let g:session_autosave = "yes"
let g:session_autoload = "yes"

" Movement within 'ins-completion-menu'
imap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<Left>" 
imap <expr><C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>" 
imap <expr><C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,javascript setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of
" languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

nmap <expr> <silent> <C-c> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

let g:nova_transparent = 1

colorscheme NeoSolarized
hi Normal guibg=NONE ctermbg=NONE 

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction



" lightline
let g:lightline = {
   \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'gitbranch' ],
  \     [ 'diagnostic', 'readonly', 'cocstatus', 'filename', 'modified' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'blame': 'LightlineGitBlame',
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ }
\ }
set noshowmode

