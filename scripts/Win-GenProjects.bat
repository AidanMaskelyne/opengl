@echo off
pushd %~dp0\..\
call deps\premake\bin\premake5.exe vs2022
popd
PAUSE
