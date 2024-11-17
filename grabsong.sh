#!/bin/bash

download_folder="$HOME/Music"

output=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
    string:"org.mpris.MediaPlayer2.Player" string:"Metadata")

spotify_url=$(echo "$output" | grep -A 1 "xesam:url" | tail -n 1 | awk -F '"' '{print $2}')

if [[ -n $spotify_url ]]; then
    echo "Starting download with spotdl..."
    
    spotdl --output "$download_folder/" "$spotify_url"

else
    echo "No Spotify track currently playing or URL not found."
fi
