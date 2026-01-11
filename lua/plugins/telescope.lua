-- ============================================================================
-- Telescope - 模糊查找
-- ~/.config/nvim/lua/plugins/telescope.lua
-- ============================================================================

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "搜索文本" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "查找缓冲区" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "帮助文档" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "最近文件" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "命令" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "快捷键" },
    { "<leader>ft", "<cmd>Telescope colorscheme<cr>", desc = "切换主题" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "❯ ",
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<Esc>"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!. git/*" },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
