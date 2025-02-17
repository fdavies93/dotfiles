return {
  "MeanderingProgrammer/render-markdown.nvim",
  config = function()
    require("render-markdown").setup({
      link = {
        wiki = {
          highlight = "RenderMarkdownLink"
        }
      },
      checkbox = {
        unchecked = {
          icon = "󰄰",
        },
        checked = {
          icon = "󰄳",
        },
        custom = {
          in_progress = {
            raw = "[/]",
            rendered = "󱎖",
            highlight = "RenderMarkdownUnchecked",
          },
          cancelled = {
            raw = "[~]",
            rendered = "",
            scope_highlight = "@text.strike"
          }
        }
      }
    })
    vim.keymap.set("n", "<Leader>tm", ":RenderMarkdown toggle<CR>", { desc = "[T]oggle [M]arkdown rendering" })
  end
}
