vim.g.mapleader = " "

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

vim.keymap.set('t', '<D-c>', '<Esc>', { noremap = true })
vim.keymap.set('i', '<D-c>', '<Esc>', { noremap = true })

vim.cmd("syntax on")
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.hlsearch = true  -- Підсвічувати знайдене
vim.opt.incsearch = true -- Показувати пошук під час введення

vim.opt.timeoutlen = 300

vim.opt.scrolloff = 8  -- Завжди мати 8 рядків зверху і знизу

-- Встановити кольорову тему
--vim.cmd("colorscheme oxocarbon")

-- Увімкнути clipboard для копіювання з системним буфером
vim.opt.clipboard = "unnamedplus"

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {})
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {})

require("config.nvimtree")
require("config.treesitter")
require("config.cmp")
require("config.lsp")
require("config.theme")
