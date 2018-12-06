" Vundle configuration and plugins
"""""""""""""""""""""""""""""""""""""

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" git interface
Plugin 'tpope/vim-fugitive'

" filesystem
Plugin 'scrooloose/nerdtree'
" NERDTree with tabs
Plugin 'jistr/vim-nerdtree-tabs'
" fzf 
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" ctrlP 
" (https://www.youtube.com/watch?v=9XrHk3xjYsw)
Plugin 'ctrlpvim/ctrlp.vim'

" Python PEP 8 syntax checker
Plugin 'nvie/vim-flake8'

" Python Tab-completion for Vim
Plugin 'vim-scripts/Pydiction' 

" better auto-indentation for Python
Plugin 'vim-scripts/indentpython.vim'

" JavaScript indentation and syntax support
Plugin 'pangloss/vim-javascript'

" syntax highlighting for JSON
Plugin 'leshill/vim-json'

" Syntax highlighting and indenting for JSX. JSX is a JavaScript syntax
" transformer which translates inline XML document fragments into JavaScript
" objects. It was developed by Facebook alongside React.
Plugin 'mxw/vim-jsx'

" syntax checking with Syntastic
Plugin 'vim-syntastic/syntastic'

" auto-completion stuff
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

" Python code folding
Plugin 'tmhedberg/SimpylFold' 

" linting
Plugin 'w0rp/ale'

" vim-surround
Plugin 'tpope/vim-surround'

" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'

" vim-tmux-navigator (Seamless navigation between tmux panes and vim splits)
Plugin 'christoomey/vim-tmux-navigator'

" EditorConfig plugin for Vim (http://editorconfig.org)
Plugin 'editorconfig/editorconfig-vim'

" color schemes
Plugin 'morhetz/gruvbox'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ajh17/Spacegray.vim'

" Powerline. A status bar that display things like the current virtualenv, git branch, files being edited, and much more.
" https://powerline.readthedocs.io/en/latest/
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" all of your plugins must be added before the following line
call vundle#end()            " required

" enables filetype detection 
filetype plugin indent on    

"""""""""""""""""""""""""""""""""""""

" set color scheme
colorscheme gruvbox
set background=dark    " Setting dark mode
"set background=light   " Setting light mode
" use Solarized for GUI mode and Zenburn for terminal mode
"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif
" Spacegray color scheme 
"colorscheme spacegray
" toggle color schemes between dark and light with F5
call togglebg#map("<F5>")

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" syntax highlighting
syntax on

" turn on line numbering
set nu

" disable swap files creation
"set noswapfile

" autocomplete (YouCompleteMe)
" ensures that the autocomplete window goes away when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1
" defines a shortcut for goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" code folding
set foldmethod=indent
set foldlevel=99
" enable folding with the spacebar
nnoremap <space> za
" if you want to see the docstrings for folded code with SimpylFold
let g:SimpylFold_docstring_preview=1

" set indentation for other file types
au BufNewFile,BufRead *.html, *.css, *.js
    \ set tabstop=2 softtabstop=2 shiftwidth=2

" set Syntastic to use ESLint for JavaScript
"let g:syntastic_javascript_checkers=['eslint']

" vim-javascript support for Flow
let g:javascript_plugin_flow = 1

" vim-jsx dont't expect that JSX files have .jsx extension
let g:jsx_ext_required = 0

" run the ALE linter when the file is saved, rather than 
" continuously as typing
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 0

" Python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" filesystem 
" enable fzf inside Vim once it has been installed on the system
" https://github.com/junegunn/fzf
set rtp+=~/.fzf
" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 



"------------Start Python PEP 8 stuff----------------

" number of spaces that a pre-existing tab is equal to
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" don't use actual tab character (ctrl-v)
au BufRead,BufNewFile *.py,*.pyw set expandtab
" indenting is 4 spaces 
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
" how many columns vim uses when you hit Tab in insert mode
au BufRead,BufNewFile *.py set softtabstop=4

" turn on auto-indent
au BufRead,BufNewFile *.py set autoindent

" text width
au BufRead,BufNewFile *.py set textwidth=79

" file format
au BufRead,BufNewFile *.py set fileformat=unix

" use the below highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red

" display tabs at the beginning of a line in Python mode as bad
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" make trailing whitespace be flagged as bad
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" use UNIX (\n) line endings
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" set the default file encoding to UTF-8:
set encoding=utf-8

" for full syntax highlighting:
let python_highlight_all=1

" keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerful
set backspace=indent,eol,start

" folding based on indentation:
autocmd FileType python set foldmethod=indent
" use space to open folds
nnoremap <space> za 

"----------Stop python PEP 8 stuff--------------

