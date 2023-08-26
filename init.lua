use_coc_over_lsp = true



vim.cmd([[
let mapleader="\<Space>"
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
set splitbelow
set splitright
tnoremap <C-[> <C-\><C-n>
nnoremap <leader>e :Explore<CR>
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



-- PLUGINS ->

 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not vim.loop.fs_stat(lazypath) then vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- TODO: use correct lazy settings
plugin_list = {
  { "nvim-lua/plenary.nvim", lazy = false },


  -- functional
  { "nvim-telescope/telescope.nvim", lazy = false },
  { "stevearc/overseer.nvim", lazy = false },
  { "folke/which-key.nvim", lazy = false },
  { "vim-airline/vim-airline", lazy = false},

  -- IDE features
  { "tpope/vim-sleuth", lazy = false }, -- detect text format
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate", lazy = false}, -- highlighting
  { "lukas-reineke/indent-blankline.nvim" },
 
--  { "neoclide/coc.nvim", branch = 'release'},

  { "hrsh7th/cmp-buffer", lazy = false },
  { "hrsh7th/cmp-path", lazy = false },
  { "hrsh7th/cmp-cmdline", lazy = false },
  { "hrsh7th/nvim-cmp", lazy = false },


  -- Cosmetic
  { "ryanoasis/vim-devicons", lazy = false },
  { "catppuccin/nvim", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "morhetz/gruvbox", lazy = false},
}

if (use_coc_over_lsp == true) then
  table.insert(plugin_list, { "neaclide/coc.nvim", branch = 'release'})
else
  table.insert(plugin_list,  { "williamboman/mason.nvim", lazy = false } ) -- LSP server installer
  table.insert(plugin_list,  { "williamboman/mason-lspconfig", lazy = false })
-- TODO: Replace vim-cmp with the faster alternative
  table.insert(plugin_list,  { "neovim/nvim-lspconfig", lazy = false }) -- LSP setup configs
  table.insert(plugin_list,  { "hrsh7th/cmp-nvim-lsp", lazy = false }) -- autocompletion UI
  table.insert(plugin_list,  { "hrsh7th/cmp-buffer", lazy = false })
  table.insert(plugin_list,  { "hrsh7th/cmp-path", lazy = false })
  table.insert(plugin_list,  { "hrsh7th/cmp-cmdline", lazy = false })
  table.insert(plugin_list,  { "hrsh7th/nvim-cmp", lazy = false })
end

require("lazy").setup(plugin_list)



require('plugin_configs/treesitter')
require('plugin_configs/cmp')

if (use_coc_over_lsp == true) then
  require('plugin_configs/coc')
else
  require('plugin_configs/mason')
  require('plugin_configs/lsp')
end

require('plugin_configs/telescope')
require('plugin_configs/which_key')
require('plugin_configs/indent_blankline')

require('plugin_configs/overseer')
require('overseer_configs/init')

-- <- PLUGINS



vim.cmd([[
colorscheme tokyonight-night
]])
