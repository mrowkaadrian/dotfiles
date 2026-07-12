---------------------
---- KEYBINDINGS ----
---------------------

local terminal      = "ghostty"
local fileManager   = "dolphin"
local menu          = "hyprlauncher"
local browser_path  = "/opt/zen-browser-bin/zen-bin" 

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Window management 
hl.bind(mainMod .. " + Q", hl.dsp.window.close())                               -- close window
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))          -- float window
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.window.fullscreen())             -- fullscreen
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ monitor = "+1" }))      -- change monitor for focused app
hl.bind(mainMod .. " + C", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))


-- Open apps
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))                      -- terminal
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))                           -- launcher
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser_path))                       -- web browser
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + Tab", hl.dsp.focus({ window = "+1" }))
hl.bind("ALT + SHIFT + Tab", hl.dsp.focus({ window = "-1" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,             hl.dsp.focus({ workspace = tostring(i)}))
    hl.bind(mainMod .. " + SHIFT + " .. i,     hl.dsp.window.move({ workspace = tostring(i) }))
end

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


