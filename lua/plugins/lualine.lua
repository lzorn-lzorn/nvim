-- ============================================================================
-- Lualine - 美化状态栏
-- ~/. config/nvim/lua/plugins/lualine.lua
-- ============================================================================

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  
  config = function()
    require("lualine").setup({
      options = {
        -- ⭐ 主题（选择一个）
        theme = "gruvbox",  -- "auto" | "gruvbox" | "tokyonight" | "catppuccin" | "nord"
        
        -- ⭐ 分隔符样式
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- 或使用圆角：
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        
        -- 禁用的文件类型
        disabled_filetypes = {
          statusline = { "alpha", "dashboard" },
          winbar = {},
        },
        
        -- 忽略焦点
        ignore_focus = {},
        
        -- 总是分割
        always_divide_middle = true,
        
        -- 全局状态栏
        globalstatus = true,
        
        -- 刷新
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      
      -- ⭐⭐⭐ 状态栏布局
      sections = {
        -- 左侧
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)  -- 只显示首字母 N/I/V
            end,
          },
        },
        
        lualine_b = {
          {
            "branch",
            icon = "",
          },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        
        lualine_c = {
          {
            "filename",
            file_status = true,     -- 显示文件状态（只读等）
            newfile_status = false,
            path = 1,               -- 0: 只文件名 1: 相对路径 2: 绝对路径 3: 绝对路径+~ 缩写
            
            symbols = {
              modified = "[+]",
              readonly = "[-]",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },
        
        -- 右侧
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          {
            "filetype",
            colored = true,
            icon_only = false,
          },
        },
        
        lualine_y = {
          {
            "encoding",
            fmt = function(str)
              return str:upper()  -- UTF-8 大写
            end,
          },
          {
            "fileformat",
            symbols = {
              unix = "  ",
              dos = "  ",
              mac = "  ",
            },
          },
        },
        
        lualine_z = {
          {
            "location",  -- 行号: 列号
          },
          {
            "progress",  -- 百分比
          },
        },
      },
      
      -- 非活动窗口的状态栏
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      
      -- 标签栏（可选，如果不想用 bufferline）
      tabline = {},
      
      -- Winbar（可选）
      winbar = {},
      inactive_winbar = {},
      
      -- 扩展
      extensions = {
        "nvim-tree",
        "lazy",
        "mason",
        "toggleterm",
      },
    })
  end,
}
