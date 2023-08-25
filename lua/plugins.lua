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
 
        -- bufferline 标签缓冲区
        use {
            'akinsho/bufferline.nvim',
            commit = '417b303328118b6d836ae330142e88771c48a8a3',
            requires = {
                            'nvim-tree/nvim-web-devicons',
                            commit = 'cfc8824cc1db316a276b36517f093baccb8e799a',
                            'moll/vim-bbye',
                            commit = '25ef93ac5a87526111f43e5110675032dbcacf56'
                        }
        }

        -- telescopre 模糊查找文件
        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.2',
            requires = {
                'nvim-lua/plenary.nvim',
                commit = '267282a9ce242bbb0c5dc31445b6d353bed978bb'
            }
        }

        -- lualine 底部文件信息
        use {
            'nvim-lualine/lualine.nvim',
            commit = '45e27ca739c7be6c49e5496d14fcf45a303c3a63',
            requires = {
                'arkav/lualine-lsp-progress',
                commit = '56842d097245a08d77912edf5f2a69ba29f275d7'
            }
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
