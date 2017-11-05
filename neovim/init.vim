call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

" Utils
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'docunext/closetag.vim'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate' " Automatisch quotes enzo sluiten
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'lfilho/cosco.vim' "Semicolon insertion

" JS
Plug 'pangloss/vim-javascript'

" Purescript
Plug 'raichoo/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'

" HTML
Plug 'mattn/emmet-vim'

" Web
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'Twinside/vim-hoogle'
Plug 'eagletmt/ghcmod-vim'

" rplugins
Plug 'tweekmonster/nvim-api-viewer'
Plug 'neovim/node-host'

" Style
" Plug 'tomasr/molokai'
" Plug 'liuchengxu/space-vim-dark'
" Plug 'luochen1990/rainbow'
Plug 'dracula/vim'

call plug#end()

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac

set mouse=

set cursorline
set modeline
set ls=2

syntax on
colorscheme dracula
hi Comment cterm=italic
hi Normal guibg=None ctermbg=None
set nohlsearch

set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=2


set ruler

set splitbelow
set splitright

set nobackup
set nowritebackup

set noswapfile

set scrolloff=5

let mapleader=","

let g:ctrlp_map = '<leader>f'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|\.git|vendor|coverage|report|compiled|dist|tmp|output)$'

let g:rainbow_active = 1

let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

"Emmet trigger with ctrl-e
let g:user_emmet_expandabbr_key = '<c-e>'

"Easymotion keybind
nmap ; <Plug>(easymotion-s)
vmap ; <Plug>(easymotion-s)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFind<CR>
nmap <Leader>o :set paste!<CR>
nnoremap <Leader>b :buffer<Space>term
nnoremap <Leader>g :CtrlPTag<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap ; :
inoremap jk <ESC>

"Pipe cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"JavaScript / Angular
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "ng-']

"Purescript
let g:psc_ide_log_level = 0
let g:psc_ide_syntastic_mode = 1

au FileType purescript map <leader>t :Ptype<CR>
au FileType purescript nmap <leader>s :Papply<CR>
au FileType purescript nmap <leader>p :Pursuit<CR>
au FileType purescript nmap <leader>g :Pgoto<CR>
nmap <leader>g <C-]>

au FileType purescript nmap <leader>fm :set foldmethod=manual<CR>zE<CR>
au FileType purescript nmap <leader>fe :set foldmethod=expr<CR>
au FileType purescript setlocal foldexpr=PureScriptFoldLevel(v:lnum)

function! PureScriptFoldLevel(l)
  return getline(a:l) =~ "^\d*import"
endfunction



set completeopt=longest,menuone
let g:ycm_semantic_triggers = {
      \ 'purescript': ['re!\w+']
      \ }

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_javascript_checkers = ['eslint']

highlight SyntasticWarningSign guifg=black guibg=yellow
highlight SyntasticStyleWarningSign guifg=black guibg=yellow

" Haskell helpers

" Show types in completion suggestions
let g:necoghc_enable_detailed_browse = 1
" Resolve ghcmod base directory
au FileType haskell let g:ghcmod_use_basedir = getcwd()

nnoremap <Leader>hh :Hoogle<CR>
nnoremap <Leader>hH :Hoogle
nnoremap <Leader>hi :HoogleInfo<CR>
nnoremap <Leader>hI :HoogleInfo
nnoremap <Leader>hz :HoogleClose<CR>
nnoremap <Leader>ht :GhcModType<CR>
nnoremap <Leader>hc :GhcModTypeClear<CR>

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gt :Gblame<CR>

" neovim
if has('nvim')
  tnoremap jk <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  vmap <Leader>e y<C-l>p
  nmap <Leader>e vipy<C-l>p
  nnoremap <Leader>t :e term://zsh<CR>
  nnoremap <Leader>vt :vs term://zsh<CR>
  nmap <Leader>l :let @r = '(enter! ' . '"' . expand("%") . '")'<CR><C-l>"rpa<CR>

  set inccommand=nosplit
endif


" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


function! s:Colors()
  let num = 255
  execute 'vnew'
  while num >= 0
      exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
      exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
      call append(0, 'ctermbg='.num.':....')
      let num = num - 1
  endwhile
endfunction
command! -nargs=0 Colors call s:Colors()



augroup jump_to_tags
  autocmd!

  " Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
  " split instead.
  "
  " Both of them will align the destination line to the upper middle part of the
  " screen.  Both will pulse the cursor line so you can see where the hell you
  " are.  <c-\> will also fold everything in the buffer and then unfold just
  " enough for you to see the destination line.
  nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
  nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>

  " Pulse Line (thanks Steve Losh)
  function! s:Pulse() " {{{
    redir => old_hi
    silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor
    for i in range(end, start, -1 * width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor

    execute 'hi ' . old_hi
  endfunction " }}}

  command! -nargs=0 Pulse call s:Pulse()
augroup END

function! s:CafeLogs()
  execute '?Detailed logs'
  normal f/
  normal vj$hy
  execute 'new'
  normal pJx
  normal 0y$
  execute 'e! ' . @"
  "normal Go
endfunction



command! -nargs=0 CafeLogs call s:CafeLogs()<Paste>
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)


"vnoremap <silent> y y:call ClipboardYank()<cr>
"vnoremap <silent> d d:call ClipboardYank()<cr>
"nnoremap <silent> p :call ClipboardPaste()<cr>p
