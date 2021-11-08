vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_section = {
	a = { description = { " Find Files             " }, command = "Telescope find_files" },
	b = { description = { " Projects               " }, command = "Telescope projects" },
	c = { description = { " Git Files              " }, command = "Telescope git_files " },
	d = { description = { " Configuration          " }, command = "edit ~/.config/nvim/init.lua" },
	e = { description = { " Lazy Git               " }, command = "Lazygit" },
}
