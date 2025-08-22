-- File tree
-- Nice doc: https://docs.rockylinux.org/books/nvchad/nvchad_ui/nvimtree/

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  requires = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup {
      diagnostics = {
        enable = true,
      }
    }
    vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", { desc = "Open explorer"})
  end
}

