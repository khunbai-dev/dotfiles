vim.g.mapleader = ' '

local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(
    mode,
    shortcut,
    command,
    { noremap = true, silent = true }
  )
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

-- Unbind keys
--nmap('<S-j>', '<Nop>')
--nmap('<S-k>', '<Nop>')

-- Redo
nmap('U', '<C-r>')

-- Vertical movement
nmap('<S-j>', '<C-d>')  -- scrolling down
nmap('<S-k>', '<C-u>')  -- scrolling up

-- Horizontal movement
nmap('<Leader>l', '$')  -- go to right end of line
nmap('<Leader>h', '^')  -- go to first character of line
nmap('<S-h>', '20zh')   -- Scrolling left
nmap('<S-l>', '20zl')   -- scrolling right

-- Map to command
nmap('<Space><Space>', '<cmd>HopWord<cr>')
nmap('<Leader>w', ':w<Enter>')
nmap('<Leader>q', ':q<Enter>')
nmap('<Leader>Q', ':q!<Enter>')
nmap('<Leader>t', ':NvimTreeToggle<CR>')
nmap('<Leader>rl', ':source $MYVIMRC<CR>')
nmap('<Leader><Bslash>', ':vsplit<CR>')

-- exit to normal mode
imap('ii', '<Esc>')
vmap('ii', '<Esc>')

-- hopword mode
vmap('<Space><Space>', '<cmd>HopWord<cr>')

-- move any selected text like Alt+arrow in vscode
vmap('<A-j>', ":m '>+1<CR>gv=gv")
vmap('<A-k>', ":m '<-2<CR>gv=gv")

-- delete selected text and paste without losing existing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])
-- delete without losing current clipboard
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- yank to global clipboard that allow to use ctrl+v outside nvim
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Session
vim.keymap.set("n", "<Leader>ob", ":Obsession<CR>", {desc = ":[O][b]session"})
-- vim.keymap.set("n", "<Leader>ss", ":source Session.vim<CR>", {desc = ":[s]ource [S]ession.vim"})

