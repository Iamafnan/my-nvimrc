vim.cmd("let b:vsnip_snippet_dir = expand('~/.config/nvim/snippets/')")

vim.fn.matchadd("matchURL", [[http[s]\?:\/\/[[:alnum:]%\/_#.-]*]])
