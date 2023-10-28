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
-- vim.cmd(":hi Normal guibg=#424242 ctermbg=NONE")  
require("style")
require("oil").setup({
     default_file_explorer = true,
})

--local arg_count = #vim.v.argv
--if arg_count == 3 and vim.v.argv[3] == "." then
--   require("oil").open()
--end
