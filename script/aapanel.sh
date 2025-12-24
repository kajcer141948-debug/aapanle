#! /bin/bash
# By Aaron
# https://github.com/kajcer141948-debug/aapanle

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
purple(){
    echo -e "\033[35m\033[01m$1\033[0m"
}

# 步骤1: 从官方安装 aaPanel
function install-official(){
    green "Step 1: Installing aaPanel from official website..."
    wget -O "/root/aapanel-install.sh" "http://www.aapanel.com/script/install_6.0_en.sh"
    bash "/root/aapanel-install.sh"
    rm -f /root/aapanel-install.sh
    green "Official installation completed."
}

# 步骤2: 降级到 6.8.23 版本
function downgrade(){
    green "Step 2: Downgrading to version 6.8.23..."
    wget -O "/root/LinuxPanel_EN-6.8.23.zip" "https://github.com/kajcer141948-debug/aapanle/releases/download/1/LinuxPanel_EN-6.8.23.zip"
    cd /root
    unzip -o LinuxPanel_EN-6.8.23.zip
    cd /root/panel
    wget -O "/root/panel/downgrade.sh" "https://raw.githubusercontent.com/kajcer141948-debug/aapanle/main/script/downgrade.sh"
    bash "/root/panel/downgrade.sh"
    rm -rf /root/LinuxPanel_EN-6.8.23.zip /root/panel/
    green "Downgrade to 6.8.23 completed."
}

# 步骤3: 破解
function crack(){
    green "Step 3: Cracking..."
    red "Please manually open the software store once before this step!"
    sleep 3
    sed -i 's|"endtime": -1|"endtime": 999999999999|g' /www/server/panel/data/plugin.json
    sed -i 's|"pro": -1|"pro": 0|g' /www/server/panel/data/plugin.json
    chattr +i /www/server/panel/data/plugin.json
    chattr -i /www/server/panel/data/repair.json 2>/dev/null
    rm -f /www/server/panel/data/repair.json
    cd /www/server/panel/data
    wget -O repair.json "https://raw.githubusercontent.com/kajcer141948-debug/aapanle/main/resource/repair.json"
    chattr +i /www/server/panel/data/repair.json
    green "Crack completed."
}

# 菜单
function start_menu(){
    clear
    purple "=========================================="
    purple " aaPanel Installation Tool"
    purple " https://github.com/kajcer141948-debug/aapanle"
    purple "=========================================="
    yellow ""
    green " 1. Full Install (Official + Downgrade + Crack)"
    green " 2. Downgrade only (6.8.23)"
    green " 3. Crack only"
    yellow ""
    green " 0. Exit"
    yellow ""
    
    read -p "Please select: " choice
    case "$choice" in
        1 )
            install-official
            downgrade
            crack
            green "All done!"
            ;;
        2 )
            downgrade
            ;;
        3 )
            crack
            ;;
        0 )
            exit 0
            ;;
        * )
            red "Invalid option!"
            start_menu
            ;;
    esac
}

start_menu
