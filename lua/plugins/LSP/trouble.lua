require'trouble'.setup {
    use_diagnostic_signs = true,
    padding = false,
    -- background = false,  -- 禁用背景色
}

vim.cmd [[
augroup trouble_setlocal
autocmd!
autocmd FileType trouble setlocal wrap
augroup END
]]