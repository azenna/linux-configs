vim.g.mapleader = ' '
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.relativenumber = true
vim.o.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', "<leader>bn", "<cmd>bnext<CR>", {})
vim.keymap.set('n', "<leader>bp", "<cmd>bprev<CR>", {})
vim.keymap.set('n', "<leader>wh", "<cmd>wincmd h<CR>", {})
vim.keymap.set('n', "<leader>wj", "<cmd>wincmd j<CR>", {})
vim.keymap.set('n', "<leader>wk", "<cmd>wincmd k<CR>", {})
vim.keymap.set('n', "<leader>wl", "<cmd>wincmd l<CR>", {})
vim.keymap.set('n', "<leader>wv", "<cmd>vs<CR>", {})
vim.keymap.set('n', "<leader>wh", "<cmd>split<CR>", {})

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

require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-telescope/telescope.nvim", tag="0.1.1",
      dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" }
    },
    "nvim-tree/nvim-tree.lua",
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    "phaazon/hop.nvim",
})

require("catppuccin").setup({
	flavour = "mocha",
}) 

vim.cmd.colorscheme "catppuccin"

require("nvim-tree").setup()

local tree_api = require("nvim-tree.api")
vim.keymap.set('n', '<leader>tt', tree_api.tree.toggle, {})

require("bufferline").setup()

require("hop").setup()
-- place this in one of your configuration file(s)
local hop = require('hop')
vim.keymap.set('n', '<leader>h', hop.hint_char1, {})

local telescope_api = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope_api.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_api.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_api.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_api.help_tags, {})

