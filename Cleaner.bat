::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFJKMjUmvPWWGKbsZzPry+e+7JLv60iP8RKjSzpybItww5kDle5M/6mpbm8ANCx5kXR6ubwExuyBLtWvl
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
% Update by Albert-wuchenyu 2022/4/10 %
@echo off
echo *清理文件(1)
echo *刷新网络配置(2)
echo -------------------------------------------
choice /C 123 /M "选择(3为取取消): "
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
	rem exit /b 0

:pa
	echo 已退�?
	pause