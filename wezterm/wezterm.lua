local wezterm = require 'wezterm'
local act = wezterm.action

return {
	enable_tab_bar = false,
	color_scheme = 'carbonfox',
	font = wezterm.font 'Hack Nerd Font Mono',
	enable_wayland = true,
	keys = {
		{ key = 'V',   mods = 'CTRL',                action = act.PasteFrom 'Clipboard' },
		{ key = 'F11', action = act.ToggleFullScreen },
	},
	-- window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt"
}
