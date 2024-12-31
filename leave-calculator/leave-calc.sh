#!/bin/bash

# Function to display help message
show_help() {
    echo "Usage: $0 [-t TIME] [--time TIME] [-w WORKDAY] [--workday WORKDAY]"
    echo "Options:"
    echo "  -t, --time    TIME        Time in the format HH:MM, where HH is hours and MM is minutes."
    echo "  -w, --workday WORKDAY    Custom workday duration in the format HH:MM (default is 7:36)."
    echo "  -h, --help              Show this help message."
    exit 0
}

# Default workday duration (7 hours 36 minutes)
workday_hours=7
workday_minutes=36

# Parse command-line options
while [[ $# -gt 0 ]]; do
    case "$1" in
    -h | --help)
        show_help
        ;;
    -t | --time)
        if [[ -z "$2" ]]; then
            echo "Error: Missing argument for -t/--time"
            exit 1
        fi
        TIME="$2"
        shift 2
        ;;
    -w | --workday)
        if [[ -z "$2" ]]; then
            echo "Error: Missing argument for -w/--workday"
            exit 1
        fi
        WORKDAY="$2"
        # Parse workday duration
        IFS=":" read -r workday_hours workday_minutes <<<"$WORKDAY"
        shift 2
        ;;
    *)
        echo "Unknown option: $1"
        show_help
        ;;
    esac
done

# Check if time is provided
if [[ -z "$TIME" ]]; then
    echo "Error: Time argument (-t or --time) is required."
    exit 1
fi

# Parse hours and minutes from the provided time string
IFS=":" read -r leave_hours leave_minutes <<<"$TIME"

# Check if both leave_hours and leave_minutes are valid numbers
if ! [[ "$leave_hours" =~ ^[0-9]+$ ]] || ! [[ "$leave_minutes" =~ ^[0-9]+$ ]]; then
    echo "Error: Invalid time format. Please provide time in the format HH:MM."
    exit 1
fi

# Convert the workday duration to minutes
workday_total_minutes=$((workday_hours * 60 + workday_minutes))

# Convert the leave time to minutes
leave_total_minutes=$((leave_hours * 60 + leave_minutes))

# Calculate the number of workdays of leave
workdays_of_leave=$(echo "scale=2; $leave_total_minutes / $workday_total_minutes" | bc)

# Output the result
echo "You have $workdays_of_leave workdays of leave."
