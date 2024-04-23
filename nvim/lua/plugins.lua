local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    "folke/which-key.nvim",
    "folke/neodev.nvim",
    {'tanvirtin/monokai.nvim', lazy = false},
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }    
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function () 
            local configs = require('nvim-treesitter.configs')
            configs.setup({
                ensure_installed = {"cpp"},
                sync_install = false,
                highlight = {enable = true},
                indent = { enable = true},
            })
        end
    }, 
    {
        'junnplus/lsp-setup.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim', -- optional
            'williamboman/mason-lspconfig.nvim', -- optional
        },
    },
    {
        'hrsh7th/cmp-nvim-lsp',
    }, 
    {
        'hrsh7th/nvim-cmp',
    },
    {
        'dcampos/nvim-snippy'
    },
    {
        'dcampos/cmp-snippy'
    },
    {
        'glepnir/template.nvim', cmd = {'Template', 'TemProject'},
        config = function()
            require('template').setup({
                temp_dir = "~/.config/nvim/template"
            })
        end
    },
    {
        'sbdchd/neoformat'
    }, 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
       
    'nvim-tree/nvim-web-devicons',
    {
      'rmagatti/auto-session',
      config = function()
        require("auto-session").setup {
          log_level = "error",
          auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        }
      end
   },
    {
      'rmagatti/session-lens',
      requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
      config = function()
        require('session-lens').setup({--[[your custom config--]]})
      end
    },
    'xiyaowong/transparent.nvim',

    {
        'numToStr/Comment.nvim',
        lazy = false,
    },
    {
        'morhetz/gruvbox'
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
      "karb94/neoscroll.nvim",
      config = function ()
        require('neoscroll').setup {

        }
      end
    },
'srcery-colors/srcery-vim'
})
