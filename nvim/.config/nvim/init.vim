 " call plug#begin('~/local/share/nvim/plugged')

 " A Vim Plugin for Lively Previewing LaTeX PDF Output
 " Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

 " call plug#end()

" ----------------------------------------------
 " BASIC STUFF
" ----------------------------------------------
"
set number relativenumber

 " using zsh as default shell
set shell=/usr/bin/zsh

 " explicitly loading all plugins (not needed)
 "packloadall

 " syntax highlighting
syntax on

 " map leader to the Spacebar key
let mapleader =  " " 

" Set the color scheme to use Gruvbox.
colorscheme gruvbox




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
