" Basic config
set number relativenumber
set tabstop=2 shiftwidth=2 expandtab
set incsearch

colo peachpuff

syntax on
let g:jsx_ext_required = 0

" Map <Leader> to space bar
let mapleader="\<Space>"
nnoremap <Space> <Nop>
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>a :call ExpandNERDTree()<CR>
map <Leader>p :Files<CR>

" Need this to prevent white column in the Solarized theme
highlight clear SignColumn
" Basic config end

" Ctags
set tags=tags

" vim-sensible https://github.com/tpope/vim-sensible
if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
endif

set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

set formatoptions+=j " Delete comment character when joining commented lines

set autoread

if &history < 1000
  set history=1000
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

set sessionoptions-=options
" vim-sensible end

" Pathogen https://github.com/tpope/vim-pathogen
execute pathogen#infect()
call pathogen#helptags()
filetype plugin on
" Pathogen end

" NERDTree https://github.com/scrooloose/nerdtree
let NERDTreeMapActivateNode = '<space>'
function! ExpandNERDTree()
  if empty(glob("%"))
    NERDTreeToggle
  else
    NERDTreeFind
  endif
endfunction
noremap <C-\> :call ExpandNERDTree()<CR>
" NERDTree end


" Fuzzy Find https://github.com/junegunn/fzf
map <C-p> :Files<CR>
" Fuzzy Find end

" ALE https://github.com/w0rp/ale
" let g:ale_set_highlights = 0
highlight ALEWarning ctermbg=Yellow
highlight ALEWarning ctermfg=DarkGrey
highlight ALEError ctermbg=Red
highlight ALEError ctermfg=DarkGrey
let g:ale_linters = {
      \'javascript': ['eslint', 'flow', 'flow-language-server', 'jscs', 'jshint', 'standard', 'xo']
      \}
" ALE end

" % macro to go to the matching do/end in Ruby
runtime macros/matchit.vim
" % macro end

" Status Line
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
" Status Line end

" Frozen String Literal macro"
command Fsl call FrozenStringLiteral()

function! FrozenStringLiteral()
  let string = '# frozen_string_literal: true'
  call setline(1, string)
endfunction
" Frozen String Literal macro end"

" Change Ruby hash notation macro
let @h = 'f:xepl3xj0'

" YARD docs
hi link yardGenericTag rubyInstanceVariable
hi link yardYield yardGenericTag
hi link yardType rubyClass
hi link yardDuckType yardType
hi link yardLiteral yardType
" YARD docs end
