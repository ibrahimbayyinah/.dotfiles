 " call plug#begin('~/local/share/nvim/plugged')

 " A Vim Plugin for Lively Previewing LaTeX PDF Output
 " Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

 " call plug#end()

 " Plugins. Managed by vim-plug
 " To install:
 " $ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
 "     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
 " Then run :PlugInstall in neovim
 "
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'https://github.com/vim-scripts/AutoComplPop'
Plug 'https://github.com/gruvbox-community/gruvbox'
" Plug 'morhetz/gruvbox'
" Plug 'xuhdev/vim-latex-live-preview'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Extra (optional) dependencies for telescope: `ripgrep` and `fd`
" remaps for telescope in the `plugins` directory
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" Neovim Tree shitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" lsp
"
" Plug 'mbbill/undotree'
"
" Plug 'https://github.com/tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
call plug#end()
" ----------------------------------------------
 " BASIC STUFF
" ----------------------------------------------
"
" Setting some sane options:

" Write :h <option> to get help on a particular option. Or type :options to get a list of all the options with a short description for each.

set number relativenumber " Line numbers and relative numbers:

" Tabs and indentation:
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" ThePrimeagen options:
set exrc " Sources project specific vimrc's
set guicursor=i:block " Block cursor in insert mode
" set hidden
set noerrorbells " No annoying error sounds
" set nowrap
set ignorecase
set smartcase " Case sensitive search when searching for a capital letter. Otherwise case insensitive search. (Requires ignorecase to be set).
set undodir=~/.local/share/nvim/undo
set undofile
set incsearch
set scrolloff=8 " To start scrolling when the cursor is 8 lines above the last line in the current view
set colorcolumn=80
" With that you might also want to do:
" highlight ColorColumn ctermbg=4 guibg=Red
" But put that line below the gruvbox colours configuration, or else it won't
" work for some reason
set signcolumn=yes " Extra column to show error signs and whatnot

 " using zsh as default shell
set shell=/usr/bin/zsh

 " explicitly loading all plugins (not needed on some systems)
" packloadall

 " syntax highlighting
syntax on

 " map leader to the Spacebar key
let mapleader =  " " 

" Set the color scheme to use Gruvbox.
" autocmd vimenter * ++nested colorscheme gruvbox " only needed if using morhetz/gruvbox
" To force terminal to display italics. This setting must be before
" `colorscheme gruvbox` (just like all other gruvbox settings must be before it):
let g:gruvbox_italic=1
" highlight Normal guibg=none
set termguicolors
" To switch to light theme:
set bg=light
" highlight ColorColumn ctermbg=4 guibg=Red
" Hard contrast in light mode:
let g:gruvbox_contrast_light='soft'
colorscheme gruvbox



" ----------------------------------------------
" *.mom files
" ----------------------------------------------
"

function! CompileMomDoc()
	w %
	" !pdfmom % | /usr/bin/zathura - &
    !pdfmom % > "%:p:t:r.pdf"
endfunction

augroup momfiles
    au!
    autocmd BufReadPost *.mom set syntax=mom " set syntax to mom for *.mom files (requires a mom.vim syntax file in the $RUNTIME/syntax dir (either user-specific or global)
    " autocmd BufReadPost *.mom nnoremap <leader>g :call CompileMomDoc()<cr>
    autocmd BufNewFile,BufReadPost *.mom nnoremap <F5> :call CompileMomDoc()<cr>
augroup END



" ----------------------------------------------
" xuhdev/vim-latex-live-preview CONFIGS 
" ----------------------------------------------
"
 " choosing zathura as default previewer for LaTeX previews
let g:livepreview_previewer = 'zathura'

 "choosing xelatex as default compiler
let g:livepreview_engine = 'xelatex'

 " choosing biber as backend to handle bibliography
let g:livepreview_use_biber = 1




" ----------------------------------------------
"  AUTOCOMPLETE STUFF
" ----------------------------------------------
"
 " allow auto-corrections to pop up when pressing <C-p> in insert mode
set complete+=kspell

 " showing autocomplete menu also when there is just one option,
 " choosing the longest option by default
set completeopt=menuone,longest

 " getting rid of the long status message when autocompleting words
set shortmess+=c

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <j> pumvisible() ? "<C-n>" :"<j>"
inoremap <expr> <k> pumvisible() ? "<C-p>" : "<k>"

inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Omnisharp bindings:
" Tab completion when previous character is not whitespace or newline char:
" (from: https://medium.com/@kpereksta/setting-up-a-c-development-environment-with-vim-on-debian-ea42d5b810 
" or: https://github.com/Skyl3r/debian-configs/blob/master/.vimrc )
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'



" ----------------------------------------------
"  CUSTOM MAPS AND FUNCTIONS
" ----------------------------------------------
"
 
 "save document with <leader>w
nnoremap <leader>w :w<cr>

 "remove highlights with leader+h
nnoremap <leader>h :noh<cr>

function! FixLastSpellingError()
	normal! mn[s1z=`n
endfunction
nnoremap <leader>fp :call FixLastSpellingError()<cr>

 " <leader>s to save the current document
nnoremap <leader>s :w %<cr>

function! CompileLatexDoc()
	w %
	!xelatex %
endfunction
nnoremap <leader>p :call CompileLatexDoc()<cr>

 " <leader>d to delete the current line and save it to the clipboard
nnoremap <leader>d :d+<cr>

 " toggle NerdTree
nmap <C-f> :NERDTreeToggle<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open current line in web browser and delete line:
" function! OpenURL()
" 	:d+<cr>
" 	!python -m webbrowser -t <C-r>"+<cr>
" endfunction
" nnoremap <leader>o :call OpenURL()<cr>
"
function! HandleURL()
	" let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
	let s:uri = getline(".")
	echo s:uri
	if s:uri != ""
		silent exec "!brave --incognito '".s:uri."'"
	else
		echo "No URI found in line."
	endif
	normal! dd
endfunction
map <leader>o :call HandleURL()<cr>

" TODO:
" Make function to toggle light and dark background: :set background=light
" Set up cursor inversion during hl search. See:
" https://github.com/gruvbox-community/gruvbox/wiki/Usage



" This should be in the plugins directory:

function! YankTitle()
	exe "normal gg\"*y/<|t>\<cr>"
endfunction

function! YankDescription()
    exe "normal /<|t>\<cr>j0\"+y/<|b>\<cr>"
endfunction

augroup tweede
    au!
    autocmd BufReadPost *.2de.md :call YankTitle()
    autocmd BufReadPost *.2de.md :call YankDescription()
    " autocmd BufReadPost *.2de.md nnoremap <leader>yd :call YankDescription()<cr>
    " autocmd BufReadPost *.2de.md nnoremap <leader>yt :call YankTitle()<cr>
augroup END
