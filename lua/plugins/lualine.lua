-- ============================================================================
-- Lualine - 现代化状态栏
-- ~/.config/nvim/lua/plugins/lualine.lua
-- ============================================================================

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "UIEnter",

  config = function()
    local theme = {
      normal = {
        a = { fg = "#1d2021", bg = "#83a598", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#32302f" },
        c = { fg = "#d5c4a1", bg = "#282828" },
      },
      insert = {
        a = { fg = "#1d2021", bg = "#8ec07c", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#32302f" },
        c = { fg = "#d5c4a1", bg = "#282828" },
      },
      visual = {
        a = { fg = "#1d2021", bg = "#d3869b", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#32302f" },
        c = { fg = "#d5c4a1", bg = "#282828" },
      },
      replace = {
        a = { fg = "#1d2021", bg = "#fb4934", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#32302f" },
        c = { fg = "#d5c4a1", bg = "#282828" },
      },
      command = {
        a = { fg = "#1d2021", bg = "#fabd2f", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#32302f" },
        c = { fg = "#d5c4a1", bg = "#282828" },
      },
      inactive = {
        a = { fg = "#a89984", bg = "#282828" },
        b = { fg = "#a89984", bg = "#282828" },
        c = { fg = "#7c6f64", bg = "#282828" },
      },
    }

    require("lualine").setup({
      options = {
        theme = theme,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "[", right = "]" },
        disabled_filetypes = {
          -- statusline = { "alpha", "dashboard" },
          -- winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 800,
          tabline = 100,
          winbar = 100,
        },
      },

      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return " " .. str .. " "
            end,
          },
        },

        lualine_b = {
          {
            "branch",
            icon = "git:",
          },
          {
            "diff",
            symbols = { added = "+", modified = "~", removed = "-" },
          },
        },

        lualine_c = {
          {
            "filename",
            file_status = true,
            newfile_status = false,
            path = 1,
            symbols = {
              modified = "[+]",
              readonly = "[-]",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },

        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
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
              return str:upper()
            end,
          },
          {
            "fileformat",
            symbols = {
              unix = "LF",
              dos = "CRLF",
              mac = "CR",
            },
          },
        },

        lualine_z = {
          { "location" },
          { "progress" },
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {
        "nvim-tree",
        "lazy",
        "mason",
        "toggleterm",
      },
    })
  end,
}
