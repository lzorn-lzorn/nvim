-- ============================================================================
-- nvim-web-devicons - 完整配置
-- ~/.config/nvim/lua/plugins/devicons.lua
-- ============================================================================

return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,

  config = function()
    local devicons = require("nvim-web-devicons")
    local have_nerd_font = vim.g.have_nerd_font == true

    devicons.setup({
      -- 使用默认图标映射，避免空 icon 覆盖导致 Telescope 结果列表无图标。
      override = {},
      -- 未启用 Nerd Font 时关闭图标输出，避免出现问号字形。
      default = have_nerd_font,
      strict = false,
      color_icons = have_nerd_font,
    })

    -- 获取文件图标
    _G.get_icon = function(filename, extension)
      return devicons.get_icon(filename, extension, { default = true })
    end

    -- 获取文件图标和颜色
    _G.get_icon_color = function(filename, extension)
      local icon, color = devicons.get_icon_color(filename, extension, { default = true })
      return icon, color
    end
  end,
}
