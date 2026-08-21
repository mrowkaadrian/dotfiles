------------------
---- MONITORS ----
------------------

-- Main 1080p 240hz, unrotated, left
hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@240",
    position = "0x0",
    scale    = "1",
})

hl.monitor({
    output    = "DP-2",
    mode      = "2560x1440@144",
    position  = "1920x0",
    scale     = 1,
    transform = 3,
})