" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
 
call plug#begin('~/.config/nvim/plugged')

Plug 'w0rp/ale'

" Plug 'heavenshell/vim-jsdoc'
"

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'wokalski/autocomplete-flow'
Plug 'plasticboy/vim-markdown'

Plug 'Raimondi/delimitMate'

Plug 'trevordmiller/nova-vim'

Plug 'Shougo/neosnippet'

Plug 'Shougo/neosnippet-snippets'

Plug 'majutsushi/tagbar'

Plug 'honza/vim-snippets'

Plug 'romgrk/vim-easytags' 

"Plug 'carlitux/deoplete-ternjs'

Plug 'steelsojka/deoplete-flow'

" Plug 'flowtype/vim-flow'

Plug 'xolox/vim-misc'

Plug 'xolox/vim-session'

Plug 'mxw/vim-jsx'

Plug 'pangloss/vim-javascript'

Plug 'reedes/vim-thematic'

Plug 'scrooloose/nerdtree'

" Plug 'ternjs/tern_for_vim', {'do': 'npm install'}

Plug 'tomtom/tcomment_vim'

Plug 'vim-airline/vim-airline'

Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-sensible'

Plug 'FelikZ/ctrlp-py-matcher'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'tpope/vim-surround'

Plug 'airblade/vim-gitgutter'

Plug 'junegunn/limelight.vim'

Plug 'junegunn/goyo.vim'

" Plug 'rhysd/vim-grammarous'

Plug 'moll/vim-bbye'

Plug 'tpope/vim-abolish'                                             "Flexible search

Plug 'junegunn/fzf.vim'                                              " Fzf vimplugin

Plug 'szw/vim-g'

Plug 'tpope/vim-abolish'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-git'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync
let g:prettier#config#parser = 'flow'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#jsx_bracket_same_line = 'false'

" ----------------------------------------------------------------------------
" General
" ----------------------------------------------------------------------------
set shell=fish
set t_Co=256
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
set noswapfile 
set winheight=10
set mouse=a

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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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
set showmatch
set smartcase
"set term=xterm-256color
colorscheme nova 
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}
let g:vim_g_open_command = "chromium"

let g:easytags_async=1
let g:easytags_auto_highlight=0


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
  \ -g "*.{js,json,php,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

set rtp+=/usr/bin/fzf "Fuzzy search

" ----------------------------------------------------------------------------
" Stuff
" ----------------------------------------------------------------------------
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:jsx_ext_required = 0
" let g:javascript_plugin_flow = 1
let g:flow#enable = 0
let g:flow#omnifunc = 0

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif


highlight Normal ctermfg=grey ctermbg=black
highlight nonText ctermbg=NONE

let g:vitality_tmux_can_focus = 1

" Color indent
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" autocmd FileType javascript setlocal omnifunc=tern#Complete 
autocmd FileType javascript set formatprg=prettier\ --single-quote\ --parser\ flow\ --stdin

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } 
let g:airline#extensions#tabline#enabled = 1

" Plugin key-mappings. Note: It must be "imap" and "smap".  It uses <Plug>
" mappings.
imap <C-k><Plug>(neosnippet_expand_or_jump) 
smap <C-k><Plug>(neosnippet_expand_or_jump) 
xmap <C-k> <Plug>(neosnippet_expand_target)


" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" ----------------------------------------------------------------------------
" Ale
" ----------------------------------------------------------------------------
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1

let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_format = '%linter% : %s'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 700
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'always'
let g:ale_linter_aliases = {}
let g:ale_linters = {'go': ['gometalinter', 'go build'], 'html': [], 'javascript': ['eslint', 'flow'], 'python': ['flake8']}
let g:ale_open_list = 0
let g:ale_set_highlights = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '>>'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '✓ OK']
let g:ale_warn_about_trailing_whitespace = 1

set hidden


"let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}

"Showmatch significantly slows down omnicomplete when the first match contains
"parentheses. set noshowmatch

