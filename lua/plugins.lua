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
          vim.o.timeoutlen = 50
      end,
      opts = {
          plugins = { registers = true}
      }
  },
  {
      "utilyre/sentiment.nvim",
      version = "*",
      event = "VeryLazy", -- keep for lazy loading
      opts = {
          -- config
      },
      init = function()
          -- `matchparen.vim` needs to be disabled manually in case of lazy loading
          vim.g.loaded_matchparen = 1
      end,
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
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
      'nvim-lualine/lualine.nvim',
  },
   {
       "github/copilot.vim",
       event = "InsertEnter",
  },
  {
      'simrat39/rust-tools.nvim', ft = 'rust'
  },
  {
      'rust-lang/rust.vim', ft = 'rust', config = function()
          local lspconfig =  require("lspconfig")
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

  {'tpope/vim-fugitive', cmd="Git"},
  {'lewis6991/gitsigns.nvim',event = {"BufReadPre", "BufNewFile"}},

}
