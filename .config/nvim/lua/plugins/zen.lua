return {
	"folke/zen-mode.nvim",
	-- cmd = { "Focus", "Zen", "Narrow" },
	--	opts = {
	--		window = {
	--			-- backdrop = 1,
	--			width = 0.2,
	--			-- options = {
	--			-- 	number = false,
	--			-- 	-- window = { width = 0.6 },
	--			-- 	-- number = false,
	--			-- 	-- your configuration comes here
	--			-- 	-- or leave it empty to use the default settings
	--			-- 	-- refer to the configuration section below
	--			-- },
	--		},
	--	},
	-- -- callback where you can add custom code when the Zen window opens
	-- on_open = function(win)
	-- end,
	-- -- callback where you can add custom code when the Zen window closes
	-- on_close = function()
	-- end,
	config = function()
		local zen = require("zen-mode")
		zen.setup({
			window = {
				width = 0.8,
				backdrop = 1,
				options = {
					number = false,
					relativenumber = false,
				},
			},
		})
		vim.keymap.set("n", "<leader>z", ":ZenMode<cr>")
	end,
}
