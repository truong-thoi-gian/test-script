@echo off

setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure to remove current database (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

call "C:\Program Files\Git\bin\sh.exe" -i "./rmdb.sh"

::echo %message%
echo "Database is reseted!"
pause

:END
endlocal