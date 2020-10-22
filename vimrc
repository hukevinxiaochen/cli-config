" NeoVim : Default
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

call plug#begin('~/.vim/plugged')

" THE PLUGINS I WANT----------------------------------------------------------

" " Editor Config
Plug 'editorconfig/editorconfig-vim'

" " Intellisense
" coc.nvim
let g:coc_node_path='/Users/adm/.nvm/versions/node/v12.18.3/bin/node'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" " Snippets shortcuts
" emmet-vim
" use ctrl-y-,
Plug 'mattn/emmet-vim'

" " Timothy Pope Vim Suite
" git
Plug 'tpope/vim-fugitive'
" surround
Plug 'tpope/vim-surround'
" comment
Plug 'tpope/vim-commentary'
" repeat
Plug 'tpope/vim-repeat'

" " Status bars
" lightline status bar
Plug 'itchyny/lightline.vim'

" " Syntax Highlighting and Indenting and Linting

" Linting and automatic document formatting
Plug 'dense-analysis/ale'

" Markdown
" vim-gfm-syntax
Plug 'rhysd/vim-gfm-syntax'

" JavaScript
" improved syntax highlighting and indentation
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"--------------
" Color Schemes
"------------------------------------------------------------------------------

Plug 'float168/vim-colors-cherryblossom'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'vim-scripts/burnttoast256'

call plug#end()

" NeoVim Default
filetype plugin indent on

" FILE AND BUFFER MANAGEMENT--------------------------------------------------
set hidden
" Makes it so I can make changes in one buffer and move to another buffer
" without writing those changes and while leaving the changed buffer open for
" access later. This is practical for smooth switching between files while
" coding.
"
" https://medium.com/usevim/vim-101-set-hidden-f78800142855

" SPECIAL PLUGIN CONFIGS------------------------------------------------------

" editorconfig
" for compatibility with vim-fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" coc.nvim
" TextEdit might fail if hidden is not set.
" set hidden
" see 17 lines up

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" see ale_fixers

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" vim-gfm-syntax
" use markdown highlighted fenced code blocks for ruby
let g:markdown_fenced_languages = ['ruby', 'javascript']

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
" NeoVim : Default
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

" let g:my_colorschemes = [Solarized(), One(), Gruvbox(), BurntToast(), Summerfruit()]

function SwitchColorScheme ()
  call my_colorschemes[0]
endfunction

" Default
" for gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
" autocmd vimenter * colorscheme gruvbox
colorscheme solarized8_flat

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

" All of the following settings are required for 24-bit
" True Color support in Vim both inside and outside of tmux
" See :h xterm-true-color for details
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" NeoVim : Default
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


" ## OTHER STANDARD VIM CONFIGS ##

" NeoVim : Default
" Character encoding
scriptencoding utf-8
set encoding=utf-8

" NeoVim : Default
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

" 'cd' towards the directory in which the current file is edited
" but only change the path for the current window
" Credit to Dimitri Merejkowsky and his 28-12-2019 Vimways.org post
nnoremap <leader>cd :lcd %:h<CR>

" Automatically source my vimrc upon writing
noremap <leader>vimrc :tabe ~/.vimrc<cr>
" autocmd bufwritepost .vimrc nested source $MYVIMRC

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
noremap <leader>dl 0d$

" Create a new blank line below
nnoremap <leader>o o<ESC>

" Clipboard functionality
vnoremap <leader>c "*y
nnoremap <leader>c "*y
nnoremap <leader>v "*p

" Repeat fFtT movements with '
nnoremap ' ;

" jk to 'escape mode'
inoremap jk <ESC>
