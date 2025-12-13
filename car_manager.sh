#!/bin/bash
# Author: JaZeeGH
# Description: A small, menu-driven Bash program to manage a collection of cars.
# The user can add new records, remove previous records, view all available records
# and also search with different criteria.

# Welcome Message at the start of the program.
printf "\nHello \033[33m$USER\033[0m!\n"
printf "\033[34mToday is $(date).\033[0m\n\n"
printf "\033[32mWelcome to the Car Manager Application.\033[0m\n\n"

# Starts the mainmenu script
./controllers/mainmenu.sh
