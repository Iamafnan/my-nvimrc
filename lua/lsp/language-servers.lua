local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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

-- local system_name
-- if vim.fn.has("mac") == 1 then
  -- system_name = "macOS"
-- elseif vim.fn.has("unix") == 1 then
--   system_name = "Linux"
-- elseif vim.fn.has('win32') == 1 then
--   system_name = "Windows"
-- else
--   print("Unsupported system for sumneko")
-- end

-- local sumneko_root_path = '/data/data/com.termux/files/usr/bin/lua-language-server'
-- local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

local langservers = {
  'html',
  'cssls',
  'tsserver',
  'ls_emmet'
  -- 'sumneko_lua'
}

local signature = require('lsp_signature')

local on_attach = function( client , bufnr )
        signature.on_attach()
end

for _, server in ipairs(langservers) do
  -- if server == 'sumneko_lua' then
    -- require'lspconfig'[server].setup {
      -- cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
      -- settings = {
        -- Lua = {
        --   runtime = {
        --     version = 'LuaJIT',
        --     path = runtime_path,
        --   },
        --   diagnostics = {
        --     globals = {'vim'},
        --   },
        --   workspace = {
        --     library = vim.api.nvim_get_runtime_file("", true),
        --     checkThirdParty = false
        --   },
        --   telemetry = {
        --     enable = false,
        --   },
        -- },
      -- },
    -- }
  -- else
    require'lspconfig'[server].setup {
      capabilities = capabilities,
      on_attach = on_attach
    }
  -- end
end
