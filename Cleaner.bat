% Update by Albert-wuchenyu 2022/4/10 %
@echo off
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
echo 正在刷新网络配置...
ipconfig/flushdns
pause
