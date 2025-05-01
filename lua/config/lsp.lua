local lspconfig = require('lspconfig')

-- Для C/C++
lspconfig.clangd.setup {}

-- HTML
lspconfig.html.setup({})

-- CSS
lspconfig.cssls.setup({})

-- TailwindCSS
lspconfig.tailwindcss.setup({})

-- Emmet (для HTML, JSX, шаблонів)
lspconfig.emmet_ls.setup({
  filetypes = {
    "html", "css", "javascript", "javascriptreact",
    "typescriptreact", "svelte", "vue"
  },
})

-- Для Lua (щоб не сварився на Neovim API)
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
