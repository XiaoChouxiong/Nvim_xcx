# NVIM配置手册

## 安装WSL

1、以管理员模式打开Windows 命令提示符

```bash
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

2、升级WSL为WSL2

[适用于 x64 机器的 WSL2 Linux 内核更新包](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)

3、打开Windows 命令提示符，将WSL2设置为默认

```bash
wsl --set-default-version 2
```

## 安装Ubuntu

1、在微软商城中安装Ubuntu22.04

2、启动Ubuntu，输入用户名和密码

3、查看Ubuntu支持的是WSL版本号

```bash
wsl -l -v
"""
  NAME            STATE           VERSION
* Ubuntu-22.04    Stopped         1
"""
```

4、将Ubuntu支持的WSL版本升级为WSL2

```bash
wsl --set-version Ubuntu-22.04 2
```

## 安装Windows Terminal

1、微软应用商店中安装Windows Terminal

2、设置主题：主题--》外观--》深色主题--》One Half Dark

3、删除与VIM冲突的快捷键

4、设置字体为Nerdfonts：设置--》Ubuntu--》外观--》字体--》FiraCode Nerd Font

> 字体下载位置：https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Regular

## 安装Neovim

1、安装所需依赖包

```bash
sudo apt-get install software-properties-common
```

2、安装neovim

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

3、检查nvim版本

```bash
# 版本必须在0.7以上，如果版本过低，说明没有成功添加 ppa:neovim-ppa/unstable，需要重新安装
nvim --version
```

4、设置vim、vi都是用nvim打开

```bash
vim ~/.bashrc
"""
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
"""
```

## 克隆配置文件

1、创建配置入口目录

```bash
mkdir ~/.config/
```

2、从Github上克隆nvim配置文件

```bash
cd ./.config/
git clone https://github.com/XiaoChouxiong/Nvim_xcx.git
mv Nvim_xcx/ nvim
```

## 安装Git

1、安装编译工具 & 依赖文件

```bash
sudo apt-get install gcc
sudo apt-get install make
sudo apt install zlib1g-dev
sudo apt install gettext
```

2、解压安装包

```
tar -zxvf git-2.41.0.tar.gz
```

3、配置安装环境 & 编译安装

```bash
./configure --prefix=/home/ubuntu/Apps/git-2.41.0
make
sudo make install
```

4、配置环境变量

```bash
vim ~/.profile
"""
export PATH=/home/ubuntu/Apps/git-2.41.0:$PATH
"""

# 刷新环境变量
source ~/.profile
```

## 安装插件管理器

> 插件默认安装位置：~/.local/share/nvim/site/pack/packer/start

1、下载插件管理器代码

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2、进入插件管理配置页面 & 安装用到的插件

```bash
vim /home/ubuntu/.config/nvim/lua/plugins.lua

# 安装所有用到的插件
:PackerSync
# 安装完成后退出插件安装进度页面
q
```

## 主题库

https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes

## 侧边栏
system_open 项，如果想要在 WSL 中用 Windows 系统默认设置打开文件，需要使用 Node.js 全局安装一个 wsl-open 包，使用命令 npm install -g wsl-open

已经安装的插件

1、Packer：插件管理工具

2、主题



## LazyVim插件参考

1. `LazyVim`：一个基于 Lua 的插件管理器，用于管理和加载其他插件。
2. `cmp-nvim-lsp`：一个基于 Neovim 的自动补全插件，用于与 Language Server Protocol (LSP) 集成。
3. `gitsigns.nvim`：一个用于在代码编辑器中显示 Git 代码变更的插件，可以方便地查看、添加和提交代码更改。
4. `mini.ai`：一个基于 Lua 的人工智能插件，提供了一些实用的功能，如快速注释、缩进范围、括号自动匹配等。
5. `neo-tree.nvim`：一个类似于 NERDTree 的文件管理器插件，可以在侧边栏中显示文件目录结构。
6. `nvim-cmp`：一个基于 Neovim 的自动补全框架，支持多种补全源，包括 LSP、snippets 等。
7. `nvim-treesitter-textobjects`：一个基于 nvim-treesitter 的插件，提供了一些额外的文本对象，用于在编辑器中进行更精细的选择和操作。
8. `todo-comments.nvim`：一个用于在代码中查找和管理 TODO 注释的插件，可以帮助你更好地组织和跟踪开发任务。
9. `LuaSnip`：一个基于 Lua 的代码片段插件，可以快速插入常用的代码块和模板。
10. `cmp-path`：一个用于路径补全的插件，可以根据当前文件的路径自动补全文件和目录名。
11. `indent-blankline.nvim`：一个用于显示缩进线的插件，可以帮助你更清晰地看到代码的缩进结构。
12. `alpha-nvim`：一个用于美化 Neovim 界面的插件，提供了多种主题和自定义选项。
13. `lazy.nvim`：一个用于延迟加载插件的插件管理器，可以提高 Neovim 的启动速度。
14. `bufferline.nvim`：一个用于管理和切换缓冲区的插件，可以在状态栏中显示当前打开的文件标签。
15. `dressing.nvim`：一个用于为 Neovim 添加装饰效果的插件，如高亮当前行、突出显示括号等。
16. `lualine.nvim`：一个用于自定义状态栏的插件，可以添加自定义的信息和图标。
17. `mini.comment`：一个用于快速注释代码的插件，支持多种注释风格和语言。
18. `neodev.nvim`：一个用于开发的插件集合，提供了一些实用的开发工具和功能。
19. `nvim-notify`：一个用于在 Neovim 中显示通知消息的插件，可以用于显示编译错误、任务完成等信息。
20. `persistence.nvim`：一个用于保存和恢复编辑器会话的插件，可以在关闭和重新打开编辑器时恢复上次的工作状态。





