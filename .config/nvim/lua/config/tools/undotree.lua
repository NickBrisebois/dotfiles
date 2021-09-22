vim.api.nvim_set_keymap('n', '<Leader>uu', ':UndotreeToggle<CR>', { noremap = true })

require('which-key').register({
    u = {
        name = '+ui-toggle',
        u = 'UndoTree'
    }
}, { prefix = "<leader>" })
