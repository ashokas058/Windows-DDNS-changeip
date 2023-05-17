@echo off

set USER=
set PASSWORD=
set HOST= 

:loop

curl -s ip.changeip.com >output.txt
set response=<output.txt


for /f "tokens=4" %%i in ("%response%") do (
    set MYIP=%%i
)

set params="u=%USER%&p=%PASSWORD%&myip=%MYIP%&hostname=%HOST%&set=1"
set URL="https://nic.ChangeIP.com/nic/update"
curl -G %URL% -d %params%

timeout /t 300 /nobreak > nul
goto loop

