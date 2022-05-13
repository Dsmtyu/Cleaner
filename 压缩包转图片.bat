@echo off
set /p pic_1="图片路径或名称:"
set /p file="压缩文件路径或名称:"
set /p pic_2="输出图片名称:"
copy /b %pic_1%+%file% %pic_2%
pause
