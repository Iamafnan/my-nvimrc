local ls = require("luasnip")
local loader = require("luasnip.loaders.from_vscode").load
local types = require("luasnip.util.types")

function _G.LuaSnipLoad()
	loader({
		path = "~/.local/share/nvim/site/pack/packer/opt/friendly-snippets/snippets/",
	})
end

vim.cmd("command! LuaSnipLoad :lua _G.LuaSnipLoad()")

ls.config.setup({
	history = true,
	updateevents = "TextChangedI",
	enable_autosnippets = true,
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})

local s = ls.parser.parse_snippet
local snip = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

local function len(args)
	local a = args[1][1]
	return (a and #a or 0) + 2
end

ls.snippets = {
	all = {
		snip({ trig = "box", name = "Box" }, {
			f(function(args)
				return "┌" .. string.rep("─", len(args)) .. "┐"
			end, 1),
			t({ "", "| " }),
			i(1),
			t({ " |", "" }),
			f(function(args)
				return "└" .. string.rep("─", len(args)) .. "┘"
			end, 1),
		}),
	},
	lua = {
		s("l", "local $1"),
		snip(
			"ll",
			fmt([[ local {} = {} ]], {
				f(function(name)
					local parts = vim.split(name[1][1], ".", true)
					return parts[#parts] or ""
				end, { 1 }),
				i(1),
			})
		),
		s("req", 'require("$1")'),
		snip(
			"lreq",
			fmt([[local {} = require "{}"]], {
				f(function(name)
					local parts = vim.split(name[1][1], ".", true)
					return parts[#parts] or ""
				end, { 1 }),
				i(1),
			})
		),
		s("cl", "local $1 = {}\n $0 \n return $1"),
		s("rt", "return $1"),
		s("p", 'print("$1")$0'),
	},
	markdown = {
		s("h1", "<h1 $1 >$2</h1>$0"),
		s("h2", "<h2 $1 >$2</h2>$0"),
		s("h3", "<h3 $1 >$2</h3>$0"),
		s("h4", "<h4 $1 >$2</h4>$0"),
		s("img", "![$1]($2)$0"),
		s("link", "[$1]($2)$0"),
		s("code", "```$1\n$2\n```$0"),
	},
	javascript = {
		s("sim", "setImmediate(() => {\n\t${0}\n})"),
		s("a", "await ${0}"),
		s("apa", "await Promise.all(${1:value})"),
		s("apad", "const [${0}] = await Promise.all(${1:value})"),
		s("apm", "await Promise.all(${1:array}.map(async (${2:value}) => {\n\t${0}\n}))"),
		s("ast", "await new Promise((r) => setTimeout(r, ${0}))"),
		s("cb", "function (err, ${1:value}) {\n\tif (err) throw err\n\t${0}\n}"),
		s("pe", "process.env"),
		s("pa", "Promise.all(${1:value})"),
		s("prs", "Promise.resolve(${1:value})"),
		s("prj", "Promise.reject(${1:value})"),
		s("p", "Promise"),
		s("np", "new Promise((resolve, reject) => {\n\t${0}\n})"),
		s("pt", "${1:promise}.then((${2:value}) => {\n\t${0}\n})"),
		s("pc", "${1:promise}.catch(error => {\n\t${0}\n})"),
		s("desc", "describe('${1:description}', () => {\n\t${0}\n})"),
		s("dt", "describe('${TM_FILENAME_BASE}', () => {\n\t${0}\n})"),
		s("it", "it('${1:description}', async () => {\n\t${0}\n})"),
		s("itt", "it.todo('${1:description}')"),
		s("itd", "it('${1:description}', (done) => {\n\t${0}\n})"),
		s("its", "it('${1:description}', () => {\n\t${0}\n})"),
		s("bf", "before(async () => {\n\t${0}\n})"),
		s("ba", "beforeAll(async () => {\n\t${0}\n})"),
		s("bfe", "beforeEach(async () => {\n\t${0}\n})"),
		s("aft", "after(() => {\n\t${0}\n})"),
		s("afe", "afterEach(() => {\n\t${0}\n})"),
		s("rq", "require('${1:module}')"),
		s("cr", "const ${1:module} = require('${1:module}')"),
		s("em", "exports.${1:member} = ${2:value}"),
		s("me", "module.exports = ${1:name}"),
		s(
			"mec",
			"class ${1:name} {\n\tconstructor (${2:arguments}) {\n\t\t${0}\n\t}\n}\n\nmodule.exports = ${1:name}\n"
		),
		s("on", "${1:emitter}.on('${2:event}', (${3:arguments}) => {\n\t${0}\n})"),
		s("evc", "ev.preventDefault()\nev.stopPropagation()\nreturn false"),
		s("ae", "${1:document}.addEventListener('${2:event}', ${3:ev} => {\n\t${0}\n})"),
		s("rel", "${1:document}.removeEventListener('${2:event}', ${3:listener})"),
		s("gi", "${1:document}.getElementById('${2:id}')"),
		s("gc", "Array.from(${1:document}.getElementsByClassName('${2:class}'))"),
		s("gt", "Array.from(${1:document}.getElementsByTagName('${2:tag}'))"),
		s("qs", "${1:document}.querySelector('${2:selector}')"),
		s("qsa", "Array.from(${1:document}.querySelectorAll('${2:selector}'))"),
		s("cdf", "${1:document}.createDocumentFragment(${2:elem})"),
		s("cel", "${1:document}.createElement(${2:elem})"),
		s("hecla", "${1:el}.classList.add('${2:class}')"),
		s("heclr", "${1:el}.classList.remove('${2:class}')"),
		s("hect", "${1:el}.classList.toggle('${2:class}')"),
		s("hega", "${1:el}.getAttribute('${2:attr}')"),
		s("hera", "${1:el}.removeAttribute('${2:attr}')"),
		s("hesa", "${1:el}.setAttribute('${2:attr}', ${3:value})"),
		s("heac", "${1:el}.appendChild(${2:elem})"),
		s("herc", "${1:el}.removeChild(${2:elem})"),
		s("fe", "${1:iterable}.forEach((${2:item}) => {\n\t${0}\n})"),
		s("map", "${1:iterable}.map((${2:item}) => {\n\t${0}\n})"),
		s("reduce", "${1:iterable}.reduce((${2:previous}, ${3:current}) => {\n\t${0}\n}${4:, initial})"),
		s("filter", "${1:iterable}.filter((${2:item}) => {\n\t${0}\n})"),
		s("find", "${1:iterable}.find((${2:item}) => {\n\t${0}\n})"),
		s("every", "${1:iterable}.every((${2:item}) => {\n\t${0}\n})"),
		s("some", "${1:iterable}.some((${2:item}) => {\n\t${0}\n})"),
		s("v", "var ${1:name}"),
		s("va", "var ${1:name} = ${2:value}"),
		s("l", "let ${1:name}"),
		s("c", "const ${1:name}"),
		s("cd", "const { ${2:prop} } = ${1:value}"),
		s("cad", "const [ ${2:prop} ] = ${1:value}"),
		s("ca", "const ${1:name} = await ${2:value}"),
		s("cda", "const { ${1:name} } = await ${2:value}"),
		s("cf", "const ${1:name} = (${2:arguments}) => {\n\treturn ${0}\n}"),
		s("la", "let ${1:name} = await ${2:value}"),
		s("cy", "const ${1:name} = yield ${2:value}"),
		s("ly", "let ${1:name} = yield ${2:value}"),
		s("co", "const ${1:name} = {\n\t${0}\n}"),
		s("car", "const ${1:name} = [\n\t${0}\n]"),
		s("gari", "Array.from({ length: ${1:length} }, (v, k) => k + 1)"),
		s("gari0", "[...Array(${1:length}).keys()]"),
		s("cs", "class ${1:name} {\n\tconstructor (${2:arguments}) {\n\t\t${0}\n\t}\n}"),
		s(
			"csx",
			"class ${1:name} extends ${2:base} {\n\tconstructor (${3:arguments}) {\n\t\tsuper(${3:arguments})\n\t\t${0}\n\t}\n}"
		),
		s("e", "export ${1:member}"),
		s("ec", "export const ${1:member} = ${2:value}"),
		s("ef", "export function ${1:member} (${2:arguments}) {\n\t${0}\n}"),
		s("ed", "export default ${1:member}"),
		s("edf", "export default function ${1:name} (${2:arguments}) {\n\t${0}\n}"),
		s("im", "import ${2:*} from '${1:module}'"),
		s("ia", "import ${2:*} as ${3:name} from '${1:module}'"),
		s("id", "import {$2} from '${1:module}'"),
		s("to", "typeof ${1:source} === '${2:undefined}'"),
		s("t", "this."),
		s("iof", "${1:source} instanceof ${2:Object}"),
		s("lif", "let ${0} \n if (${2:condition}) {\n\t${1}\n}"),
		s("el", "else {\n\t${0}\n}"),
		s("ei", "else if (${1:condition}) {\n\t${0}\n}"),
		s("wid", "let ${1:array}Index = ${1:array}.length\nwhile (${1:array}Index--) {\n\t${0}\n}"),
		s("tn", "throw new ${0:error}"),
		s("tc", "try {\n\t${0}\n} catch (${1:err}) {\n\t\n}"),
		s("tf", "try {\n\t${0}\n} finally {\n\t\n}"),
		s("tcf", "try {\n\t${0}\n} catch (${1:err}) {\n\t\n} finally {\n\t\n}"),
		s("fan", "function (${1:arguments}) {${0}}"),
		s("fn", "function ${1:name} (${2:arguments}) {\n\t${0}\n}"),
		s("asf", "async function (${1:arguments}) {\n\t${0}\n}"),
		s("aa", "async (${1:arguments}) => {\n\t${0}\n}"),
		s("iife", ";(function (${1:arguments}) {\n\t${0}\n})(${2})"),
		s("aiife", ";(async (${1:arguments}) => {\n\t${0}\n})(${2})"),
		s("af", "(${1:arguments}) => ${2:statement}"),
		s("fd", "({${1:arguments}}) => ${2:statement}"),
		s("fdr", "({${1:arguments}}) => ${1:arguments}"),
		s("f", "(${1:arguments}) => {\n\t${0}\n}"),
		s("fr", "(${1:arguments}) => {\n\treturn ${0}\n}"),
		s("gf", "function* (${1:arguments}) {\n\t${0}\n}"),
		s("gfn", "function* ${1:name}(${2:arguments}) {\n\t${0}\n}"),
		s("cl", "console.log(${0})"),
		s("cv", "console.log('${0}:', ${0})"),
		s("ce", "console.error(${0})"),
		s("cw", "console.warn(${0})"),
		s("cod", "console.dir('${0}:', ${0})"),
		s("cn", "constructor () {\n\t${0}\n}"),
		s("uss", "'use strict'"),
		s("js", "JSON.stringify($0)"),
		s("jp", "JSON.parse($0)"),
		s("m", "${1:method} (${2:arguments}) {\n\t${0}\n}"),
		s("get", "get ${1:property} () {\n\t${0}\n}"),
		s("set", "set ${1:property} (${2:value}) {\n\t${0}\n}"),
		s("gs", "get ${1:property} () {\n\t${0}\n}\nset ${1:property} (${2:value}) {\n\t\n}"),
		s("proto", "${1:Class}.prototype.${2:method} = function (${3:arguments}) {\n\t${0}\n}"),
		s("oa", "Object.assign(${1:dest}, ${2:source})"),
		s("oc", "Object.create(${1:obj})"),
		s("og", "Object.getOwnPropertyDescriptor(${1:obj}, '${2:prop}')"),
		s("te", "${1:cond} ? ${2:true} : ${3:false}"),
		s("ta", "const ${0} = ${1:cond} ? ${2:true} : ${3:false}"),
		s("od", "Object.defineProperty(${1:dest}, '${2:prop}', {\n\t${0}\n})"),
		s("ok", "Object.keys(${1:obj})"),
		s("ov", "Object.values(${1:obj})"),
		s("oe", "Object.entries(${1:obj})"),
		s("r", "return ${0}"),
		s("rf", "return (${1:arguments}) => ${2:statement}"),
		s("y", "yield ${0}"),
		s("rt", "return ${0:this}"),
		s("rn", "return null"),
		s("ro", "return {\n\t${0}\n}"),
		s("ra", "return [\n\t${0}\n]"),
		s("rp", "return new Promise((resolve, reject) => {\n\t${0}\n})"),
		s("wrap selection in arrow function", "() => {\n\t{$TM_SELECTED_TEXT}\n}"),
		s("wrap selection in async arrow function", "async () => {\n\t{$TM_SELECTED_TEXT}\n}"),
	},
}
