require("core.options")
require("core.keymaps")
require("plugins.plugins-setup")

require('plugins.themes.gruvbox')

require('plugins.functions.UI.lualine')
require('plugins.functions.UI.nvim-tree')
require('plugins.functions.find.telescope')

require('plugins.LSP.treesitter')
require('plugins.LSP.nvim-cmp')
require("plugins.LSP.mason")
require("plugins.LSP.lspconfig")
require("plugins.LSP.lsp-signature")
require("plugins.LSP.diagflow")
require("plugins.LSP.trouble")
-- require("plugins.LSP.luasnip")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
-- 设置透明背景
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })  -- 浮动窗口透明
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })  -- 侧边栏透明
-- 设置状态栏透明
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" }) -- 非活动状态栏

