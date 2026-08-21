-----------------------
---- LOOK AND FEEL ----
-----------------------

local colors = require('themes/catppuccin-mocha')

hl.config({
    general = {
        gaps_in  = 10,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = { colors = { colors.mauve, colors.blue }, angle = 45 },
            inactive_border = colors.surface0,
        },

        resize_on_border = false,
        allow_tearing    = false,
    },

    decoration = {
        rounding       = 20,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.97,

        shadow = {
            enabled      = true,
            range        = 10,
            render_power = 1,
            color        = colors.crust,
        },

        blur = {
            enabled  = true,
            size     = 10,
            passes   = 3,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = false,
    },
})

--------------------
---- CURVES --------
--------------------

hl.curve("default",        { type = "bezier", points = { {0.22, 1},    {0.36, 1} } })
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.22, 1},    {0.36, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}  } })

--------------------
---- ANIMATIONS ----
--------------------

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })

hl.animation({ leaf = "windows",       enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "slide" })

hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })

hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })

hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "easeInOutCubic", style = "slide top" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "easeInOutCubic", style = "slide bottom" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "easeInOutCubic", style = "slide top" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
