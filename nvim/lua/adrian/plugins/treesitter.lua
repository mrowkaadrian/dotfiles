return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "lua", "luadoc",
      "qmljs",
      "javascript", "typescript", "tsx",
      "json", "yaml", "toml",
      "bash", "markdown", "markdown_inline",
      "vim", "vimdoc",
    })

    vim.treesitter.language.register("qmljs", "qml")

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
