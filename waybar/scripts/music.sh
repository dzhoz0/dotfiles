#!/bin/bash

# Get player status
status=$(playerctl metadata --player=spotify --format '{{lc(status)}}' 2>/dev/null)
icon=""

# Only run if Spotify is running
if [[ $status == "playing" || $status == "paused" ]]; then
    # Get title and artist
    title=$(playerctl metadata --player=spotify --format '{{title}}' 2>/dev/null | sed -E 's/[-(].*//')
    artist=$(playerctl metadata --player=spotify --format '{{artist}}' 2>/dev/null)

    # Trim title and artist if too long
    max_len=40
    if [[ ${#title} -gt $max_len ]]; then
        title="${title:0:$max_len}..."
    fi
    if [[ ${#artist} -gt $max_len ]]; then
        artist="${artist:0:$max_len}..."
    fi

    # Build text depending on status
    if [[ $status == "playing" ]]; then
        text="$title — $artist $icon"
    else
        text=" $title — $artist $icon"
    fi
else
    # Stopped or Spotify not running
    text="Spotify is not running $icon"
    status="stopped"
fi

# Output JSON for Waybar
echo "{\"text\":\"$text\", \"class\":\"$status\"}"

