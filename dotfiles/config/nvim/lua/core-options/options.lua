local o = vim.opt

-- line number
o.number = true
o.relativenumber = true

-- tab and indentation
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

-- line wrapping
o.wrap = false

-- search settings
o.ignorecase = true
o.smartcase = true

-- appearance
o.colorcolumn = '80'
o.list = true
--o.listchars = {tab='»·', space='.', eol='¬'}
o.listchars = {tab='»·', space='.'}
--(v) Setting font here may not working as it follows terminal font.
-- o.guifont = {"SpaceMono NFM", ":h10"}
o.guifont = {"Hack NF", ":h10"}

-- split window
o.splitright = true
o.splitbelow = true

-- colorscheme
o.termguicolors = true

vim.cmd [[
  syntax on
  syntax enable
  set noerrorbells
  set noshowmode
  set noshowmatch
  set undodir=~/.vim/undodir
  set undofile
  set nosmartindent
  set mouse=a
  set t_Co=256
  " No highlight for match parenthesis
  let loaded_matchparen = 1
]]

