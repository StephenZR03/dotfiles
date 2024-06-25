--             shortcut_type = 'number',
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

    --use 'catppuccin/nvim'                           -- catppuccin theme
    --use 'sainnhe/gruvbox-material'                  -- gruvbox theme
    use 'rebelot/kanagawa.nvim'
    --use 'craftzdog/solarized-osaka.nvim'              -- solatized osaka theme
    --use({ 'kepano/flexoki-neovim', as = 'flexoki' })
    --use "kdheepak/monochrome.nvim"
    use { "ellisonleao/glow.nvim", config = function() require("glow").setup() end }
    use 'nvim-tree/nvim-web-devicons'

    -- dashboard configuration
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup({
                theme = 'hyper',
                config = {
                    week_header = {
                        enable = true,
                        append = { '千里之行，始於足下 - "A journey of a thousand miles begins with a single step."' }
                    },

                    shortcut = {
                        {
                            desc = '󰢱 Mason',
                            group = '@property',
                            action = 'Mason',
                            key = 'm',
                        },

                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },

                        {
                            desc = ' Keymaps',
                            group = 'DiagnosticHint',
                            action = 'Telescope keymaps',
                            key = 'i',
                        },

                        {
                            desc = ' Dotfiles',
                            group = '@constant',
                            action = 'e ~/.config/nvim/ | Telescope find_files cwd=',
                            key = 'd',
                        },
                    },

                    project = { enable = true, limit = 5 }
                }
            })
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use 'folke/neodev.nvim'                           -- neovim config code suggestions
    use 'numToStr/Comment.nvim'                       -- auto-commenting
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- context based comments
    use 'xiyaowong/transparent.nvim'                  -- enable trasparency
    use 'theprimeagen/harpoon'                        -- quick file navigation
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'mbbill/undotree'                             -- undo history
    use 'tpope/vim-fugitive'                          -- git integration
    use 'lewis6991/gitsigns.nvim'
    use 'f-person/git-blame.nvim'
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
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
        },
    }
end)
