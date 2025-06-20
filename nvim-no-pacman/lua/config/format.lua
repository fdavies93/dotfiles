require("conform").setup({
  formatters_by_ft = {
    python = { "isort", "black" },
    javascript = { "prettier", "eslint" },
    typescript = { "prettier", "eslint" },
  },
  format_on_save = {
    -- suggested config in docs, but might need tweaking
    timeout_ms = 500,
    lsp_format = "fallback"
  }
})
