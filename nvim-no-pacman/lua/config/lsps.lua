local setup_lsp_buffer_keybinds = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>",
        { desc = "[R]ename symbol" })
end

vim.lsp.config('lua_ls',
    {
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
                    -- ignoreDir = { "plugins" }, -- can disable this when working on plugin config
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

        on_attach = function(client, bufnr)
            setup_lsp_buffer_keybinds(bufnr)
        end,

        settings = {
            Lua = {}
        }
    }
)

vim.lsp.config('eslint', {})

vim.lsp.enable('lua_ls')

vim.lsp.config('pyright', {
    on_attach = function(client, bufnr)
        setup_lsp_buffer_keybinds(bufnr)
    end
})

vim.lsp.config('ts_ls', {
    on_attach = function(client, bufnr)
        setup_lsp_buffer_keybinds(bufnr)
    end
})

vim.lsp.enable('eslint')

vim.lsp.enable('pyright')

vim.lsp.enable('bashls')

vim.lsp.enable('ts_ls')
