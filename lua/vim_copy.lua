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
