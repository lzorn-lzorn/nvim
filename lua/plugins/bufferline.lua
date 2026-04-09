-- ============================================================================
-- Bufferline - Gruvbox 现代化样式
-- ~/.config/nvim/lua/plugins/bufferline.lua
-- ============================================================================

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "UIEnter",

  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "下一个缓冲区" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个缓冲区" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "下一个缓冲区" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个缓冲区" },

    { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "跳转到 1" },
    { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "跳转到 2" },
    { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "跳转到 3" },
    { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "跳转到 4" },
    { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "跳转到 5" },

    { "<leader>bd", "<cmd>bdelete<cr>", desc = "关闭当前" },
    { "<leader>bD", "<cmd>bdelete!<cr>", desc = "强制关闭" },
    { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "选择缓冲区" },
    { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "选择关闭" },
    { "<leader>bC", "<cmd>BufferLineCloseOthers<cr>", desc = "关闭其他" },
    { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "关闭右侧" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "关闭左侧" },
    { "<leader>bs", "<cmd>BufferLineSortByExtension<cr>", desc = "按扩展名排序" },
  },

  config = function()
    local c = {
      bg0 = "#1d2021",
      bg1 = "#282828",
      bg2 = "#32302f",
      fg0 = "#ebdbb2",
      fg1 = "#d5c4a1",
      fg2 = "#a89984",
      blue = "#83a598",
      aqua = "#8ec07c",
      yellow = "#fabd2f",
      red = "#fb4934",
      purple = "#d3869b",
    }

    require("bufferline").setup({
      options = {
        themeable = true,
        show_clutilse_icon = true,
        numbers = "none",
        mode = "buffers",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,

        max_name_length = 20,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 22,

        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(...)
          local diagnostics_dict = select(3, ...)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and "E "
              or (e == "warning" and "W " or "I ")
            s = s .. n .. sym
          end
          return s
        end,

        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        indicator = { style = "icon", icon = "|" },

        separator_style = "thin", -- slant 斜角; slope 立体斜坡; padded_slant 填充斜角
        style_preset = {
          require("bufferline").style_preset.no_italic,
          -- require("bufferline").style_preset.no_bold
          -- require("bufferline").style_preset.minimal,
        },
        enforce_regular_tabs = false,
        always_show_bufferline = true,

        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },
        sort_by = "insert_after_current",
      },

      highlights = {
        fill = { bg = c.bg0 },

        background = {
          fg = c.fg2,
          bg = c.bg1,
        },
        buffer_selected = {
          fg = c.fg0,
          bg = c.bg2,
          bold = true,
          italic = false,
          underline = true,
        },
        buffer_visible = {
          fg = c.fg1,
          bg = c.bg1,
        },

        indicator_selected = {
          fg = c.aqua,
          bg = c.bg2,
          bold = true,
        },

        separator = {
          fg = c.bg2,
          bg = c.bg0,
        },
        separator_selected = {
          fg = c.bg2,
          bg = c.bg0,
        },

        modified = {
          fg = c.purple,
          bg = c.bg1,
        },
        modified_selected = {
          fg = c.purple,
          bg = c.bg2,
        },

        close_button = {
          fg = c.fg2,
          bg = c.bg1,
        },
        close_button_selected = {
          fg = c.red,
          bg = c.bg2,
        },

        diagnostic = {
          fg = c.blue,
          bg = c.bg1,
        },
        diagnostic_selected = {
          fg = c.blue,
          bg = c.bg2,
          bold = true,
        },
        error_selected = {
          fg = c.red,
          bg = c.bg2,
          bold = true,
        },
        warning_selected = {
          fg = c.yellow,
          bg = c.bg2,
          bold = true,
        },
      },
    })
  end,
}
