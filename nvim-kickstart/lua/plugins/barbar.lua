return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = true
    -- Helix-style goto buffer
    -- vim.keymap.set("n", "gn", "<Cmd>BufferNext<CR>", { desc = "[G]oto [N]ext Buffer" })
    -- vim.keymap.set("n", "gp", "<Cmd>BufferPrevious<CR>", { desc = "[G]oto [P]revious Buffer" })
  end,
  opts = {
    highlight_visible = false
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
