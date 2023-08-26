-- 基础配置
require("basic")
 
-- Packer 插件管理
require("plugins")

-- 设置nvim主题
require("colorscheme")

-- 快捷键映射
require("keybindings")

-- vim复制内容到windows剪切板
require("nvim_copy")

-- 顶部标签页配置信息
require("plugin-config.bufferline")

-- 侧边栏配置信息
require("plugin-config.nerdtree")

-- 底部文件状态栏
require("plugin-config.lualine")

-- 文件高亮解析器
require("plugin-config.nvim-treesitter")
