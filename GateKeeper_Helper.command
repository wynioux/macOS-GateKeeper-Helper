#!/bin/bash
# Bash Menu Script Example
RED='\033[0;31m'
GRN='\033[0;32m'
BLU='\033[0;34m'
NC='\033[0m'
echo ""
echo ""
echo -e "GateKeeper Helper ${BLU}wynioux${NC}"
echo -e "Check this out: ${BLU}https://wynioux.github.io ${NC}"
echo ""
echo ""
PS3='Please enter your choice: '
options=("Disable Your GateKeeper" "Enable Your GateKeeper" "Allow Single App To ByPass The GateKeeper" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Disable Your GateKeeper")
			echo ""
			echo -e "${GRN}You Chose To Disable Your GateKeeper${NC}"
			echo ""
			echo -e "${RED}Plaese Insert Your Password To Procceed${NC}"
			echo ""
			sudo spctl --master-disable
			break
			;;
		"Enable Your GateKeeper")
			echo ""
			echo -e "${GRN}You Chose To Enable Your GateKeeper${NC}"
			echo ""
			echo -e "${RED}Plaese Insert Your Password To Procceed${NC}"
			echo ""
			sudo spctl --master-enable
			break
			;;
		"Allow Single App To ByPass The GateKeeper")
			echo ""
			echo -e "${GRN}You Chose To Allow Single App To ByPass The GateKeeper${NC}"
			echo ""
			read -e -p "Drag & Drop The App Here Then Hit Return: " FILEPATH
			echo ""
			echo -e "${RED}Plaese Insert Your Password To Procceed${NC}"
			echo ""
			sudo xattr -rd com.apple.quarantine "$FILEPATH"
			break
			;;
		"Quit")
			break
			;;
		*) echo "invalid option $REPLY";;
	esac
done