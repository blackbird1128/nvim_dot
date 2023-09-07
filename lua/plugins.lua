return {

    { "catppuccin/nvim", name = "catppuccin", priority = 10000 },

    {
          'nvim-telescope/telescope.nvim', tag = '0.1.2',
          dependencies = { 'nvim-lua/plenary.nvim',   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },}
      },

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {'tpope/vim-fugitive'},
    'lewis6991/gitsigns.nvim',
    'mbbill/undotree',
    'junegunn/vim-peekaboo',
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    'romgrk/barbar.nvim',
    'neovim/nvim-lspconfig',
    "windwp/nvim-autopairs",
    {   "github/copilot.vim",
     build = ":Copilot setup",
    },
    {   'simrat39/rust-tools.nvim', ft = 'rust'},
    { 'rust-lang/rust.vim', ft = 'rust' , config = function() vim.g.rustfmt_autosave = 1 end},
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
