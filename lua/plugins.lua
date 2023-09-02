return {

    { "catppuccin/nvim", name = "catppuccin", priority = 10000 },

    {
          'nvim-telescope/telescope.nvim', tag = '0.1.2',
          dependencies = { 'nvim-lua/plenary.nvim',   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },}
      },

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    {'ggandor/leap.nvim', priority=1000},
    'jinh0/eyeliner.nvim',

    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    'romgrk/barbar.nvim',
    'neovim/nvim-lspconfig',
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {   "github/copilot.vim",
     build = ":Copilot setup",
    },
    {
    'simrat39/rust-tools.nvim', ft = 'rust'},
    { 'rust-lang/rust.vim', ft = 'rust' , config = function() vim.g.rustfmt_autosave = 1 end},

    {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 400
        require("which-key").setup {
            -- or leave it empty to use the default settings
        }
    end
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/cmp-nvim-lsp-signature-help'}, -- Optional
        {"hrsh7th/cmp-path"}, -- Optional
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
}
}
