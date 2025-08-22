return {
	"mason-org/mason.nvim",
	lazy = false,
	dependencies = {
		-- bridge between mason & lspconfig
		"williamboman/mason-lspconfig.nvim",
		-- Installs automatically some packages (linters, formatters, debuggers)
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- import mason_tool_installer
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- Install these LSPs automatically from mason
			ensure_installed = {
				"lua_ls",
				"pyright",
        "texlab",
			},
		})

		mason_tool_installer.setup({
			-- Install these packages automatically from mason
			ensure_installed = {
				-- Ruff is a extremely fast Python linter and code formatter. Drop-in replacement for black, flake8, isort (I don't know how to set up ruff, so I am not using it)
				-- "ruff",
				"prettier", -- formats a lot of languages like markdown
				"shfmt", -- shell formatter
				"stylua", -- formatter of Lua
				"black", -- black is a python code formatter
				-- 'debugpy', -- for debugging
				-- "flake8", -- Tool for style guide enforcement
				"isort", -- sorts imports alphabetically, and automatically separated into sections and by type
				-- "mypy", -- static type checker for Python
				"pylint", -- static code analyser
        "tex-fmt", -- formatter for latex
			},
		})
	end,
}
