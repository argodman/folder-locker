cls

@ECHO OFF

title Folder Locker
color 0e
set logfile=D:\logfile.txt
IF NOT EXIST D:\ (
    echo Warning: Drive D: does not exist. Log file will be created in current directory.
    set logfile=logfile.txt
)

echo __________________________________________________________ >> %logfile%
echo user run this folder at %date% %time% >> %logfile%

:start
echo version 0.3.4
echo made by ArGoDmAn
echo Telegram: @argodman
echo Log: D:\ (by default)

:locker
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Locker goto MDLOCKER

:CONFIRM
echo the folder is not locked. lock it now?(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto FNL
if %cho%==N goto FNL
echo Invalid choice.
goto CONFIRM

:LOCK
ren Locker "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked
echo user locked this folder at %date% %time% >> %logfile%
goto End

:UNLOCK
echo Enter password to Unlock folder
set/p "pass=>"
if NOT %pass%==22580 goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Locker
echo Folder Unlocked successfully
echo user unlocked this folder at %date% %time% >> %logfile%
goto End

:FAIL
echo Invalid password
echo user could'nt unlock this file at %date% %time% >> %logfile%
goto unlock

:MDLOCKER
md Locker
echo Locker created successfully
goto End

:FNL
echo user refused to lock folder at %date% %time% >> %logfile%
echo your folder is not locked
echo do you want to lock it?(y/n)
set/p "kho=>"
if %kho%==y goto CONFIRM
if %kho%==Y goto CONFIRM
goto End

:End
echo __________________________________________________________ >> %logfile%
echo do you want to see the logfile.txt?(y/n)
set/p "sho=>"
if %sho%==y start %logfile%
if %sho%==Y start %logfile%