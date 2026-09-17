#!/usr/bin/env bash

cava -p ~/.config/cava/waybar | while read -r line; do
    IFS=';' read -ra bars <<< "$line"

    output=""
    active=false

    for bar in "${bars[@]}"; do
        if (( bar >= 1 )); then
            active=true
        fi

        case "$bar" in
            0) output+=" " ;;
            1) output+="▁" ;;
            2) output+="▂" ;;
            3) output+="▃" ;;
            4) output+="▄" ;;
            5) output+="▅" ;;
            6) output+="▆" ;;
            7) output+="█" ;;
        esac
    done

    if $active; then
        echo "$output"
    else
        echo ""
    fi
done