#!/bin/bash

# Fonction pour récupérer le niveau de batterie
battery() {
    if command -v acpi &>/dev/null; then
        acpi_output=$(acpi -b)
        status=$(echo "$acpi_output" | awk -F': |, ' '{print $2}')
        level=$(echo "$acpi_output" | awk -F', ' '{print $2}')

        if [[ "$status" == "Charging" ]]; then
            echo "🔌 $level"
        elif [[ "$status" == "Discharging" ]]; then
            echo "🔋 $level"
        else
            echo "🔋 $level"
        fi
    else
        echo "❓ N/A"
    fi
}

# Fonction pour récupérer le nom du réseau Wi-Fi connecté
wifi() {
    if command -v nmcli &>/dev/null; then
        ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
        if [[ -n "$ssid" ]]; then
            signal_strength=$(nmcli -t -f ACTIVE,SIGNAL dev wifi | grep '^yes' | cut -d: -f2)
            echo "$ssid 🌐 : $signal_strength"
        else
            echo "🌐 Off"
        fi
    else
        echo "🌐 N/A"
    fi
}

# Fonction pour récupérer la date et l'heure
datetime() {
    date '+🗓️ %a %d-%m-%Y %H:%M'
}

# Fonction pour récupérer le volume audio
volume() {
    if command -v pamixer &>/dev/null; then
        vol=$(pamixer --get-volume)
        muted=$(pamixer --get-mute)
        if [[ "$muted" == "true" ]]; then
            echo "🔇"
        else
            echo "🔊 $vol%"
        fi
    elif command -v amixer &>/dev/null; then
        vol=$(amixer get Master | grep -o '[0-9]*%' | head -1)
        muted=$(amixer get Master | grep '\[off\]')
        if [[ -n "$muted" ]]; then
            echo "🔇"
        else
            echo "🔊 $vol"
        fi
    else
        echo "🔊 N/A"
    fi
}

# Fonction pour récupérer le niveau de luminosité
brightness() {
    if command -v light &>/dev/null; then
        level=$(light -G | cut -d. -f1)
        echo "🔆 $level%"
    else
        echo "🔆 N/A"
    fi
}

resources() {
    # CPU usage (1 seconde moyenne)
    cpu=$(top -bn1 | grep '^%Cpu' | awk '{print 100 - $8}')

    # RAM usage (en pourcentage)
    mem_used=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

    echo "🖥️ RAM : ${mem_used}%  CPU ${cpu%%.*}%"
}

# Fonction pour récupérer le titre du média en cours de lecture
MAX_TITLE_LENGTH=30
media_title() {
    if command -v playerctl &>/dev/null; then
        title=$(playerctl metadata title)
        if [[ -n "$title" ]]; then
            # Truncate the title if it exceeds MAX_TITLE_LENGTH
            if [[ ${#title} -gt $MAX_TITLE_LENGTH ]]; then
                title="${title:0:$MAX_TITLE_LENGTH}..."
            fi
            echo "🎶 $title |"
        else
            echo ""
        fi
    else
        echo ""
    fi
}

disk(){
    disk_info=$(df -h / | awk 'NR==2 {print $3 "o : " $5}')
    echo "$disk_info 📁"
}

while true; do
    # Compose la barre
    status="$(media_title) $(wifi) | $(resources) | $(brightness) | $(volume) | $(disk) | $(battery) | $(datetime)"

    # Affiche dans swaybar (output standard)
    echo "$status"

    sleep 2
done

