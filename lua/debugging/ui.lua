local dapui = require("dapui")
local dap = require("dap")

-- Setup DAP UI
dapui.setup()

-- For AutoCompletion in dap repl
vim.cmd('au FileType dap-repl lua require("dap.ext.autocompl").attach()')

-- DAP Terminal Customization
dap.defaults.fallback.external_terminal = { command = "/data/data/com.termux/files/usr/bin/zsh", args = { "-e" } }
dap.defaults.fallback.force_external_terminal = true
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

-- Custom Signs
vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linhl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
