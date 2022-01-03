local Path = require("plenary.path")
local config = require("session_manager.config")
require("session_manager").setup({
	sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
	path_replacer = "__",
	colon_replacer = "++",
	autoload_mode = config.AutoloadMode.Disabled,
	save_current = true,
	autosave_ignore_not_normal = true,
	autosave_last_session = true,
})
