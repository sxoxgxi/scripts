
#!/bin/bash

CONFIG_FILE="$HOME/.config/alacritty/alacritty.toml"

DEFAULT_THRESHOLD=0.01

if [ "$1" == "i" ]; then
  THRESHOLD=$DEFAULT_THRESHOLD
elif [ "$1" == "d" ]; then
  THRESHOLD=-$DEFAULT_THRESHOLD
elif [ "$1" == "full" ]; then
  NEW_OPACITY=1.0
elif [ "$1" == "reset" ]; then
  NEW_OPACITY=0.9
else
  echo "Usage: $0 {i|d|full|reset}"
  exit 1
fi

# Read the current opacity only if not setting directly
if [ -z "$NEW_OPACITY" ]; then
  CURRENT_OPACITY=$(grep -Eo 'opacity = [0-9]*\.[0-9]+' "$CONFIG_FILE" | awk '{print $3}')

  if [ -z "$CURRENT_OPACITY" ]; then
    CURRENT_OPACITY=1.0
  fi

  # Calculate the new opacity
  NEW_OPACITY=$(echo "$CURRENT_OPACITY + $THRESHOLD" | bc)

  # Clamp the new opacity between 0.0 and 1.0
  if (( $(echo "$NEW_OPACITY > 1.0" | bc -l) )); then
    NEW_OPACITY=1.0
  elif (( $(echo "$NEW_OPACITY < 0.0" | bc -l) )); then
    NEW_OPACITY=0.0
  fi

  NEW_OPACITY=$(printf "%.2f" $NEW_OPACITY)
fi

# Update the configuration file with the new opacity
sed -i "s/opacity = .*/opacity = $NEW_OPACITY/" "$CONFIG_FILE"

echo "Opacity updated to $NEW_OPACITY"
