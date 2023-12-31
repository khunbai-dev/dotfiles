-- check if nvim-tree is installed
local installed, nvimtree = pcall(require, "nvim-tree")
if not installed then
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "h", action = "dir_up" },
        { key = "l", action = "dir_down" },
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    highlight_modified = "none",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "u",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "README.md", "readme.md" },
    symlink_destination = true,
  },
  git = {
    enable = true,
    ignore = false,  -- true = hide files that are in .gitignore
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
})

--require'nvim-web-devicons'.setup {
--  -- your personnal icons can go here (to override)
--  -- you can specify color or cterm_color instead of specifying both of them
--  -- DevIcon will be appended to `name`
--  override = {
--   zsh = {
--     icon = "",
--     color = "#428850",
--     cterm_color = "65",
--     name = "Zsh"
--   }
--  };
--  -- globally enable different highlight colors per icon (default to true)
--  -- if set to false all icons will have the default icon's color
--  color_icons = true;
--  -- globally enable default icons (default to false)
--  -- will get overriden by `get_icons` option
--  default = true;
--  -- globally enable "strict" selection of icons - icon will be looked up in
--  -- different tables, first by filename, and if not found by extension; this
--  -- prevents cases when file doesn't have any extension but still gets some icon
--  -- because its name happened to match some extension (default to false)
--  strict = true;
--  -- same as `override` but specifically for overrides by filename
--  -- takes effect when `strict` is true
--  override_by_filename = {
--    [".gitignore"] = {
--      icon = "",
--      color = "#f1502f",
--      name = "Gitignore"
--    }
--  };
--  -- same as `override` but specifically for overrides by extension
--  -- takes effect when `strict` is true
--  override_by_extension = {
--    ["log"] = {
--      icon = "",
--      color = "#81e043",
--      name = "Log"
--    }
--  };
--}
---- Open explorer tab on startup
--require("nvim-tree.api").tree.toggle({
--	path = nil,
--	current_window = false,
--	find_file = false,
--	update_root = false,
--	focus = true,
--})
