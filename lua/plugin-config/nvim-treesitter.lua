local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

treesitter.setup({
    -- 安装插件时，配置自动安装的解析器
    ensure_installed = {"markdown", "json", "vim", "lua", "c", "cpp", "verilog"},
    -- 启用代码高亮模块
    highlight = {
        enable = true,
        -- 关闭Vim 原生的正则表达式引擎
        additional_vim_regex_highlighting = false,
        -- 禁用代码高亮的语言列表
        disable = {"markdown" },
    },

    -- 启用增量选择模块
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },

    -- 启用代码缩进模块 (=)
    indent = {
        enable = true,
    },
})

------------- 代码折叠模块设置 ------------------
-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
-- 根据语法树（AST）决定折叠的方式
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 打开文件时默认不进行折叠，显示所有内容
vim.opt.foldlevel = 99
