-- 快速跳转插件

return {
    "smoka7/hop.nvim",
    -- opts = {
    --     hint_position = 3 
    -- },
    config = function()
        require("hop").setup({
            hint_position = require("hop.hint").HintPosition.END,
        })
    end,
    key = {
        { "<leader>hp", ":HopWord<cr>", silent = true }
    }
}
