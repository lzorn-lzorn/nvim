-- =========================================================-- ============================================================================
-- nvim-tree - 完整配置（带图标）
-- ~/. config/nvim/lua/plugins/nvim-tree.lua
-- ============================================================================

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",  -- ⭐ 图标依赖
  },
  
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "文件树" },
    { "<leader>ee", "<cmd>NvimTreeFocus<cr>", desc = "聚焦文件树" },
    { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "定位当前文件" },
  },
  
  config = function()
    -- 禁用 netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      -- 同步根目录
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      
      -- 更新聚焦的文件
      update_focused_file = {
        enable = true,
        update_root = false,
      },

      -- ⭐ 视图设置
      view = {
        width = 30,
        side = "left",
      },

      -- ⭐⭐⭐ 渲染设置（图标配置）
      renderer = {
        group_empty = true,
        
        -- ⭐ 高亮
        highlight_opened_files = "name",
        highlight_git = true,
        
        -- ⭐ 图标配置
        icons = {
          webdev_colors = true,  -- 使用 web-devicons 的颜色
          git_placement = "before",
          
          show = {
            file = true,         -- ⭐ 显示文件图标
            folder = true,       -- ⭐ 显示文件夹图标
            folder_arrow = true, -- ⭐ 显示箭头
            git = true,          -- ⭐ 显示 Git 状态
          },
          
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },

      -- 过滤器
      filters = {
        dotfiles = false,
        custom = { "^.git$" },
      },

      -- Git 集成
      git = {
        enable = true,
        ignore = false,
      },

      -- 操作设置
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
    })
  end,
}
