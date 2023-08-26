local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

treesitter.setup({
  -- 安装插件时，配置自动安装的解析器
  ensure_installed = {"json", "vim", "lua", "c", "cpp", "verilog"},
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    -- 关闭Vim 原生的正则表达式引擎
    additional_vim_regex_highlighting = false,
  },
})

