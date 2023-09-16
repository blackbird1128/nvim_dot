local opts = require("leap").opts

opts.max_phase_one_targets = nil
opts.highlight_unlabeled_phase_one_targets = false
opts.max_highlighted_traversal_targets = 12
opts.case_sensitive = false
opts.equivalence_classes = { ' \t\r\n', 'eéè','aà' }
opts.safe_labels = {}
opts.labels = {'a','z','e','r','j','k','l','m' ,'f','d','s','q','w','h'}
opts.special_keys = {
    next_target = '<Right>',
    prev_target = '<Left>',
    next_group = '<space>',
    prev_group = '<tab>',
    multi_accept = '<enter>',
    multi_revert = '<backspace>',
}

require('leap').add_default_mappings()

vim.keymap.set('n', '<leader><leader>', function ()
  local current_window = vim.fn.win_getid()
  require('leap').leap { target_windows = { current_window } }
end)


