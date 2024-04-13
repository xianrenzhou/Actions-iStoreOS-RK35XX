#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

# 移植黑豹x2

# rm -f target/linux/rockchip/image/rk35xx.mk
# cp -f $GITHUB_WORKSPACE/opfiles/rk35xx.mk target/linux/rockchip/image/rk35xx.mk


# rm -f target/linux/rockchip/rk35xx/base-files/lib/board/init.sh
# cp -f $GITHUB_WORKSPACE/opfiles/init.sh target/linux/rockchip/rk35xx/base-files/lib/board/init.sh


# rm -f target/linux/rockchip/rk35xx/base-files/etc/board.d/02_network
# cp -f $GITHUB_WORKSPACE/opfiles/02_network target/linux/rockchip/rk35xx/base-files/etc/board.d/02_network


# sed -i "s/option\s*script_timeout\s*60/option script_timeout 360/g" package/network/services/uhttpd/files/uhttpd.config




# 修改内核配置文件
# rm -f target/linux/rockchip/rk35xx/config-5.10
# cp -f $GITHUB_WORKSPACE/opfiles/config-5.10 target/linux/rockchip/rk35xx/config-5.10
sed -i "/# CONFIG_ROCKCHIP_RGA2 is not set/d" target/linux/rockchip/rk35xx/config-5.10
sed -i "/CONFIG_ROCKCHIP_RGA2_DEBUGGER=y/d" target/linux/rockchip/rk35xx/config-5.10
sed -i "/CONFIG_ROCKCHIP_RGA2_DEBUG_FS=y/d" target/linux/rockchip/rk35xx/config-5.10
sed -i "/CONFIG_ROCKCHIP_RGA2_PROC_FS=y/d" target/linux/rockchip/rk35xx/config-5.10




# 替换dts文件
cp -f $GITHUB_WORKSPACE/opfiles/rk3566-jp-tvbox.dts target/linux/rockchip/dts/rk3568/rk3566-jp-tvbox.dts

cp -f $GITHUB_WORKSPACE/opfiles/rk3566-panther-x2.dts target/linux/rockchip/dts/rk3568/rk3566-panther-x2.dts


#增加黑豹X2的一键补全WiFi脚本进系统里
cp -f $GITHUB_WORKSPACE/opfiles/brcmfmac43430-sdio-panther-x2.sh package/base-files/files/sbin/brcmfmac43430-sdio-panther-x2.sh
chmod 755 package/base-files/files/sbin/brcmfmac43430-sdio-panther-x2.sh
