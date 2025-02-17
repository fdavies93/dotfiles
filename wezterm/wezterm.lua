local wezterm = require 'wezterm'
local act = wezterm.action

return {
	enable_tab_bar = false,
	color_scheme = 'Oxocarbon Dark',
	font = wezterm.font 'Hack',
	enable_wayland = true,
	keys = {
		{ key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
	},
}
