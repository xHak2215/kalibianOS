#!/bin/bash

# Предупреждение
echo "Предупреждение: Этот скрипт удаляет все графические оболочки и переносит корневую файловую систему в домашний каталог обычного пользователя."
echo "Это может привести к потере данных и неработоспособности системы."
read -p "Вы уверены, что хотите продолжить? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Отмена."
    exit 1
fi

# Удаление графических оболочек
echo "Удаление графических оболочек..."
sudo apt-get purge --auto-remove gnome* kde* xfce* lxde* cinnamon* mate*

# Удаление пакетов, связанных с графикой
echo "Удаление пакетов, связанных с графикой..."
sudo apt-get purge --auto-remove xserver* x11-common

# Очистка системы
echo "Очистка системы..."
sudo apt-get autoremove --purge
sudo apt-get clean

echo "Графические оболочки удалены."

# Перенос корневой файловой системы
user=$(whoami)
home_dir="/home/$user"

# Создание резервной копии
echo "Создание резервной копии корневой файловой системы..."
sudo tar -czvf "$home_dir/root_backup.tar.gz" /

# Перенос корневой файловой системы
echo "Перенос корневой файловой системы в $home_dir/root..."
sudo mv / "$home_dir/"

# Создание символической ссылки
echo "Создание символической ссылки..."
sudo ln -s "$home_dir/root" /

echo "Корневая файловая система перенесена в $home_dir/root."

# Запрос у пользователя, какие пакеты установить
echo "Введите список пакетов, которые вы хотите установить (через пробел):"
read -p "Пакеты: " packages

if [[ -n "$packages" ]]; then
    echo "Проверка наличия пакетов в репозиториях..."
    sudo apt-get update > /dev/null
    for package in $packages; do
        if sudo apt-cache show $package > /dev/null 2>&1; then
            echo "Пакет $package найден. Установка..."
            sudo apt-get install -y $package
        else
            echo "Пакет $package не найден в репозиториях."
        fi
    done
else
    echo "Пакеты не указаны. Пропускаем установку."
fi

echo "Операция завершена."
