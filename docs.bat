REM DJANGO DOCUMENTATION MENU FOR WINDOWS
REM VERSION 1.0

REM CLEANING OUTPUT
@echo off
ECHO OFF

REM SAVING PyLit PATH
SET PYLITPATH=S:\prg\py\pylit

REM SAVING PYTHON PATH
SET PYTHONPATH=S:\PortableApps\WinPython\python-3.4.4.amd64

REM SAVING PATH
SET PATH=%PYLITPATH%;%PYTHONPATH%;%PYTHONPATH%\Scripts;%PATH%

REM SHOWING MENU

:MENU
CLS
ECHO ########## MENU ##########
ECHO # 1. SPHINX DOC          #
ECHO # 2. ReST VIEW           #
ECHO # 3. PyLit               #
ECHO ##########################
ECHO # 4. EXIT                #
ECHO ##########################
choice /C 1234 /M "SELECT AN OPTION:"

IF %ERRORLEVEL% EQU 1 GOTO OPT1
IF %ERRORLEVEL% EQU 2 GOTO OPT2
IF %ERRORLEVEL% EQU 3 GOTO OPT3
IF %ERRORLEVEL% EQU 4 GOTO OPT4

:OPT1
%PYTHONPATH%\Scripts\sphinx-apidoc.exe -o documentation ..
CALL make.bat html
PAUSE
GOTO MENU

:OPT2
SET /P FILE=Which RST file would like to show?
START %PYTHONPATH%\Scripts\restview.exe "%FILE%"
PAUSE
GOTO MENU

:OPT3
SET /P FILE=Which RST file would like to convert?
%PYTHONPATH%\python.exe %PYLITPATH%\pylit.py "%FILE%" "%FILE:~0,-4%.py"
PAUSE
GOTO MENU

:OPT4
EXIT
