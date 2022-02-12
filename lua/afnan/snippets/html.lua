local ls = require("luasnip")
local s = ls.parser.parse_snippet

ls.snippets.html = {
	s("doctype", "<!DOCTYPE>\n$1"),
	s("a", '<a href="$1">$2</a>$3'),
	s("abbr", '<abbr title="$1">$2</abbr>$3'),
	s("address", "<address>\n\t$1\n\t</address>"),
	s("area", '<area shape="$1" coords="$2" href="$3" alt="$4">$5'),
}
