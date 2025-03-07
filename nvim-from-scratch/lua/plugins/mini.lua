return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require("mini.pick").setup()
        require("mini.statusline").setup()
        require("mini.icons").setup()
        require("mini.extra").setup()
        require("mini.completion").setup()
        require("mini.indentscope").setup({
            draw = {
                animation = require("mini.indentscope").gen_animation.none()
            }
        })
        require('mini.notify').setup()
        require("config.mini-clue")

        vim.keymap.set("n", "<leader>fe", MiniExtra.pickers.explorer, { desc = "[F]ind [E]xplorer" })
        vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files, { desc = "[F]ind [F]iles" })
        vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { desc = "[F]ind [B]uffer" })
        vim.keymap.set("n", "<leader><leader>", MiniPick.builtin.buffers, { desc = "Find Buffer" })
        vim.keymap.set("n", "<leader>/", MiniPick.builtin.grep, { desc = "Grep Directory" })
        vim.keymap.set("n", "<leader>fh", MiniPick.builtin.help, { desc = "[F]ind [h]elp" })

        vim.keymap.set("n", "<leader>fH", MiniExtra.pickers.hl_groups, { desc = "[F]ind [H]ighlights" })

        vim.keymap.set("n", "<leader>fn", function()
            MiniPick.builtin.files(nil, { source = { cwd = '~/.config/nvim' } })
        end, { desc = "[F]ind [N]vim Config" })

        vim.keymap.set("n", "gd", function()
            MiniExtra.pickers.lsp({ scope = "definition" })
        end
        , { desc = "[G]oto [D]efinition" })

        vim.keymap.set("n", "gr", function()
            MiniExtra.pickers.lsp({ scope = "references" })
        end
        , { desc = "[G]oto [R]eferences" })


        -- vim.keymap.set("n", "gr", MiniExtra.pickers.lsp({ scope = "references" }), { desc = "[G]oto [R]eferences" })

        -- Setup key mappings for completions
        local imap_expr = function(lhs, rhs)
            vim.keymap.set('i', lhs, rhs, { expr = true })
        end
        imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
        imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
    end
}
