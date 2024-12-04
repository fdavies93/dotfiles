return {
  "jakobkhansen/journal.nvim",
  config = function()
    require("journal").setup({
      root = '~/notes/journal',
      date_format = '%Y-%m-%d',

      journal = {
        format = 'daily/%Y-%m-%d',
        template = '# %A, %B %d\n\n## Notes\n\n## Events',
        entries = {
          day = {
            format = 'daily/%Y-%m-%d',
            template = '# %A, %B %d\n\n## Notes\n\n## Events',
            frequency = { day = 1 },
          },
          week = {
            format = 'weekly/%Y-week-%W',
            template = '# %Y Week %W\n\n## Notes\n\n## Daily',
            frequency = { day = 7 },
            date_modifier = "monday",
          }
        }
      }

    })
  end,
}
