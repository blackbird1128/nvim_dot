return  {
    {
        'hrsh7th/nvim-cmp',event = "InsertEnter",
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp-signature-help'}, -- Optional
            {"hrsh7th/cmp-path" }, -- Optional
            {"hrsh7th/cmp-buffer"},
            {"saadparwaiz1/cmp_luasnip"},
            {'hrsh7th/cmp-nvim-lsp'},
            {
                "L3MON4D3/LuaSnip",
                dependencies= {
                    "rafamadriz/friendly-snippets"
                }
            }
        },
        config = function ()

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            local cmp = require('cmp')

            cmp.setup {
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                formatting = {
                    format = function(_, item)
                        item.menu = ""
                        return item
                    end,
                },
                sources =  cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'treesitter' },
                    { name = 'nvim_lsp_signature_help' },
                    {name = 'path'},
                    {name = 'luasnip'},
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({
                    }),
                    ["<C-n>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                            -- that way you will only jump inside the snippet region
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s"}),

                    ["<C-p>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s"})
                }
            }

        end
    }
}

