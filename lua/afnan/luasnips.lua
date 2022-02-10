local ls = require("luasnip")
local s = ls.parser.parse_snippet

ls.config.setup({
	history = true,
	updateevents = "InsertLeave",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

ls.snippets = {
	lua = {
		s("l", "local $1 \n$0"),
		s("ll", "local $1 = $2\n$0"),
		s("lreq", 'local $1 = require("$2")\n$0'),
		s("req", 'require("$1")\n$0'),
		s("u", 'use({ "$1" , $0 })'),
		s("cl", "local $1 = {}\n $0 \n return $1"),
		s("rt", "return $1 \n$0"),
		s("p", 'print("$1") \n$0'),
		s("s", 's("$1", "$2"),\n$0'),
	},
	markdown = {
		s("h1", "<h1 $1 >$2</h1>$0"),
		s("h2", "<h2 $1 >$2</h2>$0"),
		s("h3", "<h3 $1 >$2</h3>$0"),
		s("h4", "<h4 $1 >$2</h4>$0"),
		s("img", "![$1]($2)$0"),
		s("link", "[$1]($2)$0"),
	},
}
