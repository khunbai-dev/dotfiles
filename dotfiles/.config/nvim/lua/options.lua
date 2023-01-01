local o = vim.opt

o.wrap = false
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2
o.number = true
o.relativenumber = true
o.list = true
o.listchars = {tab='»·', space='.', eol='¬'}
--(v) Setting font here may not working as it follows terminal font.
o.guifont = {"SpaceMono NFM", ":h10"}

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
  set splitbelow splitright
  set colorcolumn=80
  set t_Co=256
  " No highlight for match parenthesis
  let loaded_matchparen = 1
]]

