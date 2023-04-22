#!/bin/bash

# Check for updates
echo "Checking for updates from GitHub..."
curl -fsSLO https://raw.githubusercontent.com/ras434/cal3/main/cal3.cpp || {
  echo "Failed to fetch the latest cal3.cpp from GitHub. Using local file if it exists."
}
curl -fsSLO https://raw.githubusercontent.com/ras434/cal3/main/install_cal3.sh || {
  echo "Failed to fetch the latest install_cal3.sh from GitHub. Using local file if it exists."
}

# Check for macOS
if [[ "$(uname)" != "Darwin" ]]; then
  echo "This script is intended for macOS only."
  exit 1
fi

# Check for and install Homebrew if not installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check for and install mandoc if not installed
if ! command -v mandoc &>/dev/null; then
  echo "mandoc not found. Installing mandoc..."
  brew install mandoc
fi

# Compile cal3
g++ cal3.cpp -o cal3

# Move the executable to /usr/local/bin
sudo mv cal3 /usr/local/bin

# Move the man page to the appropriate location
sudo mkdir -p /usr/local/share/man/man1
sudo cp cal3.1 /usr/local/share/man/man1

# Update the man page database
brew_prefix="$(brew --prefix)"
makewhatis_path="$(find "$brew_prefix" -type f -name bsdmakewhatis -print -quit)"
if [ -z "$makewhatis_path" ]; then
  echo "makewhatis command not found. Please ensure mandoc is correctly installed."
  exit 1
fi
sudo "$makewhatis_path" /usr/local/share/man
echo "cal3 and its man page have been successfully installed."

