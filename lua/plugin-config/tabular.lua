-- 如果找不到 tabular 组件，就不继续执行
local status, tabular = pcall(require, "tabular")
if not status then
    vim.notify("没有找到 tabular")
    return
end
