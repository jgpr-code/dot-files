" Start with Plugin Manager (Vundle)
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.

Plugin 'tikhomirov/vim-glsl'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
" Plugin 'altercation/vim-colors-solarized'

" Some tools for automated code formatting for python, c, c++, ... (see below)
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" NOTE: YouCompleteMe has huge RAM requirements so by default disabled
" YouCompleteMe has a compiled component, so use:
" cd ~/.vim/bundle/YouCompleteMe
" python3 install.py --clang-completer
" Plugin 'Valloric/YouCompleteMe'
"
" Adds some useful vim commands to automatically generate YCM extra conf from
" CMakeLists for example
" Plugin 'rdnetto/YCM-Generator'

" Cooler Status Line
Plugin 'vim-airline/vim-airline'

" Tab key for vim completion
Plugin 'ajh17/VimCompletesMe'

" Automatically generate tag files and manage them for jumps with :tag
Plugin 'ludovicchabant/vim-gutentags'

" Fold plugin, don't know yet if useful
Plugin 'pseewald/vim-anyfold'

" try out this plugin
Plugin 'lervag/vimtex'
" All of your Plugins must be added before the following line
" ...
call vundle#end()
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just 
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" glsl syntax highlighting for .vs.glsl and .fs.glsl files
autocmd! BufNewFile,BufRead *.vs.glsl,*.fs.glsl set ft=glsl

" NERDTree automatics if no files were specified
" Note: Now start vim with plain vim, not vim .
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" vanilla indentation for .tex files
autocmd BufWrite *.tex :execute "normal! gg=G\<C-o>\<C-o>zz"

augroup autoformat_settings
  "  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  " This doesn't work :(  autocmd FileType plaintex AutoFormatBuffer latexindent
  "  autocmd FileType dart AutoFormatBuffer dartfmt
  "  autocmd FileType go AutoFormatBuffer gofmt
  "  autocmd FileType gn AutoFormatBuffer gn
  "  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  "  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" YCM options
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_autoclose_preview_window_after_insertion = 1
" map <F9> :YcmCompleter FixIt<CR>

" Some more 'classic' settings
set nobackup
set mouse=a
set number
set expandtab
set tabstop=2
set shiftwidth=2
set ruler
set showcmd
set cursorline
set incsearch
set hlsearch
set laststatus=2
" to make copy from clipboard more convenient use this and afterwards disable!
" set paste
" 
" set foldmethod=syntax
syntax on
" set background=dark
" colorscheme solarized
color desert
" remember colors will be shown different on different computers so this is 
" actually correct if used on the university pc's oO
" highlight ColorColumn ctermfg=1 ctermbg=0
highlight CursorLine cterm=bold
