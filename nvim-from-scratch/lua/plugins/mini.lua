return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require("mini.pick").setup()
        require("mini.statusline").setup()
        require("mini.icons").setup()
        require("mini.extra").setup()
        require("mini.completion").setup({
            lsp_completion = {
                source_fuc = 'omnifunc'
            }
        })
        require("mini.indentscope").setup({
            draw = {
                animation = require("mini.indentscope").gen_animation.none()
            }
        })
        require('mini.notify').setup()
        require("config.mini-clue")

        MiniIcons.tweak_lsp_kind("prepend")

        vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files, { desc = "[f]ind [f]iles" })
        vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { desc = "[f]ind [b]uffer" })
        vim.keymap.set("n", "<leader><leader>", MiniPick.builtin.buffers, { desc = "Find Buffer" })
        vim.keymap.set("n", "<leader>/", MiniPick.builtin.grep, { desc = "Grep Directory" })
        vim.keymap.set("n", "<leader>fh", MiniPick.builtin.help, { desc = "[f]ind [h]elp" })

        vim.keymap.set("n", "<leader>fH", MiniExtra.pickers.hl_groups, { desc = "[f]ind [H]ighlights" })

        vim.keymap.set("n", "<leader>fn", function()
            MiniPick.builtin.files(nil, { source = { cwd = '~/.config/nvim' } })
        end, { desc = "[f]ind [n]vim Config" })

        vim.keymap.set("n", "fs", function()
            MiniExtra.pickers.lsp({ scope = "document_symbol" })
        end
        , { desc = "[f]ind [s]ymbol" })


        vim.keymap.set("n", "gd", function()
            MiniExtra.pickers.lsp({ scope = "definition" })
        end
        , { desc = "[g]oto [d]efinition" })

        vim.keymap.set("n", "gr", function()
            MiniExtra.pickers.lsp({ scope = "references" })
        end
        , { desc = "[g]oto [r]eferences" })

        -- Setup key mappings for completions
        local imap_expr = function(lhs, rhs)
            vim.keymap.set('i', lhs, rhs, { expr = true })
        end
        imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
        imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
    end
}
