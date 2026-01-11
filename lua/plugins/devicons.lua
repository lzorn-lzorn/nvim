---- ============================================================================
-- nvim-web-devicons - 完整配置
-- ~/.config/nvim/lua/plugins/devicons. lua
-- ============================================================================

return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  
  config = function()
    local devicons = require("nvim-web-devicons")

    devicons.setup({
      -- 全局默认设置
      override = {
        -- Web 开发
        html = { icon = "", color = "#e34c26", name = "HTML" },
        css = { icon = "", color = "#1572b6", name = "CSS" },
        scss = { icon = "", color = "#cc6699", name = "SCSS" },
        sass = { icon = "", color = "#cc6699", name = "SASS" },
        js = { icon = "", color = "#f7df1e", name = "JavaScript" },
        jsx = { icon = "", color = "#61dafb", name = "JSX" },
        ts = { icon = "", color = "#3178c6", name = "TypeScript" },
        tsx = { icon = "", color = "#61dafb", name = "TSX" },
        vue = { icon = "", color = "#42b883", name = "Vue" },
        svelte = { icon = "", color = "#ff3e00", name = "Svelte" },
        
        -- 后端语言
        py = { icon = "", color = "#3776ab", name = "Python" },
        java = { icon = "", color = "#cc3e44", name = "Java" },
        rb = { icon = "", color = "#cc342d", name = "Ruby" },
        php = { icon = "", color = "#777bb4", name = "PHP" },
        go = { icon = "", color = "#00add8", name = "Go" },
        rs = { icon = "", color = "#dea584", name = "Rust" },
        c = { icon = "", color = "#599eff", name = "C" },
        cpp = { icon = "", color = "#f34b7d", name = "CPP" },
        cs = { icon = "󰌛", color = "#178600", name = "CSharp" },
        
        -- 脚本语言
        lua = { icon = "", color = "#51a0cf", name = "Lua" },
        vim = { icon = "", color = "#019833", name = "Vim" },
        sh = { icon = "", color = "#4eaa25", name = "Shell" },
        bash = { icon = "", color = "#89e051", name = "Bash" },
        zsh = { icon = "", color = "#89e051", name = "Zsh" },
        fish = { icon = "", color = "#4aae47", name = "Fish" },
        
        -- 数据格式
        json = { icon = "", color = "#cbcb41", name = "JSON" },
        yaml = { icon = "", color = "#6d8086", name = "YAML" },
        yml = { icon = "", color = "#6d8086", name = "YAML" },
        toml = { icon = "", color = "#9c4221", name = "TOML" },
        xml = { icon = "", color = "#e37933", name = "XML" },
        csv = { icon = "", color = "#89e051", name = "CSV" },
        
        -- 文档
        md = { icon = "", color = "#519aba", name = "Markdown" },
        txt = { icon = "", color = "#89e051", name = "Text" },
        pdf = { icon = "", color = "#b30b00", name = "PDF" },
        
        -- 配置文件
        ["init.lua"] = { icon = "", color = "#51a0cf", name = "InitLua" },
        [".gitignore"] = { icon = "", color = "#f1502f", name = "GitIgnore" },
        [".gitconfig"] = { icon = "", color = "#f1502f", name = "GitConfig" },
        [".env"] = { icon = "", color = "#faf743", name = "Env" },
        
        -- Docker
        dockerfile = { icon = "", color = "#0db7ed", name = "Dockerfile" },
        ["docker-compose.yml"] = { icon = "", color = "#0db7ed", name = "DockerCompose" },
        
        -- 包管理
        ["package. json"] = { icon = "", color = "#e8274b", name = "PackageJson" },
        ["package-lock. json"] = { icon = "", color = "#7a0d21", name = "PackageLockJson" },
        ["yarn.lock"] = { icon = "", color = "#368fb9", name = "YarnLock" },
        ["pom.xml"] = { icon = "", color = "#7a0d21", name = "Maven" },
        ["Cargo.toml"] = { icon = "", color = "#dea584", name = "Cargo" },
        ["Gemfile"] = { icon = "", color = "#cc342d", name = "Gemfile" },
        
        -- 构建工具
        ["makefile"] = { icon = "", color = "#6d8086", name = "Makefile" },
        ["Makefile"] = { icon = "", color = "#6d8086", name = "Makefile" },
        ["CMakeLists.txt"] = { icon = "", color = "#6d8086", name = "CMake" },
        
        -- README
        ["README.md"] = { icon = "", color = "#4169e1", name = "Readme" },
        ["README"] = { icon = "", color = "#4169e1", name = "Readme" },
        
        -- License
        ["LICENSE"] = { icon = "", color = "#cbcb41", name = "License" },
        ["LICENSE.md"] = { icon = "", color = "#cbcb41", name = "License" },
      },
      
      -- 默认图标
      default = true,
      strict = false,
      color_icons = true,
    })
    
    -- ========================================================================
    -- 实用函数
    -- ========================================================================
    
    -- 获取文件图标
    _G.get_icon = function(filename, extension)
      return devicons.get_icon(filename, extension, { default = true })
    end
    
    -- 获取文件图标和颜色
    _G. get_icon_color = function(filename, extension)
      local icon, color = devicons.get_icon_color(filename, extension, { default = true })
      return icon, color
    end
  end,
} 
