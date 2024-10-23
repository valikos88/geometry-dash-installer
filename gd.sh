#!/bin/bash

# Вывод приветствия
echo "Geometry Dash Installer for Linux"
echo "-----------------------------"
echo "
██╗░░░██╗░█████╗░██╗░░░░░██╗██╗░░██╗░█████╗░░██████╗░█████╗░░█████╗░
██║░░░██║██╔══██╗██║░░░░░██║██║░██╔╝██╔══██╗██╔════╝██╔══██╗██╔══██╗
╚██╗░██╔╝███████║██║░░░░░██║█████═╝░██║░░██║╚█████╗░╚█████╔╝╚█████╔╝
░╚████╔╝░██╔══██║██║░░░░░██║██╔═██╗░██║░░██║░╚═══██╗██╔══██╗██╔══██╗
░░╚██╔╝░░██║░░██║███████╗██║██║░╚██╗╚█████╔╝██████╔╝╚█████╔╝╚█████╔╝
░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝╚═╝░░╚═╝░╚════╝░╚═════╝░░╚════╝░░╚════╝░"

check_program() {
  if ! command -v "$1" &> /dev/null; then
    echo "Программа '$1' не найдена.
    Program $1 not found"
    echo "Пожалуйста, установите ее с помощью пакетного менеджера.
    Please, install it with package manager."
    exit 1
  fi
}

check_program wine
check_program wget

INSTALLER_URL="https://download1529.mediafire.com/415qnt3tnewggod3pmG4rczDr0Po4ZpGgl1X0zFklTqy6YmJUH-UpHQa6bbGr0iqvx0E3t1Y3bpgJJy8_EGKOoKw8o1heMjSs_C0rKrs9CDsEW-qFO1Z2ZggOH58GH7rtkq42CyfMNwo9qvj3OywxXbtfj2Q62zoTVT5DzszIN4xEag/b8pl2vdr9m2t1fo/GeometryDash2.206Installer.exe"
INSTALLER_FILE="GeometryDash2.206Installer.exe"

if [ ! -f "$INSTALLER_FILE" ]; then
  echo "Загрузка установщика Geometry Dash...
  Loading installer of Geometry Dash..."
  wget -c "$INSTALLER_URL"
else
  echo "Установщик Geometry Dash уже загружен.
  Geometry Dash installer is already downloaded"
fi

echo "Запуск установщика...
Installer loading..."
wine "$INSTALLER_FILE"

echo "-----------------------------"
echo "Установка Geometry Dash завершена!
Geometry Dash installing was finished!"

read -p "Введите путь к папке Geometry Dash: 
Write the GD Folder location:" GD_FOLDER

if [ ! -d "$GD_FOLDER" ]; then
  echo "Ошибка: папка '$GD_FOLDER' не найдена!
  Error: '$GD_FOLDER' not found!"
  exit 1
fi

read -p "Установить Geode? (y/n): 
Install Geode? (y/n)" CHOICE

if [[ "$CHOICE" =~ ^[Yy]$ ]]; then 
  GEODE_INSTALLER_URL="https://objects.githubusercontent.com/github-production-release-asset-2e65be/449738859/a2a2aca2-291f-4a1a-a1dc-e42bbe421112?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241023%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241023T185833Z&X-Amz-Expires=300&X-Amz-Signature=ee50285bfbd03fb07a8b08279ceb60f9cbee8749c03abc17835c198bede53b85&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dgeode-installer-v3.8.1-win.exe&response-content-type=application%2Foctet-stream"
  GEODE_INSTALLER_FILE="geode-installer-v3.8.1-win.exe"

  echo "Загрузка установщика Geode...
  Geode Installer downloading..."
  wget -c -O "$GEODE_INSTALLER_FILE" "$GEODE_INSTALLER_URL"

  echo "Запуск установщика Geode...
  Geode Installer starting..."
  wine "$GEODE_INSTALLER_FILE" & 

else
  echo "Geode не будет установлен.
  Geode will not be installed."
fi

echo "-----------------------------"
echo "Завершено! 
Finished!
tg:@ispovedvalikosa"