"Session settings
let g:session_autosave = "yes"
let g:session_autoload = "no"


" ----------------------------------------------------------------------------
" NeoComplete

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 150
let g:deoplete#auto_refresh_delay =1000
let g:deoplete#enable_camel_case = 1
"let g:deoplete#auto_complete_start_length = 3

let g:deoplete#keyword_patterns = {} 
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'

"let g:deoplete#sources#go = 'vim-go'

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " Thisdo disable full signature type on autocomplete
let g:tern#filetypes = [
			\ 'jsx',
			\ 'javascript.jsx',
			\ 'vue', 
			\ 'js'
			\ ]

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:deoplete#sources#jedi#statement_length = 0 
let g:deoplete#sources#jedi#show_docstring = 1 
let g:deoplete#sources#jedi#short_types = 1
"let g:deoplete#sources#jedi#worker_threads = 2

let g:deoplete#sources#flow#flow_bin = 'flow' 

"let g:deoplete#omni#functions = get(g:, 'deoplete#omni#functions', {}) 
"let g:deoplete#omni#functions.php = 'phpcomplete_extended#CompletePHP' 
"let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
"let g:deoplete#omni#functions.html = 'htmlcomplete#CompleteTags'

"let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns',{})
"let g:deoplete#omni#input_patterns.python = '' 
"let g:deoplete#omni#input_patterns.javascript = '[^. \t]\.\%\(\h\w*\)\?'
"let g:deoplete#omni#input_patterns.html = '.+'
"let g:deoplete#omni#input_patterns.php = 
			\ '\w+|[^. \t]->\w*|\w+::\w*'

"let g:deoplete#omni_patterns = get(g:, 'deoplete#omni_patterns', {}) 
"let "g:deoplete#omni_patterns.php = \ '\h\w*\|[^.
"\t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

"let g:deoplete#member#prefix_patterns = get(g:,'deoplete#member#prefix_patterns', {})
"let g:deoplete#member#prefix_patterns.javascript = ['\.']

let g:deoplete#tag#cache_limit_size = 5000000

" call deoplete#custom#set('buffer', 'mark', '') call deoplete#custom#set('_',
" 'matchers', ['matcher_head']) call deoplete#custom#set('_', 'matchers',
" ['matcher_full_fuzzy']) call deoplete#custom#set('_', 'disabled_syntaxes',
" ['Comment', 'String']) call deoplete#custom#set('buffer', 'mark', '*')
"
" Use auto delimiter call deoplete#custom#set('_', 'converters', \
" ['converter_auto_paren', \  'converter_auto_delimiter', 'remove_overlap'])

call deoplete#custom#source('_', 'converters', [
			\ 'converter_remove_paren', 
			\ 'converter_remove_overlap', 
			\ 'converter_truncate_abbr', 
			\ 'converter_truncate_menu',
			\ 'converter_auto_delimiter', 
			\ ])

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<Left>" 
imap <expr><C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>" 
imap <expr><C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Undo completion
inoremap <expr><C-g> deoplete#undo_completion()

" Redraw candidates
inoremap <expr><C-l> deoplete#refresh()

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>" 
noremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
imap <silent><expr><CR> pumvisible() ?
	\ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#close_popup())
		\ : (delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : "\<CR>")

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}
" }}}


"Theme conf
let g:thematic#themes = { 
			\  'laptop' : { 'colorscheme': 'solarized', 
			\ 'background' : 'light',
			\                  'transparancy': 0,
			\ 'typeface': 'Operator Mono',
			\                  'font-size': 12,
			\ },
			\  'home' : {'colorscheme': 'nova', 
			\                  'background' : 'dark', 
			\ 'transparancy': 0, 
			\                  'typeface': 'Operator Mono', 
			\'font-size': 10,
			\                },
			\}
let g:thematic#theme_name = 'OceanicNext'

nnoremap <Leader>D :Thematic pencil_dark<CR>
