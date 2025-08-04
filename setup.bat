@echo off
REM EV Adoption Forecasting Project Setup Script
REM Alternative to Makefile for Windows users without make

setlocal EnableDelayedExpansion

set VENV_NAME=ev-venv
set PYTHON_CMD=python

if "%1"=="" goto help
if "%1"=="help" goto help
if "%1"=="setup" goto setup
if "%1"=="clean" goto clean
if "%1"=="install" goto install
if "%1"=="run-app" goto run_app
if "%1"=="run-notebook" goto run_notebook
if "%1"=="test-env" goto test_env
if "%1"=="status" goto status
if "%1"=="activate" goto activate
goto help

:help
echo EV Adoption Forecasting Project Setup
echo =====================================
echo.
echo Available commands:
echo   setup.bat setup          - Create virtual environment and install dependencies
echo   setup.bat install        - Install/update dependencies
echo   setup.bat clean          - Remove virtual environment
echo   setup.bat run-app        - Run the Streamlit application
echo   setup.bat run-notebook   - Start Jupyter notebook server
echo   setup.bat test-env       - Test if environment is working properly
echo   setup.bat activate       - Show command to activate virtual environment
echo   setup.bat status         - Show environment status
echo.
goto end

:setup
echo Creating virtual environment and installing dependencies...
call :create_venv
call :install_deps
echo Setup complete! Environment '%VENV_NAME%' is ready.
echo To activate: %VENV_NAME%\Scripts\activate
goto end

:create_venv
echo Creating virtual environment '%VENV_NAME%'...
if not exist "%VENV_NAME%" (
    %PYTHON_CMD% -m venv %VENV_NAME%
    if !errorlevel! equ 0 (
        echo Virtual environment created successfully.
    ) else (
        echo Error creating virtual environment.
        exit /b 1
    )
) else (
    echo Virtual environment '%VENV_NAME%' already exists.
)
goto :eof

:install
call :create_venv
call :install_deps
goto end

:install_deps
echo Installing dependencies...
if exist "%VENV_NAME%\Scripts\pip.exe" (
    %VENV_NAME%\Scripts\pip.exe install --upgrade pip
    %VENV_NAME%\Scripts\pip.exe install -r requirements.txt
    echo Dependencies installed successfully.
) else (
    echo Virtual environment not found. Please run 'setup.bat setup' first.
    exit /b 1
)
goto :eof

:clean
echo Removing virtual environment '%VENV_NAME%'...
if exist "%VENV_NAME%" (
    rmdir /s /q "%VENV_NAME%"
    echo Virtual environment removed successfully.
) else (
    echo Virtual environment '%VENV_NAME%' does not exist.
)
goto end

:run_app
echo Starting Streamlit application...
if exist "%VENV_NAME%\Scripts\streamlit.exe" (
    %VENV_NAME%\Scripts\streamlit.exe run app.py
) else (
    echo Streamlit not found. Please run 'setup.bat install' first.
)
goto end

:run_notebook
echo Starting Jupyter notebook server...
if exist "%VENV_NAME%\Scripts\jupyter.exe" (
    %VENV_NAME%\Scripts\jupyter.exe notebook
) else (
    echo Jupyter not found. Please run 'setup.bat install' first.
)
goto end

:test_env
echo Testing virtual environment...
if exist "%VENV_NAME%\Scripts\python.exe" (
    echo Python version:
    %VENV_NAME%\Scripts\python.exe --version
    echo.
    echo Installed packages:
    %VENV_NAME%\Scripts\pip.exe list
    echo Environment test completed successfully.
) else (
    echo Virtual environment not found. Please run 'setup.bat setup' first.
)
goto end

:activate
echo To activate the virtual environment, run:
echo %VENV_NAME%\Scripts\activate
goto end

:status
echo Environment Status:
echo ===================
if exist "%VENV_NAME%" (
    echo Virtual environment: EXISTS
    if exist "%VENV_NAME%\Scripts\python.exe" (
        echo Python executable: FOUND
        echo Python version:
        %VENV_NAME%\Scripts\python.exe --version
    ) else (
        echo Python executable: NOT FOUND
    )
) else (
    echo Virtual environment: NOT FOUND
)
if exist "requirements.txt" (
    echo Requirements file: FOUND
) else (
    echo Requirements file: NOT FOUND
)
goto end

:end
endlocal
