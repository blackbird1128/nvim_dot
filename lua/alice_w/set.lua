vim.opt.nu = true;
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.undofile = true

-- vim.api.nvim_exec("set signcolumn=number",false)
vim.opt.mouse = 'a'
vim.cmd("set signcolumn=no")
vim.opt.updatetime = 50
vim.opt.termguicolors =  true
vim.o.ttimeout = false
vim.o.tm = 0


vim.o.wildignore = '*.o,*.a,__pycache__,*.class,*.swp,*.bak,*.pyc,*.min.js,*.min.css,*.png,*.jpg,*.gif,*.jpeg,*.bmp,*.ico,*.pdf,*.DS_Store,*.ttf,*.otf,*.woff,*.woff2,*.eot,*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.apk,*.exe,*.7z,*.rdb,node_modules/**,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store/*,*/.idea/*,*/.vscode/*,*/.cache/'
vim.opt.colorcolumn = "80"

-- Netrw 

--vim.g.netrw_banner = 0
--vim.g.netrw_liststyle = 3
