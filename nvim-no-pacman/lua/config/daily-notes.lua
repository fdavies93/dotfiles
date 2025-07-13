local daily_notes = require("daily-notes")
daily_notes.setup({
  parsing = {
    resolve_strategy = {
      weekday = {
        this = "period"
      }
    }
  },
  writing = {
    root = "~/notes/notes/journal/2025",
    day = {
      template = [=[
# %A, [[%Y-%m|%B]] %d [[%Y]]

[[%Y-week-%W|Week %W]]

## Notes

## Tasks

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
})
