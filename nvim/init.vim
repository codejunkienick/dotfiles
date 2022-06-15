" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
 
call plug#begin('~/.config/nvim/plugged')

" Default VIM settings
Plug 'tpope/vim-sensible'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'fannheyward/telescope-coc.nvim'


" Super Power
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Powerline plugin
Plug 'itchyny/lightline.vim'

" Navigation
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'moll/vim-bbye' " Bdelete func for ,q

" Text utils
Plug 'phaazon/hop.nvim'
Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'     " Better search/replace case sensitive preserve

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'tpope/vim-fugitive'


" Themes
Plug 'glepnir/dashboard-nvim'
Plug 'folke/which-key.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'icymind/NeoSolarized'
" Plug 'sainnhe/everforest'
Plug 'navarasu/onedark.nvim'
" Plug 'olimorris/onedarkpro.nvim'
" Plug 'sainnhe/edge'
" Plug 'rose-pine/neovim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }


" Writing Focus


call plug#end()

let g:tokyonight_style = "storm"
let g:tokyonight_italic_functions = 1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ----------------------------------------------------------------------------
" General
" ----------------------------------------------------------------------------
" set exrc
let g:loaded_python_provider = 0 " disable python2
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
" Better display for messages
set cmdheight=1
set updatetime=100
set timeoutlen=500
set shortmess+=c
set signcolumn=yes
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
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1
" let g:loaded_netrwFileHandlers = 1
" let g:loaded_netrwSettings = 1
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
"
" }}}
" ----------------------------------------------------------------------------
" Clipboard
" ----------------------------------------------------------------------------
vnoremap <C-c> "*y
nnoremap <C-S-v> <C-v>
nnoremap <C-v> "*p

set clipboard+=unnamedplus


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

nnoremap <F8> :Vista!!<CR>

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
" Hop
" ----------------------------------------------------------------------------
"
nnoremap <Space>w <cmd>HopWord<cr>
nnoremap <Space>l <cmd>HopLine<cr>
" "
" " " Turn on case sensitive feature
" let g:EasyMotion_smartcase = 1
"
" " " JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

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
set guifont=Iosevka\ Nerd\ Font\ Mono\ 13
set guioptions-=Be 
set guioptions=aAc 
"set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:• 
set directory^=$HOME/.cache/nvim/tmp/
set backupdir=$HOME/.cache/nvim/backup/ 
set undodir=$HOME/.cache/nvim/undo/
set showmatch
set smartcase
"set term=xterm-256color
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}
let g:vim_g_open_command = "chromium"

let g:easytags_async=1
let g:easytags_auto_highlight=0

" Allow saving in root
command! -nargs=0 Sw w !sudo tee % > /dev/null


" ----------------------------------------------------------------------------
" Telescope
" ----------------------------------------------------------------------------
nnoremap <space>p <cmd>Telescope find_files<cr>
nnoremap <space>f <cmd>Telescope live_grep<cr>

" ----------------------------------------------------------------------------
" FuzzySearch
" ----------------------------------------------------------------------------

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~35%' }
let g:fzf_history_dir = '~/.cache/nvim/fzf-history'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" fzf config
" nnoremap <C-p> :GFiles<cr>
" nnoremap <C-f> :RG<cr>
" Paste from register into FZF instance
tnoremap <expr> <C-v> '<C-\><C-N>pi'

set rtp+=/opt/homebrew/bin/fzf "Fuzzy search

" ----------------------------------------------------------------------------
" Stuff
" ----------------------------------------------------------------------------
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



" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" " Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)
"
" " Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
"
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
"
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'
"
" " Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

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

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json,javascript setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

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
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>Telescope coc commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

nmap <expr> <silent> <C-c> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc


hi Normal guibg=NONE ctermbg=NONE 

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction


function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

let g:onedark_config = {
    \ 'style': 'cool',
\}

colorscheme onedark

" lightline
set showtabline=2
let g:lightline = {
   \ 'colorscheme': 'tokyonight',
   \ 'enable': {'statusline': 1, 'tabline' :1 },
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'gitbranch' ],
  \     [ 'diagnostic', 'readonly', 'cocstatus', 'filename', 'modified', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'lineinfo', 'percent' ],
  \     ['blame']
  \   ],
  \ },
  \ 'tab': {
  \   'active': [ 'tabnum', 'filename', 'modified' ],
  \   'inactive': [ 'tabnum', 'filename', 'modified' ] 
  \ },
  \ 'tabline': {
  \   'left': [  [ 'tabs' ] ],
  \   'right': [ [ 'close' ] ]
  \ },
  \ 'component_function': {
  \   'method': 'NearestMethodOrFunction',
  \   'filename': 'LightlineFilename',
  \   'gitbranch': 'FugitiveHead',
  \   'blame': 'LightlineGitBlame',
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
  \ 'tab_component_function': {
  \   'filename': 'MyTabFilename',
  \ },
  \ 'mode_map': {
  \ 'n' : 'N',
  \ 'i' : 'I',
  \ 'R' : 'R',
  \ 'v' : 'V',
  \ 'V' : 'VL',
  \ "\<C-v>": 'VB',
  \ 'c' : 'C',
  \ 's' : 'S',
  \ 'S' : 'SL',
  \ "\<C-s>": 'SB',
  \ 't': 'T',
  \ },
\ }

function! MyTabFilename(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnum = buflist[winnr - 1]
  let bufname = expand('#'.bufnum.':t')
  let buffullname = expand('#'.bufnum.':p')
  let buffullnames = []
  let bufnames = []
  for i in range(1, tabpagenr('$'))
    if i != a:n
      let num = tabpagebuflist(i)[tabpagewinnr(i) - 1]
      call add(buffullnames, expand('#' . num . ':p'))
      call add(bufnames, expand('#' . num . ':t'))
    endif
  endfor
  let i = index(bufnames, bufname)
  if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
    return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
  else
    return strlen(bufname) ? bufname : '[No Name]'
  endif
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
set noshowmode


let g:coc_explorer_global_presets = {
\   'neovim': {
\     'root-uri': '~/.config/neovim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Use preset argument to open it
nnoremap <space>e :<C-u>CocCommand explorer<CR>

" List all presets
nnoremap <space>el :<C-u>CocList explPresets<CR>


" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')


lua <<EOF
require('gitsigns').setup()
require('telescope').load_extension('coc')
require'hop'.setup()
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
require("which-key").setup()

local home = os.getenv('HOME')
local db = require('dashboard')
db.custom_center = {
  {icon = '?  ',
    desc = 'Recently laset session                  ',
    shortcut = 'SPC s l',
    action ='SessionLoad'},
    {icon = '?  ',
      desc = 'Recently opened files                   ',
      action =  'DashboardFindHistory',
      shortcut = 'SPC f h'},
      {icon = '?  ',
        desc = 'Find  File                              ',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
        shortcut = 'SPC f f'},
        {icon = '?  ',
          desc ='File Browser                            ',
          action =  'Telescope file_browser',
          shortcut = 'SPC f b'},
          {icon = '?  ',
            desc = 'Find  word                              ',
            aciton = 'DashboardFindWord',
            shortcut = 'SPC f w'},
            {icon = '?  ',
              desc = 'Open Personal dotfiles                  ',
              action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
              shortcut = 'SPC f d'},
              }
EOF
