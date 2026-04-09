-- ============================================================================
-- Alpha-nvim - 现代化启动页
-- ~/.config/nvim/lua/plugins/alpha.lua
-- ============================================================================

return {
  "goolord/alpha-nvim",
  -- 仅在 Neovim 启动入口加载，避免影响普通缓冲区打开性能。
  event = "VimEnter",
  -- 图标来源：统一走 nvim-web-devicons，缺失时再回退 ASCII，避免手写 Unicode 兼容问题。
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local have_nerd_font = vim.g.have_nerd_font == true
    local has_devicons, devicons = pcall(require, "nvim-web-devicons")

    -- UI 状态快照：进入 alpha 页面时隐藏底部栏，离开时恢复原值。
    local ui_state = {
      active = false,
      laststatus = nil,
      cmdheight = nil,
      showmode = nil,
      ruler = nil,
      showcmd = nil,
    }

    -- 所有启动页动作的单一配置源：
    -- key      快捷键
    -- label    展示文本
    -- cmd      执行命令
    -- icon_src 图标推断文件名与扩展名（交给 devicons）
    -- fallback ASCII 回退图标（终端/字体不支持时仍可读）
    local actions = {
      {
        key = "f",
        label = "查找文件",
        cmd = "<cmd>Telescope find_files<cr>",
        file = "file.lua",
        ext = "lua",
        fallback = "[F]",
      },
      {
        key = "r",
        label = "最近文件",
        cmd = "<cmd>Telescope oldfiles<cr>",
        file = "history.md",
        ext = "md",
        fallback = "[R]",
      },
      {
        key = "g",
        label = "搜索文本",
        cmd = "<cmd>Telescope live_grep<cr>",
        file = "grep.txt",
        ext = "txt",
        fallback = "[G]",
      },
      {
        key = "n",
        label = "新建文件",
        cmd = "<cmd>ene <bar> startinsert<cr>",
        file = "new.lua",
        ext = "lua",
        fallback = "[N]",
      },
      {
        key = "c",
        label = "配置文件",
        cmd = "<cmd>edit $MYVIMRC<cr>",
        file = "init.lua",
        ext = "lua",
        fallback = "[C]",
      },
      {
        key = "u",
        label = "更新插件",
        cmd = "<cmd>Lazy sync<cr>",
        file = "lazy-lock.json",
        ext = "json",
        fallback = "[U]",
      },
      {
        key = "q",
        label = "退出程序",
        cmd = "<cmd>qa<cr>",
        file = "quit.txt",
        ext = "txt",
        fallback = "[Q]",
      },
    }

    -- 图标选择策略：
    -- 1) 优先 devicons.get_icon
    -- 2) 若插件不可用/返回空，则使用 ASCII fallback
    local function icon_or_fallback(filename, ext, fallback)
      if have_nerd_font and has_devicons then
        local icon = devicons.get_icon(filename, ext, { default = true })
        if icon and icon ~= "" then
          return icon
        end
      end
      return fallback
    end

    local function make_button(key, label, cmd, filename, ext, fallback)
      local text = string.format(
        -- 文案只保留“图标 + 文本”，快捷键交给 alpha 默认 shortcut 列处理。
        -- 这样可以避免空快捷键导致的映射报错，并消除重复 [F][F]。
        "  %s  %s",
        icon_or_fallback(filename, ext, fallback),
        label
      )
      return dashboard.button(key, text, cmd)
    end

    -- 页脚参数：时间格式与插件统计来源（lazy.stats）。
    local function footer()
      local ok, lazy = pcall(require, "lazy")
      local plugin_count = ok and lazy.stats().count or 0
      local dt = os.date("%Y-%m-%d  %H:%M:%S")
      return string.format("%s   %d plugins", dt, plugin_count)
    end

    dashboard.section.header.val = {
      "",
      "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██║   ██║██║████╗ ████║",
      "██╔██╗ ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "",
    }

    dashboard.section.buttons.val = vim.tbl_map(function(item)
      return make_button(item.key, item.label, item.cmd, item.file, item.ext, item.fallback)
    end, actions)

    -- 按钮组核心参数：
    -- spacing  行间距
    -- position 组整体水平对齐方式
    dashboard.section.buttons.opts = { spacing = 1, position = "center" }

    for _, btn in ipairs(dashboard.section.buttons.val) do
      btn.opts.hl = "AlphaButtons"
      btn.opts.hl_shortcut = "AlphaShortcut"
      -- width 控制可点击区域宽度；cursor 控制文本在按钮内起点。
      -- 这两个值共同决定“文本是否真正居中”。
      btn.opts.width = 46
      btn.opts.cursor = 7
      btn.opts.position = "center"
      -- 使用 dashboard.button 默认生成的 shortcut，不要覆盖为 nil。
      btn.opts.keymap = false
    end

    dashboard.section.footer.val = footer()

    -- 版面节奏参数：
    -- padding 值越大整体越松散；终端较矮时可按需下调。
    dashboard.config.layout = {
      { type = "padding", val = 1 },
      dashboard.section.header,
      { type = "padding", val = 1 },
      {
        type = "text",
        -- 边框宽度建议略大于按钮宽度，保证视觉包裹感。
        val = "┌────────────────────────────────────────────────┐",
        opts = { hl = "AlphaBorder", position = "center" },
      },
      { type = "group", val = dashboard.section.buttons.val, opts = { spacing = 1, position = "center" } },
      {
        type = "text",
        val = "└────────────────────────────────────────────────┘",
        opts = { hl = "AlphaBorder", position = "center" },
      },
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    -- 主题色参数：可根据壁纸明暗对比做统一调整。
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#7aa2f7", bold = true })
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#ff9e64", bold = true })
    vim.api.nvim_set_hl(0, "AlphaBorder", { fg = "#4c566a" })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#9aa5ce", italic = true })

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.header.opts.position = "center"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.section.footer.opts.position = "center"

    -- 进入 alpha 页面时隐藏底部状态栏/命令提示；离开后按快照恢复。
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function(ev)
        if not ui_state.active then
          ui_state.laststatus = vim.o.laststatus
          ui_state.cmdheight = vim.o.cmdheight
          ui_state.showmode = vim.o.showmode
          ui_state.ruler = vim.o.ruler
          ui_state.showcmd = vim.o.showcmd
          ui_state.active = true
        end

        vim.o.laststatus = 0
        vim.o.cmdheight = 0
        vim.o.showmode = false
        vim.o.ruler = false
        vim.o.showcmd = false

        -- 在 alpha 页面内提供按键映射（含大小写），替代默认 shortcut 列。
        for _, item in ipairs(actions) do
          local map_opts = {
            buffer = ev.buf,
            noremap = true,
            silent = true,
            nowait = true,
          }
          vim.keymap.set("n", item.key, item.cmd, map_opts)
          vim.keymap.set("n", item.key:upper(), item.cmd, map_opts)
        end

        -- 离开 alpha 缓冲区立即恢复 UI 状态，避免影响正常编辑体验。
        vim.api.nvim_create_autocmd({ "BufLeave", "BufWipeout" }, {
          buffer = ev.buf,
          once = true,
          callback = function()
            if ui_state.active then
              vim.o.laststatus = ui_state.laststatus or 3
              vim.o.cmdheight = ui_state.cmdheight or 1
              vim.o.showmode = ui_state.showmode ~= false
              vim.o.ruler = ui_state.ruler ~= false
              vim.o.showcmd = ui_state.showcmd ~= false
              ui_state.active = false
            end
          end,
        })
      end,
    })

    alpha.setup(dashboard.config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyDone",
      callback = function()
        dashboard.section.footer.val = footer()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
