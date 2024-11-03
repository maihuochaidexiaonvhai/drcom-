#!/bin/bash
logger "【Dr.COM网页认证】开始定时检测"
if curl -s http://192.168.111.4 > drcom.html; then #校园网登录IP
    check_status=$(grep "Dr.COMWebLoginID_0.htm" drcom.html)
    if [[ -z $check_status ]]; then
        #尚未登录
        logger "【Dr.COM网页认证】上网登录窗尚未登录"
        #!/bin/bash
        curl "https:" # 确保这里的curl命令是正确的 直接复制的curl里有单引号，需要改为双引号
        if [ $? -eq 0 ]; then
            logger "【Dr.COM网页认证】上网登录窗未登录，现已登录"
        else
            logger "【Dr.COM网页认证】登录失败"
        fi
    else
        #已经登录
        logger "【Dr.COM网页认证】上网登录窗之前已登录"
    fi
else
    logger "【Dr.COM网页认证】获取登录页面失败"
fi
logger "【Dr.COM网页认证】结束定时检测"
