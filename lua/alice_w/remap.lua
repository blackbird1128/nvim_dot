local map = function(mode, l, r, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(mode, l, r, opts)
end

vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("n","<C-s>", vim.cmd.w)
vim.keymap.set("i","<C-s>", vim.cmd.w)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- return to normal mode from terminals
map("t", "<Esc>", "<C-\\><C-n>")

-- create new tab
map("n", "<leader><tab>", ":tabnew<CR>")

