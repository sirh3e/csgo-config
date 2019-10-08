#!/usr/bin/env bash

DIR=$(dirname "$(readlink -f $0 || realpath $0)")
PLATFORM=$(uname)
GREEN='\033[1;32m'
NC='\033[0m' # No Color
echo $PLATFORM
if [ "$PLATFORM" == 'Linux' ]; then
    cd "${HOME}/.local/share/Steam/steamapps/common/Counter-Strike Global Offensive/csgo"
elif [ "$PLATFORM" == 'Darwin' ] || [ "$PLATFORM" == 'FreeBSD' ]; then
    cd "${HOME}/Library/Application Support/Steam/SteamApps/common/Counter-Strike Global Offensive/csgo"
else
    echo "The script is not compatible with your OS."
	exit 1
fi

ln -sf "${DIR}/simpleradar"/* resource/overviews/

ln -sf "${DIR}/blank-panorama"/* panorama/videos/

ln -sf "${DIR}/01-autoexec.cfg" cfg/autoexec.cfg

if [ ! -d custom ]; then
    ln -sf "${DIR}" cfg/custom
fi

threads=$(cat /proc/cpuinfo | grep processor | wc -l)

echo
echo "Installation complete!"
echo
echo "Please set up your launch options:"
echo -e "\t-novid -nojoy -w <width> -h <height> -refresh <rate> -threads ${threads} -high -tickrate 128"
echo
echo -e "${GREEN}-novid${NC} – Remove the Valve intro that normally plays at the beginning. A must-have launch option in my opinion."
echo -e "${GREEN}-nojoy${NC} – Removes joystick support, more ram free"
echo -e "${GREEN}-w <width>${NC} – Forces the engine to start with resolution set to <width>."
echo -e "${GREEN}-h <height>${NC} – Forces the engine to start with resolution set to <height>. This launch option does not need to be set in the presence of -w. The width value with determine the height automatically."
echo -e "${GREEN}-refresh <rate>${NC} – Force a specific refresh rate. Warning: This will not work if your monitors maximum refresh rate is lower than <rate>."
echo -e "${GREEN}-threads ${threads}${NC} – Tells the game how many CPU cores it has access to (Your system has '${threads}' cores)."
echo -e "${GREEN}-high${NC} – This will start the game in high-priority mode. This launch option can help players with lower-end computers to get less lag and a few more fps, but it is not a guarantee."
echo -e "${GREEN}-tickrate 128${NC} – If you create an offline game with bots, the created server will run at tickrate 128 instead of 64."
