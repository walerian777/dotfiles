" Basic config
set number
set tabstop=2 shiftwidth=2 expandtab
set incsearch

colo peachpuff

syntax on
let g:jsx_ext_required = 0

" Need this to prevent white column in the Solarized theme
highlight clear SignColumn
" Basic config end

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
noremap <C-\> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode = '<space>'
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
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
" Status Line end
