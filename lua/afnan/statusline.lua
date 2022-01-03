local galaxyline = require("galaxyline")

local diagnostic = require("galaxyline.providers.diagnostic")
local vcs = require("galaxyline.providers.vcs")
local fileinfo = require("galaxyline.providers.fileinfo")
local colors = require("galaxyline.highlighting")
local buffer = require("galaxyline.providers.buffer")
local search = require("galaxyline.providers.search")
local whitespace = require("galaxyline.providers.whitespace")
local lspclient = require("galaxyline.providers.lsp")

local BufferIcon = buffer.get_buffer_type_icon
local BufferNumber = buffer.get_buffer_number
local FileTypeName = buffer.get_buffer_filetype

local GitBranch = vcs.get_git_branch
local DiffAdd = vcs.diff_add
local DiffModified = vcs.diff_modified
local DiffRemove = vcs.diff_remove

local SearchResults = search.get_results

local LineColumn = fileinfo.line_column
local FileSize = fileinfo.get_file_size
local FileIcon = fileinfo.get_file_icon
local FileName = fileinfo.get_current_file_name
local LinePercent = fileinfo.current_line_percent

local Whitespace = whitespace.get_item

local DiagnosticError = diagnostic.get_diagnostic_error
local DiagnosticWarn = diagnostic.get_diagnostic_warn
local DiagnosticHint = diagnostic.get_diagnostic_hint
local DiagnosticInfo = diagnostic.get_diagnostic_info

local GetLspClient = lspclient.get_lsp_client

local gls = galaxyline.section

galaxyline.short_line_list = { "NvimTree" }
