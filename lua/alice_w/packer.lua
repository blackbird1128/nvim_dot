-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  requires = { {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      }
    }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine')
    end
  })

  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')



  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use('mbbill/undotree')

  use('nvim-tree/nvim-web-devicons') -- OPTIONAL: for file icons
  use('romgrk/barbar.nvim')
  use {
      "windwp/nvim-autopairs",
     config = function() require("nvim-autopairs").setup {} end
  }

  use {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
          require("copilot").setup({
              suggestion = { enabled = true , auto_trigger = true }

          })
      end
  }
 -- use("ggandor/leap.nvim")
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

-- Lua
  use {
      "folke/which-key.nvim",
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 400
          require("which-key").setup {
              -- or leave it empty to use the default settings
          }
      end
  }

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional
          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
      }
  }

end)
