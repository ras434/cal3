#!/bin/bash

CURRENT_VERSION="1.0.0"  # Replace with the actual version defined in cal3.cpp
GITHUB_VERSION=$(curl -fsS https://raw.githubusercontent.com/ras434/cal3/main/version.txt)

if [[ -z "$GITHUB_VERSION" ]]; then
  # Failed to fetch the version from GitHub, continue silently
  exit 0
fi

if [[ "$CURRENT_VERSION" != "$GITHUB_VERSION" ]]; then
  echo "Update available for cal3:"
  echo "Current version: $CURRENT_VERSION"
  echo "Latest version: $GITHUB_VERSION"
  echo "To update, run the install_cal3.sh script again or follow the instructions in the README.md"
fi

