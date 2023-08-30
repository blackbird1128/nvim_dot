local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]ile' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind [G]it ' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]uzzy [W]ord' })
