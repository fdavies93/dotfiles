return {
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
}
