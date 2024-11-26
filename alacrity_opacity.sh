
#!/bin/bash

CONFIG_FILE="$HOME/.config/alacritty/alacritty.toml"

DEFAULT_THRESHOLD=0.01

if [ "$1" == "i" ]; then
  THRESHOLD=$DEFAULT_THRESHOLD
elif [ "$1" == "d" ]; then
  THRESHOLD=-$DEFAULT_THRESHOLD
else
  echo "Usage: $0 {i|d}"
  exit 1
fi

CURRENT_OPACITY=$(grep -Eo 'opacity = [0-9]*\.[0-9]+' "$CONFIG_FILE" | awk '{print $3}')

if [ -z "$CURRENT_OPACITY" ]; then
  CURRENT_OPACITY=1.0
fi

NEW_OPACITY=$(echo "$CURRENT_OPACITY + $THRESHOLD" | bc)

if (( $(echo "$NEW_OPACITY > 1.0" | bc -l) )); then
  NEW_OPACITY=1.0
elif (( $(echo "$NEW_OPACITY < 0.0" | bc -l) )); then
  NEW_OPACITY=0.0
fi

NEW_OPACITY=$(printf "%.2f" $NEW_OPACITY)

sed -i "s/opacity = .*/opacity = $NEW_OPACITY/" "$CONFIG_FILE"

echo "Opacity updated to $NEW_OPACITY"

