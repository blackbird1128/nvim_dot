local map = function(mode, l, r, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(mode, l, r, opts)
end

vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", ":Oil<CR>")
vim.keymap.set("n","<C-s>", vim.cmd.w)
vim.keymap.set("i","<C-s>", vim.cmd.w)


vim.keymap.set("n", "ù", "%")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

-- vim.keymap.set("n", "<leader>y", '"+y')
-- vim.keymap.set("v", "<leader>Y", '"+Y')
--

-- map("n", "<leader><tab>", ":tabnew<CR>")
