-- Visualize buffers as tabs

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "tabs",
    }
  },
	config = function()
		-- vim.opt.termguicolors = true
		require("bufferline").setup({})
	end,
}
