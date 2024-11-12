#!/bin/bash

# Функция для вывода ASCII-арта
print_kalibian_art() {
    local art="
    /$$   /$$  /$$$$$$  /$$       /$$$$$$ /$$$$$$$  /$$$$$$  /$$$$$$  /$$   /$$
    | $$  /$$/ /$$__  $$| $$      |_  $$_/| $$__  $$|_  $$_/ /$$__  $$| $$$ | $$
    | $$ /$$/ | $$  \ $$| $$        | $$  | $$  \ $$  | $$  | $$  \ $$| $$$$| $$
    | $$$$$/  | $$$$$$$$| $$        | $$  | $$$$$$$   | $$  | $$$$$$$$| $$ $$ $$
    | $$  $$  | $$__  $$| $$        | $$  | $$__  $$  | $$  | $$__  $$| $$  $$$$
    | $$\  $$ | $$  | $$| $$        | $$  | $$  \ $$  | $$  | $$  | $$| $$\  $$$
    | $$ \  $$| $$  | $$| $$$$$$$$ /$$$$$$| $$$$$$$/ /$$$$$$| $$  | $$| $$ \  $$
    |__/  \__/|__/  |__/|________/|______/|_______/ |______/|__/  |__/|__/  \__/
    "

    echo "$art"
}

# Функция для добавления ASCII-арта в .bashrc или .bash_profile
add_kalibian_art() {
    local profile_file="$HOME/.bashrc"
    if [[ -f "$HOME/.bash_profile" ]]; then
        profile_file="$HOME/.bash_profile"
    fi

    # Проверяем, есть ли уже функция в файле
    if ! grep -q "print_kalibian_art" "$profile_file"; then
        echo "Функция print_kalibian_art не найдена в $profile_file. Добавляем..."
        echo -e "\n# Функция для вывода ASCII-арта" >> "$profile_file"
        echo -e "print_kalibian_art() {" >> "$profile_file"
        echo -e "    local art=\"$art\"" >> "$profile_file"
        echo -e "    echo \"\$art\"" >> "$profile_file"
        echo -e "}" >> "$profile_file"
        echo -e "\n# Вызов функции для вывода ASCII-арта" >> "$profile_file"
        echo -e "print_kalibian_art" >> "$profile_file"
        echo "Функция добавлена в $profile_file."
    else
        echo "Функция print_kalibian_art уже существует в $profile_file."
    fi
}

# Вызов функции для добавления ASCII-арта
add_kalibian_art

# Перезагрузка профиля для применения изменений
source "$HOME/.bashrc" 2>/dev/null || source "$HOME/.bash_profile" 2>/dev/null
