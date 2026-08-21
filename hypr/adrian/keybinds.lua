---------------------
---- KEYBINDINGS ----
---------------------

local terminal      = "ghostty"
local fileManager   = "yazi"
local launcher      = "walker"
local browser_path  = "/opt/zen-browser-bin/zen-bin" 

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Window management 
hl.bind(mainMod .. " + Q", hl.dsp.window.close())                               -- close window
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))          -- float window
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.window.fullscreen())             -- fullscreen
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ monitor = "+1" }))      -- change monitor for focused app

-- Move window
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Swap windows
hl.bind(mainMod .. " + SHIFT + CTRL + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + CTRL + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + CTRL + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + CTRL + down", hl.dsp.window.swap({ direction = "down" }))

-- Resize windows
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.resize({ x = -40, y = 0,   relative = true }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 40,  y = 0,   relative = true }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.resize({ x = 0,   y = -40, relative = true }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.resize({ x = 0,   y = 40,  relative = true })) 

-- Open apps
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))                      -- terminal
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(launcher))                       -- launcher
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(launcher))                           -- launcher
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser_path))                       -- web browser
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd('hyprshot -m window'))
hl.bind("Print", hl.dsp.exec_cmd('hyprshot -m window'))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('hyprshot -m region'))

-- Move focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [1-9]
-- Move active window to a workspace with mainMod + SHIFT + [1-9]
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,             hl.dsp.focus({ workspace = tostring(i)}))
    hl.bind(mainMod .. " + SHIFT + " .. i,     hl.dsp.window.move({ workspace = tostring(i) }))
end

hl.bind(mainMod .. " + " .. 0,             hl.dsp.focus({ workspace = tostring(10)}))
hl.bind(mainMod .. " + SHIFT + " .. 0,     hl.dsp.window.move({ workspace = tostring(10) }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
