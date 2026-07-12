vim.env.QML2_IMPORT_PATH = "/usr/lib/qt6/qml"

vim.lsp.config("qmlls", {
  cmd = { "qmlls6", "-E" },
  filetypes = { "qml" },
})

vim.lsp.enable("qmlls")
