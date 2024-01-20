vim.cmd(":highlight GitSignsAdd guibg=NONE")

vim.cmd(":highlight GitSignsChange guibg=NONE")

vim.cmd(":highlight GitSignsDelete guibg=NONE")

vim.cmd(":highlight SignColumn guibg=NONE")

vim.cmd("augroup transparent_signs au! autocmd ColorScheme * highlight SignColumn guibg=NONE augroup END")

vim.keymap.set('n', '<leader>gs', ":Git<CR>", { desc = '[G]it [S]tatus' })

vim.keymap.set('n', '<leader>gd', ":Git diff<CR>", { desc = '[G]it [D]iff' })
vim.keymap.set('n', '<leader>ggh', ":diffget //2<CR>", { desc = 'Git get Left' })
vim.keymap.set('n', '<leader>ggl', ":diffget //3<CR>", { desc = 'Git get Right' })


require('gitsigns').setup({

    signcolumn = false,
    numhl = true,
    attach_to_untracked = false,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<leader>hb', function() gs.blame_line{full=true} end, {desc="[H]over [B]lame"})
        map('n', '<leader>tb', gs.toggle_current_line_blame, {desc="[T]oggle [B]lame"})
    end

})
