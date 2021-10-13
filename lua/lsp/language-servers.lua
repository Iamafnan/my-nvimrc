local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local signature = require('lsp_signature')

local bmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true , silent = true }

local on_attach = function( client , bufnr )
vim.api.nvim_buf_set_keymap(0 , 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_buf_set_keymap(0 , 'n', '<C-1>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(0 , 'n', '<C-2>', '<cmd>lua vim.lsp.buf.decladeclaration()<CR>', opts)
        signature.on_attach()
end

require'lspconfig/configs'.ls_emmet = {
  default_config = {
    cmd = { 'ls_emmet', '--stdio' };
    filetypes = { 'html', 'css', 'scss' };
    root_dir = function(_)
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

local system_name
  system_name = "Linux"

local sumneko_root_path = '/data/data/com.termux/files/usr/lib/lua-language-server'
local sumneko_binary = '/data/data/com.termux/files/usr/bin/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local langservers = {
  'html',
  'cssls',
  'tsserver',
  'pyright',
  'ls_emmet',
  'sumneko_lua'
}

for _, server in ipairs(langservers) do
  if server == 'sumneko_lua' then
    require'lspconfig'[server].setup {
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = runtime_path,
          },
          diagnostics = {
            globals = {'vim'},
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
  else
    require'lspconfig'[server].setup {
      capabilities = capabilities,
      on_attach = on_attach
    }
  end
end
