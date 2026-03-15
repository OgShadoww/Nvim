return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "clangd",
        "codelldb",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_ls",
        "basedpyright",
        "ruff",
        "zls",
        "marksman",
        "gopls",
        "asm-lsp"
      },
    })

    local lspconfig = require("lspconfig")

    -- (nice) capabilities for cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = { Lua = { diagnostics = { globals = { "vim" } } } },
    })

    -- C/C++
    lspconfig.clangd.setup({
      capabilities = capabilities,
      -- you can add args here if needed
      -- cmd = { "clangd", "--background-index" },
    })

    -- Asm
    lspconfig.asm_lsp.setup({
      capabilities = capabilities,
      filetypes = { "asm", "s", "S" },
    })

    -- Python
    lspconfig.ruff.setup({
      capabilities = capabilities,
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,
    })

    -- Zig
    lspconfig.zls.setup({
      capabilities = capabilities,
    })

     lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    -- Markdown
    lspconfig.marksman.setup({
      capabilities = capabilities,
    })

    lspconfig.codelldb.setup({})

    lspconfig.basedpyright.setup({
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoImportCompletions = true,
            diagnosticMode = "openFilesOnly",
          },
        },
      },
    })

    -- Web
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.tailwindcss.setup({ capabilities = capabilities })

    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "html","css","javascript","javascriptreact",
        "typescriptreact","svelte","vue"
      },
    })

    -- TypeScript (compat with both names)
    if lspconfig.ts_ls then
      lspconfig.ts_ls.setup({ capabilities = capabilities })
    else
      lspconfig.tsserver.setup({ capabilities = capabilities })
    end
  end,
}

