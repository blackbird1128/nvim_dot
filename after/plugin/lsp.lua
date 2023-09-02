local lsp = require('lsp-zero').preset({})
local luasnip = require("luasnip")

lsp.on_attach(function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  local opts = {buffer = bufnr,remap = false}
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  vim.keymap.set("n", "gd",function()  vim.lsp.buf.definition()end, opts)
  vim.keymap.set("n", "K",function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vd",function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>rn", function ()  vim.lsp.buf.rename()  end,opts)
  vim.keymap.set("n", "<leader>ca", function () vim.lsp.buf.code_action() end,opts)
 -- see :help lsp-zero-keybindines
  -- to learn the available actions
end  )

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


lsp.setup()

local rt = require('rust-tools')

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lspconfig = require('lspconfig')

-- Rust part
lspconfig.rust_analyzer.setup({
  on_attach = function(_, bufnr)
    -- Hover actions
    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions,
    { buffer = bufnr })
    -- Code action groups
  end,
  cmd = {"rustup", "run", "stable", "rust-analyzer"},
})
-- end Rust part

