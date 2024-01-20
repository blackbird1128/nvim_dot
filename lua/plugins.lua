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
          vim.o.timeoutlen = 5
      end,
      opts = {
          plugins = { registers = true}
      }
  },
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
      'numToStr/Comment.nvim',

      opts = {
          -- add any options here
      },
      event = {"BufAdd,BufNewFile"},
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
  { "github/copilot.vim" ,event="InsertEnter"},
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
