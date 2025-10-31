#!/bin/sh

NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
BLINK='\x1b[5m'
hasRedDream=false
hasYaba=false
hasMupen=false
hasPPSSPP=false
hasDuckstation=false
hasDrastic=false
hasDolphinMMJ=false
hasRetroArch=false
hasCitra=false
hasAether=false

#Handheld model
handheldModel=$(cat ~/dragoonDoriseTools/.device)

#Retroarch?
FOLDER=~/storage/shared/RetroArch
if [ -d "$FOLDER" ]; then
	hasRetroArch=true
fi

#Nether?
FOLDER=~/storage/shared/Android/data/xyz.aethersx2.android
if [ -d "$FOLDER" ]; then
	hasAether=true
fi
#Azahar?
FOLDER=~/storage/shared/Azahar
if [ -d "$FOLDER" ]; then
	hasCitra=true
fi

#RedDream?
FOLDER=~/storage/shared/Android/data/io.recompiled.redream
if [ -d "$FOLDER" ]; then
	hasRedDream=true
fi
#YabaSanshioro?
FOLDER=~/storage/shared/Android/data/org.devmiyax.yabasanshioro2.pro
FOLDERPRO=~/storage/shared/Android/data/org.devmiyax.yabasanshioro2
if [ -d "$FOLDER" ]; then
	hasYaba=true
fi
if [ -d "$FOLDERPRO" ]; then
	hasYaba=true
fi
#Mupen64
FOLDER=~/storage/shared/Android/data/org.mupen64plusae.v3.fzurita
FOLDERPRO=~/storage/shared/Android/data/org.mupen64plusae.v3.fzurita.pro
if [ -d "$FOLDER" ] || [ -d "$FOLDERPRO" ]; then
	hasMupen=true
fi
#PPSSPP
FOLDER=~/storage/shared/PPSSPP
FOLDERGOLD=~/storage/shared/Android/data/org.ppsspp.ppssppgold
if [ -d "$FOLDER" ] || [ -d "$FOLDERGOLD" ]; then
	hasPPSSPP=true
fi
#duckstation
FOLDER=~/storage/shared/duckstation
if [ -d "$FOLDER" ]; then
	hasDuckstation=true
fi
#Drastic
FOLDER=~/storage/shared/DraStic
if [ -d "$FOLDER" ]; then
	hasDrastic=true
fi
#Dolphin
FOLDER=~/storage/shared/mmjr2-vbi
if [ -d "$FOLDER" ]; then
	hasDolphinMMJ=true
fi

clear
echo "### Checking emulators "  &>> ~/storage/shared/pegasus_installer_log.log
echo -e ""
echo -e "Checking for installed emulators..."
echo -e ""
#Common emulators

echo -ne "Retroarch..."
if [ $hasRetroArch == true ]; then
	echo -e  "${GREEN}Installed${NONE}"
else
	echo -e  "${RED}Not installed${NONE}"
fi
echo -ne "PSP - PPSSPP..."
if [ $hasPPSSPP == true ]; then
	echo -e  "${GREEN}Installed${NONE}"
else
	echo -e  "${RED}Not installed${NONE}"
fi
echo -ne "Playstation - Duckstation..."
if [ $hasDuckstation == true ]; then
	echo -e  "${GREEN}Installed${NONE}"
else
	echo -e  "${RED}Not installed${NONE}"
fi
echo -ne "Nintendo DS - Drastic..."
if [ $hasDrastic == true ]; then
	echo -e  "${GREEN}Installed${NONE}"
else
	echo -e  "${RED}Not installed${NONE}"
fi


#Only ODIN & ANDROID
if [[ $handheldModel == "ODIN" ]] || [[ $handheldModel == "ANDROID" ]]; then
	echo "### Emus only for ODIN $ Android "  &>> ~/storage/shared/pegasus_installer_log.log
	echo -ne "PS2 - netherSX2..."
	if [ $hasAether == true ]; then
		echo -e  "${GREEN}Installed${NONE}"
	else
		echo -e  "${RED}Not installed${NONE}"
	fi		
	echo -ne "3DS - Azahar..."
	if [ $hasCitra == true ]; then
		echo -e  "${GREEN}Installed${NONE}"
	else
		echo -e  "${RED}Not installed${NONE}"
	fi
	echo -ne "Nintendo Wii & GameCube - Dolphin..."
	if [ $hasDolphinMMJ == true ]; then
		echo -e  "${GREEN}Installed${NONE}"
	else
		echo -e  "${RED}Not installed${NONE}"
	fi
	echo ""		

fi

#Only on Rp2+
if [[ $handheldModel == "RP2+" ]]; then	
	echo "### RP2+ Only Emus "  &>> ~/storage/shared/pegasus_installer_log.log	
	echo -ne "Nintendo Wii & GameCube - Dolphin MMJR2..."
	if [ $hasDolphinMMJ == true ]; then
		echo -e  "${GREEN}Installed${NONE}"
	else
		echo -e  "${RED}Not installed${NONE}"
	fi
	echo ""		
fi

