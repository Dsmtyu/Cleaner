% Update by Albert-wuchenyu 2022/4/10 %
@echo off
echo *清理文件夹(1)
echo *刷新网络配置(2)
echo -------------------------------------------
choice /C 123 /M "选择(3为取消): "
if %errorlevel%==1 goto clean
if %errorlevel%==2 goto ipconfig
if %errorlevel%==3 goto pau
:clean
	echo 确定清理以下文件夹？（不可恢复）
	echo C:\,C:\Windows\,C:\User\用户名\
	choice /C YN /CS /M "确定(Y/N): "	
	if %errorlevel%==1 goto cle
	if %errorlevel%==2 goto pau
	:cle
		echo 正在清除系统垃圾文件，请稍等...
		del /f /s /q %systemdrive%\*.tmp
		del /f /s /q %systemdrive%\*._mp
		del /f /s /q %systemdrive%\*.log
		del /f /s /q %systemdrive%\*.gid
		del /f /s /q %systemdrive%\*.chk
		del /f /s /q %systemdrive%\*.old
		del /f /s /q %systemdrive%\recycled\*.*
		del /f /s /q %windir%\*.bak
		del /f /s /q %windir%\Prefetch
		del /f /s /q %windir%\System32\LogFiles
		del /f /s /q %windir%\Temp
		del /f /s /q %windir%\Help
		del /f /s /q %windir%\SoftwareDistribution
		rd /s /q %windir%\temp & md %windir%\temp
		del %userprofile%\.condarc
		del %userprofile%\.git-for-windows-updater
		del %userprofile%\.bash_history
		del %userprofile%\.gitconfig
		del %userprofile%\.viminfo
		del /f /q %userprofile%\cookies\*.*
		del /f /q %userprofile%\recent\*.*
		del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
		del /f /s /q "%userprofile%\recent\*.*"
		echo 清除系统垃圾文件完成...
	rem exit /b 0

:ipconfig
	echo 正在刷新网络配置...
	ipconfig/flushdns
	pause

:pa
	echo 已退出
	pause