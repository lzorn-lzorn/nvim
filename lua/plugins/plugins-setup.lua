
local plugins = {
    { 
        'wbthomason/packer.nvim',
    },
    
    {-- 主题
        'ellisonleao/gruvbox.nvim',
        requires = 'rktjmp/lush.nvim',
    },
    {-- 状态栏
        'nvim-lualine/lualine.nvim',
        requires = { 
            'nvim-tree/nvim-web-devicons',
            opt = true,
        },

    },
    { -- 文件树
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        
    },
    {
        'nvim-treesitter/nvim-treesitter',
    },
    {
        'christoomey/vim-tmux-navigator'
    },
    {
        'p00f/nvim-ts-rainbow'
    },
    {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make || true",
            },
            {
                "nvim-telescope/telescope-frecency.nvim",
                requires = {"tami5/sqlite.lua"},   -- need to install sqlite lib
            },
            "nvim-telescope/telescope-ui-select.nvim",
            'LinArcX/telescope-changes.nvim',
            'nvim-telescope/telescope-github.nvim',
            -- "nvim-telescope/telescope-live-grep-raw.nvim",
        },
    },

    { -- 自动补全
        'hrsh7th/nvim-cmp',
        requires = {
            -- {
            --     'yehuohan/cmp-im',
            --     'yehuohan/cmp-im-zh',
            -- },
            {
                'onsails/lspkind-nvim',
            },
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'f3fora/cmp-spell',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-emoji',
            -- 'chrisgrieser/cmp_yanky',
            -- 'petertriho/cmp-git',
            'lukas-reineke/cmp-rg',
            -- 'roobert/tailwindcss-colorizer-cmp.nvim',
            "lukas-reineke/cmp-under-comparator",
            -- 'hrsh7th/cmp-copilot', -- INFO: uncomment this for AI completion
            -- {
            --     'Ninlives/cmp-rime',
            --     run = ':UpdateRemotePlugins | !rm -rf /tmp/tmp-pyrime && git clone https://github.com/Ninlives/pyrime /tmp/tmp-pyrime && cd /tmp/tmp-pyrime && python setup.py install --prefix ~/.local',
            -- },
            -- {
            --     os.getenv('ARCHIBATE_COMPUTER') and '/home/bate/Codes/cmp-rime' or 'archibate/cmp-rime',
            --     run = 'make',
            -- },
            'saadparwaiz1/cmp_luasnip',
            {
                'L3MON4D3/LuaSnip',
                run = 'make install_jsregexp || true',
                requires = {
                    'rafamadriz/friendly-snippets',
                },
            },
        },
    },
    {
        'williamboman/mason.nvim',
        requires = {
            'williamboman/mason-lspconfig.nvim',
            "mason-org/mason-registry",
        },
        -- run = ":MasonUpdate",
        
    },
    {
        'neovim/nvim-lspconfig',
    },
    {
        'ray-x/lsp_signature.nvim',
    },
    -- {
    --     "tami5/lspsaga.nvim",
    --     config = function() require'lspsaga' end,
    -- },
    {
        'dgagn/diagflow.nvim',
    },
    -- {
    --     'andersevenrud/nvim_context_vt',
    --     config = function() require "nvim_context_vt" end,
    -- },

    -- lint and error signs
    {
        "folke/trouble.nvim",
    },
    -- {
    --     'kevinhwang91/nvim-bqf',
    --     ft = 'qf',
    --     config = function() require('bqf').setup{} end,
    --     requires = {
    --         {'junegunn/fzf', run = function() vim.fn['fzf#install']() end},
    --     },
    -- },
    -- {   -- uncomment to enable cpplint
    --     'mfussenegger/nvim-lint',
    --     config = function() require"nvim-lint" end,
    -- },
    -- {
    --     "petertriho/nvim-scrollbar",
    --     config = function() require"scrollbar".setup{} end,
    -- },



    { -- gcc gcc注释
        'numToStr/Comment.nvim'
    },
    { -- 自动补全括号
        'windwp/nvim-autopairs'
    },

}

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
  
local is_packer_bootstrap = ensure_packer()
  
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])
return require('packer').startup(function(use)
    for _, item in ipairs(plugins) do
        use(item)
    end

    if is_packer_bootstrap then
        require('packer').sync()
    end
end)
