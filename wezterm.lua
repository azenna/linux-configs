-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

disable_default_key_bindings = true
font_size = 12

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = '%',
    mods = 'ALT|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '"',
    mods = 'ALT|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 't',
    mods = 'ALT',
    action = act.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = 'n',
    mods = 'ALT',
    action = act.ActivateTabRelative(1)
  },
  {
    key = 'p',
    mods = 'ALT',
    action = act.ActivateTabRelative(-1)
   },
  {
    key = 'h',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Down',
  },
  {
    key = 'j',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize { 'Down', 5 },

  },
  {
    key = 'k',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'h',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'l',
    mods = 'ALT|SHIFT',
    action = act.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'w',
    mods = 'ALT',
    action = act.CloseCurrentPane { confirm = true },
  },
  {
    key = 'h',
    mods = 'ALT|ALT',
    action = act.MoveTabRelative(-1),
  },
  {
    key = 'm',
    mods = 'ALT',
    action = act.ToggleFullScreen,
  },
}

config.color_scheme = "Catppuccin Mocha"

return config

