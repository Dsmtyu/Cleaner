% Update by Dsmtyu 2022/5/13 %
@echo off
:cleaner
    cls
	echo *清理文件(1)
	echo *刷新网络配置(2)
	echo *杀死进程(3)
	echo *压缩包转图片(4)
	echo -------------------------------------------
	choice /C 1234C /M "选择(C为取取消): "
	if %errorlevel%==1 goto clean
	if %errorlevel%==2 goto ipconfig
	if %errorlevel%==3 goto kill
	if %errorlevel%==4 goto ziptoimg
	if %errorlevel%==5 goto pau
	:clean
		echo 确定清理以下文件夹？（不可恢复）
		echo C:\,C:\Windows\,C:\User\用户名\
		choice /CS YN /M "确定(Y/N): "	
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
        pause
		goto cleaner

	:ipconfig
		echo 正在刷新网络配置...
		ipconfig/flushdns
        pause
		goto cleaner
		
	:kill
		:: 杀死进程
		set /p p=请输入端口:
		
		if (%p%)==() (
			:: 阻止杀死默认进进程?
			echo 此行为可能导致系统崩溃，是否取消?
			choice /C YN /M "选择(Y/N): "
			:: 取消
			if %errorlevel%==1 goto kill	
			:: 继续
			if %errorlevel%==2 goto killport
		) else (
			goto killport
		)
		
	:killport
		::杀死进程
		setlocal enabledelayedexpansion
		for /f "tokens=1-5" %%a in ('netstat -ano ^| find ":%p%"') do (
			if "%%e%" == "" (
				set pid=%%d
			) else (
				set pid=%%e
			)
			echo !pid!
			taskkill /f /pid !pid!
		)
        pause
		goto cleaner

	:ziptoimg
		::压缩包转图片
		set /p pic_1="图片路径或名称:"
		set /p file="压缩文件路径或名称:"
		set /p pic_2="输出图片名称:"
		copy /b %pic_1%+%file% %pic_2%
		pause
		goto cleaner

:pau
	echo 已退出
	exit /b 0
