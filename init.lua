vim.cmd([[
let mapleader="\<Space>"
]])

vim.cmd([[
set nocompatible
syntax on
filetype plugin indent on
set encoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase
set modelines=0
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set signcolumn=yes:1
tnoremap <C-[> <C-\><C-n>
]])


vim.cmd([[
if exists('g:vscode')
  nmap j gj
  nmap k gk
else
  nnoremap j gj
  nnoremap k gk
endif
]])


vim.cmd([[
nnoremap <leader>e :Explore<CR>
]])

-- PLUGINS ->
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not vim.loop.fs_stat(lazypath) then vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- TODO: use correct lazy settings
require("lazy").setup({
  -- libary
  { "nvim-lua/plenary.nvim", lazy = false },


  -- functional
  { "nvim-telescope/telescope.nvim", lazy = false },
  { "stevearc/overseer.nvim", lazy = false },
  { "folke/which-key.nvim", lazy = false },

  -- IDE features
  { "tpope/vim-sleuth", lazy = false }, -- detect text format
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate", lazy = false}, -- highlighting
  { "williamboman/mason.nvim", lazy = false }, -- LSP server installer
  { "williamboman/mason-lspconfig", lazy = false },
  { "neovim/nvim-lspconfig", lazy = false }, -- LSP setup configs

  { "hrsh7th/cmp-nvim-lsp", lazy = false }, -- autocompletion UI
  { "hrsh7th/cmp-buffer", lazy = false },
  { "hrsh7th/cmp-path", lazy = false },
  { "hrsh7th/cmp-cmdline", lazy = false },
  { "hrsh7th/nvim-cmp", lazy = false },


  -- Cosmetic
  { "ryanoasis/vim-devicons", lazy = false },
  { "catppuccin/nvim", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
})




require('plugin_configs/treesitter')

require('plugin_configs/mason')

require('plugin_configs/lsp')

require('plugin_configs/telescope')

require('plugin_configs/which_key')

require('plugin_configs/overseer')


-- <- PLUGINS

vim.cmd([[
colorscheme tokyonight-night
]])
