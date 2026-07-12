return {
    -- docs @ https://github.com/folke/snacks.nvim/blob/main/docs
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            explorer = {
                enabled = true,
                replace_netrw = true,
                trash = true,
            },

            picker = {
                enabled = true,
                sources = {
                    explorer = {
                        hidden = true,
                        ignored = false,
                        auto_close = false,
                        layout = {
                            preset = "sidebar",
                            preview = "main",
                        },
                        win = {
                            list = {
                                keys = {
                                    ["."] = "explorer_cd" -- set [explorer cursor -> cwd]
                                }
                            }
                        }
                    },
                },
            },

            bigfile = { enabled = true, },
            quickfile = { enabled = true, },
            indent = { enabled = true, },
            input = { enabled = true, },
            notifier = { enabled = true, },
            scope = { enabled = true, },
            words = { enabled = true, },
        },
        keys = {
            { "<leader>gg", function() require("snacks").lazygit() end,     desc = "Lazygit" },
            { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs" },

            { "<leader>m",  function() Snacks.explorer() end,               desc = "File Explorer" },
            { "<leader>sf", function() Snacks.picker.files() end,           desc = "Search Files" },
            { "<leader>sg", function() Snacks.picker.grep() end,            desc = "Search by Grep" },
            { "<leader>sh", function() Snacks.picker.help() end,            desc = "Search Help" },
            { "<leader>sk", function() Snacks.picker.keymaps() end,         desc = "Search Keymaps" },
            { "<leader>sr", function() Snacks.picker.recent() end,          desc = "Search Recent Files" },
        }
    }
}
