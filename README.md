# cal3

cal3 is a command-line calendar utility that displays a simple calendar with optional highlighted 
dates.

## Installation

To install cal3, run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/ras434/cal3/master/install_cal3.sh | bash
```

## Usage

```
cal3 [options] [month] [year]
```

**Options:**

- `-h, --help`: Display help message and exit.
- `-v, --version`: Display version information and exit.
- `-t, --today`: Highlight today's date in the output.
- `-d, --date DATE`: Highlight the specified date (in `MM-DD` format) in the output.

**Arguments:**

- `month`: The month to display (numeric, 1-12). If not specified, defaults to the current month.
- `year`: The year to display (numeric). If not specified, defaults to the current year.

## Examples

1. Display the current month's calendar:

```bash
cal3
```

2. Display the calendar for a specific month and year:

```bash
cal3 12 2022
```

3. Display the calendar with today's date highlighted:

```bash
cal3 -t
```

4. Display the calendar with a specific date highlighted:

```bash
cal3 -d 12-25
```

5. Display the calendar for a specific month and year with a specific date highlighted:

```bash
cal3 -d 12-25 12 2022
```

