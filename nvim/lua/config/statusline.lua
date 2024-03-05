--{{{ Values "
local colors = {
  bg        = '#202328',
  fg        = '#bbc2cf',
  yellow    = '#ECBE7B',
  cyan      = '#008080',
  darkblue  = '#081633',
  green     = '#98be65',
  orange    = '#FF8800',
  violet    = '#a9a1e1',
  magenta   = '#c678dd',
  blue      = '#51afef',
  red       = '#ec5f67',
	active    = '#e0e0e0',
	inactive  = '#909090',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}
--}}}

--{{{ Config "
local config = {
  options = {
    theme = {
      normal = {c = {fg = colors.fg, bg = colors.bg}},
      inactive = {c = {fg = colors.fg, bg = colors.bg}},
    },
		component_separators = '',
		section_separators = '',
		disabled_filetypes = {},
		globalstatus = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
	tabline = {
		lualine_a = {
			{
				'buffers',
				icons = false,
				use_mode_colors = true,
				buffers_color = {
					active = {fg = colors.active, gui = 'bold'},
					inactive = {fg = colors.inactive},
				},
				symbols = {
					modified = '',
					alternate_file = '',
					directory = '',
				},
				max_length = function()
					return vim.o.columns
				end,
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {},
}
--}}}

--{{{ Left "
local function add_left(component)
  table.insert(config.sections.lualine_c, component)
end

add_left{
  -- mode component
  function()
    return vim.fn.mode()
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      ['␖'] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      ['␓'] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return {fg = mode_color[vim.fn.mode()]}
  end,
  padding = {left = 1},
}

add_left{
  'branch',
  icon = '',
  color = {fg = colors.violet, gui = 'bold'},
}

add_left{
  'diff',
	symbols = {added = '+', modified = '~', removed = '-'},
  diff_color = {
    added = {fg = colors.green},
    modified = {fg = colors.orange},
    removed = {fg = colors.red},
  },
  cond = conditions.hide_in_width,
	padding = {left = 0},
}

add_left{
  'filename',
  cond = conditions.buffer_not_empty,
  color = {fg = colors.fg},
}

-- mid section
add_left{
	function()
		return '%='
	end,
}

add_left{
	'filetype',
}

add_left{
  -- Lsp server name .
  function()
    local msg = 'no active lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = '󱤵',
  color = {fg = '#bbbbbb', gui = 'bold'},
}
--}}}

--{{{ Right "
local function add_right(component)
  table.insert(config.sections.lualine_x, component)
end

add_right{
	function()
		if vim.v.hlsearch == 0 then
			return ''
		end
		return vim.fn.getreg('/')
	end,
	padding = {left = 1},
}

add_right{
	'searchcount',
	maxcount = 999,
	timeout = 500,
}

add_right{
	'location',
	padding = {left = 0},
}

add_right{
	'progress',
	color = {fg = colors.fg, gui = 'bold'},
	padding = {left = 1},
}

add_right{
  'o:encoding',
  fmt = string.lower,
  cond = conditions.hide_in_width,
  color = {fg = colors.green, gui = 'bold'},
	padding = {left = 1},
}

add_right{
  'fileformat',
  fmt = string.lower,
  icons_enabled = true,
  color = {fg = colors.green, gui = 'bold'},
}

add_right{
  'diagnostics',
  sources = {'nvim_lsp', 'nvim_diagnostic'},
  diagnostics_color = {
    color_error = {fg = colors.red},
    color_warn = {fg = colors.yellow},
    color_info = {fg = colors.cyan},
  },
}
--}}}

require('lualine').setup(config)
