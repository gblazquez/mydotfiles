return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Tmux navigate Left" },
		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Tmux navigate Down" },
		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Tmux navigate Up" },
		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Tmux navigate Right" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Tmux navigate Previous" },
	},
}
