return {
  -- 📁 Файловий переглядач
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- 📊 Статус бар
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- 🌈 Підсвітка синтаксису (treesitter)
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- 🎨 Теми
  --{ "projekt0n/github-nvim-theme" },
  --{ "nyoom-engineering/oxocarbon.nvim" },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },

  -- 🔍 Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- 🧬 Git-індикатори
  { "lewis6991/gitsigns.nvim" },

  -- ⚙️ LSP
  { "neovim/nvim-lspconfig" },

  -- 🤖 Автодоповнення
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },

  -- 📦 Снипети
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- 🗂 Ranger прямо в Neovim (опційно)
  { "kevinhwang91/rnvimr", build = "make" },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
    require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
          "lua_ls",
          "clangd",
          "html",
          "cssls",
          "ts_ls",
          "basedpyright",
          "ruff",
          "emmet_ls",
          "tailwindcss"
        }
      })
    end,
  },
}
