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

## 标签页

1、定义标签页的快捷键

```lua
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
```

2、在bufferline的配置文件中，定义了关闭标签采用vim-bbye插件提供的指令

## 模糊查找

1、安装插件依赖

```bash
# 检查依赖情况，我选择将plenary与ripgrep集成到插件中
:checkhealth telescope
"""
- OK plenary installed.
- OK rg: found ripgrep.
"""

# 安装repgrep
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt install ripgrep
```

2、插件内置快捷键

```bash
CTRL + c		退出telescope界面
CTRL + p		上一条选项
TAB				上一条选项
CTRL + n		下一条选项
SHIFT + TAB		下一条选项
CTRL + u		上翻浏览页
CTRL + d		下翻浏览页
```

3、定义模糊查找的快捷键

```lua
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
```

4、指令说明

```bash
# 文件选择器
:Telescope find_files		列出当前工作目录中的文件
:Telescope live_grep		在当前工作目录中搜索字符串并在键入时实时获取结果

# vim选择器
:Telescope keymaps			列出正常模式键盘映射

# git选择器
:Telescope git_commits		列出工作目录的提交历史记录
:Telescope git_bcommits		列出当前缓冲区的提交历史记录
:Telescope git_branches		列出所有分支，包括日志预览
:Telescope git_status		列出每个文件的当前更改
:Telescope git_stash		列出当前存储库中的隐藏项目
```

## 底部文件状态栏

1、插件配置说明

```lua
-- 主要的配置说明
1、将文件状态栏主题与nvim主题调整一致：tokyonight
2、定义信息栏显示内容
```

2、特别配置说明（lua/basic.lua）

```bash
# 默认情况下安装该插件时，命令行应该配置为两行显示
# 但是不知道哪个插件自动将命令行扩展了一行，导致成为三行显示命令行
# 因此需要将基本配置中命令行设置为一行显示，以达到两行显示的效果
vim.o.cmdheight = 1
```

## 语言解析

1、`:TSModuleInfo`查看模块使能情况

2、插件的语言解析器下载位置：~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/parser/

注：`:TSModuleInfo` 会识别nvim自带的语言解析包，但是该插件虽然显示已经安装解析包，但只支持自己目录下的解析包，因此需要nvim-treesitter插件对该解析包进行安装(`:TSInstall`)

> nvim自带解析包位置：/usr/lib/x86_64-linux-gnu/nvim/parser

### 代码高亮

1、使用Packer安装该插件时，由于第一次无法识别到该插件的命令，而报错无法执行`更新支持的语言解析器`，重新执行一次`PackerSync`即可

2、指令说明

```bash
# 查看 language parsers 列表与安装状态
:TSInstallInfo

# 更新已安装的解析器
:TSUpdate

# 安装解析器
:TSInstall {language}

# 卸载解析器
:TSUninstall {language}

# 代码高亮开关
:TSBufToggle highlight
```

### 增量选择

1、定制快捷键说明

```bash
# 内置快捷键
ggvG	选中全文

# 配置文件中定义快捷键
<CR>	回车键可以初始化选择、扩大选区
<BS>	退格键可以缩小选区
<TAB>	制表符可以在选区的基础上扩大选区

# 自定义快捷键（快捷键映射文件）
map("n", "<C-a>", 'ggvG<CR>', opt)		选中全文
```

### 代码缩进

1、模块说明：默认缩进为4个空格

2、快捷键说明

```bash
# 内置快捷键
=		对选中的区域进行代码缩进
gg=G	对全文进行代码缩进
```

### 代码折叠

1、快捷键说明

```bash
# 内置快捷键
zc		折叠代码块
zo		打开折叠代码块

# 自定义快捷键（快捷键映射文件）
CTRL+]	折叠代码块
CTRL+[	打开折叠代码块
```

## git差异显示

1、快捷键说明

```bash
<leader>ha			# 将当前缓冲文件加入到暂存区
<leader>hc			# 将当前缓冲文件回退到上一版本状态
<leader>hd			# 显示当前缓冲文件与上一版本间的差异
<leader>hj			# 光标定位到文件修改的下一个位置
<leader>hk			# 光标定位到文件修改的上一个位置
<leader>hp			# 显示当前块的修改差异
<leader>hs			# 显示项目的所有修改文件
```

## Nvim复制内容脚本

1、这个不属于插件，是使用lua编写的一段脚本，用于实现nvim复制内容到windows下的粘贴板上

脚本位置：/home/ubuntu/.config/nvim/lua/nvim_copy.lua

2、定义复制快捷键

