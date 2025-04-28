local lint = require('lint')

lint.linters_by_ft = {
    python = { 'mypy', 'flake8' }
}

vim.api.nvim_create_autocmd({"BufReadPost", "BufWritePost"}, {
    pattern = { "*.py" },
    callback = function()
        -- don't throw errors if our linters aren't installed
        lint.try_lint({ 'mypy', 'flake8' }, { ignore_errors = true })
    end
})
