require("alice_w")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {})

vim.cmd("colorscheme catppuccin-frappe")
vim.cmd(":hi LineNr guibg=NONE cterm=NONE term=NONE")
vim.cmd(":hi GitGutterAdd guibg=None")
vim.cmd(":hi GitGutterChange guibg=None")
vim.cmd(":hi GitGutterDelete guibg=NONE")
vim.cmd(":hi GitGutterChangeDelete guibg=None")
-- vim.cmd(":hi Normal guibg=#424242 ctermbg=NONE")
require("style")

require("oil").setup()
