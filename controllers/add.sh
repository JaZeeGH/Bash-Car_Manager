#!/bin/bash
# Author: JaZeeGH
# Description: This is the Add New Records script of the Car Manager Application.
# The user can add new records, can validate whether the entered details
# are correct before saving those to the Car Database.

# Defines the vehicle database file
database="./data/cars.db"

# Check if the database file exists
if [ ! -e $database ]; then
	# Check if it does not exist, create database file
	mkdir -p ./data && touch $database
fi

# Otherwise start the input for a new vehicle record
count=0
while [ $count -lt 4 ]; do

	if [ $count -eq 0 ]; then
		echo "Please enter the Vehicle Registration Number: (please only enter letters and digits)"
		read regNumber
		# Convert all letters to uppercase
		regNumber="${regNumber^^}"
		# Remove all non-alphanumeric characters eg. space, dash etc.
		regNumber="${regNumber//[^A-Z0-9]/}"
		# Checks the entered info is not blank, otherwise a warning is issue and user asked to re-enter
		if ! [ -z "${regNumber}" ]; then
			count=$((count + 1))
		else
			echo "Warning: You cannot enter a blank Vehicle Registration Number"
		fi
		echo "Please enter the vehicle's make: "
		read make
		# This makes the word all lower case and capitalising the first letter.
		make="${make,,}"
		make="${make^}"

		# Checks the entered info is not blank, otherwise a warning is issue and user asked to re-enter
		if ! [ -z "${make}" ]; then
			count=$((count + 1))
		else
			echo "Warning: You cannot enter a blank vehicle's make"
		fi
		echo "Please enter the vehicle's model: "
		read model
		# This makes the word all lower case and capitalising the first letter.
		model="${model,,}"
		model="${model^}"
		# Checks the entered info is not blank, otherwise a warning is issue and user asked to re-enter
		if ! [ -z "${model}" ]; then
			count=$((count + 1))
		else
			echo "Warning: You cannot enter a blank vehicle's model"
		fi
		echo "Please enter the vehicle's manufacturing year (please only enter digits): "
		read manyear
		# Remove all non-numeric characters to make sure we only save digits
		manyear="${manyear//[^0-9]/}"

		# Checks the entered info is not blank, otherwise a warning is issue and user asked to re-enter
		if ! [ -z "${manyear}" ]; then
			count=$((count + 1))
		else
			echo "Warning: You cannot enter a blank manufacturing year"
		fi
		echo "Please enter the vehicle's mileage (please only enter digits): "
		read mileage
		# Remove all non-numeric characters to make sure we only save digits
		mileage="${mileage//[^0-9]/}"
		# Checks the entered info is not blank, otherwise a warning is issue and user asked to re-enter
		if ! [ -z "${mileage}" ]; then
			count=$((count + 1))
		else
			echo "Warning: You cannot enter blank mileage"
		fi
		echo "Please enter the vehicle's price (please only enter digits): "
		read price
		# Remove all non-numeric characters to make sure we only save digits
		price="${price//[^0-9]/}"
		# Checks the entered info is not blank, otherwise a warning is issue and user asked to re-enter
		if ! [ -z "${price}" ]; then
			count=$((count + 1))
		else
			echo "Warning: You cannot enter blank price"
		fi

		# Displays the entered record
		printf "\n\nYou entered the following details: "
		echo $regNumber $make $model $manyear $mileage $price

		# Prompt to whether to save the file or not
		printf "\n\nDo you really want to save these details? (yes or no)\n"

		# Reads the response of the customer
		read word

		case $word in

		# If the user enters 'y', 'Y', 'yes', or 'Yes'
		[yY] | [yY][Ee][Ss])
			# Print a colored message and confirms that the file was saved
			printf "\n\n\033[32mDetails saved\033[0m"
			# Saves the previously entered details in the database file
			echo $regNumber $make $model $manyear $mileage $price >>$database
			;;

		# If the user enters 'n', 'N', 'no', or 'No'
		[nN] | [nN][Oo])
			# Print a colored message and restarts the add new car script
			printf "\n\n\033[33mYou can add another car!\033[0m\n\n"
			./controllers/add.sh
			exit 0
			;;
		*)
			# For any other input, print an error message
			printf "\033[31mInvalid input\033[0m\n\n"
			;;
		esac
	fi
done

# Ask user whether to return to the Main Menu after the function
printf "\n\n\033[33mDo you want to return to the main menu? (yes or no)\033[0m"
printf "\n\033[95mIf you choose no the program will exit.\033[0m\n\n"
printf "Enter your choice here: "
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
