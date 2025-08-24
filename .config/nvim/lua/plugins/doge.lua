return {
	"kkoomen/vim-doge",
	config = function()
		vim.keymap.set("n", "<Leader>cd", ":DogeGenerate numpy<cr>", { desc = "Create numpy style documentation" })
    -- I had to modify the file /home/guille/.local/share/nvim/lazy/vim-doge/plugin/doge.vim,
    -- because in the which-key pane with the keymaps the mapping was still pointing to <Leader>d even after modification
		vim.keymap.set("n", "<Leader>cg", "<Plug>(doge-generate)<cr>", { desc = "Create documentation" })
	end,
}
