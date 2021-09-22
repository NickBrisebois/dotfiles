require"toggleterm".setup {
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<A-=>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    -- The degree by which to darken to terminal colour.
    -- default: 1 for dark backgrounds, 3 for light
    shading_factor = 1,
    start_in_insert = true,
    persist_size = true,
    direction = 'float',
    shell = vim.o.shell,
    float_opts = {
        -- The border key is *almost* the same as 'nvim_win_open'
        -- see :h nvim_win_open for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'double',
        width = 110,
        height = 30,
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        }
    }
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local normalterm = Terminal:new({ hidden = true })
local wk = require('which-key')

function _lazygit_toggle()
    lazygit:toggle()
end

function _terminal_toggle()
    normalterm:toggle()
end

vim.api.nvim_set_keymap("n", "<Leader>tg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>tt", "<cmd>lua _terminal_toggle()<CR>", {noremap = true, silent = true})

wk.register({
    t = {
        name = '+toggleterm',
        t = 'Toggle terminal',
        g = 'Toggle lazygit',
    }
}, { prefix = "<leader>" })
