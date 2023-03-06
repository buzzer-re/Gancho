@echo off


set "SolutionDir=%1"
set "Platform=%2"
set "Configuration=%3"
set "ProjectName=%4"

if "%Platform%"=="x64" (
  set "outputPath=%SolutionDir%\x64\%Configuration%\distribute"
  set "BuildDir=%SolutionDir%\x64\%Configuration%"
) else (
  set "outputPath=%SolutionDir%\%Configuration%\distribute"
  set "BuildDir=%SolutionDir%\%Configuration%"
)

echo %BuildDir%
set "SourcePath=%SolutionDir%\%ProjectName%"

set "BinPath=%outputPath%\bin"
set "IncludePath=%outputPath%\include"


if not exist "%outputPath%" mkdir "%outputPath%" 
if not exist "%BinPath%" mkdir %BinPath% 
if not exist "%IncludePath%" mkdir %IncludePath%

xcopy /y  "%BuildDir%\*.dll" "%BinPath%\"
xcopy /y  "%BuildDir%\*.lib" "%BinPath%\"
xcopy /y %SourcePath%\*.h "%includePath%"
