return {

    { "catppuccin/nvim", name = "catppuccin", priority = 10000 },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim',   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },},
        event = "VeryLazy",
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            plugins = {
                registers = false,
            }
        }
    },
    {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {'ggandor/leap.nvim'},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {'tpope/vim-fugitive', cmd="Git"},
    {'lewis6991/gitsigns.nvim', event="VeryLazy"},
--    {'mbbill/undotree',event="VeryLazy" },²
    {'junegunn/vim-peekaboo', event="VeryLazy"},
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    {'romgrk/barbar.nvim'},
    {'neovim/nvim-lspconfig', event="VeryLazy"},
    {"windwp/nvim-autopairs", lazy=true},
    {   "github/copilot.vim",
     build = ":Copilot setup",
     event = "BufRead",
    },
    {   'simrat39/rust-tools.nvim', ft = 'rust'},
    { 'rust-lang/rust.vim', ft = 'rust' , config = function() vim.g.rustfmt_autosave = 1 end},
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim', cmd="Mason"},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional
        -- Autocompletion
        {'hrsh7th/cmp-nvim-lsp-signature-help'}, -- Optional
        {"hrsh7th/cmp-path"}, -- Optional
        {'hrsh7th/nvim-cmp'},     -- Required
        {"saadparwaiz1/cmp_luasnip"},
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {
            "L3MON4D3/LuaSnip",
        }
    }
}
}
