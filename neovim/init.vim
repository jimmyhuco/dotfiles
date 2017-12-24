call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic', {'for': ['purescript']}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'pelodelfuego/vim-swoop'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'


" Purescript
Plug 'raichoo/purescript-vim', {'for': 'purescript'}
Plug 'FrigoEU/psc-ide-vim', {'for': 'purescript'}


" Haskell
Plug 'neomake/neomake'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
" Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'owickstrom/neovim-ghci', { 'for': 'haskell' }


" Style
" Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

let g:python3_host_prog = '/home/jimmy/.pyenv/shims/python3'

let mapleader=","

" https://andrew.stwrt.ca/posts/project-specific-vimrc/
set exrc
set secure

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac
" colorscheme dracula
set background=dark
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
colorscheme PaperColor

hi Comment cterm=italic
hi Normal guibg=None ctermbg=None
" tabs and spaces handling
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2



nnoremap <Leader>f :Files<CR>
let g:swoopIgnoreCase = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\uE0C0"
let g:airline_right_sep = "\uE0C2"

" set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])



" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!output/*" --glob "!bower_components/*" --glob "!.psc-package/*" --glob "!node_modules/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

set grepprg=rg\ --vimgrep



"Purescript
let g:psc_ide_log_level = 0
let g:psc_ide_syntastic_mode = 1

au FileType purescript map <leader>t :Ptype<CR>
au FileType purescript nmap <leader>s :Papply<CR>
au FileType purescript nmap <leader>p :Pursuit<CR>
au FileType purescript nmap <leader>g :Pgoto<CR>
" nmap <leader>g <C-]>

au FileType purescript nmap <leader>fm :set foldmethod=manual<CR>zE<CR>
au FileType purescript nmap <leader>fe :set foldmethod=expr<CR>
au FileType purescript setlocal foldexpr=PureScriptFoldLevel(v:lnum)

function! PureScriptFoldLevel(l)
 return getline(a:l) =~ "^\d*import"
endfunction

set completeopt=longest,menuone



"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

highlight SyntasticWarningSign guifg=black guibg=yellow
highlight SyntasticStyleWarningSign guifg=black guibg=yellow



let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)




" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords<Paste>

" Conceal {{{
" Use same color behind concealed unicode characters
hi clear Conceal

" Pretty unicode haskell symbols
let g:haskell_conceal_wide = 1
let g:haskell_conceal_enumerations = 1
let hscoptions="𝐒𝐓𝐄𝐌xRtB𝔻w"

" Disable haskell-vim omnifunc
" let g:haskellmode_completion_ghc = 0
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" hi ghcmodType ctermbg=black
" let g:ghcmod_type_highlight = 'ghcmodType'

augroup ghciMaps
  au!
  " Maps for ghci. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>gs :GhciStart<CR>
  au FileType haskell nnoremap <silent> <leader>gk :GhciKill<CR>

  " Restarting GHCi might be required if you add new dependencies
  au FileType haskell nnoremap <silent> <leader>gr :GhciRestart<CR>

  " Open GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>go :GhciOpen<CR>
  " Open GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>gov :GhciOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>gh :GhciHide<CR>

  " RELOADING (PICK ONE):

  " Automatically reload on save
  au BufWritePost *.hs GhciReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :GhciReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>gl :GhciLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>gf :GhciLoadCurrentFile<CR>
augroup END

" GHCi starts automatically. Set this if you'd like to prevent that.
let g:ghci_start_immediately = 0

" Customize how to run GHCi
let g:ghci_command = 'stack repl'
let g:ghci_command_line_options = '--ghci-options="-fobject-code"'

set tags=tags;/,codex.tags;/


function! Mydict()
  let expl=system('sdcv -n ' .
        \  expand("<cword>"))
  windo if
        \ expand("%")=="diCt-tmp" |
        \ q!|endif
  25vsp diCt-tmp
  setlocal buftype=nofile bufhidden=hide noswapfile
  1s/^/\=expl/
  1
endfunction
nmap F :call Mydict()<CR>
