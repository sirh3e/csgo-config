#!/usr/bin/env bash

DIR=$(dirname "$(readlink -f $0 || realpath $0)")
PLATFORM=$(uname)
GREEN='\033[1;32m'
NC='\033[0m' # No Color
echo $PLATFORM
if [ "$PLATFORM" == 'Linux' ]; then
    cd "${HOME}/.local/share/Steam/steamapps/common/Counter-Strike Global Offensive/game/csgo"
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

echo
echo "Installation complete!"
echo
echo "Please set up your launch options:"
echo -e "\t-fullscreen -nojoy -vulkan -sdlaudiodriver pipewire"
echo
echo -e "${GREEN}-fullscreen${NC} – Forces the engine to start in fullscreen mode."
echo -e "${GREEN}-nojoy${NC} – Removes joystick support, more ram free"
echo -e "${GREEN}-vulkan${NC} – Forces Vulkan as the default rendering option."
echo -e "${GREEN}-sdlaudiodriver pipewire${NC} – Set the audio API SDL Audio to pipewire."
