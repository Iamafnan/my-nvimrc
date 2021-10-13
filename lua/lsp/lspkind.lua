local kind = require('lspkind')

local lsp_symbols = {
  Text           = ' (text)',
  Method         = ' (method)',
  Function       = ' (func)',
  Ctor           = ' (ctor)',
  Field          = ' (field)',
  Variable       = ' (var)',
  Class          = ' (class)',
  Interface      = 'ﰮ (interface)',
  Module         = ' (module)',
  Property       = ' (property)',
  Unit           = 'ﰩ (unit)',
  Value          = ' (value)',
  Enum           = '練(enum)',
  Keyword        = ' (keyword)',
  Snippet        = '﬌ (snippet)',
  Color          = ' (color)',
  File           = ' (file)',
  Reference      = ' (ref)',
  Folder         = ' (folder)',
  EnumMember     = ' (enum member)',
  Constant       = 'ﱃ (const)',
  Struct         = ' (struct)',
  Event          = ' (event)',
  Operator       = '璉(operator)',
  TypeParameter  = ' (type param)',
}

kind.init{
        with_text = true,
        preset = 'codicons',
        symbol_map = lsp_symbols
}
