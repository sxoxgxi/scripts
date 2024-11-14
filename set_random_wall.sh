#!/bin/bash

WALLPAPER_DIR="$HOME/Downloads/Others/.local_database/.img_db"

DEFAULT_WALLPAPER="$HOME/Pictures/Backgrounds/basement.jpg"

if [ -n "$1" ]; then
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.webp" \) | shuf -n 1)
else
    WALLPAPER="$DEFAULT_WALLPAPER"
fi

gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER"

