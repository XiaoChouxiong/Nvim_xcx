local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use {
            'wbthomason/packer.nvim',
            commit = '1d0cf98a561f7fd654c970c49f917d74fafe1530',
        }

        -- tokyonight主题插件
        use {
            'folke/tokyonight.nvim',
            --commit = '1ee11019f8a81dac989ae1db1a013e3d582e2033',
            commit = '9191b4b67499b5759f4da84ca92c9481d35e8278',
        }

        -- nerdtree 文件树结构
        use {
            'preservim/nerdtree',
            commit = 'c46e12a886b4a6618a9e834c90f6245952567115'
        }
    end,

    config = {
        max_jobs = 16,
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    }

})

-- Packer指令说明
-- PackerCompile: 每次改变插件配置时，必须运行此命令或 PackerSync, 重新生成编译的加载文件
-- PackerClean:   清理没有配置的插件
-- PackerInstall: 清除，然后安装缺失的插件
-- PackerUpdate:  清除，然后更新并安装插件
-- PackerSync:    执行 PackerUpdate 后，再执行 PackerCompile
-- PackerStatus:  显示插件状态
-- PackerLoad:    立刻加载 opt 插件
