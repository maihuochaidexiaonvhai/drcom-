#!/bin/bash

# 使用双引号包裹变量
logger "【Dr.COM网页认证】开始定时检测"
curl "http://192.168.111.4" > drcom.html  # ①
check_status=$(grep "<!--Dr.COMWebLoginID_0.htm-->" drcom.html)  # ②

if [[ $check_status != "NID" ]]; then
    # 尚未登录
    logger "【Dr.COM网页认证】上网登录窗尚未登录"
    curl "https://auth-p.bcnu.edu.cn:802/eportal/portal/login?callback=dr1003&login_method=1&user_account=%2C0%2C07274320%40cmcc&user_password=100200&wlan_user_ip=10.200.19.100&wlan_user_ipv6=&wlan_user_mac=767D249D6CB9&wlan_ac_ip=192.168.111.17&wlan_ac_name=AC-WX5540X&jsVersion=4.2.1&terminal_type=1&lang=zh-cn&v=5075&lang=zh"
    # 此处为你已修改完毕的curl命令或其他登录逻辑
    # curl ... 或者其他登录命令
    logger "【Dr.COM网页认证】上网登录窗未登录，现已登录"
else
    # 已经登录
    logger "【Dr.COM网页认证】上网登录窗之前已登录"
fi

logger "【Dr.COM网页认证】结束定时检测"
