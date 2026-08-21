--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})


hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.workspace_rule({ workspace = "1", monitor = "DP-3", default = true, })
hl.workspace_rule({ workspace = "2", monitor = "DP-3", })
hl.workspace_rule({ workspace = "3", monitor = "DP-3", })
hl.workspace_rule({ workspace = "4", monitor = "DP-3", })
hl.workspace_rule({ workspace = "5", monitor = "DP-3", })

hl.workspace_rule({ workspace = "6", monitor = "DP-2", default = true, })
hl.workspace_rule({ workspace = "7", monitor = "DP-2", })
hl.workspace_rule({ workspace = "8", monitor = "DP-2", })
hl.workspace_rule({ workspace = "9", monitor = "DP-2", })
hl.workspace_rule({ workspace = "0", monitor = "DP-2", })

hl.window_rule({
    match = { class = "steam_app_.*"},
    workspace = "1",
})

hl.window_rule({ 
    match = { class = ".*", float = true }, 
    center = true,
})

hl.window_rule({
    match = { class = "steam", title = "negative:^Steam$" },
    float = true,
})

---------------------
---- GODOT RULES ----
---------------------

-- Godot editor → workspace 2
hl.window_rule({
    match = { class = "^Godot$", title = "^Godot$" },
    workspace = "2",
})

-- Running game, window A (title carries DEBUG) → workspace 3
hl.window_rule({
    match = { title = ".*DEBUG.*" },
    workspace = "3",
})

-- Running game, window B (project-named class, title still "Godot") → workspace 3
hl.window_rule({
    match = { class = "negative:^Godot$", title = "^Godot$" },
    workspace = "3",
})
