return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
      preset = "modern",
      spec = {
          { "<leader>s", group = "Search" },
          { "<leader>g", group = "Git" },
          { "<leader>f", group = "Function" },
      }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
