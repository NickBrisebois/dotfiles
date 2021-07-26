local exec = vim.api.nvim_exec

local colors = require 'colors'
local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'
local cursor = require 'feline.providers.cursor'

local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.blue,
    VISUAL = colors.violet,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.red,
    ['V-REPLACE'] = colors.red,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.magenta,
    SHELL = colors.green,
    TERM = colors.blue,
    NONE = colors.yellow
}

local vi_mode_text = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    [''] = "V-BLOCK",
    V = "V-LINE",
    c = "COMMAND",
    no = "UNKNOWN",
    s = "UNKNOWN",
    S = "UNKNOWN",
    ic = "UNKNOWN",
    R = "REPLACE",
    Rv = "UNKNOWN",
    cv = "UNKWON",
    ce = "UNKNOWN",
    r = "REPLACE",
    rm = "UNKNOWN",
    t = "INSERT"
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = ' '
    elseif os == 'MAC' then
        icon = ' '
    else
        icon = ' '
    end
    return icon .. os
end

local comps = {
    vi_mode = {
        left = {
            provider = function()
                local current_text = ' '..vi_mode_text[vim.fn.mode()]..' '
                return current_text
            end,
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = colors.bg,
                    bg = vi_mode_utils.get_mode_color(),
                    style = 'bold'
                }
                return val
            end
            -- right_sep = ' '
        },
        right = {
            provider = '▊',
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color()
                }
                return val
            end,
            left_sep = ' '
        }
    },
    file = {
        info = {
            -- provider = 'file_info',
            provider = require("file_name").get_current_ufn,
            hl = {
                fg = colors.blue,
                style = 'bold'
            },
            left_sep = ' '
        },
        encoding = {
            provider = 'file_encoding',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        },
        type = {
            provider = 'file_type'
        },
        os = {
            provider = file_osinfo,
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        }
    },
    line_percentage = {
        provider = 'line_percentage',
        left_sep = ' ',
        hl = {
            style = 'bold'
        }
    },
    position = {
        provider = function()
            pos = cursor.position()
            return ' '..pos..' '
        end,
        left_sep = ' ',
        hl = function()
            local val = {
                name = vi_mode_utils.get_mode_highlight_name(),
                fg = colors.bg,
                bg = vi_mode_utils.get_mode_color(),
                style = 'bold'
            }
            return val
        end
    },
    scroll_bar = {
        provider = 'scroll_bar',
        left_sep = ' ',
        hl = {
            fg = colors.blue,
            style = 'bold'
        }
    },
    diagnos = {
        err = {
            provider = 'diagnostic_errors',
            enabled = function()
                return lsp.diagnostics_exist('Error')
            end,
            hl = {
                fg = colors.red
            }
        },
        warn = {
            provider = 'diagnostic_warnings',
            enabled = function()
                return lsp.diagnostics_exist('Warning')
            end,
            hl = {
                fg = colors.yellow
            }
        },
        hint = {
            provider = 'diagnostic_hints',
            enabled = function()
                return lsp.diagnostics_exist('Hint')
            end,
            hl = {
                fg = colors.cyan
            }
        },
        info = {
            provider = 'diagnostic_info',
            enabled = function()
                return lsp.diagnostics_exist('Information')
            end,
            hl = {
                fg = colors.blue
            }
        },
    },
    lsp = {
        name = {
            provider = 'lsp_client_names',
            left_sep = ' ',
            icon = ' ',
            hl = {
                fg = colors.yellow
            }
        }
    },
    git = {
        branch = {
            provider = 'git_branch',
            icon = ' ',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            },
        },
        add = {
            provider = 'git_diff_added',
            hl = {
                fg = colors.green
            }
        },
        change = {
            provider = 'git_diff_changed',
            hl = {
                fg = colors.orange
            }
        },
        remove = {
            provider = 'git_diff_removed',
            hl = {
                fg = colors.red
            }
        }
    }
}


local function get_filename(component, modifiers)
    -- local filename = vim.fn.expand('%:t')
    local modifiers_str = table.concat(modifiers, ":")
    local filename = vim.fn.expand("%" .. modifiers_str)
    local extension = vim.fn.expand('%:e')
    local modified_str

    local icon = component.icon or
        require'nvim-web-devicons'.get_icon(filename, extension, { default = true })

    if filename == '' then filename = 'unnamed' end

    if vim.bo.modified then
        local modified_icon = component.file_modified_icon or '●'
        modified_str = modified_icon .. ' '
    else
        modified_str = ''
    end

    return icon .. ' ' .. filename .. ' ' .. modified_str
end

local components = {
    left = {
        active = {
            comps.vi_mode.left,
            comps.file.info,
            comps.lsp.name,
            comps.diagnos.err,
            comps.diagnos.warn,
            comps.diagnos.hint,
            comps.diagnos.info
        },
        inactive = {
            comps.file.info
        }
    },
    mid = {
        active = {},
        inactive = {}
    },
    right = {
        active = {
             comps.git.add,
             comps.git.change,
             comps.git.remove,
             comps.file.os,
             comps.git.branch,
             comps.scroll_bar,
             comps.line_percentage,
             -- comps.vi_mode.right
             comps.position
        },
        inactive = {
            -- comps.file.os
        }
    }
}

local properties = {
    force_inactive = {
        filetypes = {
            'NvimTree',
            'dbui',
            'packer',
            'startify',
            'fugitive',
            'fugitiveblame'
        },
        buftypes = {'terminal'},
        bufnames = {}
    }
}

-- local components = require('feline.presets').default.components
-- local properties = require('feline.presets').default.properties

-- Force toggleterm to be inactive
-- table.insert(properties.force_inactive.filetypes, 'toggleterm')

-- Remove all inactive statusline components
-- components.left.inactive = {}
-- components.mid.inactive = {}
-- components.right.inactive = {}

-- Get highlight of inactive statusline by parsing the style, fg and bg of VertSplit
-- local InactiveStatusHL = {
--    fg = exec("highlight VertSplit", true):match("guifg=(#%d+)") or '#444444',
--    bg = exec("highlight VertSplit", true):match("guibg=(#%d+)") or '#1E1E1E',
--    style = exec("highlight VertSplit", true):match("gui=(#%d+)") or ''
--}

-- Add strikethrough to inactive statusline highlight style
-- in order to have a thin line instead of the statusline
-- if InactiveStatusHL.style == '' then
--    InactiveStatusHL.style = 'strikethrough'
--else
--    InactiveStatusHL.style = InactiveStatusHL.style .. ',strikethrough'
--end

-- Apply the highlight to the statusline
-- by having an empty provider with the highlight
--components.left.inactive[1] = {
--    provider = '',
--    hl = InactiveStatusHL
--}

-- Reset feline highlights
-- require('feline').reset_highlights()

-- Setup feline.nvim
require('feline').setup {
    default_bg = colors.bg,
    default_fg = colors.fg,
    components = components,
    properties = properties,
    vi_mode_colors = vi_mode_colors
}
