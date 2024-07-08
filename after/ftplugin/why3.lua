local ft = require('Comment.ft')

vim.bo.makeprg = "why3 prove -L . % --type-only"
-- vim.bo.commentstring = "(*%s*)"
-- Error exemple:
-- File "current.mlw", line 46, characters 50-57: Error msg"

vim.cmd [[ set errorformat=file\ \"%f\"\\,\ line\ %l\\,\ characters\ %c-%k%m ]]


-- Work settings:
-- ident at two 

vim.bo.shiftwidth = 2
vim.bo.tabstop = 2 
vim.bo.softtabstop = 2 
vim.bo.expandtab = true 
vim.bo.smartindent = true

-- call why3 -L . replay (name without extension) --smoke-detector
vim.api.nvim_create_user_command('DetectSmoke',function()
    vim.cmd [[ ! why3 -L . replay %:r --smoke-detector ]]
end,{})

vim.api.nvim_create_user_command('FindProve',function()
    vim.cmd [[ Start why3find prove % ]]
end,{})

vim.api.nvim_create_user_command('Why3Ide',function()
    vim.cmd [[ Start why3 -L . ide % ]]
end,{})

vim.keymap.set('n', '<leader>sd', ':DetectSmoke<CR>', { desc = '[D]etect [S]moke' })
vim.keymap.set('n', '<leader>wi', ':Why3Ide<CR>', { desc = '[W]hy3 [I]de' })
vim.keymap.set('n', '<leader>wp', ':FindProve<CR>', { desc = '[W]hy3 [P]rove' })

ft.set('why3', {'(*%s*)', '(* %s *)'})
