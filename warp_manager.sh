#!/bin/bash

check_warp_status() {
    result=$(curl -s https://www.cloudflare.com/cdn-cgi/trace/)
    warp_status=$(echo "$result" | grep -oP 'warp=\K\w+')

    if [[ "$warp_status" == "on" ]]; then
        echo "on"
    else
        echo "off"
    fi
}

display_status() {
    echo -ne "\033[2K\r$1"
}

start_warp() {
    warp_status=$(check_warp_status)
    if [[ "$warp_status" == "on" ]]; then
        display_status "WARP is already ON ✅"
    else
        display_status "Starting warp-svc... \n"
        sudo systemctl start warp-svc
        sleep 2
        if [[ "$(check_warp_status)" == "on" ]]; then
            display_status "WARP started successfully ✅"
        else
            display_status "Failed to start WARP ❌"
        fi
    fi
    echo
}

stop_warp() {
    warp_status=$(check_warp_status)
    if [[ "$warp_status" == "off" ]]; then
        display_status "WARP is already OFF ❌"
    else
        display_status "Stopping warp-svc... \n"
        sudo systemctl stop warp-svc
        sleep 2
        if [[ "$(check_warp_status)" == "off" ]]; then
            display_status "WARP stopped successfully ✅"
        else
            display_status "Failed to stop WARP ❌"
        fi
    fi
    echo
}

usage() {
    echo "Usage: $0 {start/enable/on | stop/disable/off | status/check}"
    exit 1
}

if [[ $# -ne 1 ]]; then
    usage
fi

case "$1" in
    start|enable|on)  
        start_warp
        ;;
    stop|disable|off) 
        stop_warp
        ;;
    status|check) 
        warp_status=$(check_warp_status)
        if [[ "$warp_status" == "on" ]]; then
            display_status "WARP is ON ✅"
        else
            display_status "WARP is OFF ❌"
        fi
        echo
        ;;
    *)
        usage
        ;;
esac

