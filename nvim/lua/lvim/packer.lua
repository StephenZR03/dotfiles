-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use 'catppuccin/nvim'                             -- catppuccin theme
    use 'sainnhe/gruvbox-material'                    -- gruvbox theme
    use 'folke/neodev.nvim'                           -- neovim config code suggestions
    use 'numToStr/Comment.nvim'                       -- auto-commenting
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- context based comments
    use 'xiyaowong/transparent.nvim'                  -- enable trasparency
    use 'theprimeagen/harpoon'                        -- quick file navigation
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'mbbill/undotree'                             -- undo history
    use 'tpope/vim-fugitive'                          -- git integration
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use "christoomey/vim-tmux-navigator"
    use {
        "zbirenbaum/copilot.lua",
    }
    use {
        "zbirenbaum/copilot-cmp",
        config = function()
            require('copilot_cmp').setup()
        end
    }
    use {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" },     -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" },      -- for curl, log wrapper
        },
    }
end)
