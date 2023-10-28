local builtin = require('telescope.builtin')

local telescope = require('telescope')

telescope.setup {
    defaults = {
        path_display = { 'smart'},
        file_ignore_patterns = { 'node_modules', 'dist', 'build', 'target', 'env', 'venv' },
    }
}

pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]ile' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind [G]it ' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]uzzy [W]ord' })
vim.keymap.set('n', '<leader>fa', builtin.live_grep, { desc = '[F]ind [A]ll' })
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = '[F]ind [B]buffer' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })


vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer'})