#Only on RG552 or Android
if [[ $handheldModel == "RG552" ]] || [[ $handheldModel == "ANDROID" ]]; then
	echo "### RG552 & Android only Emus "  &>> ~/storage/shared/pegasus_installer_log.log
	echo -ne "Nintendo 64 - Mupen 64 Plus..."
	if [ $hasMupen == true ]; then
		echo -e  "${GREEN}Installed${NONE}"
	else
		echo -e  "${RED}Not installed${NONE}"
	fi
	echo -ne "Dreamcast - ReDream..."
	if [ $hasRedDream == true ]; then
		echo -e  "${GREEN}Installed${NONE}"
	else
		echo -e  "${RED}Not installed${NONE}"
	fi
	echo -ne "Saturn - Yaba Sanshiro 2 Pro..."
	if [ $hasYaba == true ]; then
		echo -e  "${GREEN}Installed${NONE}"
	else
		echo -e  "${RED}Not installed${NONE}"
	fi	
fi
echo -e ""
echo -e "We're going to download all missing emulators."
echo -e "${BOLD}Remember to open every emulator right after installing it and to grant them folder permissions.${NONE}"
echo -e "Come back in here after every installation to continue the installation."
echo -e  "Press the ${RED}A button${NONE} to install the missing emulators."
read pause
clear
echo "### Downloading missing emus start "  &>> ~/storage/shared/pegasus_installer_log.log

#We prevent to download some emulators

if [[ $handheldModel == "ODIN" ]]; then
	hasRedDream=true
	hasYaba=true
fi

if [[ $handheldModel == "RP2+" ]]; then
	hasCitra=true
fi

if [[ $handheldModel == "RG552" ]]; then
	hasCitra=true
	hasAether=true
fi

if [ $hasRetroArch == false ]; then
	echo -e "Multisystem - RetroArch..."
	echo ""
	wget  -q --show-progress https://buildbot.libretro.com/stable/1.21.0/android/RetroArch.apk -P ~/storage/shared/
	echo ""
	echo -e "We need to install RetroArch before we can continue..."
	echo -e  "When RetroArch is installed open your home folder in a file browser, then click the file. Then click ${BOLD}OPEN${NONE} in the installation window so RetroArch is opened."
	echo -e  "Wait for Retroarch files to be downloaded, then quit Retroarch and come back here."
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause
fi

if [ $hasRedDream == false ]; then
	echo -e "Dreamcast - Redream..."	
	termux-open "https://play.google.com/store/apps/details?id=io.recompiled.redream"
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	
fi
if [ $hasDolphinMMJ == false ]; then
	echo -e "Nintendo Wii & GameCube - Dolphin MMJR2..."
	wget  -q --show-progress https://github.com/Medard22/Dolphin-MMJR2-VBI/releases/download/U24.07.02-2407/Dolphin.MMJR2-VBI-U24.07.02-2407.apk -P ~/storage/shared/
	echo -e  "Open your file browser in the home folder."		
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause
fi

if [ $hasYaba == false ]; then
	echo -e "Saturn - Yaba Sanshiro 2 Pro..."
	termux-open "https://play.google.com/store/apps/details?id=org.devmiyax.yabasanshioro2"
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause
fi
if [ $hasMupen == false ]; then
	echo -e "Nintendo 64 - Mupen 64 Plus..."
	termux-open "https://play.google.com/store/apps/details?id=org.mupen64plusae.v3.fzurita"
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause
fi
if [ $hasPPSSPP == false ]; then
	echo -e "PSP - PPSSPP..."
	termux-open "https://play.google.com/store/apps/details?id=org.ppsspp.ppsspp"
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause
fi
if [ $hasDuckstation == false ]; then
	echo -e "Playstation - Duckstation..."	
	termux-open "https://play.google.com/store/apps/details?id=com.github.stenzek.duckstation"
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause
fi
if [ $hasAether == false ]; then
	echo -e "Playstation2 - AetherSX2..."	
	wget  -q --show-progress https://github.com/Trixarian/NetherSX2-patch/releases/download/2.2b/NetherSX2-v2.2b-4248.apk -P ~/storage/shared/
	echo -e  "Open your file browser in the home folder."
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause
fi
if [ $hasDrastic == false ]; then
	echo -e "Nintendo DS - Drastic..."
	wget  -q --show-progress https://archive.org/download/com.dsemu.drastic_r2.6.0.4a-109_minapi14armeabi-v7anodpi_apkmirror.com/com.dsemu.drastic_r2.6.0.4a-109_minAPI14%28armeabi-v7a%29%28nodpi%29_apkmirror.com.apk -P ~/storage/shared/
	echo -e  "Open your file browser in the home folder."
	echo -e  "Press the ${RED}A button${NONE} to install the next emulator"
	read pause
fi
if [ $hasCitra == false ]; then
	echo -e "Nintendo 3DS - Azahar..."		
	termux-open "https://play.google.com/store/apps/details?id=io.github.lime3ds.android"
	echo -e  "Press the ${RED}A button${NONE} to install Azahar"
	read pause				
fi

echo "### Downloading missing emulator finish "  &>> ~/storage/shared/pegasus_installer_log.log
		
echo -e  "Emulators installed."
echo -e "Press the ${RED}A button${NONE} to continue"
read pause
