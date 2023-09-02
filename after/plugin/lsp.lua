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

local cmp = require('cmp')
cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'treesitter' },
    { name = 'nvim_lsp_signature_help' },
    {name = 'path'},
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Esc>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
    }),
     ["Down"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
      -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["Up"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
}
