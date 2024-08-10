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
nmap('<C-j>', '<C-d>')  -- scrolling down
nmap('<C-k>', '<C-u>')  -- scrolling up

-- Horizontal movement
nmap('fl', '$')  -- go to right end of line
nmap('fh', '^')  -- go to first character of line
nmap('<C-h>', '20zh')   -- Scrolling left
nmap('<C-l>', '20zl')   -- scrolling right

-- Map to command
nmap('<Leader>w', ':w<Enter>')
nmap('<Leader>q', ':q<Enter>')
nmap('<Leader>Q', ':q!<Enter>')
nmap('<Leader>t', ':NvimTreeToggle<CR>')
nmap('<Leader>h', ':NvimTreeFocus<CR>')
nmap('<Leader>rl', ':source $MYVIMRC<CR>')
nmap('<Leader><Bslash>', ':vsplit<CR>')

-- switch between split window
nmap('<S-h>', '<C-W>h')
nmap('<S-l>', '<C-W>l')

-- exit to normal mode
imap('ii', '<Esc>')
vmap('ii', '<Esc>')
imap('<A-i>', '<Esc>')
vmap('<A-i>', '<Esc>')

-- move any selected text like Alt+arrow in vscode
vmap('<A-j>', ":m '>+1<CR>gv=gv")
vmap('<A-k>', ":m '<-2<CR>gv=gv")

-- delete selected text and paste without losing existing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])
-- delete without losing current clipboard
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- yank to global clipboard that allow to use ctrl+v outside nvim
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
