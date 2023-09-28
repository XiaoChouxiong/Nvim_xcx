-------------------- 文件变量 -------------------------
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }
-- 插件快捷键
local pluginKeys = {}
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
map("v", "<C-x>", '"+d', opt)

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

------------------ vim-commentary 代码注释快捷键 -----------------------
map("n", "<leader>/", '<Plug>CommentaryLine', opt)
map("v", "<leader>/", '<Plug>CommentaryLine', opt)
map("v", "<leader>/", '<Plug>Commentary', opt)

------------------ 获取缓冲区文件路径快捷键 -------------------------
-- map("n", "<leader>P", [[:let @+ = $PWD | echo $PWD<CR>]], opt)                   -- 复制项目绝对路径到Windows剪切板，并打印
map("n", "<leader>P", [[:let @+ = expand('%') | echo expand('%')<CR>]], opt)        -- 复制缓冲区相对路径到Windows剪切板，并打印
map("n", "<leader>p", [[:let @+ = expand('%:p') | echo expand('%:p')<CR>]], opt)    -- 复制缓冲区绝对路径到Windows剪切板，并打印

------------------ gitgutter git差异显示快捷键 -------------------------
map("n", "<leader>ha", [[<cmd>silent! execute "!git add " .. expand('%') | echo "git add " .. expand('%')<CR>]], opt)        -- 将当前缓冲加入到git暂存区
map("n", "<leader>hc", [[<cmd>silent! execute "!git checkout HEAD -- " .. expand('%') | echo "git checkout HEAD -- " .. expand('%')<CR>]], opt)        -- 将当前缓冲回退到上一版
map("n", "<leader>hd", ":GitGutterDiffOrig<CR>", opt)
map("n", "<leader>hj", ":GitGutterNextHunk<CR>", opt)
map("n", "<leader>hk", ":GitGutterPrevHunk<CR>", opt)
map("n", "<leader>hp", ":GitGutterPreviewHunk<CR>", opt)
map("n", "<leader>hs", ":Telescope git_status<CR>", opt)

------------------ nvim-cmp 自动补全快捷键 -------------------------
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)

    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win()))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- Super Tab
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, {"i", "s"})

        -- -- 如果窗口内容太多，可以滚动
        -- ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        -- ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),

        -- -- 自定义代码段跳转到下一个参数
        -- ["<C-l>"] = cmp.mapping(function(_)
        --     if vim.fn["vsnip#available"](1) == 1 then
        --         feedkey("<Plug>(vsnip-expand-or-jump)", "")
        --     end
        -- end, {"i", "s"}),

        -- -- 自定义代码段跳转到上一个参数
        -- ["<C-h>"] = cmp.mapping(function()
        --     if vim.fn["vsnip#jumpable"](-1) == 1 then
        --         feedkey("<Plug>(vsnip-jump-prev)", "")
        --     end
        -- end, {"i", "s"}),


        -- -- end of super Tab
    }
end


return pluginKeys
