@echo off
rem open default build output directory for Visual studio project
setlocal enabledelayedexpansion

set config=%1
for %%F in (*.sln) do (
    set "name=%%~NF"
)

if defined name (
	set "arr[0]=%name%\bin\x86\%config%"
	set "arr[1]=%name%\bin\x64\%config%"
	set "arr[2]=%name%\bin\%config%"
	for /L %%i in (0, 1, 2) do (
		if exist !arr[%%i]! (
			start !arr[%%i]!
			break
		)
	)
) else (
	set "arr[0]=bin\x86\%config%"
	set "arr[1]=bin\x64\%config%"
	set "arr[2]=bin\%config%"
	for /L %%i in (0, 1, 2) do (
		if exist !arr[%%i]! (
			start !arr[%%i]!
			break
		)
	)
)
endlocal
