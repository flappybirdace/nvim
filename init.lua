-- TODO: Explore how to make command height 0
-- setting cmdheight=0 makes it required to press
-- enter twice when using remaps that end with <CR>



local use_coc_over_lsp = false



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
nnoremap <leader>e :Explore<CR>
nnoremap <leader>w <C-w>

tnoremap <C-[> <C-\><C-n>
]])
vim.opt.shell = 'pwsh'


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
  { "folke/which-key.nvim", lazy = false },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  { 'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- IDE features
  { "stevearc/overseer.nvim", lazy = false },
  { "tpope/vim-sleuth", lazy = false }, -- detect text format
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate", lazy = false}, -- highlighting
  { "lukas-reineke/indent-blankline.nvim" },
  { "iamcco/markdown-preview.nvim", build =  "call mkdp#util#install()"},

--  { "neoclide/coc.nvim", branch = 'release'},

  { "hrsh7th/cmp-buffer", lazy = false },
  { "hrsh7th/cmp-path", lazy = false },
  { "hrsh7th/cmp-cmdline", lazy = false },
  { "hrsh7th/nvim-cmp", lazy = false },


  -- Cosmetic
  { "ryanoasis/vim-devicons", lazy = false },
  -- Colorschemes
  { "catppuccin/nvim", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "morhetz/gruvbox", lazy = false},
  { "rebelot/kanagawa.nvim", lazy = false},
  { "bluz71/vim-moonfly-colors", lazy = false},
  { "nanotech/jellybeans.vim", lazy = false},
  { "noahfrederick/vim-hemisu", lazy = false},
  { "fneu/breezy", lazy = false},
  { "Jorengarenar/vim-darkness", lazy = false},
}

if (use_coc_over_lsp == true) then
  table.insert(plugin_list, { "neaclide/coc.nvim", branch = 'release'})
else
  table.insert(plugin_list,  { "williamboman/mason.nvim", lazy = false } ) -- LSP server installer
  table.insert(plugin_list,  { "williamboman/mason-lspconfig", lazy = false })
-- TODO: Replace vim-cmp with coq 
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
  require('plugin_configs/nvim_lspconfig')
  require('plugin_configs/lsp')
end

require('plugin_configs/telescope')
require('plugin_configs/telescope_file_browser')
require('plugin_configs/which_key')
require('plugin_configs/indent_blankline')
require('plugin_configs/lualine')
require('plugin_configs/overseer')
require('plugin_configs/markdown_preview')


require('overseer_configs/init')


-- <- PLUGINS


-- BINDINGS ->

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- <- BINDINGS


vim.cmd([[
colorscheme kanagawa
]])


