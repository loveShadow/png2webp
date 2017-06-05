::使用说明
::1. 在本目录创建pngDir文件夹，将png图片放到该目录中
::2. 运行本bat文件

setlocal enabledelayedexpansion 

::循环次数 0：无限循环
set loopnum=0
::间隔时间 ms
set intervalTime=80

::将png生成webp
set cwebp=cwebp.exe
set DestPath=C:\Users\zhaoli\Desktop\png2webp\png2webp\pngDir\
set DestExt=*.png

for /f "delims=" %%i in ('dir  /b/a-d/s  %DestPath%\%DestExt%')  do (
	set "command=%cwebp% %%i -o %%i.webp"
	!command!
)

::将生成的多个webp合并成一个webp动画
set webpmux=webpmux.exe
set DestPath=C:\Users\zhaoli\Desktop\png2webp\png2webp\pngDir\
set DestExt=*.webp

for /f "delims=" %%i in ('dir  /b/a-d/s  %DestPath%\%DestExt%')  do (
	set "webpmux=!webpmux! -frame "%%i" +%intervalTime%+0+0+1-b"
)
set "webpmux=%webpmux% -loop %loopnum%  -bgcolor 0,255,255,255 -o "./cd.webp""
echo webpmux=!webpmux!

%webpmux%

pause
