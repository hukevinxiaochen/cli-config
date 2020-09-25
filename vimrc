" 'compatible' 'cp'	boolean	(default on, off when a |vimrc| or |gvimrc|
" 					file is found, reset in |defaults.vim|)
" 			global
" 	This option has the effect of making Vim either more Vi-compatible, or
" 	make Vim behave in a more useful way.
"
" 	This is a special kind of option, because when it's set or reset,
" 	other options are also changed as a side effect.
" 	NOTE: Setting or resetting this option can have a lot of unexpected
" 	effects: Mappings are interpreted in another way, undo behaves
" 	differently, etc.  If you set this option in your vimrc file, you
" 	should probably put it at the very start.
"
" 	By default this option is on and the Vi defaults are used for the
" 	options.  This default was chosen for those people who want to use Vim
" 	just like Vi, and don't even (want to) know about the 'compatible'
" 	option.
"
" 	when a |vimrc| or |gvimrc| file exists, Vim will use the Vim
" 	defaults, otherwise it will use the Vi defaults.
" :h nocompatible
if &compatible
  set nocompatible              " be iMproved, required
endif

" ~~~~~~~~~~~~~~~~~
" PLUGIN MANAGEMENT
" ~~~~~~~~~~~~~~~~~

" VUNDLE CONFIGS--------------------------------------------------------------
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternate:
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" THE PLUGINS I WANT----------------------------------------------------------

" " Editor Config
Plugin 'editorconfig/editorconfig-vim'

" " Intellisense
" coc.nvim
let g:coc_node_path='/Users/adm/.nvm/versions/node/v12.18.3/bin/node'
Plugin 'neoclide/coc.nvim'

" " Snippets shortcuts
" emmet-vim
" use ctrl-y-,
Plugin 'mattn/emmet-vim'

" " File Navigation
" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'

" " Timothy Pope Vim Suite
" git
Plugin 'tpope/vim-fugitive'
" surround
Plugin 'tpope/vim-surround'
" repeat
Plugin 'tpope/vim-repeat'

" " Status bars
" lightline status bar
Plugin 'itchyny/lightline.vim'

" " Syntax Highlighting and Indenting and Linting

" Linting and automatic document formatting
Plugin 'dense-analysis/ale'

" Markdown
" vim-gfm-syntax
Plugin 'rhysd/vim-gfm-syntax'

" JavaScript
" improved syntax highlighting and indentation
Plugin 'pangloss/vim-javascript'
" Plugin 'yuezk/vim-js'
" Plugin 'mxw/vim-jsx'

" HTML template tags
" Plugin 'jonsmithers/vim-html-template-literals'

" SQL template tags
" Plugin 'statico/vim-javascript-sql'

"--------------
" Color Schemes
"------------------------------------------------------------------------------

Plugin 'float168/vim-colors-cherryblossom'
Plugin 'rakr/vim-one'
Plugin 'morhetz/gruvbox'
Plugin 'lifepillar/vim-solarized8'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'vim-scripts/burnttoast256'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" SPECIAL PLUGIN CONFIGS--------------------------------------------------

" editorconfig
" for compatibility with vim-fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" coc.nvim
set cmdheight=2
set updatetime=300
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" vim-gfm-syntax
" use markdown highlighted fenced code blocks for ruby
let g:markdown_fenced_languages = ['ruby', 'javascript']

" CtrlP
let g:ctrlp_show_hidden=1

" Ale
let g:ale_linters_explicit = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_fixers = {
      \'*': ['remove_trailing_lines', 'trim_whitespace'],
      \}
" see ftplugin files for which linters and fixers are configured
" for their respective languages

" Lightline
" lightline configuration function for fugitive
" function! LightlineFugitive()
" 	return exists('*fugitive#head') ? fugitive#head() : ''
" endfunction

" make lightline work
set laststatus=2
set noshowmode
let g:lightline = {
\ 'colorscheme': 'one',
\ 'active': {
\ 	'left': [ [ 'mode', 'paste' ], 
\             [ 'fugitive' ], 
\             [ 'modified' ] ],
\   'right':[ ['lineinfo'],
\             ['percent'],
\             ['filename', 'filetype'] ]
\	},
\ 'component' :{
\   'charvaluehex': '0x%B'
\ },
\ 'component_function': {
\	  'fugitive': 'fugitive#head'
\	},
\ }

" Color Schemes----------------------------------------------------------------

