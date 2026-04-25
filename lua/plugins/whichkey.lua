
return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    preset = "helix",
    win = {
      -- no_overlap = true,
      title = false,
      width = 0.5,
    },
    spec = {
      -- { "<leader>cc", group = "CodeCompanion"},
      { "<leader>s", group = "<Snacks>"},
      { "<leader>y", group = "<Snacks> Toggle"},
    },
    expand = function(node)
      return not node.desc
    end,
  },
  keys = {
    { "<leader>?", function() require("which-key").show({global = false}) end, desc = "WhichKey" },
  },
}