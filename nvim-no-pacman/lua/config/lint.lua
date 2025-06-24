local lint = require('lint')

lint.linters_by_ft = {
    python = { 'mypy', 'flake8' },
    yaml = { 'yamllint', 'cfn_lint' }
}

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "ModeChanged", "BufEnter" }, {
    pattern = { "*.py" },
    callback = function()
        -- don't throw errors if our linters aren't installed
        lint.try_lint({ 'mypy', 'flake8' }, { ignore_errors = true })
    end
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "ModeChanged", "BufEnter" }, {
    pattern = { "*.yaml" },
    callback = function()
        -- don't throw errors if our linters aren't installed
        lint.try_lint({ 'yamllint', 'cfn_lint' }, { ignore_errors = true })
    end
})
