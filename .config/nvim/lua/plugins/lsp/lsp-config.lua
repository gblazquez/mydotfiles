return {
	"neovim/nvim-lspconfig",
	lazy = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    -- I don't know if I am actually using the next two dependencies
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
	config = function()
    -- import cmp-nvim-lsp plugin
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- we configure lua_ls
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			filetypes = { "lua" },
		})

		-- we configure pyright
		lspconfig.pyright.setup({
			capabilities = capabilities,
			filetypes = { "python" },
		})

		-- we configure texlab
		lspconfig.texlab.setup({
			capabilities = capabilities,
			filetypes = { "latex", "tex" },
		})

		-- Displays information
		vim.keymap.set("n", "<leader>di", vim.lsp.buf.hover, {desc= "Display information" })

		-- Opens the file where the object is defined
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition"})

		-- Shows where the object is used in the file and other files
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to reference"})

		-- Displays a menu with code actions regarding the diagnostic
		vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions"})

		-- Displays diagnostic
		vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Display diagnostic"})

		-- Navigate diagnostic
		-- no need to set these keymaps, they are automatically asigned
		-- view.keymap.set("n", "[d", vim.diagnostic.goto_next, {})
		-- view.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})
	end,
}
