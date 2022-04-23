-- Auto install packer on first run
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

--- Automatically source this file and compile new plugins when saved.
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

return require("packer").startup({function()
    use 'wbthomason/packer.nvim' -- Have Packer manage itself

    --###################################################################
    --# Core Plugins #
    --################

    -- Theme
    -- Doom-One for nvim: https://github.com/NTBBloodbath/doom-one.nvim
    --use { 'sainnhe/everforest', config = function() require('conf.colorscheme') end }
    use { 'sainnhe/sonokai', config = function() require('conf.colorscheme') end }
    
    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    --###################################################################
    --# UX #
    --######
    
    -- Mini.nvim
    use {
        'echasnovski/mini.nvim',
        config = function()
            --require('mini.completion').setup()
            require('mini.comment').setup()
            require('mini.pairs').setup()
        end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        },
        config = function() require('conf.telescope') end
    }

    -- Which-Key
    use {
        "folke/which-key.nvim",
        config = function() require("which-key").setup { vim.cmd('set timeoutlen=500') } end
    }

    --###################################################################
    --# LSP #
    --#######
    use {
        'neovim/nvim-lspconfig',
        config = function() require('conf.lsp') end
    }

    -- Completion 
    use {
        'ms-jpq/coq_nvim', branch = 'coq',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
            { 'ms-jpq/coq.thirdparty',
                branch = '3p',
            },
        }, config = function() require('conf.coq') end
    }

    -- nvim-Metals
    use {
        "scalameta/nvim-metals",
        requires = {
            { 'nvim-lua/plenary.nvim' },
            --"mfussenegger/nvim-dap",
        },
        config = function() require('conf.nvim-metals') end
    }

    --###################################################################
    --# Packer Configs #
    --##################

    -- Automatically set up your configuration after cloning packer.nvim
    -- Must be after plugins
    if packer_bootstrap then require('packer').sync() end
end,
config = {
    -- Have packer use a popup window
    display = { open_fn = function() return require('packer.util').float({ border = "rounded" }) end }
}})
