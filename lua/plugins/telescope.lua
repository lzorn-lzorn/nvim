-- ============================================================================
-- Telescope - 模糊查找
-- ~/.config/nvim/lua/plugins/telescope.lua
-- ============================================================================

return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
}