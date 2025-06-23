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
require('mini.bufremove').setup()

vim.api.nvim_create_user_command("Bdelete", function() MiniBufremove.delete(0) end, {})

local bufDeleteOthers = function()
	local bufs = vim.api.nvim_list_bufs()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, i in ipairs(bufs) do
		if i ~= current_buf then
			vim.api.nvim_buf_delete(i, {})
		end
	end
end

local bufDeleteAll = function()
	local bufs = vim.api.nvim_list_bufs()
	for _, i in ipairs(bufs) do
		vim.api.nvim_buf_delete(i, {})
	end
end

vim.api.nvim_create_user_command("BdeleteOthers", bufDeleteOthers, {})
vim.api.nvim_create_user_command("BdeleteAll", bufDeleteAll, {})

MiniIcons.tweak_lsp_kind("prepend")


vim.keymap.set("n", "<leader>ff",
	function() MiniPick.builtin.cli({ command = { "rg", "--files", "--hidden", "--ignore-file=ignorefile" } }) end,
	{ desc = "[f]ind [f]iles" })
-- vim.keymap.set("n", "<leader>ff", function() MiniPick.builtin.files({ tool = "rg" }) end, { desc = "[f]ind [f]iles" })
vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { desc = "[f]ind [b]uffer" })
vim.keymap.set("n", "<leader><leader>", MiniPick.builtin.buffers, { desc = "Find Buffer" })
vim.keymap.set("n", "<leader>/", MiniPick.builtin.grep, { desc = "Grep Directory" })
vim.keymap.set("n", "<leader>fh", MiniPick.builtin.help, { desc = "[f]ind [h]elp" })

vim.keymap.set("n", "<leader>fH", MiniExtra.pickers.hl_groups, { desc = "[f]ind [H]ighlights" })

vim.keymap.set("n", "<leader>fd", MiniExtra.pickers.diagnostic, { desc = "[f]ind [d]iagnostics" })

vim.keymap.set("n", "<leader>fn", function()
	MiniPick.builtin.files(nil, { source = { cwd = '~/.config/nvim' } })
end, { desc = "[f]ind [n]vim Config" })

vim.keymap.set("n", "fs", function()
	MiniExtra.pickers.lsp({ scope = "document_symbol" })
end
, { desc = "[f]ind [s]ymbol" })

vim.keymap.set("n", "fc", function()
	MiniPick.builtin.cli({ command = { "rg", "--hidden", "--line-number", "--trim", "TODO|FIXME|HACK|NOTE" } })
end, { desc = "[f]ind [c]omment patterns" })

vim.keymap.set("n", "gd", function()
	MiniExtra.pickers.lsp({ scope = "definition" })
end
, { desc = "[g]oto [d]efinition" })


vim.keymap.set("n", "gD", function()
	MiniExtra.pickers.lsp({ scope = "declaration" })
end
, { desc = "[g]oto [D]eclaration" })

vim.keymap.set("n", "gr", function()
	MiniExtra.pickers.lsp({ scope = "references" })
end
, { desc = "[g]oto [r]eferences" })

-- Setup key mappings for completions
local imap_expr = function(lhs, rhs)
	vim.keymap.set('i', lhs, rhs, { expr = true })
end

local keycode = vim.keycode or function(x)
	return vim.api.nvim_replace_termcodes(x, true, true, true)
end
local keys = {
	['cr']        = keycode('<CR>'),
	['ctrl-y']    = keycode('<C-y>'),
	['ctrl-y_cr'] = keycode('<C-y><CR>'),
}

_G.cr_action = function()
	if vim.fn.pumvisible() ~= 0 then
		-- If popup is visible, confirm selected item or add new line otherwise
		local item_selected = vim.fn.complete_info()['selected'] ~= -1
		return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
	else
		-- If popup is not visible, use plain `<CR>`. You might want to customize
		-- according to other plugins. For example, to use 'mini.pairs', replace
		-- next line with `return require('mini.pairs').cr()`
		return keys['cr']
	end
end

vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })


imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])



local miniclue = require("mini.clue")

miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = 'n', keys = '<Leader>' },
		{ mode = 'x', keys = '<Leader>' },

		-- Built-in completion
		{ mode = 'i', keys = '<C-x>' },

		-- `g` key
		{ mode = 'n', keys = 'g' },
		{ mode = 'x', keys = 'g' },

		-- Marks
		{ mode = 'n', keys = "'" },
		{ mode = 'n', keys = '`' },
		{ mode = 'x', keys = "'" },
		{ mode = 'x', keys = '`' },

		-- Registers
		{ mode = 'n', keys = '"' },
		{ mode = 'x', keys = '"' },
		{ mode = 'i', keys = '<C-r>' },
		{ mode = 'c', keys = '<C-r>' },

		-- Window commands
		{ mode = 'n', keys = '<C-w>' },

		-- `z` key
		{ mode = 'n', keys = 'z' },
		{ mode = 'x', keys = 'z' },
	},
	window = {
		delay = 0,
		config = {
			width = 'auto'
		},
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		{ mode = "n", keys = "<Leader>f", desc = "[f]ind" },
		{ mode = "n", keys = "<Leader>g", desc = "[g]it" },
		miniclue.gen_clues.builtin_completion(),
		-- miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
})

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
		hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
		todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
		note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

local git = require('mini.git')
git.setup()
