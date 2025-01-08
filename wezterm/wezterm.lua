local wezterm = require 'wezterm'
local act = wezterm.action

return {
	enable_tab_bar = false,
	color_scheme = 'Tokyo Night',
	font = wezterm.font 'NotoMono Nerd Font Mono',
	enable_wayland = true,
	keys = {
		{ key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
	},
}
