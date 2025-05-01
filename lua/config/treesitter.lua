require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c", "cpp", "lua", "python", "javascript",
    "html", "css", "tsx", "typescript", "json"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
