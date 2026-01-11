-- ============================================================================
-- Bufferline - Gruvbox 美化版
-- ~/. config/nvim/lua/plugins/bufferline.lua
-- ============================================================================

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  
  keys = {
    -- 导航
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "下一个缓冲区" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个缓冲区" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "下一个缓冲区" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个缓冲区" },
    
    -- 快速跳转
    { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "跳转到 1" },
    { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "跳转到 2" },
    { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "跳转到 3" },
    { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "跳转到 4" },
    { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "跳转到 5" },
    
    -- 关闭
    { "<leader>bd", "<cmd>bdelete<cr>", desc = "关闭当前" },
    { "<leader>bD", "<cmd>bdelete!<cr>", desc = "强制关闭" },
    { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "选择缓冲区" },
    { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "选择关闭" },
    { "<leader>bC", "<cmd>BufferLineCloseOthers<cr>", desc = "关闭其他" },
    { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "关闭右侧" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "关闭左侧" },
    
    -- 排序
    { "<leader>bs", "<cmd>BufferLineSortByExtension<cr>", desc = "按扩展名排序" },
  },
  
  config = function()
    require("bufferline").setup({
      options = {
        -- ====================================================================
        -- 基本设置
        -- ====================================================================
        mode = "buffers",
        
        -- numbers = function(opts)
        --   return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
        -- end,
        
        -- 鼠标操作
        close_command = "bdelete!  %d",
        right_mouse_command = "bdelete!  %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        
        -- 名称长度
        max_name_length = 20,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 20,
        
        -- LSP 诊断美化
        diagnostics = "nvim_lsp", 
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
              or (e == "warning" and " " or " ")
            s = s .. n .. sym
          end
          return s
        end,
        
        -- offsets = {
        --   {
        --     filetype = "NvimTree",
        --     text = "> Explorer",
        --     text_align = "center",
        --     separator = true,
        --     highlight = "Directory",
        --   },
        -- },
        
        -- ====================================================================
        -- 显示设置
        -- ====================================================================
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        
        -- 分隔符样式（尝试不同的样式）
        separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
        
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        
        -- 悬停效果
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        
        --  排序
        sort_by = "insert_after_current",
      },
      
      highlights = {
        -- 所有背景透明
        fill = { bg = "NONE" },
        
        -- 未选中的 buffer（灰色文字）
        background = {
          fg = "#928374",
          bg = "NONE",
        },
        
        -- ⭐ 选中的 buffer（高亮文字 + 左侧指示线）
        buffer_selected = {
          fg = "#ebdbb2",  -- 亮色文字
          bg = "NONE",
          bold = true,
          italic = false,
        },
        
        -- 可见但未选中
        buffer_visible = {
          fg = "#a89984",
          bg = "NONE",
        },
        
        -- ⭐ 选中的指示器（左侧竖线）
        indicator_selected = {
          fg = "#b8bb26",  -- 绿色指示线
          bg = "NONE",
        },
        
        -- 分隔符（透明）
        separator = {
          fg = "#3c3836",
          bg = "NONE",
        },
        separator_selected = {
          fg = "#3c3836",
          bg = "NONE",
        },
        
        -- 修改指示器
        modified = {
          fg = "#d3869b",
          bg = "NONE",
        },
        modified_selected = {
          fg = "#d3869b",
          bg = "NONE",
        },
        
        -- 关闭按钮
        close_button = {
          fg = "#928374",
          bg = "NONE",
        },
        close_button_selected = {
          fg = "#fb4934",
          bg = "NONE",
        },
        
        -- 诊断（只保留选中状态）
        error_selected = {
          fg = "#fb4934",
          bg = "NONE",
          bold = true,
        },
        warning_selected = {
          fg = "#fabd2f",
          bg = "NONE",
          bold = true,
        },
      },
    })
  end,
}
