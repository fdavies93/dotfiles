# No Magic Config

Popular projects like [Mason](https://github.com/williamboman/mason.nvim) and 
[Lazy.nvim](https://github.com/folke/lazy.nvim) work well 90% of the 
time on 90% of projects, but can fail in annoying ways with complex or unusual 
setups (e.g. monorepos with several formatters in multiple languages).

This config takes a Bring Your Own Tools approach to configuration. You are
expected to manage your own external tooling (i.e. LSPs, formatters, linters)
but by doing so, you guarantee that tooling should work for your personal use
cases.

_You should consider this if..._

- You make money from programming and need your setup to be consistent and
  reliable.
- You work across a number of different types of machine or OS and want to be
  able to guarantee your config works across all of them.
- You like neovim to run blazingly fast.
- You want to learn more about how neovim works.
- You're okay with maintaining your own config.

_Maybe stay away if..._

- You want easy copy-paste package management.
- You have many plugins and want / need advanced plugin management features.

## How do I...

### Install a plugin?

```bash
git submodule add https://github.com/nyoom-engineering/oxocarbon.nvim plugins/oxocarbon
```

Then in `init.lua` or a secondary config file:

```lua
-- The same setup method as any other config!
require("oxocarbon").setup({})
```

### Update my plugins?

```bash
git submodule update --remote
git add plugins
```

### Delete a plugin?

```bash
git submodule deinit plugins/oxocarbon
git rm -rf plugins/oxocarbon
```

## How does this work?

Every subfolder of `plugins` is added to nvim's runtimepath, which lets nvim
load each plugin's `colors`, `plug`, and `lua` folders, where most plugin's
application code lives.

```lua
function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

-- Add the root config directory to runtimepath so we can actually find
-- stuff under the config directory
vim.opt.rtp:prepend(script_path())

local plugins = vim.api.nvim_get_runtime_file("plugins/*", true)

for _, v in ipairs(plugins) do
         vim.opt.rtp:append(v)
end
```
