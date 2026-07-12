-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local terminal    = "ghostty"
local hyprpolkitagent = "/usr/lib/hyprpolkitagent/hyprpolkitagent"

hl.on("hyprland.start", function () 
--  hl.exec_cmd(terminal .. " -e tmux new-session -A -s main")
  hl.exec_cmd(terminal)
  hl.exec_cmd("awww-daemon")        -- wallpaper daemon
  hl.exec_cmd("qs")                 -- quickshell bar
  hl.exec_cmd(hyprpolkitagent)      -- auth agent (run elevated apps)
end)


