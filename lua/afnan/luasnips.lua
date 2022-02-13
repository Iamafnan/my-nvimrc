local ls = require("luasnip")
local loader = require("luasnip.loaders.from_vscode").load
local s = ls.parser.parse_snippet

ls.config.setup({
	history = true,
	updateevents = "InsertLeave",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

function LuaSnipLoad()
	loader({
		path = "~/.local/share/nvim/site/pack/packer/opt/friendly-snippets/snippets/",
	})

	loader({
		path = "~/.local/share/nvim/site/pack/packer/opt/abusaidm.html-snippets-0.0.18/snippets/",
	})
end

vim.cmd("command! LuaSnipLoad :lua LuaSnipLoad()")

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
	css = {
		s("as", [[align-items: ${1|flex-start,flex-end,center,baseline,stretch,auto|};]]),
		s("ls", [[letter-spacing: ${0:2px};]]),
		s(
			"dis",
			[[display: ${1|none,block,inline,inline-block,flex,inline-flex,list-item,table,inline-table,table-caption,table-cell,table-row,table-row-group,table-column|};]]
		),
		s("ws", [[white-space: ${1|nowrap,pre,pre-wrap,pre-line,normal|};]]),
		s("fst", [[font-style: ${1|italic,oblique,normal|};]]),
		s("jcfs", [[justify-content: flex-start;]]),
		s("jcfe", [[justify-content: flex-end;]]),
		s("jcc", [[justify-content: center;]]),
		s(
			"ani",
			[[animation: ${1:name} ${2:1s} ${3|linear,ease-in-out,ease,ease-in,ease-out,step-start,step-end,steps,cubic-bezier|};]]
		),
		s("jcsb", [[justify-content: space-between;]]),
		s("marr", [[margin-right: ${0:0};]]),
		s("mart", [[margin-top: ${0:0};]]),
		s("bgrx", [[background-repeat: repeat-x;]]),
		s("bgry", [[background-repeat: repeat-y;]]),
		s("bgrn", [[background-repeat: no-repeat;]]),
		s("fw", [[font-weight: ${0:bold};]]),
		s("born", [[border: none;]]),
		s("mih", [[min-height: ${0:1px};]]),
		s("miw", [[min-width: ${0:1px};]]),
		s("boz", [[box-sizing: ${1|border-box,content-box|};]]),
		s("listd", [[list-style-type: disc;]]),
		s("mah", [[max-height: ${0:1px};]]),
		s("listn", [[list-style-type: none;]]),
		s("lists", [[list-style-type: square;]]),
		s("maw", [[max-width: ${0:1px};]]),
		s("bgc", [[background-color: ${0:#fff};]]),
		s("listur", [[list-style-type: upper-roman;]]),
		s("opa", [[opacity: ${0:0};]]),
		s("ft", [[font: ${0:12px/1.5};]]),
		s("bgcl", [[background-clip: ${1|border-box,padding-box,content-box,text|};]]),
		s("anidi", [[animation-direction: ${1|alternate,alternate-reverse,reverse,normal|};]]),
		s("lsn", [[letter-spacing: normal;]]),
		s("mara", [[margin: 0 auto;]]),
		s("bg", [[background: ${0:#fff};]]),
		s("bgi", [[background-image: url('${0:background.jpg}');]]),
		s("anidu", [[animation-duration: ${0:1s};]]),
		s("ova", [[overflow: auto;]]),
		s("ovh", [[overflow: hidden;]]),
		s("jc", [[justify-content: ${1|flex-start,flex-end,center,space-between,space-around|};]]),
		s("ovs", [[overflow: scroll;]]),
		s("ovv", [[overflow: visible;]]),
		s("aniic", [[animation-iteration-count: ${0:infinite};]]),
		s("posa", [[position: absolute;]]),
		s("posf", [[position: fixed;]]),
		s("padb", [[padding-bottom: ${0:0};]]),
		s("posr", [[position: relative;]]),
		s("poss", [[position: sticky;]]),
		s("padl", [[padding-left: ${0:0};]]),
		s("anin", [[animation-name: ${0:name};]]),
		s("tac", [[text-align: center;]]),
		s("tal", [[text-align: left;]]),
		s("tar", [[text-align: right;]]),
		s("tdu", [[text-decoration: underline;]]),
		s("tdn", [[text-decoration: none;]]),
		s(
			"anitf",
			[[animation-timing-function: ${1|linear,ease,ease-in-out,ease-in,ease-out,step-start,step-end,steps,cubic-bezier|};]]
		),
		s("tdl", [[text-decoration: line-through;]]),
		s("pad", [[padding: ${0:0};]]),
		s("fl", [[float: ${1|left,right,none|};]]),
		s("vam", [[vertical-align: middle;]]),
		s("flex", [[flex: ${1:1} ${2:1} ${3:auto};]]),
		s("mar", [[margin: ${0:0};]]),
		s("pos", [[position: ${1|relative,absolute,fixed,sticky,static|};]]),
		s("bot", [[bottom: ${0:0};]]),
		s("bgs", [[background-size: ${0:cover};]]),
		s("wida", [[width: auto;]]),
		s("wsn", [[white-space: nowrap;]]),
		s("wsp", [[white-space: pre;]]),
		s("col", [[color: ${0:#000};]]),
		s("ta", [[text-align: ${1|center,left,right,justify,start,end|};]]),
		s("imp", [[@import '${0:filename}';]]),
		s(
			"mix",
			[[@mixin ${1:name} {
  $0
}]]
		),
		s("inc", [[@include ${0:mixin};]]),
		s(
			"key",
			[[@keyframes ${1:name} {
  $0
}]]
		),
		s(
			"med",
			[[@media screen and (${1:max-width: 300px}) {
  $0
}]]
		),
		s("!", [[!important]]),
		s("i", [[!important]]),
		s(
			"bor",
			[[border: ${1:1px} ${2|solid,dashed,dotted,double,groove,ridge,inset,outset,none,hidden|} ${0:#000};]]
		),
		s("vis", [[visibility: ${1|visible,hidden,collapse|};]]),
		s("td", [[text-decoration: ${1|none,underline,overline,line-through|};]]),
		s(
			"lis",
			[[list-style: ${1|disc,circle,square,decimal,lower-roman,upper-roman,lower-alpha,upper-alpha,none,armenian,cjk-ideographic,georgian,lower-greek,hebrew,hiragana,hiragana-iroha,katakana,katakana-iroha,lower-latin,upper-latin|} ${2|outside,inside|};]]
		),
		s("borc", [[border-color: ${0:#000};]]),
		s("bors", [[border-style: ${1|solid,dashed,dotted,double,groove,ridge,inset,outset,none,hidden|};]]),
		s("ti", [[text-indent: ${0:2em};]]),
		s("top", [[top: ${0:0};]]),
		s("fld", [[flex-direction: ${1|row,row-reverse,column,column-reverse|};]]),
		s("borw", [[border-width: ${0:1px};]]),
		s("ts", [[text-shadow: ${1:1px} ${2:1px} ${3:1px} ${4:1px} ${0:rgba(0, 0, 0, .5)};]]),
		s("zi", [[z-index: ${0:-1};]]),
		s("ww", [[word-wrap: ${1|break-word,break-spaces,normal|};]]),
		s(
			"borb",
			[[border-bottom: ${1:1px} ${2|solid,dashed,dotted,double,groove,ridge,inset,outset,none,hidden|} ${0:#000};]]
		),
		s("wid", [[width: ${0:0};]]),
		s("wb", [[word-break: ${1|break-all,keep-all,break-word,normal|};]]),
		s(
			"borl",
			[[border-left: ${1:1px} ${2|solid,dashed,dotted,double,groove,ridge,inset,outset,none,hidden|} ${0:#000};]]
		),
		s("vish", [[visibility: hidden;]]),
		s("visv", [[visibility: visible;]]),
		s(
			"borr",
			[[border-right: ${1:1px} ${2|solid,dashed,dotted,double,groove,ridge,inset,outset,none,hidden|} ${0:#000};]]
		),
		s("vat", [[vertical-align: top;]]),
		s("vab", [[vertical-align: bottom;]]),
		s("va", [[vertical-align: ${1|baseline,middle,top,bottom,sub,super,text-top,text-bottom|};]]),
		s(
			"bort",
			[[border-top: ${1:1px} ${2|solid,dashed,dotted,double,groove,ridge,inset,outset,none,hidden|} ${0:#000};]]
		),
		s("tt", [[text-transform: ${1|capitalize,uppercase,lowercase,full-width,none|};]]),
		s("fz", [[font-size: ${0:12px};]]),
		s("br", [[border-radius: ${0:2px};]]),
		s("ais", [[align-items: stretch;]]),
		s("ai", [[align-items: ${1|flex-start,flex-end,center,baseline,stretch,start,end,self-start,self-end|};]]),
		s("flf", [[flex-flow: ${1|row,row-reverse,column,column-reverse|} ${2|wrap,wrap-reverse,nowrap|};]]),
		s("curp", [[cursor: pointer;]]),
		s("marb", [[margin-bottom: ${0:0};]]),
		s("curd", [[cursor: default;]]),
		s("aifs", [[align-items: flex-start;]]),
		s("aic", [[align-items: center;]]),
		s("lisp", [[${1|outside,inside|}]]),
		s("bos", [[box-shadow: ${1:1px} ${2:1px} ${3:1px} ${4:1px} ${0:rgba(0, 0, 0, .5)};]]),
		s("disi", [[display: inline-block;]]),
		s("bga", [[background-attachment: ${1|fixed,scroll,local|};]]),
		s("disn", [[display: none;]]),
		s("aib", [[align-items: baseline;]]),
		s("disf", [[display: flex;]]),
		s("bgp", [[background-position: ${1:left} ${2:top};]]),
		s("clr", [[clear: ${1|both,left,right,none|};]]),
		s("flw", [[flex-wrap: ${1|wrap,wrap-reverse,nowrap|};]]),
		s("fle", [[flex: ${1:1} ${2:1} ${3:auto};]]),
		s("aife", [[align-items: flex-end;]]),
		s("anide", [[animation-delay: ${0:1s};]]),
		s("lef", [[left: ${0:0};]]),
		s("rig", [[right: ${0:0};]]),
		s("fldc", [[flex-direction: column;]]),
		s("disb", [[display: block;]]),
		s("listc", [[list-style-type: circle;]]),
		s("bgrr", [[background-repeat: repeat;]]),
		s("listlr", [[list-style-type: lower-roman;]]),
		s("marl", [[margin-left: ${0:0};]]),
		s("anips", [[animation-play-state: ${1|paused,running|};]]),
		s("fll", [[float: left;]]),
		s(
			"cur",
			[[cursor: ${1|auto,default,alias,cell,copy,crosshair,context-menu,help,grab,grabbing,move,none,no-drop,not-allowed,pointer,progress,e-resize,all-scroll,text,wait,vertical-text,zoom-in,zoom-out|};]]
		),
		s("flr", [[float: right;]]),
		s("fwb", [[font-weight: bold;]]),
		s("fln", [[float: none;]]),
		s("fldr", [[flex-direction: row;]]),
		s("hei", [[height: ${0:1px};]]),
		s("padr", [[padding-right: ${0:0};]]),
		s("bgr", [[background-repeat: ${1|no-repeat,repeat-x,repeat-y,repeat,space,round|};]]),
		s("jcsa", [[justify-content: space-around;]]),
		s("fsti", [[font-style: italic;]]),
		s("bgo", [[background-origin: ${1|border-box,padding-box,content-box|};]]),
		s("fstn", [[font-style: normal;]]),
		s("anifm", [[animation-fill-mode: ${1|forwards,backwards,both,none|};]]),
		s("fsto", [[font-style: oblique;]]),
		s("lh", [[line-height: ${0:1.5};]]),
		s("ff", [[font-family: ${0:arial};]]),
		s("con", [[content: '$0';]]),
		s(
			"list",
			[[list-style-type: ${1|disc,circle,square,decimal,lower-roman,upper-roman,lower-alpha,upper-alpha,none,armenian,cjk-ideographic,georgian,lower-greek,hebrew,hiragana,hiragana-iroha,katakana,katakana-iroha,lower-latin,upper-latin|};]]
		),
		s("ov", [[overflow: ${1|visible,hidden,scroll,auto,clip|};]]),
		s("fwl", [[font-weight: light;]]),
		s("padt", [[padding-top: ${0:0};]]),
		s("fwn", [[font-weight: normal;]]),
	},
	html = {
		s("doctype", "<!DOCTYPE>\n$1"),
		s("a", '<a href="$1">$2</a>$3'),
		s("abbr", '<abbr title="$1">$2</abbr>$3'),
		s("address", "<address>\n\t$1\n\t</address>"),
		s("area", '<area shape="$1" coords="$2" href="$3" alt="$4">$5'),
	},
}
