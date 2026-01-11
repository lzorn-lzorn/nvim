-- ============================================================================
-- Transparent - 透明背景插件
-- ~/.config/nvim/lua/plugins/transparent.lua
-- ============================================================================

return {
  "xiyaowong/transparent.nvim",
  lazy = false,              -- 立即加载
  priority = 999,            -- 高优先级，在配色方案之后加载
  config = function()
    require("transparent").setup({
      -- 启用透明
      enable = true,
      
      -- 额外需要透明的组
      extra_groups = {
        "NormalFloat",       -- 浮动窗口
        "NvimTreeNormal",    -- nvim-tree
        "NvimTreeNormalNC",
        "TelescopeNormal",   -- telescope
        "TelescopeBorder",
        "TelescopePromptNormal",
        "WhichKeyFloat",     -- which-key:
        -- "LspFloatWinNormal", -- LSP 浮动窗口
      },
      
      -- 排除的组（不透明）
      exclude_groups = {},
    })
    
    -- 默认启用透明
    vim.cmd("TransparentEnable")
  end,
  
--   -- 快捷键
--   keys = {
--     { "<leader>tt", "<cmd>TransparentToggle<cr>", desc = "切换透明" },
--     { "<leader>te", "<cmd>TransparentEnable<cr>", desc = "启用透明" },
--     { "<leader>td", "<cmd>TransparentDisable<cr>", desc = "禁用透明" },
--   },
}
