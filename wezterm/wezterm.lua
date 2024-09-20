local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- right click to paste
config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
        end),
    },
}

-- Statusbar
wezterm.on('update-right-status', function(window, pane)
    -- "Wed Mar 3 08:14"
    local date = wezterm.strftime '%a %b %-d %H:%M '

    local bat = ''
    for _, b in ipairs(wezterm.battery_info()) do
        bat = ' ' .. string.format('%.0f%%', b.state_of_charge * 100)
    end

    window:set_right_status(wezterm.format {
        { Text = date },
    })

    window:set_left_status(wezterm.format {
        { Text = ' ' .. wezterm.hostname() .. ' [' .. bat .. ' ]' },
    })
end)

-- Tab Bar
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Colors
config.color_scheme = 'Urple'
config.font_size = 15.0


return config
