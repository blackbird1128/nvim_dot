return {

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim',   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }}
  },
  {
      "folke/which-key.nvim",
      init = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 500
      end,
      opts = {
          plugins = { registers = true}
      }
  },
  {
      "aserowy/tmux.nvim",
      lazy = true,
      init = function ()
          return require("tmux").setup()
      end
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
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    event = {"BufReadPre", "BufNewFile"},
  },
  {'tpope/vim-fugitive', cmd="Git"},
  {'lewis6991/gitsigns.nvim'},
  'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  {'neovim/nvim-lspconfig'},
  {"windwp/nvim-autopairs", event = "BufRead"},
  {   "github/copilot.vim",
  build = ":Copilot setup",
  event = "BufRead",
    },
    {   'simrat39/rust-tools.nvim', ft = 'rust'},
    { 'rust-lang/rust.vim', ft = 'rust' , config = function() 
            vim.g.rustfmt_autosave = 1
            local rt = require('rust-tools')
            lspconfig.rust_analyzer.setup({
                checkOnSave = {
                    command = "clippy"
                },
                on_attach = function(_, bufnr)
                    -- Hover actions
                    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions,
                    { buffer = bufnr })
                    -- Code action groups
                end,
                cmd = {"rustup", "run", "stable", "rust-analyzer"},
            })
        end
    },
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
            {"hrsh7th/cmp-path", lazy=true}, -- Optional
            {'hrsh7th/nvim-cmp'},     -- Required
            {"saadparwaiz1/cmp_luasnip"},
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {
                "L3MON4D3/LuaSnip",
                lazy=true
            }
        }
    }
}
