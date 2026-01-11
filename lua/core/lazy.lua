
-- 自动安装 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("正在安装 lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  print("lazy.nvim 安装完成！")
end

-- 将 lazy.nvim 添加到运行时路径
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 从 lua/plugins/ 目录自动加载所有插件配置
  spec = {
    { import = "plugins" },
  },

  -- 默认配置
  defaults = {
    lazy = false,           -- 默认不延迟加载
    version = false,        -- 不使用版本号，始终使用最新提交
  },

  -- 安装配置
  install = {
    missing = true,         -- 自动安装缺失的插件
    colorscheme = { "gruvbox" }, -- 安装时使用的配色
  },

  -- 检查器配置
  checker = {
    enabled = true,         -- 启用更新检查
    notify = false,         -- 不显示更新通知
    frequency = 3600,       -- 检查频率（秒）
  },

  -- 变更日志
  change_detection = {
    enabled = true,         -- 启用配置文件变更检测
    notify = false,         -- 不��示通知
  },

  -- 性能优化
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      -- 禁用不需要的内置插件
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },

  -- UI 配置
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "rounded",
    title = "📦 Lazy.nvim",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },

  -- 开发配置（如果你正在开发插件）
  dev = {
    path = "~/projects",
    patterns = {},
    fallback = false,
  },

  -- 日志级别
  -- debug, info, warn, error
  -- log = { level = "info" },
})

-- ============================================================================
-- Lazy.nvim 快捷键
-- ============================================================================

-- vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- vim.keymap.set("n", "<leader>lh", "<cmd>Lazy home<cr>", { desc = "Lazy Home" })
-- vim.keymap.set("n", "<leader>lu", "<cmd>Lazy update<cr>", { desc = "Lazy Update" })
-- vim.keymap.set("n", "<leader>ls", "<cmd>Lazy sync<cr>", { desc = "Lazy Sync" })
-- vim.keymap.set("n", "<leader>lc", "<cmd>Lazy clean<cr>", { desc = "Lazy Clean" })
-- vim.keymap.set("n", "<leader>li", "<cmd>Lazy install<cr>", { desc = "Lazy Install" })
-- vim.keymap.set("n", "<leader>lp", "<cmd>Lazy profile<cr>", { desc = "Lazy Profile" })
-- vim.keymap.set("n", "<leader>ld", "<cmd>Lazy debug<cr>", { desc = "Lazy Debug" })
