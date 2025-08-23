return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
    local function footer()
        local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
        local version = vim.version()
        local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
        return datetime .. nvim_version_info
    end

		-- Set header
    dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("n", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("e", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("ff", "󰱼  > Find file", "<cmd>Telescope find_files<CR>"),
			dashboard.button("fw", "  > Find word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("r", "  > Recently opened files"   , ":Telescope oldfiles<CR>"),
			dashboard.button("wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("wl", "🗄 > Sessions", ":SessionSearch<CR>"),
      dashboard.button("p", "󰂖  > Lazy Plugins", "<Cmd>Lazy<CR>"),
      dashboard.button("m", "🛠 > Mason Packages", ":Mason<CR>"),
      -- ☭
      dashboard.button( "s", "  > Settings" , ":cd $HOME/.config/nvim | :tabnew lua/vim-options.lua | :NvimTreeToggle <CR>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}
    dashboard.section.footer.val = footer()
    -- dashboard.section.header.val = footer()
    dashboard.section.footer.opts.hl = "Constant"

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
