--·在 nvim 中按下 CTRL + x 时切换鼠标模式   
function ToggleMouseMode()
    local current_mouse_setting = vim.o.mouse
    if current_mouse_setting == "" then
        vim.o.mouse = "a"
    else
        vim.o.mouse = ""
    end
end

if vim.fn.has('wsl') then
    vim.g.clipboard = {
        name='myClipboard',
        copy={
            ['+']='clip.exe',
            ['*']={'tmux','load-buffer','-'},
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*']={'tmux','save-buffer','-'},
        }
    }
end
