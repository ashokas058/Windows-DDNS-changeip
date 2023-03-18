@echo off

set USER=ashokas.crypt@gmail.com
set PASSWORD=ashok.net4.0
set HOST=api.changeip.us

:loop

for /f "tokens=2 delims=:" %%A in ('nslookup myip.opendns.com resolver1.opendns.com ^| find "Address"') do set MYIP=%%A
set MYIP=%MYIP: =%
set MYIP=%MYIP: =%


set params="u=%USER%&p=%PASSWORD%&myip=%MYIP%&hostname=%HOST%&set=1"
set URL="https://nic.ChangeIP.com/nic/update"
curl -G %URL% -d %params%

timeout /t 300 /nobreak > nul
goto loop

