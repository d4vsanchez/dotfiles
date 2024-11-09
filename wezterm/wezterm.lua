local wezterm = require("wezterm")
local panes = require("panes")
local config = wezterm.config_builder()

-- Set environment variables to WezTerm
-- This is helpful when spawining commands within WezTerm
config.set_environment_variables = {
  PATH = "/opt/homebrew/bin:" .. os.getenv("PATH")
}

-- Pick a color scheme.
-- WezTerm ships with color schemes: https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Rosé Pine (Gogh)"

-- Choose the initial size of the window
config.initial_rows = 40
config.initial_cols = 140

-- Choose the font. I'm using Nerd Font fonts
config.font = wezterm.font({ family = "SauceCodePro Nerd Font Mono" })
-- Choose a font size
config.font_size = 12

-- Removes the title bar, leaving the tab bar. Allows resizing the window
config.window_decorations = "RESIZE"

-- Modify the font of the tab bar
config.window_frame = {
	font = wezterm.font({ family = "SauceCodePro Nerd Font Mono", weight = "Bold" }),
	font_size = 11,
}

-- Modify leader to Ctrl + Space
config.leader = {
  key = "Space",
  mods = "CTRL",
  timeout_milliseconds = 1000
}

-- Map keypresses to actions
config.keys = {
	-- Jump a word backwards
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action.SendString "\x1bb",
	},
  -- Jump a word forwards
  {
    key = "RightArrow",
    mods = "OPT",
    action = wezterm.action.SendString "\x1bf",
  },
  -- Open the Wezterm configuration
  {
    key = ",",
    mods = "SUPER",
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { "nvim", wezterm.config_file },
    },
  },
  -- Split pane horizontally
  {
    key = "\"",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  -- Split pane vertically
  {
    key = "%",
    mods = "LEADER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  -- Move to bottom pane
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  -- Move to top pane
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  -- Move to left pane
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  -- Move to right pane
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  -- Resize panes
  {
    key = "r",
    mods = "LEADER",
    action = wezterm.action.ActivateKeyTable({
      name = "resize_panes",
      one_shot = false,
      timeout_milliseconds = 1000,
    }),
  }
}

config.key_tables = {
  resize_panes = {
    panes.resize_pane("h", "Left"),
    panes.resize_pane("j", "Down"),
    panes.resize_pane("k", "Up"),
    panes.resize_pane("l", "Right"),
  }
}

return config
