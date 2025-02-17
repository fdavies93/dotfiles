-- Based on kickstart.nvim

require("setup")
require("keymaps")
require("cmd")
require("autocmd")

-- These are designed to allow imported modules to export a map of plugins to
-- load, instead of a single plugin's spec. The same idea can be used recursively
local plugin_groups = {
  require("plugins.themes"),
  require("plugins.lazydev"),
}

local plugins = {
  "tpope/vim-sleuth", -- autosets buffer options

  -- ui enhancements
  "moll/vim-bbye",
  require("plugins.lualine"),      -- statusline
  require("plugins.auto-session"), -- session manager
  require("plugins.which-key"),    -- show key mappings

  -- telescope - should be modularised more
  require("plugins.telescope"),
  require("plugins.telescope-file-browser"),

  -- just provides a statusline here, but can do a lot more
  -- require("plugins.mini"),

  -- git stuff
  require("plugins.gitsigns"),
  require("plugins.git-blame"),

  -- lsp / completions
  require("plugins.lsps"), -- can be broken down further
  require("plugins.nvim-cmp"),
  require("plugins.nvim-treesitter"),
  require("plugins.conform"),
  -- better comments
  -- require("plugins.todo-comments"),
  -- mainly for editing text
  "folke/zen-mode.nvim",
  -- require("plugins.journal"),
  -- require("plugins.markdown-preview"), -- broken
  -- require("plugins.markview"), -- flaky
  require("plugins.wrapping"),
  require("plugins.render-markdown"),
  -- "mattn/calendar-vim",
  "jghauser/follow-md-links.nvim",
  {
    "fdavies93/daily-notes.nvim",
    opts = {
      parsing = {
        resolve_strategy = {
          weekday = {
            this = "period"
          }
        }
      },
      writing = {
        root = "~/notes/journal",
        day = {
          template = [=[
# %A, [[%Y-%m|%B]] %d [[%Y]]

[[%Y-week-%W|Week %W]]

## Notes

## Tasks

## Timebox

| Time | Task |
|------|------|
]=]
        },
        week = {
          template = [=[
# [[%Y-week-%W|Week %W, %Y]]

Week beginning [[%Y-%m-%d]]
]=]
        },
        month = {
          template = [=[
# %B [[%Y]]
]=]
        }
      }
    }
  },
  require("plugins.emoji")
}

-- Merge plugin groups with plugins specified individually
for _, v in pairs(plugin_groups) do
  for _, v2 in pairs(v) do
    table.insert(plugins, v2)
  end
end

local ui = {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
}
require("lazy").setup(plugins, ui)

vim.cmd.colorscheme("oxocarbon")
vim.cmd.hi 'Comment gui=none'

vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
