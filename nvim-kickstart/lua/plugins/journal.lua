return {
  "jakobkhansen/journal.nvim",
  config = function()
    require("journal").setup({
      root = '~/notes/journal',
      date_format = '%Y-%m-%d',

      journal = {
        format = 'daily/%Y-%m-%d',
        template = '# %A, %B %d\n\n## Notes\n\n## Events\n\n- 1000-1015 DSU',
        entries = {
          day = {
            format = 'daily/%Y-%m-%d',
            template = '#  %A, %B %d\n\n## Notes\n\n## Events\n\n- 1000-1015 DSU',
            frequency = { day = 1 },
          },
          week = {
            format = 'weekly/%Y-week-%W',
            template = '# Week %W\n\n## Weekly Goals\n\n## Weekly Reality\n\n- 1000-1015 DSU',
            frequency = { day = 7 },
            date_modifier = "monday",
          }
        }
      }

    })
  end,
}
