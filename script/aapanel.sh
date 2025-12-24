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

# 修复 apt 源
function fix-apt-source(){
    if [ -f /etc/debian_version ]; then
        green "Fixing apt sources..."
        
        # 获取 Debian 版本代号
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            CODENAME=$VERSION_CODENAME
        fi
        
        # 修复常见的源问题
        if [ -f /etc/apt/sources.list ]; then
            # 修复 mirrors.edge.kernel.org 问题
            sed -i 's|http://mirrors.edge.kernel.org/debian-security|http://deb.debian.org/debian-security|g' /etc/apt/sources.list
            sed -i 's|http://mirrors.edge.kernel.org/debian|http://deb.debian.org/debian|g' /etc/apt/sources.list
            
            # 修复其他常见镜像问题
            sed -i 's|http://security.debian.org/debian-security|http://deb.debian.org/debian-security|g' /etc/apt/sources.list
        fi
        
        green "Apt sources fixed."
    fi
}

# 步骤4: 屏蔽自动更新
function block-update(){
    green "Blocking auto-update..."
    
    DNSMASQ_OK=0
    
    # 检测系统类型并安装 dnsmasq
    if ! command -v dnsmasq &> /dev/null; then
        green "Installing dnsmasq..."
        if [ -f /etc/debian_version ]; then
            # 先尝试修复 apt 源
            fix-apt-source
            apt update -y && apt install dnsmasq -y && DNSMASQ_OK=1
        elif [ -f /etc/redhat-release ]; then
            yum install dnsmasq -y && DNSMASQ_OK=1
        fi
    else
        DNSMASQ_OK=1
    fi
    
    # 如果 dnsmasq 安装成功，使用 dnsmasq 方式
    if [ "$DNSMASQ_OK" = "1" ] && [ -d /etc/dnsmasq.d ]; then
        green "Using dnsmasq method..."
        
        # 创建 dnsmasq 屏蔽配置
        cat > /etc/dnsmasq.d/block-panel-update.conf << 'EOF'
# Block aaPanel domains
address=/aapanel.com/127.0.0.1

# Block bt.cn domains
address=/bt.cn/127.0.0.1
EOF
        
        # 配置 dnsmasq 作为本地 DNS
        if [ -f /etc/dnsmasq.conf ] && ! grep -q "listen-address=127.0.0.1" /etc/dnsmasq.conf; then
            echo "listen-address=127.0.0.1" >> /etc/dnsmasq.conf
        fi
        
        # 设置系统使用本地 DNS
        if [ -f /etc/resolv.conf ]; then
            cp /etc/resolv.conf /etc/resolv.conf.bak 2>/dev/null
            if ! grep -q "nameserver 127.0.0.1" /etc/resolv.conf; then
                sed -i '1i nameserver 127.0.0.1' /etc/resolv.conf
            fi
        fi
        
        # 启动并启用 dnsmasq
        systemctl enable dnsmasq 2>/dev/null
        systemctl restart dnsmasq 2>/dev/null
        
        green "Blocked: *.aapanel.com, *.bt.cn (all subdomains via dnsmasq)"
    else
        # 回退到 hosts 方式
        yellow "dnsmasq not available, using hosts file method..."
        
        DOMAINS="www.aapanel.com aapanel.com api.aapanel.com download.aapanel.com node.aapanel.com www.bt.cn bt.cn api.bt.cn download.bt.cn node.bt.cn update.bt.cn update1.bt.cn update2.bt.cn update3.bt.cn"
        
        for domain in $DOMAINS; do
            if ! grep -q "127.0.0.1 $domain" /etc/hosts; then
                echo "127.0.0.1 $domain" >> /etc/hosts
            fi
        done
        
        green "Blocked via /etc/hosts (common subdomains only)"
    fi
    
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
}

# 恢复更新功能
function unblock-update(){
    green "Unblocking auto-update..."
    
    # 删除 dnsmasq 屏蔽配置
    rm -f /etc/dnsmasq.d/block-panel-update.conf 2>/dev/null
    
    # 重启 dnsmasq
    systemctl restart dnsmasq 2>/dev/null
    
    # 恢复 resolv.conf
    if [ -f /etc/resolv.conf.bak ]; then
        cp /etc/resolv.conf.bak /etc/resolv.conf
    fi
    
    # 移除 hosts 中的屏蔽（如果使用了 hosts 方式）
    sed -i '/127.0.0.1.*aapanel\.com/d' /etc/hosts
    sed -i '/127.0.0.1.*bt\.cn/d' /etc/hosts
    
    # 解锁文件
    chattr -i /www/server/panel/script/update.py 2>/dev/null
    chattr -i /www/server/panel/BT-Panel 2>/dev/null
    chattr -i /www/server/panel/BT-Task 2>/dev/null
    
    green "Auto-update unblocked!"
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
    green " 8. Fix apt sources (Debian/Ubuntu)"
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
        8 )
            fix-apt-source
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
