return {

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim',   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },},
  },
  {
        "folke/which-key.nvim",
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
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
  },
  {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
        'nvim-lualine/lualine.nvim',
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {'tpope/vim-fugitive', cmd="Git"},
  {'lewis6991/gitsigns.nvim' },
  {'junegunn/vim-peekaboo' },
  'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  {'neovim/nvim-lspconfig'},
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
