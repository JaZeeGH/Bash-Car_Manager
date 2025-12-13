#!/bin/bash
# Author: JaZeeGH
# Description: This is the Delete Records script of the Car Manager Application.
# This script allows the user to delete car records from the database
# by make, by model, or remove all records entirely.

# Defines the vehicle database file
database="./data/cars.db"

# Check if the database file exists
if [ ! -e $database ]; then

	# If the file doesn't exist, print a warning message in red
	printf "\n\n\e[31;1mThere are no vehicle records available \e[0m \n\n"

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
# Otherwise if the database exists, the user can see the different delete options
else
	# Print the menu title in green and bold
	printf "\n\033[32;1mDelete Records\033[0m\n"

	PS3=$'\n\033[33mPlease select from one of the above options:\033[0m'

	# List of search options displayed to the user
	options=(
		"Delete by Make" "Delete by Model" "Delete All" "Return To Main Menu" "Exit")
	select opt in "${options[@]}"; do
		case $opt in
		"Delete by Make")
			# Print a message confirming the user’s selection
			printf "\n\n\033[32mYou selected to delete vehicles by their make\033[0m\n\n"

			# Prompt for the vehicle make
			echo "Please enter the make of the vehicle you would like to delete: "

			# Reads the response of the customer
			read makeDelete

			# A case-insensitive search for the entered make in the database file
			if grep -iq "$makeDelete" "$database"; then

				# Print matching lines with formatted columns
				grep -i "$makeDelete" "$database" |
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
                    '
				# Confrims whether the user really wants to delete the displayed records.
				printf "\n\nWould you really like to delete the record/s? (yes or no)\n"

				# Reads the response of the customer
				read word

				case $word in

				# If the user enters 'y', 'Y', 'yes', or 'Yes'
				[yY] | [yY][Ee][Ss])

					# Delete the matching records with "sed"
					sed -i "/$makeDelete/I d" $database

					# Once the records have been deleted the program returns to the main menu
					printf "\n\n\033[33mRecords deleted. Returning to Main Menu\033[0m \n\n"
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
					;;
				esac

			else
				# If no matching records were found, print a warning message
				printf "\n\n\033[31;1mThere is no vehicle record with the make you entered.\033[0m\n\n"
			fi
			;;
		"Delete by Model")
			# Print a message confirming the user’s selection
			printf "\n\n\033[32mYou selected to delete vehicles by their model\033[0m\n\n"

			# Prompt for the vehicle model
			echo "Please enter the model of the vehicle you would like to delete: "

			# Reads the response of the customer
			read modelDelete

			# A case-insensitive search for the entered model in the database file
			if grep -iq $modelDelete $database; then

				# Print matching lines with formatted columns
				grep -i $modelDelete $database |
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
                    '

				# Confrims whether the user really wants to delete the displayed records.
				printf "\n\nWould you really like to delete the record/s? (yes or no)\n"

				# Reads the response of the customer
				read word

				case $word in

				# If the user enters 'y', 'Y', 'yes', or 'Yes'
				[yY] | [yY][Ee][Ss])

					# Delete the matching records with "sed"
					sed -i "/$modelDelete/I d" $database

					# Once the records have been deleted the program returns to the main menu
					printf "\n\n\033[33mRecords deleted. Returning to Main Menu\033[0m \n\n"
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
					;;
				esac

			else
				# If no matching records were found, print a warning message
				printf "\n\n\033[31;1mThere is no vehicle record with the make you entered.\033[0m\n\n"
			fi
			;;
		"Delete All")
			# Prints a confirmation in Bold Red whether the user really wants to delete all records.
			printf "\n\n\e[31;1mAre you sure you want to delete all records?(yes or no)\e[0m \n\n"

			read word

			case $word in

			# If the user enters 'y', 'Y', 'yes', or 'Yes'
			[yY] | [yY][Ee][Ss])

				#The application deletes the database file.
				rm -f "$database"

				# Once the file has been deleted the program returns to the main menu
				printf "\n\n\033[33mAll records have been deleted. Returning to Main Menu\033[0m \n\n"
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
fi
