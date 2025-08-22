--
-- vim options
--

-- enable line numbers
vim.opt.nu = true

-- relative line numbers
vim.opt.relativenumber = true

-- number of space characters as a tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Indent spaces when press enter
vim.opt.shiftwidth = 4

-- convert tabs into spaces
vim.opt.expandtab = true

-- auto indentation
vim.opt.autoindent = true

-- vim.opt.list = true -- show tab characters and trailing whitespace

-- do not highlight all matches on previous search pattern
vim.opt.hlsearch = false

-- incrementally highlight searches as you type
vim.opt.incsearch = true

-- enable true color support
vim.opt.termguicolors = true

-- minimum number of lines to keep above and below the cursor
vim.opt.scrolloff = 8

--minimum number of columns to keep above and below the cursor
vim.opt.sidescrolloff = 8

-- trailling spaces removed when written
-- vim.g.editorconfig.trim_trailing_whitespace = true

-- spelling
vim.opt.spelllang = "en_us"
vim.opt.spell = false

--
-- vim keymaps
--

-- buffers keymaps
vim.keymap.set("n", "gt", ":bn<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "gT", ":bp<cr>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "g1", ":b1<cr>", { desc = "Go to buffer 1" })
vim.keymap.set("n", "g2", ":b2<cr>", { desc = "Go to buffer 2" })
vim.keymap.set("n", "g3", ":b3<cr>", { desc = "Go to buffer 3" })
vim.keymap.set("n", "g4", ":b4<cr>", { desc = "Go to buffer 4" })
vim.keymap.set("n", "g5", ":b5<cr>", { desc = "Go to buffer 5" })
vim.keymap.set("n", "g6", ":b6<cr>", { desc = "Go to buffer 6" })
vim.keymap.set("n", "g7", ":b7<cr>", { desc = "Go to buffer 7" })
vim.keymap.set("n", "g8", ":b8<cr>", { desc = "Go to buffer 8" })
vim.keymap.set("n", "g9", ":b9<cr>", { desc = "Go to buffer 9" })
vim.keymap.set("n", "<leader>q", ":bd<cr>", { desc = "Close buffer " })
-- tabs
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- splitting
-- Remember C-w-s and C-w-v
-- vim.keymap.set("n", "<leader>s", ":split<cr>", { desc = "Split window"})
-- vim.keymap.set("n", "<leader>v", ":vsplit<cr>", { desc = "Split window vertically"})
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- yank to clippboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], {desc = "Yank to system clipboard"})

-- moving lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up"}) -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down"}) -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up (v)"}) -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down (v)"}) -- move line down(v)


--
-- Format
--

-- python formatting
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.py",
	callback = function()
		vim.opt.textwidth = 79
		vim.opt.colorcolumn = "79"
	end,
  desc = "Formatting for python",
})

-- lua formatting
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.js", "*.html", "*.css", "*.lua" },
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
	end,
  desc = "Formatting for lua, javascript, and html"
})

-- return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
  desc = "Return to last edit position when opening files"
})

-- Remove trailing spaces
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.py", "*.js", "*.lua" }, -- only for these files
	command = [[%s/\s\+$//e]],
	desc = "Remove trailing spaces when written",
})

-- spelling
vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "*.tex", "*.txt", "*.md" }, -- only for these files
	callback = function()
		vim.opt_local.spell = true
	end,
	desc = "Enable spellcheck for defined files",
})
