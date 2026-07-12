vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  group = vim.api.nvim_create_augroup("autosave", { clear = true }),
  callback = function(args)
    local buf = args.buf
    local bo = vim.bo[buf]
    if bo.buftype ~= "" then return end       -- skip explorer, terminals, help
    if not bo.modifiable then return end
    if bo.readonly then return end
    if not bo.modified then return end          -- nothing changed, skip
    if vim.api.nvim_buf_get_name(buf) == "" then return end  -- skip unnamed buffers
    vim.api.nvim_buf_call(buf, function()
      vim.cmd("silent! write")
    end)
  end,
})
