@echo off
:start
Title Guess-The-Number
cls
color 7
set /A Attempt=0
set /A Answer=(%RANDOM%)/100
set Quit=quit
set Hint=000
echo ====================================================
echo Rules:
echo For quit the game enter : quit
echo ====================================================
echo ------------ Get Answer : %Hint% ----------------------
:again
echo ====================================================
set /P myNum="Guess the number : "
set /A Attempt+=1
If %myNum% EQU %Hint% goto:Hint
If %myNum% EQU %Quit% goto:quit
If %myNum% GTR %Answer% goto:smaller
If %myNum% EQU %Answer% goto:correct
If %myNum% LSS %Answer% goto:bigger
goto:again
pause
Exit /b 0

:Hint
cls
color 6
echo ====================================================
echo The Answer is %Answer%
goto:again
Exit /b 0

:quit
cls
Exit /b 0

:correct
cls
color a
echo ====================================================
echo %Answer% Bingo!! You Guessed In %Attempt% Attempts.
echo ====================================================
:ask
choice /C YN /M "Do you want to play again "
if errorlevel 2 (
    Exit /b 0
    goto ask
) else if errorlevel 1 (
    goto start
) else (
    echo "Invalid choice. Please enter Y or N."
)
echo ====================================================
pause
Exit /b 0

:smaller
color 1
echo                                        some smaller
goto:again
Exit /b 0

:bigger
color 5
echo                                         more BIGGER
goto:again
Exit /b 0

pause