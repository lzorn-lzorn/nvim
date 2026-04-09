-- ============================================================================
-- Transparent - 透明背景插件
-- ~/.config/nvim/lua/plugins/transparent.lua
-- ============================================================================

return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  priority = 999,
  config = function()
    require("transparent").setup({
      enable = true,

      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "TelescopeNormal",
        "TelescopeBorder",
        "TelescopePromptNormal",
        "WhichKeyFloat",
      },

      -- 顶部/底部 UI 维持不透明，保证 bufferline 与 lualine 的视觉层次。
      exclude_groups = {
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineBufferVisible",
        "BufferLineBufferSelected",
        "BufferLineIndicatorSelected",
        "BufferLineSeparator",
        "BufferLineSeparatorSelected",
        "StatusLine",
        "StatusLineNC",
        "TabLine",
        "TabLineFill",
      },
    })

    vim.cmd("TransparentEnable")
  end,
}
