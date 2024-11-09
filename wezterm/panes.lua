local wezterm = require("wezterm")
local module = {}

function module.resize_pane(key, direction)
  return {
    key = key,
    action = wezterm.action.AdjustPaneSize({ direction, 3 }),
  }
end

return module
