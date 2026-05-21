@echo off
REM Double-click wrapper for sync.ps1
powershell.exe -ExecutionPolicy Bypass -NoProfile -File "%~dp0sync.ps1"
