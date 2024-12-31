# Leave Calculation Script

This is a simple bash script that calculates the number of workdays of leave based on a given number of hours and minutes. The script allows you to input the time in the format `HH:MM` and outputs the equivalent number of workdays of leave.

The script assumes a standard workday duration of **7 hours and 36 minutes** by default. You can also specify a custom workday length using the `-w` or `--workday` parameter.

## Features

- Accepts leave time in `HH:MM` format via the `-t` or `--time` option.
- Allows customization of workday duration using the `-w` or `--workday` option (default is 7:36).
- Provides a helpful usage guide with the `-h` or `--help` option.
- Performs basic input validation and error handling.

## Usage

Command-Line Options

- `-t TIME, --time TIME`: Specify the leave time in `HH:MM` format, where `HH` is hours and `MM` is minutes.
- `-w WORKDAY, --workday WORKDAY`: Specify the custom workday duration in `HH:MM` format (default is 7:36).
- `-h, --help`: Display the usage information and options.

### Example Usage

1. **Calculate workdays of leave**:

   To calculate the number of workdays for 163 hours and 49 minutes of leave using the default workday length of 7:36, run:

   ./leave-calc.sh -t 163:49

   Output:
   You have 21.90 workdays of leave.

2. **Use a custom workday length**:

   To calculate the number of workdays for 163 hours and 49 minutes of leave with a custom workday length of 8:00 (8 hours), run:

   ./leave-calc.sh -t 163:49 -w 08:00

   Output:
   You have 20.38 workdays of leave.

3. **Show help message**:

   To display the usage information, run:

   ./leave-calc.sh -h

   Output:
   Usage: ./leave-calc.sh [-t TIME] [--time TIME] [-w WORKDAY] [--workday WORKDAY]
   Options:
   -t, --time TIME Time in the format HH:MM, where HH is hours and MM is minutes.
   -w, --workday WORKDAY Custom workday duration in the format HH:MM (default is 7:36).
   -h, --help Show this help message.

## Script Logic

- The script defines a standard workday of **7 hours and 36 minutes** by default.
- If the `-w` or `--workday` option is provided, the workday duration can be customized.
- Both the leave time and the workday duration are converted into minutes.
- The script then divides the total leave time in minutes by the total workday minutes to calculate the equivalent number of workdays of leave.
- If the user does not provide a valid time format or the required argument, the script will display an error message.

## Requirements

This script is written in **Bash** and requires a Unix-like environment to run (e.g., Linux, macOS, or Windows with WSL).

License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
