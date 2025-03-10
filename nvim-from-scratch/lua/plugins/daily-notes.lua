return {
    'fdavies93/daily-notes.nvim',
    opts = {

        writing = {
            root = "~/notes/journal/2025",
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