```bash
# 在视图模式下，使用CTRL + c 或 CTRL + Insert实现内容复制
map("v", "<C-c>", '"+y', opt)
map("v", "<C-Insert>", '"+y', opt)

# 在视图模式下，使用CTRL + x 实现内容剪切
map("v", "<C-x>", '"+d', opt)
```

## 文件格式化插件

1、这个不属于插件，是使用lua编写的一段脚本，用于实现nvim打开指定文件后，可以实现文件结构格式化

脚本位置：/home/ubuntu/.config/nvim/lua/autoFormat.lua

2、目前支持的文件

① JSON文件：需要依赖`jq`实现结构格式化

```bash
# 安装jq
sudo apt-get install jq

# 对打开的文件进行结构格式化
:%!jq --indent 4 .

# 注：python也可以实现对文件的结构化操作，但是它会将中文转为Unicode编码格式，并且进行key排序
%!python -m json.tool
```

## LSP语言包

1、通过三个插件管理LSP语言服务

​	语言包管理器：mason

​	mason与lspconfig的中间配置插件：mason-lspconfig

​	语言包配置插件：lspconfig

2、安装插件依赖工具

```bash
sudo apt-get install unzip
```

3、快捷键说明

```bash
<leader>rn			整体修改代码中的变量名

gd					跳转到定义
gh					显示提示信息
gD					跳转到声明
gr					查看项目中所有用到该 变量/函数/类 的地方
                           
gp					将当前行的报错信息，以浮动窗口的方式显示 
gk					将光标定位到上一个诊断位置
gj					将光标定位到下一个诊断位置
```

4、语言服务安装

```bash
:Mason				# 语言包管理界面
i					# 安装语言包
X					# 卸载语言包
```

5、语言包安装列表

```bash
lua_ls				# lua
clangd				# c、c++
```

### clangd（C语言服务）

1、安装编译解析工具

```bash
sudo apt-get install bear
```

2、生成项目的项目结构解析文件

```bash
# 可以修改Makefile，项目中所有用到的文件都编译到，这样便可以得到一个比较全的项目结构解析文件
make clean;bear make

# 项目根目录下生成了compile_commands.json
# 检查该文件是否有错误的地方，尤其是使用的编译器，可以修改为绝对路径
```

### pyright（python语言服务）

1、安装依赖工具

```bash
# 注意pyright基于的版本号，版本过低时使用mason可以安装但是使用会报错
node -v
"""
v14.9.0
"""
```

## 代码注释

1、快捷键说明

```bash
<leader>/		代码 行注释/块注释
```

## 缓冲区文件路径拷贝

1、快捷键定义

```bash
# 按照个人习惯定义的快捷键
-- 复制项目绝对路径到Windows剪切板，并打印
-- map("n", "<leader>P", [[:let @+ = $PWD | echo $PWD<CR>]], opt)

-- 复制缓冲区相对路径到Windows剪切板，并打印
map("n", "<leader>P", [[:let @+ = expand('%') | echo expand('%')<CR>]], opt)

-- 复制缓冲区绝对路径到Windows剪切板，并打印
map("n", "<leader>p", [[:let @+ = expand('%:p') | echo expand('%:p')<CR>]], opt)
```

## *plugin/packer_compiled.lua

packer_compiled.lua文件是通过执行packer插件的compile命令生成的，它会根据你在nvim配置文件中定义的插件列表和配置进行处理。该文件包含了插件的配置信息和加载顺序，以及一些性能优化的指令。

生成packer_compiled.lua文件后，当你重新打开nvim时，packer插件会根据这个文件来加载和配置插件，而不需要再次解析和处理nvim配置文件。这样可以大大减少插件加载的时间，提高nvim的启动速度。

总结来说，packer_compiled.lua文件是用于加速插件加载的，通过预先处理和保存插件配置信息，避免了每次启动nvim时都重新解析和处理nvim配置文件的开销。

## 特：NVIM内置快捷键

```bash
# 光标
CTRL + *	文本内单词匹配跳转
gg			光标跳转到文首
G			光标跳转到文尾
w			光标以单词进行跳转
CTRL + o	光标跳转到上一个历史位置
CTRL + i	光标跳转到下一个历史位置

# 编辑
cw			替换单词
ci"			替换双引号中的内容(双引号也可以换为其他符号)
u			回退之前的编辑操作
CTRL + r	撤销之前的编辑操作

# nvim进程操作
CTRL + z	将nvim挂起到后台执行（fg：将最近的一次挂起任务返回前台执行）
```

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





