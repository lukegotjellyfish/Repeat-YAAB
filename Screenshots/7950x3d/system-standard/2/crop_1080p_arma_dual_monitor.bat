@ECHO OFF

MD Cropped >nul 2>nul

REM :loop
for %%f in (*.png) do (
ffmpeg -i %%f -vf "crop=1102:866:279:230" "./Cropped/%%~nf.jpg"
)
REM shift
REM if not "%~1"=="" goto loop


REM -filter_complex  "[0:v]crop=240:222:1600:430[top];[0:v]crop=240:775:1600:1070[bottom];[top][bottom]overlay=format=auto" output.jpg
REM top: x240, y222 
REM topb: x1600, y430

REM bot: 240, 775
REM botb: 1600, 1070