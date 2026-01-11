-- ============================================================================
-- UI 增强
-- ~/.config/nvim/lua/plugins/ui.lua
-- ============================================================================

return {
  -- 缩进线
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = {
        char = "│",
      },
      scope = {
        enabled = true,
      },
    },
  },

  -- 颜色高亮
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        css = true,
        css_fn = true,
      },
    },
  },

  -- 通知增强
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      notify.setup({
		background_colour = "#282828",  -- Gruvbox 背景色
        stages = "fade",
        timeout = 3000,
        })
	   -- 设置为默认通知
      	vim.notify = notify
    end,
  },

  -- Which-key - 快捷键提示
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },
}