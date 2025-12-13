#!/bin/bash
# Author: JaZeeGH
# Description: This is the view script of the Car Manager Application.
# The script can show all available vehicle records from the database if there is any available.

# Defines the vehicle database file
database="./data/cars.db"

# Check if the database file exists
if [ ! -e "$database" ]; then
	# If the file doesn't exist, print a warning message in red
	printf "\n\n\033[31;1mThere are no vehicle records available \033[0m \n\n"

	# Ask user whether to return to the Main Menu after the function
	printf "\n\n\033[33mDo you want to return to the Main Menu? (yes or no)\033[0m"
	printf "\n\033[95mIf you choose no the program will exit.\033[0m\n\n"
	printf "Enter your choice here: "

	# Reads the response of the customer
	read word

	case $word in

	# If the user enters 'y', 'Y', 'yes', or 'Yes'
	[yY] | [yY][Ee][Ss])
		# Print a colored message and return to the main menu script
		printf "\n\n\033[33mReturning To Main Menu.\033[0m \n\n"
		./controllers/mainmenu.sh
		exit 0
		;;

	# If the user enters 'n', 'N', 'no', or 'No'
	[nN] | [nN][Oo])
		# Print a goodbye message in purple and exit the script
		printf "\n\033[95mThank you for using the application. Good Bye! \033[0m \n\n"
		exit 0
		;;
	*)
		# For any other input, print an error message
		printf "\033[31mInvalid input\033[0m\n\n"
		;;
	esac
else
	# Otherwise the database exists and a colored table will be displayed
	awk '
        BEGIN {
            # Header
            printf "\n\033[34m%-15s %-15s %-15s %-15s %-15s %-15s\033[0m\n", "Registration", "Make", "Model", "Year", "Mileage", "Price";
			print "----------------------------------------------------------------------------------------------";
        }
        {
            printf "\n\033[36m%-15s %-15s %-15s %-15s %-15s %-15s\033[0m", $1, $2, $3, $4, $5 "km", "€" $6;
        }
        END {
            # Footer
            printf "\n\n\033[32m%-s\033[0m\n\n", "---- End of Report ----"
        }
    ' "$database"

	# Ask user whether to return to the Main Menu after the function
	printf "\n\n\033[33mDo you want to return to the Main Menu? (yes or no)\033[0m"
	printf "\n\033[95mIf you choose no the program will exit.\033[0m\n\n"
	printf "Enter your choice here: "

	# Reads the response of the customer
	read word

	case $word in

	# If the user enters 'y', 'Y', 'yes', or 'Yes'
	[yY] | [yY][Ee][Ss])
		# Print a colored message and return to the main menu script
		printf "\n\n\033[33mReturning To Main Menu.\033[0m \n\n"
		./controllers/mainmenu.sh
		;;

	# If the user enters 'n', 'N', 'no', or 'No'
	[nN] | [nN][Oo])
		# Print a goodbye message in purple and exit the script
		printf "\n\033[95mThank you for using the application. Good Bye! \033[0m \n\n"
		exit 0
		;;
	*)
		# For any other input, print an error message
		printf "\033[31mInvalid input\033[0m\n\n"
		;;
	esac
fi
