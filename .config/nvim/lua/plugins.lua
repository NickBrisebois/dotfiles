-- Plugins
local packer = require('packer')
local use = packer.use

packer.reset()
packer.init {
    git = {
        clone_timeout = -1
    }
}

-- Packer
use 'wbthomason/packer.nvim'

-- Neovim GUI Shim
use { 'equalsraf/neovim-gui-shim', opt = true }

-- Colorscheme
use 'tomasiser/vim-code-dark'
use 'yashguptaz/calvera-dark.nvim'
use 'rakr/vim-one'
use 'sainnhe/sonokai'
use 'yong1le/darkplus.nvim'

-- Statusline
use 'famiu/feline.nvim'

-- Tab bar
use 'akinsho/nvim-bufferline.lua'

-- Start screen
use 'mhinz/vim-startify'

-- Colorize color codes
use 'chrisbra/Colorizer'

-- Neovim icons
use 'kyazdani42/nvim-web-devicons'

-- Indent guides
use { 'lukas-reineke/indent-blankline.nvim' }

-- Which Key
use 'folke/which-key.nvim'

-- File Tree
use 'kyazdani42/nvim-tree.lua'

-- Git
use 'tpope/vim-fugitive'
use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
use 'junegunn/gv.vim'
use 'APZelos/blamer.nvim'

-- Undo Tree
use 'mbbill/undotree'

-- Terminal
use 'akinsho/nvim-toggleterm.lua'

-- Color Picker
use 'KabbAmine/vCoolor.vim'

-- Surround
use 'tpope/vim-surround'

-- Comments
use 'b3nj5m1n/kommentary'

-- Tabs and text alignment
use 'godlygeek/tabular'

-- Delimit characters automatically
use 'Raimondi/delimitMate'

-- UNIX helper
use 'tpope/vim-eunuch'

-- Automatically change current directory
use 'airblade/vim-rooter'

-- Better buffer delete
use 'famiu/bufdelete.nvim'

-- Snippets
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/vim-vsnip-integ'

-- LSP
use 'neovim/nvim-lspconfig' -- Configuration
use 'ray-x/lsp_signature.nvim' -- Signature Help
use 'kosayoda/nvim-lightbulb' -- Lightbulb on Code Action
use 'simrat39/symbols-outline.nvim' -- Symbols list

-- Lua development
use 'rafcamlet/nvim-luapad'

-- Telescope
use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
}

-- Better quickfix window
use 'kevinhwang91/nvim-bqf'

-- Completion
use 'hrsh7th/nvim-compe'

-- Tresitter
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use 'nvim-treesitter/nvim-treesitter-textobjects'

use 'williamboman/nvim-lsp-installer'

-- Debugging
use 'mfussenegger/nvim-dap'
use 'mfussenegger/nvim-dap-python'
use 'theHamsta/nvim-dap-virtual-text'
use 'nvim-telescope/telescope-dap.nvim'

-- Reload config
use 'famiu/nvim-reload'
