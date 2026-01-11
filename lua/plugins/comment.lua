-- -- ============================================================================
-- Comment.nvim - 完全干净的配置
-- ============================================================================

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = true,
      ignore = "^$",
      
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      
      opleader = {
        line = "gc",
        block = "gb",
      },
      
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },
      
      mappings = {
        basic = true,
        extra = true,
      },
    })
    
    -- 自定义快捷键
    vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "注释行" })
    vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "注释选中" })
  end,
}

--[[
-- gcc         " 注释/取消注释当前行
-- gc2j        " 注释当前行和下面 2 行
-- gc4k        " 注释当前行和上面 4 行
-- gcap        " 注释整个段落
-- gcG         " 从当前行注释到文件末尾
-- gcgg        " 从当前行注释到文件开头

" 块注释
gbc         " 切换块注释（当前行）
gb2j        " 块注释当前行和下面 2 行
--]]
