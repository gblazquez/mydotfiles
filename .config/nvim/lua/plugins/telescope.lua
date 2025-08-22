-- Telescope
-- NOTE: `live-grep` finder will not function without [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) installed.
-- In ubuntu just do:
-- $ apt install ripgrep
-- NOTE:  Install [sharkdp/fd](https://github.com/sharkdp/fd) for extended capabilities.
-- In ubuntu just do:
-- $ apt install fd-find

return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- Another way to define keymaps
			-- local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<leader>fz", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Find files" })
			vim.keymap.set("n", "<leader>fi", ":Telescope git_files<cr>", { desc = "Find files tracked by Git" })
			vim.keymap.set("n", "<leader>fw", ":Telescope live_grep<cr>", { desc = "Find word" })
			vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>", { desc = "Find old file" })
			vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
			-- The next function is for defining fw in visual mode, which fuzzy finds the selected text
			function vim.getVisualSelection()
				vim.cmd('noau normal! "vy"')
				local text = vim.fn.getreg("v")
				vim.fn.setreg("v", {})
				text = string.gsub(text, "\n", "")
				if #text > 0 then
					return text
				else
					return ""
				end
			end
			local keymap = vim.keymap.set
			local tb = require("telescope.builtin")
			local opts = { noremap = true, silent = true, desc = "Find word" }
			keymap("v", "<space>fw", function()
				local text = vim.getVisualSelection()
				tb.live_grep({ default_text = text })
			end, opts)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
