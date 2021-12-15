local fn = vim.fn

local function diagnostics_indicator(_, _, diagnostics)
    local symbols = { error = ' ', warning = ' ', info = ' ' }
    local result = {}
    for name, count in pairs(diagnostics) do
      if symbols[name] and count > 0 then
        table.insert(result, symbols[name] .. count)
      end
    end
    result = table.concat(result, ' ')
    return #result > 0 and result or ''
  end


local function sort_by_mtime(a, b)
    local astat = vim.loop.fs_stat(a.path)
    local bstat = vim.loop.fs_stat(b.path)
    local mod_a = astat and astat.mtime.sec or 0
    local mod_b = bstat and bstat.mtime.sec or 0
    return mod_a > mod_b
  end

require("bufferline").setup({
      options = {
         numbers = "none",
         close_command = "bdelete! %d",
         sort_by = sort_by_mtime,
         indicator_icon = ' ▎',
         diagnostics = "nvim_lsp",
         diagnostics_update_in_insert = true,
         diagnostics_indicator = diagnostics_indicator,
         offsets = {
            {
               filetype = "NvimTree",
               text = "Explorer",
               text_align = "center",
            },
         },
         show_buffer_icons = true,
         show_buffer_close_icons = true ,
         custom_filter = function(buf_number)
            if vim.bo[buf_number].filetype ~= "dashboard" then
               return true
            end
         end,
         show_close_icon = false,
         show_tab_indicators = true ,
         persist_buffer_sort = true,
         always_show_bufferline = true,
         separator_style = "slant" ,
      }
})
