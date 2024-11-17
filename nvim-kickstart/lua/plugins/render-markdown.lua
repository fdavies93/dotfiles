return {
  "MeanderingProgrammer/render-markdown.nvim",
  config = function()
    require("render-markdown").setup({
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
          }

        }
      }
    })
    vim.keymap.set("n", "<Leader>tm", ":RenderMarkdown toggle<CR>", { desc = "[T]oggle [M]arkdown rendering" })
  end
}
