return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
        format_on_save = {
            timeout_ms = 5000,
            lsp_format = "fallback"
        },
        formatters_by_ft = {
            markdown = { "prettier" }
        },
        formatters = {
            prettier = {
                command = "npx",
                args = { "prettier", "--wrap", "80", "--prose-wrap", "always", "-w", "$FILENAME" },
                stdin = false
            }
        }
    }
}
