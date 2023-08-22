-- 设置NERDTree窗口的位置
vim.g.NERDTreeWinPos = "left"

-- 设置打开文件后 NERDTree状态
vim.g.NERDTreeQuitOnOpen = 3

-- 设置默认是否显示隐藏文件
vim.g.NERDTreeShowHidden = 1

-- 设置节点菜单样式
vim.g.NERDTreeMinimalMenu = 1

-- 文件排序方式
vim.g.NERDTreeNaturalSort = 1

-- 当 NERDTree 是最后一个窗口时，自动关闭Nvim
vim.api.nvim_command([[autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]])
-- 当 NERDTree 是最后一个窗口时，自动关闭选项卡
vim.api.nvim_command([[autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]])

