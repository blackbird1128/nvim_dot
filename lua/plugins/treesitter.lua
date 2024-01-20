return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    event = {"BufNewFile", "BufAdd"},
    config = function()
    require'nvim-treesitter.configs'.setup {

        sync_install = false,

        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        ident = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "vv",
                node_incremental = "v",
                node_decremental = "V",
            },
        },

    }
    end

}
