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
    -- use { 'romgrk/doom-one.vim', config = function() require('conf.doom-one') end }
    use {
        'sainnhe/everforest',
        config = function() require('conf.everforest') end
    }
    
    -- Treesitter -> Not needed after 7.0
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    --###################################################################
    --# UX #
    --######

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
        config = function() require("which-key").setup { } end
    }

    -- Completion
    use {
        "hrsh7th/cmp-nvim-lsp",
        requires = { {"hrsh7th/cmp-vsnip"},
            {"hrsh7th/vim-vsnip"},
    }}

    --###################################################################
    --# LSP #
    --#######

    -- nvim-Metals
    use {
        "scalameta/nvim-metals",
        requires = {{
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-vsnip",
                "hrsh7th/vim-vsnip",
            }},
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
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
