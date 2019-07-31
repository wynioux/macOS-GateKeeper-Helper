#!/bin/bash
# Bash Menu Script Example
RED='\033[0;31m'
GRN='\033[0;32m'
BLU='\033[0;34m'
NC='\033[0m'
echo ""
echo -e "GateKeeper Helper ${BLU}wynioux${NC}"
echo -e "Check my page: ${BLU}https://wynioux.github.io ${NC}"
echo ""
echo -e "${GRN}Options 1: Disable Your GateKeeper${NC}"
echo -e "${RED}Means:${NC} You can completely disable your gatekeeper -> Good For Professional User."
echo ""
echo -e "${GRN}Options 2: Enable Your GateKeeper${NC}"
echo -e "${RED}Means:${NC} You can completely enable your gatekeeper -> Good For Newbie User."
echo ""
echo -e "${GRN}Options 3: Allow Single App To ByPass The GateKeeper${NC}"
echo -e "${RED}Means:${NC} If you don't want to completely disable your gatekeeper then allow an"
echo -e "individual app to pass it -> Recommended For All Users."
echo ""
echo -e "${GRN}Options 4: Self-Sign An App${NC}"
echo -e "${RED}Means:${NC} If you don't want to disable SIP and your app is quite unexpectedly especially"
echo -e "under the recent macOS then try to Self-Sign your app using this option."
echo ""
PS3='Please enter your choice: '
options=("Disable Your GateKeeper" "Enable Your GateKeeper" "Allow Single App To ByPass The GateKeeper" "Self-Sign An App" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Disable Your GateKeeper")
			echo ""
			echo -e "${GRN}You Choose To Disable Your GateKeeper${NC}"
			echo ""
			echo -e "${RED}Plaese Inseret Your Password To Procceed${NC}"
			echo ""
			sudo spctl --master-disable
			break
			;;
		"Enable Your GateKeeper")
			echo ""
			echo -e "${GRN}You Choose To Enable Your GateKeeper${NC}"
			echo ""
			echo -e "${RED}Plaese Inseret Your Password To Procceed${NC}"
			echo ""
			sudo spctl --master-enable
			break
			;;
		"Allow Single App To ByPass The GateKeeper")
			echo ""
			echo -e "${GRN}You Choose To Allow Single App To ByPass The GateKeeper${NC}"
			echo ""
			read -e -p "Drag & Drop The App Here Then Hit Return: " FILEPATH
			echo ""
			echo -e "${RED}Plaese Inseret Your Password To Procceed${NC}"
			echo ""
			sudo xattr -rd com.apple.quarantine "$FILEPATH"
			break
			;;
		"Self-Sign An App")
			echo ""
			echo -e "${GRN}You Choose To Self-Sign An App${NC}"
			echo ""
			read -e -p "Drag & Drop The App Here Then Hit Return: " FILEPATH
			echo ""
			echo -e "${RED}Plaese Inseret Your Password To Procceed${NC}"
			echo ""
			sudo codesign -f -s - --deep "$FILEPATH"
			echo ""
			echo -e "${RED}If you see - replacing existing signature - that means you are DONE!${NC}"
			echo ""
			echo -e "${RED}Otherwise there is something wrong with the app or its path${NC}"
			echo ""
			break
			;;
		"Quit")
			break
			;;
		*) echo "invalid option $REPLY";;
	esac
done