-------------------- 文件变量 -------------------------
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-------------------- Leader Key -----------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------- 窗口管理快捷键映射 -------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

------------------- Terminal界面配置 --------------------------
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

------------------- Visule 模式下快捷键 --------------------------
-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- nvim 复制快捷键
map("v", "<C-c>", '"+y', opt)
map("v", "<C-Insert>", '"+y', opt)

------------------- 浏览代码快捷键 ---------------------
-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

------------------ 其他快捷键 ---------------------
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)

------------------ nerdtree 目录树快捷键 ------------------------
map("n", "<C-b>", ":NERDTreeToggle<CR>", opt)

------------------ bufferline 文件书签快捷键 ---------------------
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

------------------ telescope 模糊查找文件快捷键 ---------------------
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

------------------ nvim-treesitter 语言解析插件 ---------------------
-- 全文选中
map("n", "<C-a>", 'ggvG<CR>', opt)
-- 代码块折叠快捷键
map("n", "<C-[>", 'zo', opt)
map("n", "<C-]>", 'zc', opt)

------------------ nvim-lspconfig 语言服务配置 -----------------------
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)    -- 整体修改代码中的变量名

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)        -- 跳转到定义
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)             -- 显示提示信息
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)       -- 跳转到声明
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)        -- 查看项目中所有用到该 变量/函数/类 的地方

map("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)     -- 将当前行的报错信息，以浮动窗口的方式显示
map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)      -- 将光标定位到上一个诊断位置
map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)      -- 将光标定位到下一个诊断位置
