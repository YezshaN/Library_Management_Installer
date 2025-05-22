@echo off
REM -- MySQL Configuration Script for Library Management --

set MYSQL_PATH="C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

echo Importing your database...
%MYSQL_PATH% -u root -pyesh63780 < "%~dp0init.sql"

echo Database import complete.
pause
