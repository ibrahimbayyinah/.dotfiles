-- Presentation: show images. Source: https://github.com/sdaschner/dotfiles/blob/master/.vimrc
vim.cmd [[
" Automatically source an eponymous <file>.vim or <file>.<ext>.vim if it exists, as a bulked-up
" modeline and to provide file-specific customizations.
function! s:AutoSource()
    let l:testedScripts = ['syntax.vim']
    if expand('<afile>:e') !=# 'vim'
        " Don't source the edited Vimscript file itself.
        call add(l:testedScripts, 'syntax.vim')
    endif

    for l:filespec in l:testedScripts
        if filereadable(l:filespec)
            execute 'source' fnameescape(l:filespec)
        endif
    endfor

    call FindExecuteCommand()
endfunction
augroup AutoSource
    autocmd! BufNewFile,BufRead * call <SID>AutoSource()
augroup END

function! FindExecuteCommand()
  let line = search('\S*!'.'!:.*')
  if line > 0
    let command = substitute(getline(line), "\S*!"."!:*", "", "")
    execute "silent !". command
    execute "normal gg0"
    redraw
  endif
endfunction

map <F5> :call FindExecuteCommand()<cr>

let mapleader = " "

" makes Ascii art font
nmap <leader>a :.!toilet -w 200 -f pagga<CR>
nmap <leader>b :.!toilet -w 200 -f ascii9<CR>
nmap <leader>c :.!toilet -w 200 -f ascii12<CR>
nmap <leader>d :.!toilet -w 200 -f bigascii12<CR>
nmap <leader>e :.!toilet -w 200 -f bigascii9<CR>
nmap <leader>f :.!toilet -w 200 -f bigmono12<CR>
nmap <leader>g :.!toilet -w 200 -f bigmono9<CR>
nmap <leader>h :.!toilet -w 200 -f circle<CR>
nmap <leader>i :.!toilet -w 200 -f future<CR>
nmap <leader>j :.!toilet -w 200 -f letter<CR>
nmap <leader>k :.!toilet -w 200 -f mono12<CR>
nmap <leader>l :.!toilet -w 200 -f emboss2<CR>
nmap <leader>m :.!toilet -w 200 -f emboss<CR>
nmap <leader>n :.!toilet -w 200 -f mono9<CR>
nmap <leader>o :.!toilet -w 200 -f smascii12<CR>
nmap <leader>q :.!toilet -w 200 -f smblock<CR>
nmap <leader>s :.!toilet -w 200 -f smbraille<CR>
nmap <leader>t :.!toilet -w 200 -f mono12<CR>
nmap <leader>u :.!toilet -w 200 -f wideterm<CR>

" makes Ascii border
nmap <leader>1 :.!toilet -w 200 -f term -F border<CR>
]]
