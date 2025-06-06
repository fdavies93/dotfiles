return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")

        local on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>r', '<CMD>lua vim.lsp.buf.rename()<CR>',
                { desc = '[R]ename' })
        end

        vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            pattern = "*.gitlab-ci*.{yml,yaml}",
            callback = function()
                vim.bo.filetype = "yaml.gitlab"
            end,
        })
        -- lspconfig.markdown_oxide.setup({
        --     on_attach = on_attach
        -- })
        -- lspconfig.clangd.setup({
        --     on_attach = on_attach
        -- })
        lspconfig.pyright.setup({
            on_attach = on_attach
        })
        -- lspconfig.pylsp.setup({})
        lspconfig.html.setup({
            on_attach = on_attach
        })
        lspconfig.bashls.setup({
            on_attach = on_attach
        })
        lspconfig.dockerls.setup({
            on_attach = on_attach
        })
        lspconfig.lua_ls.setup(
            {
                on_attach = on_attach,
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    })
                end,
                settings = {
                    Lua = {}
                }
            })
    end
}
