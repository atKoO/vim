set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set laststatus=2   " всегда показывать строку статуса
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
set number
set tabstop=4
set shiftwidth=4
set smarttab
set et
set wrap
set showmatch 
set hlsearch
set incsearch
set ignorecase
set list
if has('gui')
colorscheme railscasts 
if has('win32')
set guifont=Consolas:h12:cRUSSIAN::
else
set guifont=Terminus\ 14
endif
endif
execute pathogen#infect()
syntax on
filetype plugin indent on
map <C-n> :NERDTreeToggle<CR>
map <F2> :NERDTreeFind<CR>

set autochdir
let NERDTreeChDirMode=2
let NERDTreeDirArrows=0
let g:airline_theme='light'
let g:airline_enable_nerdtree=1

set nocompatible
filetype on
filetype plugin on

let g:user_zen_expandabbr_key='<C-e>'

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_iconchars = ['►', '▼']
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin='C:\ctags58\ctags.exe'

setlocal spell spelllang=ru_ru,en_us

set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

" Tab is Next window
nnoremap <Tab> <C-W>w

" Shift-Tab is Previous window
nnoremap <S-Tab> <C-W>W

set ruler

set scrolljump=7
set scrolloff=7
set novisualbell
set autoindent
set smartindent
imap [ []<LEFT>
imap { {}<LEFT>

au Filetype html,xml,xsl source C:/Program Files (x86)/Vim/vimfiles/plugin/closetag.vim

set showcmd

nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

set textwidth=79  
set formatoptions=qrn1 

autocmd BufEnter * cd %:p:h 

set ve=all
