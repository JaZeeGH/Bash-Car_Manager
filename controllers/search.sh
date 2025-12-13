#!/bin/bash
# Author: JaZeeGH
# Description: This is the search script of the Car Manager Application.
# The user can search for vehicles with entering make or model or looking for specific milage range.

# Defines the vehicle database file
database="./data/cars.db"

# Check if the database file exists
if [ ! -e $database ]; then

	# If the file doesn't exist, print a warning message in red
	printf "\n\n\033[31;1mThere are no vehicle records available \e[0m \n\n"

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
	# Print the menu title in green and bold
	printf "\n\033[32;1mSearch Menu\033[0m\n"
	PS3=$'\n\033[33mPlease select from one of the above options:\033[0m'

	# List of search options displayed to the user
	options=("Search by Make" "Search by Model" "Search by Mileage" "Return To Main Menu" "Exit")
	select opt in "${options[@]}"; do
		case $opt in
		"Search by Make")
			# Print a message confirming the user’s selection
			printf "\n\n\033[32mYou selected to search for vehicles by their make.\033[0m\n\n"

			# Prompt for the vehicle make
			echo "Please enter the make of the vehicle you are looking for: "
			read makeSearch

			# A case-insensitive search for the entered make in the database file
			if grep -iq "$makeSearch" "$database"; then

				# Print matching lines with formatted columns
				grep -i "$makeSearch" "$database" |
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
			else
				# If no matches found, print a warning message
				printf "\n\n\033[31;1mThere is no vehicle record with the make you entered.\033[0m\n\n"
			fi
			break
			;;
		"Search by Model")
			# Print a message confirming the user’s selection
			printf "\n\n\033[32mYou selected to search for vehicles by their model.\033[0m\n\n"

			# Prompt for the vehicle model
			echo "Please enter the model of the vehicle you are looking for: "
			read modelSearch

			# A case-insensitive search for the entered model in the database file
			if grep -iq "$modelSearch" "$database"; then

				grep -i "$modelSearch" "$database" |
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
			else
				# If no matches found, print a warning message
				echo -n "There is no vehicle record with the model you entered. "
			fi
			break
			;;
		"Search by Mileage")
			# Print a message confirming the user’s selection
			printf "\n\n\033[32mYou selected to search for vehicles by Mileage.\033[0m\n\n"

			# Prompt for minimum mileage
			echo "Please enter the minimum mileage in km (please only enter digits): "
			read -r minMileage
			minMileage="${minMileage//[^0-9]/}"

			# Prompt for maximum mileage
			echo "Please enter the maximum mileage in km: (please only enter digits): "
			read -r maxMileage
			maxMileage="${maxMileage//[^0-9]/}"

			# Use awk to search the database file for entries within the mileage range
			awk -v min="$minMileage" -v max="$maxMileage" '
			BEGIN {
    			# Header
				printf "\n\033[34m%-15s %-15s %-15s %-15s %-15s %-15s\033[0m\n", "Registration", "Make", "Model", "Year", "Mileage", "Price";
				print "----------------------------------------------------------------------------------------------";
			}
			{
    			mileage = $5
    			if (mileage >= min && mileage <= max) {
				printf "\n\033[36m%-15s %-15s %-15s %-15s %-15s %-15s\033[0m", $1, $2, $3, $4, $5 "km", "€" $6;
    			}
			}
			END {
				printf "\n\n\033[32m%-s\033[0m\n\n", "---- End of Report ----"
			}' "$database"
			break
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

	# Ask user whether to return to the Search Menu after the function
	printf "\n\n\033[33mDo you want to return to the Search Menu? (yes or no)\033[0m"
	printf "\n\033[95mIf you choose no the program will exit.\033[0m\n\n"
	printf "Enter your choice here: "
	read word

	case $word in

	# If the user enters 'y', 'Y', 'yes', or 'Yes'
	[yY] | [yY][Ee][Ss])
		# Print a colored message and return to the start of the search menu script
		printf "\n\n\033[33mReturning To Search Menu.\033[0m \n\n"
		./controllers/search.sh
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
fi
