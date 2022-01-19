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
