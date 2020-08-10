" Configure backspace behavior
set backspace=indent,eol,start

"-------------------------------------------------------------
" Brief Help
"-------------------------------------------------------------------------------
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ

" VUNDLE CONFIGS--------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " Keep Plugin commands between vundle#begin/end.

" " alternatively, pass a path where Vundle should install plugins
" " call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" THE PLUGINS I WANT----------------------------------------------------------

" " Timothy Pope Vim Suite
" git
Plugin 'tpope/vim-fugitive'
" surround
Plugin 'tpope/vim-surround'
" repeat
Plugin 'tpope/vim-repeat'

" " Syntax Highlighting and Indenting and Linting
" JavaScript
" indentation
Plugin 'pangloss/vim-javascript'

" linting
Plugin 'dense-analysis/ale'
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \}

" Markdown
" vim-gfm-syntax
Plugin 'rhysd/vim-gfm-syntax'

" Vimtex
" Plugin 'lervag/vimtex'

" " Status bars

" lightline status bar
Plugin 'itchyny/lightline.vim'

"--------------
" Color Schemes
"-------------------------------------------------------------------------------

Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'vim-scripts/burnttoast256'

"-------------------------------- 
" EXAMPLES OF VUNDLE declarations
"-------------------------------------------------------------------------------
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" SPECIAL PLUGIN CONFIGS--------------------------------------------------
" make lightline work
set laststatus=2
set noshowmode
let g:lightline = {
\ 'colorscheme': 'one',
\ 'active': {
\ 	'left': [ [ 'mode', 'paste' ], [ 'fugitive' ], [ 'filename' ] ]
\	},
\ 'component_function': {
\	'fugitive': 'LightlineFugitive'
\	}
\ }

" lightline configuration function for fugitive
function! LightlineFugitive()
	return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" have jsx highlighting in js files too
let g:jsx_ext_required = 0

" use markdown highlighted fenced code blocks for ruby
let g:markdown_fenced_languages = ['ruby', 'javascript']

" Put your non-Plugin stuff after this line

" ## OTHER STANDARD VIM CONFIGS ##

" Character encoding
scriptencoding utf-8
set encoding=utf-8

" Shows text in different colors and calls filetype on
syntax enable

" Show line numbers
set number

" Get rid of netrw banner that shows
" the directory, sort sequence and commands
let g:netrw_banner = 0

" Set netrw window size to 25% of total window
let g:netrw_winsize = 25

" Color Schemes----------------------------------------------------------------

" Default
set background=dark
colorscheme burnttoast256

" Solarized Dark
" " Good for more relaxed, just highlight source code
function! g:SolarizedDark()
	set background=dark
	let g:solarized_termcolors=256
	colorscheme solarized
endfunction

" Solarized Light
" " Good for more relaxed, just highlight source code
function! g:SolarizedLight()
	set background=light
	let g:solarized_termcolors=256
	colorscheme solarized
endfunction

" Burnt Toast 256
" " Good for comments, high contrast
function g:BurntToast()
  set background=dark
  colorscheme burnttoast256
endfunction

" Summerfruit 256
" " Good for comments, high contrast
function g:Summerfruit()
   set background=light
   colorscheme summerfruit256
endfunction

" Single-quote leader
let mapleader = "'"

" Run commands with semicolon
nnoremap ; :

" Repeat movements with comma
nnoremap , ;

" Save or write using leader key
noremap <leader>w :w<CR>

" Save and exit with leader
noremap <leader>e :wq<CR>

" Clipboard functionality
vnoremap <leader>y "*y
nnoremap <leader>y "*y

" Highlight search results
set hlsearch

" Toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>

" jk to 'escape mode'
inoremap jk <ESC>

" Toggle `set list`, a command that shows white spaces.
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Set default tab size to 2 spaces
set tabstop=2
set shiftwidth=2
" " Hitting tab will cause vim to use spaces
set expandtab


