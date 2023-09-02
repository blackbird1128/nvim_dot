vim.opt.nu = true;
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.undofile = true

-- vim.api.nvim_exec("set signcolumn=no",false)
vim.opt.signcolumn = 'no'
vim.opt.mouse = 'a'

-- vim.cmd("set signcolumn=number")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.termguicolors =  true

vim.o.wildignore = '*.o,*.a,__pycache__'
vim.opt.colorcolumn = "80"


