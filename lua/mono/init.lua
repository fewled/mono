local M = {}

function M.setup(mode)
	local palette = require("mono.palettes." .. (mode or "dark"))

	local ui = require("mono.core.ui")(palette)
	local syntax = require("mono.core.syntax")(palette)
	local lsp = require("mono.core.lsp")(palette)

	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "mono" .. (mode and ("-" .. mode) or "")

	local groups = vim.tbl_extend("error", ui, syntax, lsp)

	for group, opts in pairs(groups) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
