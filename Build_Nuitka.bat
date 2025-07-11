@echo off
REM Compiles the OB2 EXE Compiler into an EXE with Nuitka (icon, watermark, fast build)

REM Clean up old builds
rmdir /s /q build
rmdir /s /q dist
del OB2_Compiler_GUI.build.log

REM Nuitka multi-core, custom icon
python -m nuitka ^
 --standalone ^
 --onefile ^
 --assume-yes-for-downloads ^
 --enable-plugin=tk-inter ^
 --windows-icon-from-ico=ICON.ico ^
 --jobs=12 ^
 --output-dir=dist ^
 OB2_Compiler_GUI.py

REM Copy hit.wav to dist (needed for sound)
copy hit.wav dist

echo Done! Your EXE is in the dist folder, with your watermark icon!
pause
