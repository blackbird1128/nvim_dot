vim.cmd(":highlight GitSignsAdd guibg=NONE")

vim.cmd(":highlight GitSignsChange guibg=NONE")

vim.cmd(":highlight GitSignsDelete guibg=NONE")

vim.cmd(":highlight SignColumn guibg=NONE")

vim.cmd("augroup transparent_signs au! autocmd ColorScheme * highlight SignColumn guibg=NONE augroup END")

require('gitsigns').setup({

    signcolumn = false,
    numhl = true,
})
