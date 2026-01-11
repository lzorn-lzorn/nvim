
寻找nvim的配置文件路径：`:=vim.fn.stdpath("config")`
在nvim中创建新的文件:
```bash
:e filename.txt              " 在当前目录创建文件
:e path/to/file.txt          " 在指定路径创建文件
:e ../another/file.txt       " 使用相对路径
```
分屏创建:
```bash
:split newfile.txt           " 水平分屏打开新文件 
:vsplit newfile.txt          " 垂直分屏打开新文件
:tabnew newfile.txt          " 在新标签页打开
```
分别简写 `sp`, `vsp`, `tabe`

使用内置文件浏览器(Netrw)查看目录
```bash
:Explore                     " 打开当前目录
:Sexplore                    " 水平分屏打开
:Vexplore                    " 垂直分屏打开
:Texplore                    " 新标签页打开
```
简写: `Ex`, `Sex`, `Vex`
使用:
1. `:pwd` 查看 Netrw 默认打开的目录
2. `:echo b:netrw_curdir`
创建目录:
1. Netrw 中创建: `:Ex`, 按`d`(不是输入`:d`), 输入文件名, Enter
2. 使用Shell命令: `!mkdir dirname`


