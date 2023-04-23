@ECHO OFF

MD Cropped >nul 2>nul

:loop
ffmpeg -i %1 -vf "crop=1102:866:279:230" "./Cropped/%~n1.jpg"
shift
if not "%~1"=="" goto loop