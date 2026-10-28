#!/usr/bin/env bash
set -euo pipefail

# Calculate simple interest: (principal * annual rate * time in years) / 100

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time period (years): " time

# Accept non-negative decimal values; reject empty input and non-numeric values.
is_non_negative_number() {
  [[ "$1" =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]]
}

if ! is_non_negative_number "$principal"; then
  echo "Error: principal must be a non-negative number." >&2
  exit 1
fi
if ! is_non_negative_number "$rate"; then
  echo "Error: interest rate must be a non-negative number." >&2
  exit 1
fi
if ! is_non_negative_number "$time"; then
  echo "Error: time period must be a non-negative number." >&2
  exit 1
fi

# awk provides decimal arithmetic without requiring external packages.
interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", (p*r*t)/100 }')
total=$(awk -v p="$principal" -v i="$interest" 'BEGIN { printf "%.2f", p+i }')

printf '\nSimple interest: %s\n' "$interest"
printf 'Total amount:    %s\n' "$total"
