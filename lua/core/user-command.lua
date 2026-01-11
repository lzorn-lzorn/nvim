
local api = vim.api
local cmd = vim.cmd
api.nvim_create_user_command("ST", function()
    cmd("split | terminal")
end, {})
