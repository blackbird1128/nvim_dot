local lsp = require('lsp-zero').preset({})


lsp.on_attach(function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  local opts = {buffer = bufnr,remap = false}
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap("gd",function()  vim.lsp.buf.definition()end, '[G]oto [D]efinition')
  nmap("K",function() vim.lsp.buf.hover() end, '[K]ind')
  nmap("<leader>vd",function() vim.diagnostic.open_float() end, '[V]iew [D]iagnostics')
  nmap("<leader>rn", function ()  vim.lsp.buf.rename()  end, '[R]ename')
  nmap("<leader>ca", function () vim.lsp.buf.code_action() end, '[C]ode [A]ction')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

 -- see :help lsp-zero-keybindines
  -- to learn the available actions
end  )

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


lsp.setup()
lspconfig = require('lspconfig')

-- Rust part

-- end Rust part

