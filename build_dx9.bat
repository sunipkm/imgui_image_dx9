@REM Build for Visual Studio compiler. Run your copy of vcvars32.bat or vcvarsall.bat to setup command-line compiler.
@set RC_INCLUDE_PATH="C:\Program Files\Windows Kits\10\Include\10.0.19041.0\um"
@REM ;C:\Program Files\Microsoft SDKs\Windows\v7.0A\Include"
@set OUT_DIR=build
@set OUT_EXE=image_display
@set INCLUDES=/I .\ /I .\include /I .\imgui\include /I "%DXSDK_DIR%/Include"
@set SOURCES=guimain.cpp ^
jpge.cpp
@set RESOURCES=image_example.res
@set LIBS=/LIBPATH:"%DXSDK_DIR%/Lib/x86" d3d9.lib imgui\win32_lib\libimgui_win32.lib
mkdir %OUT_DIR%
rc /i %RC_INCLUDE_PATH% image_example.rc
cl /nologo /Zi /MD /EHsc %INCLUDES% /D UNICODE /D _UNICODE %SOURCES% /Fe%OUT_DIR%/%OUT_EXE%.exe /Fo%OUT_DIR%/ /link %LIBS% %RESOURCES%