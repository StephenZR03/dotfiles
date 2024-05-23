require("transparent").setup({ -- Optional, you don't have to run setup.
	groups = { -- table: default groups
		'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
		'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
		'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
		'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC', 
		'EndOfBuffer',
	},
	extra_groups = {
		'TelescopeNormal', 'TelescopeBorder', 'TelescopePromptTitle', 'TelescopePromptBorder',
		'FloatTitle', 'FloatBorder', 'NormalFloat'
	}, -- table: additional groups that should be cleared
	exclude_groups = {
		'StatusLine', 'StatusLineNC'
	}, -- table: groups you don't want to clear
})

color = color or "catppuccin-mocha"
vim.cmd.colorscheme(color)
