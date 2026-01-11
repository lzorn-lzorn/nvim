-- ============================================================================
-- Nvim-tree - 文件浏览器
-- ~/.config/nvim/lua/plugins/nvim-tree.lua
-- ============================================================================

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "文件浏览器" },
    { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "定位当前文件" },
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { ". git", "node_modules", ". cache" },
      },
      git = {
        enable = true,
        ignore = false,
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
    })
  end,
}