-- function YankTitle()
--     vim.cmd [[exe "normal gg\"*y/<|t>\<cr>"]]
-- end
-- 
-- function YankDescription()
--     vim.cmd [[exe "normal /<|t>\<cr>j0\"+y/<|b>\<cr>"]]
-- end


vim.cmd [[
    function! YankTitle()
        exe "normal gg\"*y/<|t>\<cr>"
    endfunction

    function! YankDescription()
        exe "normal /<|t>\<cr>j0\"+y/<|b>\<cr>"
    endfunction

    function! PasteDescription()
        exe "normal \"*pgg\"+p"
        call append(line('.'), '<|t>')
        exe "normal /<|t>\<cr>jV/^Beschrijving$\<cr>dGpk"
        call append(line('.'), '<|b>')
        %s/^\s*//
        exe "normal GccVraagprijs  :"
    endfunction

    nnoremap <C-p> :call PasteDescription()<cr>

    augroup tweede
        au!
        autocmd BufReadPost *.2de.md :call YankTitle()
        autocmd BufReadPost *.2de.md :call YankDescription()
    augroup END
]]
