local ekaput = require("e-kaput")

-- Diagnostic Floating Window Setup
ekaput.setup({})


-- Basic Diagnostics Setup
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false ,
  underline = true,
  update_in_insert = true,
})

-- Highlights for diagnostics
vim.cmd [[
  highlight LspDiagnosticsLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight LspDiagnosticsLineNrWarning guibg=#51412A guifg=#FFA500 gui=bold
  highlight LspDiagnosticsLineNrInformation guibg=#1E535D guifg=#00FFFF gui=bold
  highlight LspDiagnosticsLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=LspDiagnosticsSignError linehl= numhl=LspDiagnosticsLineNrError
  sign define DiagnosticSignWarn text= texthl=LspDiagnosticsSignWarning linehl= numhl=LspDiagnosticsLineNrWarning
  sign define DiagnosticSignInfo text= texthl=LspDiagnosticsSignInformation linehl= numhl=LspDiagnosticsLineNrInformation
  sign define DiagnosticSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=LspDiagnosticsLineNrHint
]]

-- Highlights for ekaput
vim.cmd([[
  highlight link EKaputError LspDiagnosticsSignError
  highlight link EKaputWarning LspDiagnosticsSignWarning
  highlight link EKaputInformation LspDiagnosticsSignInformation
  highlight link EKaputHint LspDiagnosticsSignHint
  highlight link EKaputBorder LspDiagnosticsSignInformation
  highlight link EKaputBackground NormalFloat
]])
