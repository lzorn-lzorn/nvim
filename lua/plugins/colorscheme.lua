-- ============================================================================
-- Gruvbox 配色方案
-- ~/. config/nvim/lua/plugins/colorscheme.lua
-- ============================================================================
return {{
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- 立即加载
    priority = 1000, -- 最高优先级，确保第一个加载
    config = function()
        require("gruvbox").setup({
            terminal_colors = true, -- 终端配色
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- 反转颜色
            contrast = "hard", -- 对比度:  "hard", "soft", ""
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false -- 透明背景
        })

        -- 应用配色方案
        vim.cmd([[colorscheme gruvbox]])

        -- 设置背景色（dark 或 light）
        vim.opt.background = "dark"
    end
}}
