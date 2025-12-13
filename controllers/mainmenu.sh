#!/bin/bash
# Author: JaZeeGH
# Description: This is the Main Menu script of the Car Manager Application.
# The user can make a selection whether to add new records, delete records, view records or search records.
# The user can also backup existing data. After the user made their choice the matching script will start.

# Print the menu title in green and bold
printf "\n\033[32;1mMain Menu\033[0m\n"
PS3=$'\n\033[33mPlease select from one of the above options:\033[0m'

# List of menu options displayed to the user
options=("Add New Cars" "Delete Cars" "List Cars" "Search Cars" "Backup" "Exit")
select opt in "${options[@]}"; do
	case $opt in
	# Option 1 — Add a new car record
	"Add New Cars")
		printf "\n\n\033[32mYou selected to add a new record.\033[0m\n\n"
		./controllers/add.sh
		break
		;;
	# Option 2 — Delete an existing car record
	"Delete Cars")
		printf "\n\n\033[32mYou selected to remove one or more record/s.\033[0m\n\n"
		./controllers/delete.sh
		break
		;;
	# Option 3 — List all car records
	"List Cars")
		./controllers/view.sh
		break
		;;
	# Option 4 — Search cars by different criteria
	"Search Cars")
		printf "\n\n\033[32mYou selected to search for cars.\033[0m\n\n"
		./controllers/search.sh
		break
		;;
	# Option 5 — Open Backup Options
	"Backup")
		printf "\n\n\033[32mYou selected to backup data.\033[0m\n\n"
		./controllers/backup.sh
		break
		;;
	# Option 6 — Exit the program
	"Exit")
		printf "\n\033[95mThank you for using the application. Good Bye! \033[0m \n\n"
		exit 0
		;;
	# Invalid input handling
	*)
		printf "\n\e[31;1mInvalid option. Please try again. \e[0m\n"
		;;
	esac
done
