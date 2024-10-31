@echo off

for /f "delims=" %%i in ('dir /b "*.cab" 2^>nul') do (dism /online /add-package /packagepath:%%i /norestart)

reg delete "HKLM\SOFTWARE\Microsoft\.NETFramework" /v "OnlyUseLatestCLR" /f >nul
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\.NETFramework" /v "OnlyUseLatestCLR" /f >nul

copy /y "machine.config" "%systemroot%\Microsoft.NET\Framework\v2.0.50727\CONFIG\machine.config" >nul
copy /y "machine.config" "%systemroot%\Microsoft.NET\Framework64\v2.0.50727\CONFIG\machine.config" >nul

dism /online /enable-feature /featurename:LegacyComponents /all
dism /online /enable-feature /featurename:DirectPlay /all