function ToggleBackgroundColour ()
    if (&background == 'light')
        set background=dark
        echo "background -> dark"
    else
        set background=light
        echo "background -> light"
    endif
endfunction

noremap <F7> :call ToggleBackgroundColour()<CR>

" Default
" for gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
" autocmd vimenter * colorscheme gruvbox
colorscheme gruvbox

" Solarized
" Lowest contrast, even in high contrast mode
function! g:Solarized()
	colorscheme solarized8_high
endfunction

" One
function g:One()
  colorscheme one
endfunction

" Gruvbox
" Lower contrast, more than Solarized
function g:Gruvbox()
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_contrast_light = 'hard'
  colorscheme gruvbox
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


" APPENDIX A - VUNDLE
" HELP------------------------------------------------------------------
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" see :h vundle for more details or wiki for FAQ

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

" All of the following settings are required for 24-bit
" True Color support in Vim both inside and outside of tmux
" See :h xterm-true-color for details
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Configure backspace behavior
" <https://stackoverflow.com/questions/11560201/backspace-key-not-working-in-vim-vi>
" By default this option is empty, not allowing you to backspace over 
" auto-indents, end-of-line chars, and start-of-line.
" This is the standard Vi behavior.
set backspace=indent,eol,start

set mouse=a

" APPEARANCE--------------------------------------------------------------------
" Not colorscheme related view and appearance related settings.
" Highlight search results
set hlsearch

" set custom color for highlighting search results
hi Search ctermfg=19 ctermbg=51

" Use the same symbols as TextMate for tabstops and EOLs
" tab   - tab         : Black Right-Pointing Small Triange U+25B8 &#9656
" eol   - end of line : Not Sign U+00AC &#172;
" space - space       : Ogham Space Mark U+1680 &#5760
set listchars=space:·,tab:▸\ ,eol:¬,trail:•

" Set default tab size to 2 spaces
set tabstop=2
set shiftwidth=2

" Hitting tab will cause vim to use spaces
set expandtab

" FILE AND BUFFER MANAGEMENT--------------------------------------------------
set hidden
" Makes it so I can make changes in one buffer and move to another buffer
" without writing those changes and while leaving the changed buffer open for
" access later. This is practical for smooth switching between files while
" coding.
"
" https://medium.com/usevim/vim-101-set-hidden-f78800142855

" ## OTHER STANDARD VIM CONFIGS ##

" Character encoding
scriptencoding utf-8
set encoding=utf-8

" Shows text in different colors and calls filetype on
syntax enable

" Show line numbers
set number relativenumber
" Get rid of netrw banner that shows
" the directory, sort sequence and commands
let g:netrw_banner = 0

" Set netrw window size to 25% of total window
" let g:netrw_winsize = 25

" Set netrw liststyle
let g:netrw_liststyle = 3

" Ignore case when sorting by name
let g:netrw_sort_options="i"

"-------------------------------------------------------------------------------
" Keybindings
" NOTE:
" To determine the special key code representation that can be used 
" in a map command, in insert mode, press the <CTRL-K> key followed by the key.
"-------------------------------------------------------------------------------

" Space leader
let mapleader = " "

" Automatically source my vimrc upon writing
noremap <leader>vimrc :tabe ~/.vimrc<cr>
autocmd bufwritepost .vimrc nested source $MYVIMRC

" Toggle line numbers
nnoremap <C-N><C-N> :set invnumber<CR>

" Toggle `set list`, a command that shows white spaces.
nnoremap <leader>s :set list!<CR>

" Buffers
noremap <leader>n :bn<CR>
noremap <leader>p :bp<CR>
noremap <leader>d :bd<CR>
noremap <leader>l :ls<CR>
noremap <leader>m :e .<CR>

" Tabs
noremap te :tabe
noremap <leader>tc :tabclose<CR>

" Write using leader key
noremap <leader>w :w<CR>

" Write and exit with leader
noremap <leader>q :wq<CR>

" Run commands with semicolon
nnoremap ; :

" Format document
noremap <leader>f :ALEFix<CR>

" Delete line contents
noremap <leader>d 0d$

" Move lines downward/upward in the file
" Down
noremap - 0d$o<esc>p

" Up
" noremap _ 0d$O<esc>p

" Clipboard functionality
vnoremap <leader>y "*y
nnoremap <leader>y "*y
nnoremap <leader>p "*p

" Repeat fFtT movements with '
nnoremap ' ;

" jk to 'escape mode'
inoremap jk <ESC>
