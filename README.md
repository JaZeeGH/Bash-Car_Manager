# Bash Car Manager

A small, menu-driven Bash program to manage a collection of cars.

This script demonstrates basic Bash constructs—loops, case statements, functions, and user input—and can serve as both a learning example and a starting point for larger CLI tools.

---

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Menu Overview](#menu-overview)
- [Contributing](#contributing)
- [License](#license)

---

## Features

- **Interactive menu:** Navigate using simple numeric choices.
- **CRUD operations:** Add, delete, list, and search cars in your inventory.
- **Flexible search:** Filter by make, model, or mileage.
- **Graceful exit:** Friendly goodbye message on exit.

---

## Installation

Clone the repository:

```sh
git clone https://github.com/JaZeeGH/Bash-Car_Manager.git
cd Bash_Application
```

Make the script executable:

```sh
chmod +x car_manager.sh   # replace with the actual filename if different
```

(Optional) Move it to a directory in your `$PATH`:

```sh
sudo mv car_manager.sh /usr/local/bin/
```

After this, you can launch the program from anywhere with `car_manager.sh`.

---

## Usage

Run the script directly:

```sh
./car_manager.sh
```

Or, if you placed it in `$PATH`:

```sh
car_manager.sh
```

You’ll be presented with the main menu:

```
1) Add New Cars
2) Delete Cars
3) List Cars
4) Search Cars
5) Backup
6) Exit
Please select from one of the following options:
```

Enter the number corresponding to your desired action and press Enter.

---

## Menu Overview

### Add New Cars

- Prompts for Make, Model, Year, and Mileage.
- Stores each record in a plain-text file (`cars.db` by default).

### Delete Cars

- Shows a numbered list of stored cars.
- Choose the index to remove; the file is rewritten without that entry.

### List Cars

- Prints the entire inventory in a tidy table.

### Search Cars

Sub-menu:
```
1) Search by Make
2) Search by Model
3) Search by Mileage
4) Return to Main Menu
5) Exit
```
- Each option filters the database and displays matching rows.
- Selecting 4 returns you to the main menu; 5 exits immediately.

### Backup
```
1) Create Backup
2) Restore Backup
3) Delete Backup
4) Return To Main Menu
5) Exit
```
- Creat a backup file of the database file (`cars.db`)
- Restore the data into `cars.db` 
- Delete the backup file

### Exit

- Displays a farewell message:

  > Thank you for using the application. Good Bye!

- The script terminates cleanly.

---

## Contributing

1. Fork the repository.
2. Create a feature branch:
   ```sh
   git checkout -b my-feature
   ```
3. Commit your changes:
   ```sh
   git commit -am 'Add new feature'
   ```
4. Push the branch:
   ```sh
   git push origin my-feature
   ```
5. Open a Pull Request describing your change.

Please keep the code style consistent (indent with 4 spaces, use `snake_case` for variable names) and add comments for any new functions.

---

## License

MIT License - Please see LICENSE file for additional details