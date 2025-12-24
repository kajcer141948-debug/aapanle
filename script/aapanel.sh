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
    
    # 检查 plugin.json 是否存在
    if [ ! -f /www/server/panel/data/plugin.json ]; then
        red "ERROR: plugin.json not found!"
        red "Please open the App Store in aaPanel first, then run this option again."
        return 1
    fi
    
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

# 步骤4: 屏蔽自动更新
function block-update(){
    green "Blocking auto-update..."
    
    # 检测系统类型并安装 dnsmasq
    if [ -f /etc/debian_version ]; then
        # Debian/Ubuntu
        if ! command -v dnsmasq &> /dev/null; then
            green "Installing dnsmasq..."
            apt update -y && apt install dnsmasq -y
        fi
    elif [ -f /etc/redhat-release ]; then
        # CentOS/RHEL
        if ! command -v dnsmasq &> /dev/null; then
            green "Installing dnsmasq..."
            yum install dnsmasq -y
        fi
    fi
    
    # 创建 dnsmasq 屏蔽配置
    cat > /etc/dnsmasq.d/block-panel-update.conf << 'EOF'
# Block aaPanel domains
address=/aapanel.com/127.0.0.1

# Block bt.cn domains
address=/bt.cn/127.0.0.1
EOF
    
    # 配置 dnsmasq 作为本地 DNS
    if ! grep -q "listen-address=127.0.0.1" /etc/dnsmasq.conf; then
        echo "listen-address=127.0.0.1" >> /etc/dnsmasq.conf
    fi
    
    # 设置系统使用本地 DNS
    if [ -f /etc/resolv.conf ]; then
        # 备份原始 resolv.conf
        cp /etc/resolv.conf /etc/resolv.conf.bak 2>/dev/null
        # 添加本地 DNS 到首位
        if ! grep -q "nameserver 127.0.0.1" /etc/resolv.conf; then
            sed -i '1i nameserver 127.0.0.1' /etc/resolv.conf
        fi
    fi
    
    # 启动并启用 dnsmasq
    systemctl enable dnsmasq 2>/dev/null
    systemctl restart dnsmasq 2>/dev/null
    
    # 清空并锁定更新脚本
    if [ -f /www/server/panel/script/update.py ]; then
        chattr -i /www/server/panel/script/update.py 2>/dev/null
        echo "" > /www/server/panel/script/update.py
        chattr +i /www/server/panel/script/update.py
    fi
    
    # 锁定面板核心文件防止被覆盖
    chattr +i /www/server/panel/BT-Panel 2>/dev/null
    chattr +i /www/server/panel/BT-Task 2>/dev/null
    
    green "Auto-update blocked successfully!"
    green "Blocked: *.aapanel.com, *.bt.cn (all subdomains)"
}

# 恢复更新功能
function unblock-update(){
    green "Unblocking auto-update..."
    
    # 删除 dnsmasq 屏蔽配置
    rm -f /etc/dnsmasq.d/block-panel-update.conf
    
    # 重启 dnsmasq
    systemctl restart dnsmasq 2>/dev/null
    
    # 恢复 resolv.conf（可选）
    if [ -f /etc/resolv.conf.bak ]; then
        cp /etc/resolv.conf.bak /etc/resolv.conf
    fi
    
    # 解锁文件
    chattr -i /www/server/panel/script/update.py 2>/dev/null
    chattr -i /www/server/panel/BT-Panel 2>/dev/null
    chattr -i /www/server/panel/BT-Task 2>/dev/null
    
    green "Auto-update unblocked!"
    green "Removed dnsmasq block rules"
}

# 关闭面板 HTTPS
function disable-https(){
    green "Disabling panel HTTPS..."
    
    # 删除 SSL 标记文件
    rm -f /www/server/panel/data/ssl.pl
    
    # 删除 SSL 证书文件
    rm -f /www/server/panel/ssl/certificate.pem
    rm -f /www/server/panel/ssl/privateKey.pem
    rm -rf /www/server/panel/ssl/*
    
    # 重启面板
    /etc/init.d/bt restart
    
    green "Panel HTTPS disabled! You can now access via HTTP."
}

# 开启面板 HTTPS
function enable-https(){
    green "Enabling panel HTTPS..."
    
    # 创建 SSL 标记文件
    echo "True" > /www/server/panel/data/ssl.pl
    
    # 重启面板
    /etc/init.d/bt restart
    
    green "Panel HTTPS enabled!"
}

# 菜单
function start_menu(){
    clear
    purple "=========================================="
    purple " aaPanel Installation Tool"
    purple " https://github.com/kajcer141948-debug/aapanle"
    purple "=========================================="
    yellow ""
    green " 1. Full Install (Official + Downgrade)"
    green " 2. Downgrade only (6.8.23)"
    green " 3. Crack only"
    green " 4. Block auto-update"
    green " 5. Unblock auto-update"
    green " 6. Disable panel HTTPS (use HTTP)"
    green " 7. Enable panel HTTPS"
    yellow ""
    green " 0. Exit"
    yellow ""
    
    read -p "Please select: " choice
    case "$choice" in
        1 )
            install-official
            downgrade
            disable-https
            yellow ""
            yellow "=========================================="
            red "IMPORTANT: To complete setup, please:"
            red "1. Open aaPanel in your browser (HTTP)"
            red "2. Go to App Store"
            red "3. Run this script again, select option 3 (Crack)"
            red "4. Run this script again, select option 4 (Block update)"
            yellow "=========================================="
            green "Installation and downgrade completed!"
            ;;
        2 )
            downgrade
            ;;
        3 )
            crack
            ;;
        4 )
            block-update
            ;;
        5 )
            unblock-update
            ;;
        6 )
            disable-https
            ;;
        7 )
            enable-https
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
