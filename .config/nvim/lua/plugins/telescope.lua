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
			vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")
			vim.keymap.set("n", "<leader>fi", ":Telescope git_files<cr>")
			vim.keymap.set("n", "<leader>fw", ":Telescope live_grep<cr>")
			vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")
			vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find todos" })

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
			local opts = { noremap = true, silent = true }

			-- keymap("n", "<space>g", ":Telescope current_buffer_fuzzy_find<cr>", opts)
			-- keymap("v", "<space>g", function()
			-- 	local text = vim.getVisualSelection()
			-- 	tb.current_buffer_fuzzy_find({ default_text = text })
			-- end, opts)

			-- keymap("n", "<space>G", ":Telescope live_grep<cr>", opts)
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
