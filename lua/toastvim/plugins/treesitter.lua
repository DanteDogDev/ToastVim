return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	---@type TSConfig
	---@diagnostic disable-next-line: missing-fields
	opts = {
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		-- ensure_installed = {
		-- 	"vim",
		-- 	"vimdoc",
		-- 	"query",
		-- 	"regex",
		-- 	"bash",
		-- 	"lua",
		-- 	"rust",
		--
		-- 	"markdown",
		-- 	"markdown_inline",
		-- 	"html",
		-- 	"typst",
		-- 	"yaml",
		--
		-- 	"css",
		-- 	"javascript",
		-- 	"norg",
		-- 	"scss",
		-- 	"svelte",
		-- 	"tsx",
		-- 	"vue",
		-- },
	},
}
