local utils = require('utils')
local lsputils = require('config.lsp.utils')

-- Path where lspinstall installs LSP servers
local lspinstall_path = vim.fn.stdpath('data') .. '/lspinstall/'

-- Client setup
lsputils.clients['clangd'].setup {
    on_attach = function(client, bufnr)
        lsputils.default_on_attach(client, bufnr)

        local opts = { noremap = true, silent = true }

        lsputils.client_add_binds(
            bufnr,
            {{'n', '<Leader>lh', '<cmd>ClangdSwitchSourceHeader<CR>', opts}},
            { h = 'Switch source/header' },
            { prefix = '<leader>l' }
        )
    end
}

lsputils.clients['tsserver'].setup {}

lsputils.clients['rust_analyzer'].setup {
    on_attach = function(client, bufnr)
        lsputils.default_on_attach(client, bufnr)

        local opts = { noremap = true, silent = true }

        lsputils.client_add_binds(
            bufnr,
            {{'n', '<Leader>lR', '<cmd>CargoReload<CR>', opts}},
            { R = 'Reload workspace' },
            { prefix = '<leader>l' }
        )
    end,
    settings = {
        ['rust-analyzer'] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
}

lsputils.clients['sumneko_lua'].setup {
    cmd = {
        lspinstall_path .. 'lua/sumneko-lua-language-server',
        '-E', lspinstall_path .. 'lua/main.lua'
    },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    }
}

lsputils.clients['pyright'].setup {
    on_attach = function(client, bufnr)
        lsputils.default_on_attach(client, bufnr)

        local opts = { noremap = true, silent = true }

        lsputils.client_add_binds(
            bufnr,
            {{'n', '<Leader>lo', '<cmd>PyrightOrganizeImports<CR>', opts}},
            { o = 'Organize imports' },
            { prefix = '<leader>l' }
        )
    end
}

lsputils.clients['cmake'].setup {
    cmd = {
        lspinstall_path .. 'cmake/venv/bin/cmake-language-server'
    }
}

lsputils.clients['bashls'].setup {}
lsputils.clients['gdscript'].setup {}
