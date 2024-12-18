#!/bin/bash

# 使用双引号包裹变量
logger "【Dr.COM网页认证】开始定时检测"
curl "http://192.168.x.x" > drcom.html  # 登录网址
check_status=$(grep "<!--Dr.COMWebLoginID_0.htm-->" drcom.html)  # ②

if [[ $check_status != "NID" ]]; then 
    # 尚未登录
    logger "【Dr.COM网页认证】上网登录窗尚未登录"
    curl 
    # 此处为你已修改完毕的curl命令或其他登录逻辑
    # curl ... 或者其他登录命令
    logger "【Dr.COM网页认证】上网登录窗未登录，现已登录"
else
    # 已经登录
    logger "【Dr.COM网页认证】上网登录窗之前已登录"
fi

logger "【Dr.COM网页认证】结束定时检测"
