local wezterm = require("wezterm")
local M = {}

function M.setup()
  wezterm.on("window-config-reloaded", function(window, pane)
    local screen = wezterm.gui.screens()
    local screen_width = screen.virtual_width
    local win = window:get_dimensions()
    local win_width = win.pixel_width

    if win_width == screen_width then
      wezterm.log_info("is max")
      window:restore()
      window:maximize()
    end
  end)
end

return M
