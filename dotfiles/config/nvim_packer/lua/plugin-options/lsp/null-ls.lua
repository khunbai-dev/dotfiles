local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		-- diagnostics.flake8
	},
})

-- All these packages in below list are installed using different package installer
-- for each different language such as `prettier` installed using `NPM`
--   [prettier] is javascript formating
--   [stylua] is lua formatting
--   [black] is python formatting
--   [flake8] is python diagnostics or linter (linter and diagnostic are pretty the same thing)

-- To see active source of current file us command `:NullLsInfo`
-- To see LSP client attached to current buffer use command `:LspInfo`
