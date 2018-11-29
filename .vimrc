"Vundle configuration
"""""""""""""""""""""""""""""""""""""
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""


" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Install SimpylFold extension
Plugin 'tmhedberg/SimpylFold' 

" If you want to see the docstrings for folded code
let g:SimpylFold_docstring_preview=1


" Set indentation for Python following PEP 8
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Set indentation for other file types
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Better auto-indentation for Python
Plugin 'vim-scripts/indentpython.vim' 

" Flag unnecessary whitespace 
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8

" Auto-completion
Bundle 'Valloric/YouCompleteMe'
" ensures that the auto-complete window goes away when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1
" defines a shortcut for goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntax checking with syntastic
Plugin 'vim-syntastic/syntastic'

" PEP 8 checking for Python
Plugin 'nvie/vim-flake8'

" Highlighting
" for Python
let python_highlight_all=1
" general
syntax on

" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" use Solarized for GUI mode and Zenburn for terminal mode
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
" toggle Solarized between dark and light with F5
call togglebg#map("<F5>")
