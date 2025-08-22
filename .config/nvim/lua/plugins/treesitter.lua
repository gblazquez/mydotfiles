-- Treesitter: For highlighting code

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- import nvim-treesitter
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({
			-- automatically install syntax support when entering new file type buffer
      -- auto_install = true,
			ensure_installed = {
				"lua",
				"python",
				"vim",
				"gitignore",
				"bash",
				"markdown",
        "yaml",
        "html",
        "c",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
