require('lualine').setup {
options = {
    icons_enabled = false,
    theme = 'seoul256',
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' }
},
sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {"os.date('%H:%M')", 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
},
inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
},

}
