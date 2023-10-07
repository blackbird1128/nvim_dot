vim.cmd(":highlight GitSignsAdd guibg=NONE")

vim.cmd(":highlight GitSignsChange guibg=NONE")

vim.cmd(":highlight GitSignsDelete guibg=NONE")

vim.cmd(":highlight SignColumn guibg=NONE")

vim.cmd("augroup transparent_signs au! autocmd ColorScheme * highlight SignColumn guibg=NONE augroup END")

vim.keymap.set('n', '<leader>gs', ":Git<CR>", { desc = '[G]it [S]tatus' })

vim.keymap.set('n', '<leader>gd', ":Gdiff<CR>", { desc = '[G]it [D]iff' })

vim.keymap.set('n', '<leader>ggh', ":diffget //2<CR>", { desc = 'Git get Left' })
vim.keymap.set('n', '<leader>ggl', ":diffget //3<CR>", { desc = 'Git get Right' })


require('gitsigns').setup({

    signcolumn = false,
    numhl = true,
    attach_to_untracked = false,
})
