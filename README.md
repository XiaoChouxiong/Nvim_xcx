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

5、设置光标显示：设置--》Ubuntu--》外观--》光标--》光标形状--》空心旷

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

3、插件管理器指令说明

```bash
PackerCompile: 每次改变插件配置时，必须运行此命令或 PackerSync, 重新生成编译的加载文件
PackerClean:   清理没有配置的插件
PackerInstall: 清除，然后安装缺失的插件
PackerUpdate:  清除，然后更新并安装插件
PackerSync:    执行 PackerUpdate 后，再执行 PackerCompile
PackerStatus:  显示插件状态
PackerLoad:    立刻加载 opt 插件
```

## NVIM主题

更多主题浏览：https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes

修改主题方式：

1、使用Packer插件下载想使用的主题

2、设置nvim启动主题

```bash
# 编辑主题配置文件
vim ~/.config/nvim/lua/colorscheme.lua

# 修改colorscheme变量，指定下载好的主题
```

## 侧边栏
1、定义侧边栏快捷键

```bash
vim ~/.config/nvim/lua/keybindings.lua

# 设置CTRL+b打开/关闭侧边栏
map("n","<C-b>", ":NERDTreeToggle<CR>", opt)
```

2、指令说明

```bash
# 好用指令说明
:NERDTree [<start-directory> | <bookmark>]			打开 侧边栏
	-- 可以指定目录/书签，NERDTree将其作为根目录打开
:NERDTreeToggle		打开/关闭 侧边栏

:Bookmark [<name>]	将当前节点标记为<name>
	-- 如果已经有一个<name>书签，原节点将被覆盖
	-- 如果没有提供<name>，则默认为文件或目录名称
	-- 一个节点可定义多个标签
:OpenBookmark <name> 	打开指定的书签
:ClearBookmarks [<bookmarks>] 	清除节点书签
	-- 如果指定了标签，则删除节点该书签
	-- 如果没有指定标签，则删除节点所有书签
:EditBookmarks		打开书签文件进行手动编辑

# 特别指令说明
:ReadBookmarks		重新加载书签
	-- 当存在无效书签时，手边编辑完书签后，需要指定该指令，否则脚本会报错。

:NERDTreeCWD		将NERDTree根目录更改为当前工作目录（可以配合cd快捷键使用）
```

3、快捷键说明

```bash
# 好用的快捷键
o		打开/关闭
	-- 如果选择了文件节点，则在前面的窗口中打开该文件节点。
	-- 如果选择了一个目录，则根据其当前状态打开或关闭。
	-- 如果选择了链接到某个目录的书签，那么该目录将成为新的根目录。
	-- 如果选择了一个链接到文件的书签，那么该文件将在前一个窗口中打开。
go		打开文件（光标留在侧边栏）
	-- 如果选择了文件节点或链接到文件的书签，则在上一个窗口中打开，但光标不移动。
	-- 如果选择了链接到某个目录的书签，则该目录将成为新的根目录。

i		打开文件（在新的水平拆分窗口中打开选中的文件）
s		打开文件（在新的垂直拆分窗口中打开选中的文件）

O		递归打开所选目录
x		关闭所选节点的父节点
X		递归地关闭所选目录的所有子目录


p		光标跳转到所选节点的父节点
P		光标跳转到树的根

C		将选定的目录节点作为新的树根。如果一个文件被选中，则使用它的父节点。
u		将树根向上移动到一个目录


m		节点菜单
	-- a	touch指令
	-- m	mv指令
	-- d	rm指令
	-- c	cp指令
	-- p	复制节点绝对路径
	-- l	列出当前节点信息
	-- s	在当前节点目录下执行命令

q		关闭侧边栏
	
	
# 其他快捷键
j		向下移动光标
k		向上移动光标
<CR>	在选定节点上执行自定义打开操作

gi		打开文件（在新的水平拆分窗口中打开选中的文件 & 光标留在侧边栏）
gs		打开文件（在新的垂直拆分窗口中打开选中的文件 & 光标留在侧边栏）

t		打开（在新选项卡中打开）
	-- 在新选项卡中打开所选文件。
	-- 如果选择了一个目录，则在新选项卡中打开该目录的新NERDTree。
	-- 如果选择了指向某个目录的书签，则在新选项卡中为该目录打开一个NERDTree。
	-- 如果书签指向一个文件，则在新选项卡中打开该文件。
T		打开（在新选项卡中打开 & 光标保留在当前选项卡）

K		跳转到当前节点父节点的第一个子节点
J		跳转到当前节点父节点的最后一个子节点
CTRL+j	跳转到所选节点的下一个同级节点
CTRL+k	跳转到所选节点的上一个同级节点

r		刷新选中节点目录
R		递归刷新根目录

cd		定义当前节点为工作目录，需要与:NERDTreeCWD配合才可以更新工作根目录
CD		与快捷键C功能一样

I		切换是否显示隐藏文件
f		切换是否使用文件过滤器
F		切换是否显示文件节点
B		切换是否显示书签

A		最大化和最小化侧边栏窗口
?		显示快速帮助
```

4、设置NERDTree的快捷键：~/.config/nvim/lua/keybindings.lua

5、NERDTree的配置文件：~/.config/nvim/lua/plugin-config/nerdtree.lua

## Nvim复制内容脚本

1、这个不属于插件，是使用lua编写的一段脚本，用于实现nvim复制内容到windows下的粘贴板上

脚本位置：/home/ubuntu/.config/nvim/lua/vim_copy.lua

2、定义复制快捷键

```bash
# 在视图模式下，使用CTRL + c 或 CTRL + Insert实现内容复制
map("v", "<C-c>", '"+y', opt)
map("v", "<C-Insert>", '"+y', opt)
```

## *plugin/packer_compiled.lua

packer_compiled.lua文件是通过执行packer插件的compile命令生成的，它会根据你在nvim配置文件中定义的插件列表和配置进行处理。该文件包含了插件的配置信息和加载顺序，以及一些性能优化的指令。

生成packer_compiled.lua文件后，当你重新打开nvim时，packer插件会根据这个文件来加载和配置插件，而不需要再次解析和处理nvim配置文件。这样可以大大减少插件加载的时间，提高nvim的启动速度。

总结来说，packer_compiled.lua文件是用于加速插件加载的，通过预先处理和保存插件配置信息，避免了每次启动nvim时都重新解析和处理nvim配置文件的开销。



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





