return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation
			map("n", "]i", gs.next_hunk, "Next Hunk")
			map("n", "[i", gs.prev_hunk, "Previous Hunk")

			-- Actions
			-- For lines
			map("n", "<leader>is", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>ir", gs.reset_hunk, "Reset hunk")

			map("v", "<leader>is", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage hunk")

			map("v", "<leader>ir", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk")

			map("n", "<leader>ib", function()
				gs.blame_line({ full = true })
			end, "Blame line")

			map("n", "<leader>iB", gs.toggle_current_line_blame, "Toggle line blame")
			map("n", "<leader>id", gs.diffthis, "Diff this")
			map("n", "<leader>iD", function()
				gs.diffthis("~")
			end, "Diff this ~")

			-- For the whole buffer
			map("n", "<leader>iS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>iR", gs.reset_buffer, "Reset buffer")
			map("n", "<leader>iu", gs.undo_stage_hunk, "Undo stage hunk")
			map("n", "<leader>ip", gs.preview_hunk, "Preview hunk")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
		end,
	},
}
