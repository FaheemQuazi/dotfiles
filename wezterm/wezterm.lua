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
    -- Date/Time on Right
    local date = wezterm.strftime '%a %b %-d %H:%M '
    window:set_right_status(wezterm.format {
        { Text = date },
    })

    -- for desktop, only show hostname
    if wezterm.hostname() == 'galactica' then
        window:set_left_status(wezterm.format {
            { Text = ' ' .. wezterm.hostname() },
        })
    else
        local bat = ''
        for _, b in ipairs(wezterm.battery_info()) do
            bat = ' ' .. string.format('%.0f%%', b.state_of_charge * 100)
        end
        window:set_left_status(wezterm.format {
            { Text = ' ' .. wezterm.hostname() .. ' [' .. bat .. ' ]' },
        })
    end

end)

-- Tab Bar
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Colors
config.color_scheme = 'Urple'
config.font_size = 14.0
config.colors = {
    background = "0D0221",
    foreground = "#CCCCCC",
    selection_fg = "#000000",
    selection_bg = "#F9C80E",
    cursor_bg = "#2DE2E6",
    cursor_fg = "#000000",
    tab_bar = {
        background = '#540D6E'
    }
}


return config
