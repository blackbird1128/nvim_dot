require("alice_w")

--vim.cmd(":highlight SignColumn guibg=NONE")

vim.cmd("augroup transparent_signs au! autocmd ColorScheme * highlight SignColumn guibg=NONE augroup END")
