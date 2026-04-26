-- ============================================================================
-- toggleterm.nvim - 现代美化浮动终端插件
-- 文档: https://github.com/akinsho/toggleterm.nvim
-- ============================================================================

return {
  "akinsho/toggleterm.nvim",
  version = "*", -- 始终使用最新稳定版
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("toggleterm").setup({
      -- 打开终端的快捷键（已改为 <leader>t，推荐更符合习惯）
      -- <leader>t 默认是 "\<leader>t"，即 \ 键+t，具体 <leader> 可在你的 nvim 配置中自定义
    --   open_mapping = [[<leader>t]],
      -- 终端方向：float 浮动窗口, horizontal 水平, vertical 垂直
      direction = "float",
      -- 浮动终端样式美化
      float_opts = {
        border = "curved", -- 边框风格: single/double/shadow/curved
        winblend = 10,     -- 透明度(0-100)
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
      -- 关闭时自动进入插入模式
      start_in_insert = true,
      -- 终端大小
      size = 20 | function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	  end,
      -- 允许在所有 buffer 中打开
      persist_mode = true,
    })

    -- 可选: 你也可以自定义更多快捷键，例如：
    -- vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true, desc = '切换浮动终端' })

    -- 添加 :term 命令，命令模式下输入 :term 可打开/关闭浮动终端（与内置 :term 区分，优先级高于内置命令）
    vim.api.nvim_create_user_command('term', function()
      require('toggleterm').toggle()
    end, { desc = '打开/关闭浮动终端' })
  end,
}
