local map = function(mode, l, r, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(mode, l, r, opts)
end

vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("n","<C-s>", vim.cmd.w)
vim.keymap.set("i","<C-s>", vim.cmd.w)


map("n", "<leader><tab>", ":tabnew<CR>")
