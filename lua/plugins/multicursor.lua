-- ==========================================================================
-- 多光标/批量操作插件配置
-- 推荐插件：mg979/vim-visual-multi
-- 文档：https://github.com/mg979/vim-visual-multi
-- 常用快捷键：
--   Ctrl-N 选中下一个匹配
--   Ctrl-Down/Up 扩展/收缩多光标
--   n/N 跳到下/上一个匹配
--   q 退出多光标模式
--   <leader>m 进入多光标模式（可自定义）
-- ==========================================================================

return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      -- 可选：自定义进入多光标模式的快捷键
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Select All"] = "<C-a>",
        ["Add Cursor Down"] = "<C-Down>",
        ["Add Cursor Up"] = "<C-Up>",
        ["Exit"] = "q",
      }
      -- 可选：自定义 leader 键触发多光标
      vim.keymap.set("n", "<leader>m", ":VMultiCursor<CR>", { desc = "多光标模式" })
    end,
  },
}
