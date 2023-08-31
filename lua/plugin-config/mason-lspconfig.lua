local status, mason_lspconfig = pcall(require, "mason-lspconfig")
local _,lspconfig = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 mason-lspconfig")
    return
end

-- bufferline 配置
mason_lspconfig.setup({
    handlers = {
        -- 设置默认的 LSP 服务器配置
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        ["lua_ls"] = function ()
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }
        end,
        ["clangd"] = function ()
            local cmd = { "clangd" }
            local clangd_args = {
                "--background-index",       -- 用于后台索引：后台持续地分析代码
            }

            -- 将命令添加到cmd列表中
            for _, arg in ipairs(clangd_args) do
                table.insert(cmd, arg)
            end

            lspconfig.clangd.setup {
                -- 设置特定的 C 语言配置
                cmd = cmd,
                -- 支持的文件类型
                filetypes = { "c", "cpp" },
                -- 查找项目根目录
                root_dir = require("lspconfig/util").root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
                init_options = {
                    clangdFileStatus = true,    -- 显示文件状态信息
                    usePlaceholders = true,     -- 使用占位符来提示和补全代码
                    completeUnimported = true,  -- 自动导入将要用到函数的头文件
                }
            }
        end,
    }
})
