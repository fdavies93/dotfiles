return {
  require("plugins.themes.kanagawa"),
  require("plugins.themes.tokyo-night"),
  require("plugins.themes.catpuccin"),
  require("plugins.themes.dracula"),
  require("plugins.themes.monokai-pro"),
  require("plugins.themes.sonokai"),
  require("plugins.themes.onedark"),
  require("plugins.themes.kanagawa-paper"),
  require("plugins.themes.oldworld"),
  require("plugins.themes.oxocarbon"),
  { "rktjmp/lush.nvim" },
  { "metalelf0/jellybeans-nvim" },
  { "EdenEast/nightfox.nvim" },
  { "akinsho/horizon.nvim",     version = "*" },
  {
    "water-sucks/darkrose.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "NTBBloodbath/doom-one.nvim"
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load()
    end
  },
  {
    "whatyouhide/vim-gotham"
  }
}
