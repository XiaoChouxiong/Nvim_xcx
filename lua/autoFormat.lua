-- 打开文件时，对指定文件进行结构格式化
function autoFormat()
    -- 获取打开文件的文件类型
    local file_type = vim.bo.filetype

    -- 打开json文件时做格式化操作
    if file_type == "json" then
        vim.cmd('%!python -m json.tool')
    end
end

-- 在启动时立即执行一次
autoFormat()

-- 绑定到BufEnter事件，以便在打开或切换缓冲区时更新
vim.cmd('autocmd BufEnter * lua autoFormat()')

