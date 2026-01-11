-- ============================================================================
-- Alpha-nvim - 按钮边框美化
-- ~/. config/nvim/lua/plugins/alpha.lua
-- ============================================================================

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- 标题
    dashboard.section.header.val = {
      "                                   ",
      "   ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
      "   ████╗  ██║██║   ██║██║████╗ ████║",
      "   ██╔██╗ ██║██║   ██║██║██╔████╔██║",
      "   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "                                   ",
    }

    -- ⭐ 按钮配置
    dashboard.section.buttons.val = {
      dashboard.button("f         ", "        查找文件", ":Telescope find_files<CR>"),
      dashboard.button("r         ", "        最近文件", ": Telescope oldfiles<CR>"),
      dashboard.button("n         ", "        新建文件", ":ene <BAR> startinsert<CR>"),
      dashboard.button("g         ", "        搜索文本", ": Telescope live_grep<CR>"),
      dashboard.button("c         ", "        配置文件", ":e $MYVIMRC<CR>"),
      dashboard.button("u         ", "        更新插件", ":Lazy sync<CR>"),
      dashboard.button("q         ", "        退出程序", ":qa<CR>"),
    }

    -- ⭐ 创建边框函数
    local function create_border()
      return {
        { type = "text", val = "╭─────────────────────────────────────────╮", opts = { hl = "AlphaBorder", position = "center" } },
      }
    end

    local function create_border_bottom()
      return {
        { type = "text", val = "╰─────────────────────────────────────────╯", opts = { hl = "AlphaBorder", position = "center" } },
      }
    end

    -- 页脚
    local function footer()
      local total_plugins = require("lazy").stats().count
      local datetime = os.date("  %Y-%m-%d   %H:%M:%S")
      return datetime ..  "   " .. total_plugins ..  " plugins"
    end

    dashboard.section.footer.val = footer()

    -- ⭐ 布局（带边框）
    dashboard.config.layout = {
      { type = "padding", val = 1 },
      dashboard.section. header,
      { type = "padding", val = 1 },
      
      -- 顶部边框
      { type = "text", val = "╭─────────────────────────────────────────╮", opts = { hl = "AlphaBorder", position = "center" } },
      
      -- 按钮组
      { type = "group", val = dashboard.section.buttons. val, opts = { spacing = 0 } },
      
      -- 底部边框
      { type = "text", val = "╰─────────────────────────────────────────╯", opts = { hl = "AlphaBorder", position = "center" } },
      
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    -- ⭐ 颜色配置
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#7aa2f7", bold = true })
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#9ece6a" })
    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#ff9e64", bold = true })
    vim.api.nvim_set_hl(0, "AlphaBorder", { fg = "#565f89" })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#565f89", italic = true })

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    alpha.setup(dashboard.config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        dashboard.section. footer.val = footer()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
