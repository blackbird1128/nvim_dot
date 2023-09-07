local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 600 })
  end,
  group = highlight_group,
  pattern = '*',
})

vim.cmd("augroup transparent_signs au! autocmd ColorScheme * highlight SignColumn guibg=NONE augroup END")

-- Auto cmd to set relative line numbers when it makes sense 
vim.cmd("augroup numbertoggle")
vim.cmd("autocmd!")
vim.cmd("autocmd BufEnter,FocusGained,InsertLeave * set relativenumber")
vim.cmd("autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber")
vim.cmd("augroup END")


