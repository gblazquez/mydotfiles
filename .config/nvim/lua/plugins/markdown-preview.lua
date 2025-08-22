-- Markdown preview

return {
	"iamcco/markdown-preview.nvim",
	cmd = {
		"MarkdownPreviewToggle",
		"MarkdownPreview",
		"MarkdownPreviewStop",
	},
	ft = { "markdown" },
	build = function()
		vim.cmd([[Lazy load markdown-preview.nvim]])
		vim.fn["mkdp#util#install"]()
		-- Is this keymap working?
	end,
	config = function()
		vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })
	end,
}
