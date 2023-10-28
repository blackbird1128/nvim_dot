
return  {
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            -- options
        },
    },
    {'neovim/nvim-lspconfig',event={"BufAdd", "BufNewFile"},
    dependencies = {
        {'williamboman/mason.nvim', cmd="Mason"},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

    },
    config = function()
        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config

        lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
        )

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = {buffer = event.buf}


                local nmap = function(keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
                end

                nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                nmap("gd",function()  vim.lsp.buf.definition()end, '[G]oto [D]efinition')
                nmap("K",function() vim.lsp.buf.hover() end, '[K]ind')
                nmap("<leader>vd",function() vim.diagnostic.open_float() end, '[V]iew [D]iagnostics')
                nmap("<leader>rn", function ()  vim.lsp.buf.rename()  end, '[R]ename')
                nmap("<leader>ca", function () vim.lsp.buf.code_action() end, '[C]ode [A]ction')
                nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

            end
        })

        local default_setup = function(server)
            lspconfig[server].setup({})
        end

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {default_setup},
        })

    end
}
}
