require("conform").setup({
  formatters = {
    prettier = {
      append_args = { "--print-width", "80", "--prose-wrap", "always" }
    }
  },
  formatters_by_ft = {
    python = { "isort", "black" },
    -- prettier has a good balance between liberal rules and idiomatic syntax
    markdown = { "prettier" },
  },
  format_on_save = {
    -- suggested config in docs, but might need tweaking
    timeout_ms = 500,
    lsp_format = "fallback"
  }
})
