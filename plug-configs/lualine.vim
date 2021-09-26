lua <<EOF

local lualine = require 'lualine'

local colors = {
  white = '#000000',
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  dracula_green = '#49F583',
  dracula_voilet = '#9758F4',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

local config = {
  options = {
    component_separators = "",
    section_separators = "",
    theme = {
      normal = {c = {fg = colors.fg, bg = colors.bg}},
      inactive = {c = {fg = colors.fg, bg = colors.bg}}
    }
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  }
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function() return '▊' end,
  color = {fg = colors.dracula_voilet}, -- Sets highlighting of component
  left_padding = 0 -- We don't need space before this
}

ins_left {
  'mode',
  condition = conditions.buffer_not_empty,
  color = {bg = colors.dracula_voilet, fg = colors.black , gui = 'bold'}
}
ins_left {
        'filename',
color = { fg = colors.dracula_voilet, gui = 'bold' }
        }

ins_left {'location', color = { fg = colors.white, gui = 'bold' }}

ins_left {'progress', color = {fg = colors.white, gui = 'bold'}}


ins_right {function() return '%=' end}

ins_right {
        'filetype',
        color = { gui = 'bold' }
        }

ins_right {
  'branch',
  icon = '',
  condition = conditions.check_git_workspace,
  color = { bg = colors.dracula_voilet, gui = 'bold'}
}

ins_right {
  function() return '▊' end,
  color = {fg = colors.dracula_voilet},
  right_padding = 0
}

extensions = { 'fugitive', 'nerdtree' }

lualine.setup(config)

EOF
