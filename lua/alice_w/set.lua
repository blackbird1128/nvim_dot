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
vim.o.mouse = 'a'

-- vim.cmd("set signcolumn=number")

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 600 })
  end,
  group = highlight_group,
  pattern = '*',
})

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.termguicolors =  true

vim.o.wildignore = '*.o,*.a,__pycache__'
vim.opt.colorcolumn = "80"
