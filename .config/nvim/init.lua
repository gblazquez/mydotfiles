-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvmim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- We load the rest of the settings
require("vim-options")

-- Setup lazy.nvim
require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.lsp" },
}, {
	change_detection = {
		enabled = true, -- automatically check for config file changes and reload the ui
		-- notify = false, -- turn off/on notifications whenever plugin changes are made
	},
})
