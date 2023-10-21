return  {"windwp/nvim-autopairs", event = "InsertEnter",
config = function()

    require("nvim-autopairs").setup {}

    local cmp = require "cmp"
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

    local npairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')

    npairs.setup({
        check_ts = true,
    })
    -- you can use some built-in conditions
    --
    local cond = require('nvim-autopairs.conds')

    -- Rust

    npairs.add_rules({
        Rule("%S<$",">","rust")
        :use_regex(true)
    })

    npairs.add_rules({
        Rule("|","|","rust"),
        Rule("&","&","rust")
    })

    -- HTML

    npairs.add_rules({
        Rule("<!--","-->",{"html","htmldjango"}),
        Rule("<",">",{ "html", "htmldjango" }),
        Rule("{%","%","htmldjango")

    })
end 
}
