vim.g.mapleader = ' '

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(
    mode, 
    shortcut, 
    command, 
    { noremap = true, silent = true }
  )
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

-- Unbind keys
nmap('<S-j>', '<Nop>')
nmap('<S-k>', '<Nop>')

-- Redo
nmap('U', '<C-r>')

-- Scrolling
nmap('<C-j>', '<C-d>')
nmap('<C-k>', '<C-u>')
nmap('<C-h>', '20zh')
nmap('<C-l>', '20zl') 

-- Map to command
nmap('<Space><Space>', '<cmd>HopWord<cr>')
nmap('<Leader>w', ':w<Enter>')
nmap('<Leader>q', ':q<Enter>')
nmap('<Leader>t', ':NvimTreeToggle<CR>')

imap('jj', '<Esc>')

vmap('jj', '<Esc>')
vmap('<Space><Space>', '<cmd>HopWord<cr>')
