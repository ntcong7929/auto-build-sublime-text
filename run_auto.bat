@echo off
setlocal

set "FILE=%~1"
set "DIR=%~2"
set "NAME=%~3"
for %%x in ("%FILE%") do set "EXT=%%~xx"
if /I "%EXT%"==".py" (
    echo Running Python file...
    start cmd /k python "%FILE%"
) else if /I "%EXT%"==".cpp" (
    echo Compiling and running C++ file...
    g++ "%FILE%" -o "%DIR%\%NAME%.exe"
    if %errorlevel% equ 0 (
        "%DIR%\%NAME%.exe"
    ) else (
        echo Compilation failed!
    )
) else if /I "%EXT%"==".php" (
    echo Running PHP file...
    start cmd /k ""D:\XAMPP\php\php.exe" "%FILE%""
) else (
    echo Unsupported file type: %EXT%
)

endlocal
