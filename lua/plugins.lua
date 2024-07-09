return {
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
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
  {
      'numToStr/Comment.nvim',
      opts = {},
      event = "InsertEnter",
  },
  {
      'Julian/lean.nvim',
      event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

      dependencies = {
          'neovim/nvim-lspconfig',
          'nvim-lua/plenary.nvim',
          -- you also will likely want nvim-cmp or some completion engine
      },

      opts = {
          lsp = {
              on_attach = on_attach,
          },
          mappings = true,
      }
  },
  {
      "whonore/Coqtail"
  },
  {
      "tomtomjhj/coq-lsp.nvim" ,
      opts = {}
  },
  {
    "mcauley-penney/tidy.nvim",
    init = function()
     vim.keymap.set('n', "<leader>tt", require("tidy").toggle, {})
     vim.keymap.set('n', "<leader>tr", require("tidy").run, {})
     end
  },
  {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  }
  }
  ,{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
      "HiPhish/rainbow-delimiters.nvim",
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
      'brenoprata10/nvim-highlight-colors',
      config = function()
          require('nvim-highlight-colors').setup({})
      end
  },
  -- { "github/copilot.vim" ,event="InsertEnter"},
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
  {'tpope/vim-dispatch', cmd={"Make","Start"}},
  {'lewis6991/gitsigns.nvim',event = {"BufReadPre", "BufNewFile"}},

}
