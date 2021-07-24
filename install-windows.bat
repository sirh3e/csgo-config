@echo off

set DIR=%cd%
set THREADS=%NUMBER_OF_PROCESSORS%

if exist "D:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\csgo" (
cd "D:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\csgo"
)

if exist cfg\custom (
rmdir cfg\custom
)

if exist cfg\autoexec.cfg (
del cfg\autoexec.cfg
)

mklink cfg\autoexec.cfg %DIR%\01-autoexec.cfg

if not exist custom (
mklink /D cfg\custom %DIR%
)

echo[
echo "Installation complete!"
echo[
echo "Please set up your launch options:"
echo "-w 1280 -h 960 -refresh 240 -r_emulate_g +r_dynamic 0 -forcenovsync -high -nojoy +fps_max 0 +fps_max 0 -nojoy -high -fullscreen +mat_disable_fancy_blending 1 +cl_forcepreload 1 -limitvsconst -forcenovsync +r_dynamic 0 -console -threads 16"
echo[
