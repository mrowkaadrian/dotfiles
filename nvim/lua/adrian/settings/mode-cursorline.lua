vim.o.cursorline = true

local mode_bg = {
  n        = "#313244",  -- normal  — neutral
  i        = "#26332b",  -- insert  — dim green
  v        = "#33263f",  -- visual  — dim purple
  V        = "#33263f",  -- visual line
  ["\22"]  = "#33263f",  -- visual block (Ctrl-V)
  R        = "#3a2630",  -- replace — dim red
  c        = "#3a3326",  -- command — dim amber
}

local function update()
  local m = vim.fn.mode():sub(1, 1)
  vim.api.nvim_set_hl(0, "CursorLine", { bg = mode_bg[m] or mode_bg.n })
end

vim.api.nvim_create_autocmd({ "ModeChanged", "VimEnter", "ColorScheme" }, {
  group = vim.api.nvim_create_augroup("mode_cursorline", { clear = true }),
  callback = update,
})
