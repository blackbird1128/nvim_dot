
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link='Comment' }) -- or some grey
vim.api.nvim_set_hl(0, 'LeapMatch', {
  -- For light themes, set to 'black' or similar.
  fg = 'white', bg='None', bold = true, nocombine = true,
})
-- Lightspeed colors
--  primary labels: bg = "#f02077" (light theme) or "#ff2f87"  (dark theme)
-- secondary labels: bg = "#399d9f" (light theme) or "#99ddff" (dark theme)
-- shortcuts: bg = "#f00077", fg = "white"
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
  fg = '#5ec4ff', bg='None', bold = true, nocombine = true,
})
vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
  fg = 'white', bold = true, nocombine = true,
})

vim.api.nvim_set_hl(0,'VertSplit', { fg='white'}) -- set vertical split color to white (mainly for peekaboo)

vim.cmd(":hi LineNr guibg=NONE cterm=NONE term=NONE")
vim.cmd(":hi GitGutterAdd guibg=None")
vim.cmd(":hi GitGutterChange guibg=None")
vim.cmd(":hi GitGutterDelete guibg=NONE")
vim.cmd(":hi GitGutterChangeDelete guibg=None")
--vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#5ec4ff', bold=true})
-- vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#ffffff',underline=true  })
