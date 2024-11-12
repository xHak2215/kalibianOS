#!/bin/bash

# Предупреждение
echo "Предупреждение: Этот скрипт запустит script.sh и art.sh."
echo "Убедитесь, что вы понимаете последствия выполнения этих скриптов."
read -p "Вы уверены, что хотите продолжить? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Отмена."
    exit 1
fi

# Установка прав на исполнение для script.sh и art.sh
echo "Установка прав на исполнение для script.sh и art.sh..."
chmod +x script.sh
chmod +x art.sh

# Запуск script.sh
echo "Запуск script.sh..."
./script.sh

# Запуск art.sh
echo "Запуск art.sh..."
./art.sh

echo "Операция завершена."
