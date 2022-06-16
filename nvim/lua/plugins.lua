
local home = os.getenv('HOME')
local db = require('dashboard')
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('renderer', wilder.popupmenu_renderer(
wilder.popupmenu_border_theme({
  highlights = {
    border = 'Normal', -- highlight to use for the border
    accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
  },
  highlighter = wilder.basic_highlighter(),
  border = 'rounded',
})
))

require('Comment').setup()
require("nvim-autopairs").setup {}
require('gitsigns').setup()
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
require'hop'.setup()
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
require("which-key").setup()

db.custom_center = {
  {icon = '?  ',
  desc = 'Recently laset session                  ',
  shortcut = 'SPC s l',
  action ='SessionLoad'},
  {icon = '?  ',
  desc = 'Recently opened files                   ',
  action =  'DashboardFindHistory',
  shortcut = 'SPC f h'},
  {icon = '?  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '?  ',
  desc ='File Browser                            ',
  action =  'Telescope file_browser',
  shortcut = 'SPC f b'},
  {icon = '?  ',
  desc = 'Find  word                              ',
  aciton = 'DashboardFindWord',
  shortcut = 'SPC f w'},
  {icon = '?  ',
  desc = 'Open Personal dotfiles                  ',
  action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
  shortcut = 'SPC f d'},
}
