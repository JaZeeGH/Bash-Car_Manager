# Bash Car Manager

A small, portable Bash-based car manager utility that provides a simple CLI for managing a collection of cars (add, remove, list, update, and simple actions). This repository contains Bash scripts intended to be lightweight, dependency-free (POSIX sh / Bash), and easy to extend.

## Features

- Add and remove car entries
- List and search cars
- Edit car properties (make, model, year, mileage)
- Plain-text storage (CSV or simple file-based DB) for portability
- Creating Backup of the simple DB
- Menu-driven CLI suitable for small demos, learning Bash scripting, or quick local tooling

## Requirements

- Bash (or POSIX-compliant shell). Tested with Bash 4.x+.
- Basic Unix command-line utilities: awk, sed, grep, cut, printf, mkdir, rm (usually available on Linux/macOS).
- No external packages required.

## Installation

1. Clone the repository:
   git clone https://github.com/JaZeeGH/Bash-Car_Manager.git

2. Enter the project directory:
   cd Bash-Car_Manager

3. Make the main script executable (replace `car_manager.sh` with the actual script filename if different):
   chmod +x car_manager.sh

4. (Optional) Move it to a location on your PATH:
   sudo mv car_manager.sh /usr/local/bin/car-manager

## Usage

Basic usage (from the project directory):
./car_manager.sh

Or, if installed to PATH:
car-manager

Typical commands/menu options (these may vary depending on the script implementation):

- Add a car:
  ./car_manager.sh add
  # or
  ./car_manager.sh add --make "Toyota" --model "Corolla" --year 2015 --mileage 72000

- List cars:
  ./car_manager.sh list
  ./car_manager.sh list --filter "owner:Alice"

- View a car:
  ./car_manager.sh view <car-id>

- Update a car:
  ./car_manager.sh update <car-id> --mileage 73000

- Remove a car:
  ./car_manager.sh remove <car-id>

- Mark serviced / sold:
  ./car_manager.sh action <car-id> --mark serviced

If the repository provides an interactive menu, running the script without arguments will open that menu.

## Data storage

This project stores records in a simple text/CSV file (e.g., data/cars.db or cars.csv). The format is intentionally simple for readability and easy manipulation with standard text tools.

Suggested columns:
- id, make, model, year, mileage

Back up the data file before bulk editing:
cp data/cars.db data/cars.db.bak

## Configuration

- Data directory: data/ (create if missing)
- Data file: data/cars.db (or cars.csv)
- Edit configuration variables near the top of the main script to change paths or defaults (e.g., DB_FILE, DATE_CMD).

## Examples

Add a car using CLI flags (example):
./car_manager.sh add --regNumber "00-D-0000" --make "Ford" --model "Mustang" --year 1967 --mileage 120000"

List and filter:
./car_manager.sh list | grep Mustang

Export to CSV (if provided):
./car_manager.sh export --format csv > /tmp/export.csv

## Extending / Development

- Add new actions by creating new functions in the script and wiring them into the command/menu dispatcher.
- Consider splitting logic into multiple files for maintainability (e.g., lib/io.sh, lib/db.sh, lib/actions.sh).
- Add unit-style tests by writing small shell test scripts and/or using bats (Bash Automated Testing System) if you want automated testing.

## Troubleshooting

- Permission denied when running: ensure the script is executable (chmod +x car_manager.sh).
- Missing commands: ensure required utilities (awk, sed, grep) are installed and available on PATH.
- Corrupt data: restore from data/cars.db.bak if present.

## Contributing

Contributions are welcome. A typical workflow:

1. Fork the repo.
2. Create a feature branch (git checkout -b feature/my-change).
3. Make changes and test locally.
4. Submit a PR with a clear description of the change.

Please follow shell scripting best practices and keep changes simple and well-documented. If you add new features that modify the data format, include a migration step or document the change.

## License

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Replace YEAR and Your Name with the appropriate values and add a LICENSE file.

## Contact

Maintainer: JaZeeGH
GitHub: https://github.com/JaZeeGH