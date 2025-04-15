@echo off
echo hi

set basename_of_interest=basename
set extension_of_interest=.pdf

echo %basename_of_interest%%extension_of_interest%
echo %basename_of_interest% (1)%extension_of_interest%

:: Main loop to detect new files
:loop
    :: List all files in the directory
    dir /b | findstr /x /c:"%basename_of_interest% (1)%extension_of_interest%"
    
    if errorlevel 1 (
        echo File "%basename_of_interest% (1)%extension_of_interest%" not found in "%directory%"!
        :: Wait for a specified time (in seconds) before checking again
        timeout /t 1 > nul
        goto loop
    ) else (
        echo File "%basename_of_interest% (1)%extension_of_interest%" found in "%directory%"!
        del "%basename_of_interest%%extension_of_interest%"
        ren "%basename_of_interest% (1)%extension_of_interest%" "%basename_of_interest%%extension_of_interest%"
        :: Wait for a specified time (in seconds) before checking again
        timeout /t 1 > nul
        goto loop
    )
