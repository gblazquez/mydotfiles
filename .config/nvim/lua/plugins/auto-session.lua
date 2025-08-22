-- For loading and saving sessions.
return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/" },
		})

		vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore a session based on the cwd in root_dir" })
		vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save a session based on the cwd in root_dir" })
		vim.keymap.set("n", "<leader>wd", "<cmd>SessionDelete<CR>", { desc = "Delete a session based on the cwd from root_dir" })
		vim.keymap.set("n", "<leader>wp", "<cmd>SessionPurgeOrphaned<CR>", { desc = "Removes all orphaned sessions with no working directory left" })
		vim.keymap.set("n", "<leader>wf", "<cmd>SessionSearch<CR>", { desc = "opens a session picker" })

	end,
}
