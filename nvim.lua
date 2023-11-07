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
vim.keymap.set('n', "<leader>bd", "<cmd>bdelete<CR>", {})
vim.keymap.set('n', "<leader>wh", "<cmd>wincmd h<CR>", {})
vim.keymap.set('n', "<leader>wj", "<cmd>wincmd j<CR>", {})
vim.keymap.set('n', "<leader>wk", "<cmd>wincmd k<CR>", {})
vim.keymap.set('n', "<leader>wl", "<cmd>wincmd l<CR>", {})
vim.keymap.set('n', "<leader>wv", "<cmd>vs<CR>", {})
vim.keymap.set('n', "<leader>ws", "<cmd>split<CR>", {})

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
    {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    "phaazon/hop.nvim",
    "terrortylor/nvim-comment",
    "neovimhaskell/haskell-vim",
    "nvim-treesitter/nvim-treesitter",
    "L3MON4D3/LuaSnip",
    { "hrsh7th/nvim-cmp"
    , dependencies = 
        { "hrsh7th/cmp-nvim-lsp"
        , "hrsh7th/cmp-nvim-lua"
        , "hrsh7th/cmp-buffer"
        , "hrsh7th/cmp-path"
        , "hrsh7th/cmp-cmdline"
        , "saadparwaiz1/cmp_luasnip"
        , "L3MON4D3/LuaSnip" }
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },
})

require("catppuccin").setup({
	flavour = "mocha",
}) 

vim.cmd.colorscheme "catppuccin"

require("telescope").setup({
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
})

require("telescope").load_extension("file_browser")

vim.keymap.set('n', '<leader>t', ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

require("bufferline").setup()

require("hop").setup()
-- place this in one of your configuration file(s)
local hop = require('hop')
vim.keymap.set('n', '<leader>h', hop.hint_char1, {})

require('nvim_comment').setup({line_mapping = "<leader>cl", operator_mapping = "<leader>c"})

local telescope_api = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope_api.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_api.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_api.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_api.help_tags, {})

require('nvim-treesitter.configs').setup({
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = 
    { "c"
    , "lua"
    , "vim"
    , "vimdoc"
    , "query"
    , "rust"
    , "go"
    , "cpp"
    , "haskell" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    enable = true,
  }
})

local cmp = require("cmp")
require("cmp").setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
	}),
})

local highlight = {
    "Red",
    "Violet",
    "Orange",
    "Cyan",
    "Yellow",
    "Blue",
    "Green",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Red", { fg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "Violet", { fg = "#cba6f7" })
    vim.api.nvim_set_hl(0, "Orange", { fg = "#fab387" })
    vim.api.nvim_set_hl(0, "Yellow", { fg = "#f9e2af" })
    vim.api.nvim_set_hl(0, "Blue", { fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "Green", { fg = "#a6e3a1" })
    vim.api.nvim_set_hl(0, "Cyan", { fg = "#94e2d5" })
end)

require("ibl").setup({indent = { highlight = highlight }, scope = {enabled = false}})

require("nvim-autopairs").setup()
