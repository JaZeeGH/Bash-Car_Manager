#!/bin/bash
# Author: Jason G Hajdics - W20114849
# Description: This is the Backup script of the Car Manager Application.
# This script allows the user to back up car records of the database,
# restore the backup or delete the backup.

# Defines the database backup location
backupfolder="./data/backup/"
# Defines the backup file
backup="./data/backup/cars.backup.db"

# Defines the vehicle database file
database="./data/cars.db"

# Print the menu title in green and bold
printf "\n\033[32;1mBackup Menu\033[0m\n"

PS3=$'\n\033[33mPlease select from one of the above options:\033[0m'

# List of search options displayed to the user
options=("Create Backup" "Restore Backup" "Delete Backup" "Return To Main Menu" "Exit")
select opt in "${options[@]}"; do
	case $opt in
	"Create Backup")
		if [ ! -e $database ]; then

			# If the file doesn't exist, print a warning message in red
			printf "\n\n\e[31;1mThere are no vehicle records available to backup\e[0m \n\n"

			# Ask user whether to return to the Backup Menu after the function
			printf "\n\n\033[33mDo you want to return to the Backup Menu? (yes or no)\033[0m"
			printf "\n\033[95mIf you choose no the program will exit.\033[0m\n\n"
			printf "Enter your choice here: "

			# Reads the response of the customer
			read word

			case $word in

			# If the user enters 'y', 'Y', 'yes', or 'Yes'
			[yY] | [yY][Ee][Ss])
				# Print a colored message and return to the backup menu script
				printf "\n\n\033[33mReturning To Backup Menu.\033[0m \n\n"
				./controllers/backup.sh
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
			# Creates the backup folder if it does not exist
			mkdir -p "$backupfolder"

			# Creates an automatic backup of the database file with the date and time at the time of backup creation
			cp "$database" "$backup"

			# Prints a confirmation in Green for the user that the backup has been created
			printf "\n\n\033[33mBackup has been created. Returning to the Backup Menu\033[0m \n\n"
			./controllers/backup.sh
			exit 0
		fi
		;;
	"Restore Backup")
		if [ ! -e $backup ]; then

			# If the file doesn't exist, print a warning message in red
			printf "\n\n\e[31;1mThere is no backup available to restore \e[0m \n\n"

			# Ask user whether to return to the Backup Menu after the function
			printf "\n\n\033[33mDo you want to return to the Backup Menu? (yes or no)\033[0m"
			printf "\n\033[95mIf you choose no the program will exit.\033[0m\n\n"
			printf "Enter your choice here: "

			# Reads the response of the customer
			read word

			case $word in

			# If the user enters 'y', 'Y', 'yes', or 'Yes'
			[yY] | [yY][Ee][Ss])
				# Print a colored message and return to the backup menu script
				printf "\n\n\033[33mReturning To Backup Menu.\033[0m \n\n"
				./controllers/backup.sh
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
			# Restores the data of the backup file with overwriting the database file
			cp "$backup" "$database"

			# Prints a confirmation in Green for the user that the backup has been created
			printf "\n\n\033[33mBackup has been restored. Returning to the Backup Menu\033[0m \n\n"
			./controllers/backup.sh
			exit 0
		fi
		;;
	"Delete Backup")
		# Prints a confirmation in Bold Red whether the user really wants to delete all backup files.
		printf "\n\n\e[31;1mAre you sure you want to delete all backup files?(yes or no)\e[0m \n\n"

		read word

		case $word in

		# If the user enters 'y', 'Y', 'yes', or 'Yes'
		[yY] | [yY][Ee][Ss])

			#The application deletes the backup folder.
			rm -f $backup

			# Once the backup has been deleted the program returns to the main menu
			printf "\n\n\033[33mAll backup files have been deleted. Returning to Main Menu\033[0m \n\n"
			./controllers/mainmenu.sh
			exit 0
			;;

		# If the user enters 'n', 'N', 'no', or 'No'
		[nN] | [nN][Oo])
			# The program restart the Delete Records script
			printf "\n\n\e[31;1mCancelled Deletion! \033[32mChoose another Option!\033[0m\n\n"
			./controllers/delete.sh
			exit 0
			;;
		*)
			# For any other input, print an error message
			printf "\033[31mInvalid input\033[0m\n\n"
			./controllers/delete.sh
			exit 0
			;;
		esac
		;;
	"Return To Main Menu")
		# If selected the program returns to the Main Menu
		printf "\n\n\033[33mReturning To Main Menu.\033[0m \n\n"
		./controllers/mainmenu.sh
		exit 0
		;;
	"Exit")
		# If selected the program exits completely
		printf "\n\033[95mThank you for using the application. Good Bye! \033[0m \n\n"
		exit 0
		;;
	*)
		# For any other input, print an error message
		printf "\n\e[31;1mInvalid option. Please try again. \e[0m\n"
		;;
	esac
done
