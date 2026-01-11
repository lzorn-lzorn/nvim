-- ============================================================================
-- Treesitter - 语法高亮
-- ~/.config/nvim/lua/plugins/treesitter.lua
-- 其需要安装 tree-sitter-cli nvim-treesitter 需要 tree-sitter CLI 工具来编译解析器
-- 使用 npm install -g tree-sitter-cli
-- ============================================================================

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter-textobjects",
--   },
  config = function()
    -- 添加错误处理，确保插件已加载
    local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      vim.notify("nvim-treesitter 未正确安装，请运行 :TSUpdate", vim.log.levels.ERROR)
      return
    end

    treesitter_configs.setup({
      -- 安装的语言解析器
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "yaml",
        "markdown",
        "bash",
        "c",
        "cpp",
        -- "rust",  -- Windows 可能需要 Rust 工具链
        -- "go",    -- Windows 可能需要 Go 工具链
      },

      -- 同步安装（阻塞式）
      sync_install = false,

      -- 自动安装缺失的解析器
      auto_install = true,

      -- 语法高亮
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      -- 增量选择
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },

      -- 智能缩进
      indent = {
        enable = true,
      },

      -- 文本对象（需要 textobjects 插件）
    --   textobjects = {
    --     select = {
    --       enable = true,
    --       lookahead = true,
    --       keymaps = {
    --         ["af"] = "@function.outer",
    --         ["if"] = "@function. inner",
    --         ["ac"] = "@class.outer",
    --         ["ic"] = "@class.inner",
    --       },
    --     },
    --   },
    })
  end,
}