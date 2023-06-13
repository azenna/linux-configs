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
    mods = 'CTRL|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '"',
    mods = 'CTRL|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 't',
    mods = 'CTRL',
    action = act.SpawnTab 'DefaultDomain'
  },
  {
    key = 'n',
    mods = 'CTRL',
    action = act.ActivateTabRelative(1)
  },
  {
    key = 'p',
    mods = 'CTRL',
    action = act.ActivateTabRelative(-1)
   },
  {
    key = 'l',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'h',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Down',
  },
}

config.color_scheme = "Catppuccin Mocha"

return config

