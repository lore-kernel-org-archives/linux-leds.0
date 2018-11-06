From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 03/24] leds: dt-bindings: Add LED_FUNCTION definitions
Date: Tue,  6 Nov 2018 23:07:11 +0100
Message-ID: <1541542052-10081-4-git-send-email-jacek.anaszewski@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

Add common LED function definitions for use in Device Tree.
The function names were extracted from existing dts files
after eliminating oddities.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Simon Shields <simon@lineageos.org>
Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
---
 include/dt-bindings/leds/functions.h | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 include/dt-bindings/leds/functions.h

diff --git a/include/dt-bindings/leds/functions.h b/include/dt-bindings/leds/functions.h
new file mode 100644
index 0000000..3f94e09
--- /dev/null
+++ b/include/dt-bindings/leds/functions.h
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define LED_FUNCTION_2G "2g"
+#define LED_FUNCTION_ACTIVITY "activity"
+#define LED_FUNCTION_ADSL "adsl"
+#define LED_FUNCTION_ALARM "alarm"
+#define LED_FUNCTION_ALIVE "alive"
+#define LED_FUNCTION_ALL "all"
+#define LED_FUNCTION_APP "app"
+#define LED_FUNCTION_AUX "aux"
+#define LED_FUNCTION_BACKUP "backup"
+#define LED_FUNCTION_BACKLIGHT "backlight"
+#define LED_FUNCTION_BACKLIGHT_CLUSTER "backlight_cluster"
+#define LED_FUNCTION_BEEP "beep"
+#define LED_FUNCTION_BLUETOOTH "bluetooth"
+#define LED_FUNCTION_BOOT "boot"
+#define LED_FUNCTION_BOTTOM "bottom"
+#define LED_FUNCTION_BRICK_STATUS "brick-status"
+#define LED_FUNCTION_CEL "cel"
+#define LED_FUNCTION_CEL_PWR "cel-pwr"
+#define LED_FUNCTION_CEL_RESET "cel-reset"
+#define LED_FUNCTION_CHRG "chrg"
+#define LED_FUNCTION_COM "com"
+#define LED_FUNCTION_COPY "copy"
+#define LED_FUNCTION_CPU "cpu"
+#define LED_FUNCTION_DEBUG "debug"
+#define LED_FUNCTION_DIA "dia"
+#define LED_FUNCTION_DISK "disk"
+#define LED_FUNCTION_DISPLAY_CLUSTER "display_cluster"
+#define LED_FUNCTION_DOWN "down"
+#define LED_FUNCTION_DSL "dsl"
+#define LED_FUNCTION_ENOCEAN "enocean"
+#define LED_FUNCTION_ENTER "enter"
+#define LED_FUNCTION_ERROR "error"
+#define LED_FUNCTION_ESATA "esata"
+#define LED_FUNCTION_ETHERNET_STATUS "ethernet-status"
+#define LED_FUNCTION_FAIL "fail"
+#define LED_FUNCTION_FAULT "fault"
+#define LED_FUNCTION_FLASH "flash"
+#define LED_FUNCTION_FRONT "front"
+#define LED_FUNCTION_FUNC "func"
+#define LED_FUNCTION_GPIO "gpio"
+#define LED_FUNCTION_GSM "gsm"
+#define LED_FUNCTION_HD "hd"
+#define LED_FUNCTION_HDD "hdd"
+#define LED_FUNCTION_HDDERR "hdderr"
+#define LED_FUNCTION_HEALTH "health"
+#define LED_FUNCTION_HEARTBEAT "heartbeat"
+#define LED_FUNCTION_HOME "home"
+#define LED_FUNCTION_INDICATOR "indicator"
+#define LED_FUNCTION_INET "inet"
+#define LED_FUNCTION_INFO "info"
+#define LED_FUNCTION_INTERNET "internet"
+#define LED_FUNCTION_KEYPAD "keypad"
+#define LED_FUNCTION_LAN "lan"
+#define LED_FUNCTION_LEFT "left"
+#define LED_FUNCTION_LIVE "live"
+#define LED_FUNCTION_MICROSD "microsd"
+#define LED_FUNCTION_MISC "misc"
+#define LED_FUNCTION_MMC "mmc"
+#define LED_FUNCTION_NAND "nand"
+#define LED_FUNCTION_NETWORK "network"
+#define LED_FUNCTION_ON "on"
+#define LED_FUNCTION_OS "os"
+#define LED_FUNCTION_PANEL "panel"
+#define LED_FUNCTION_PMU_STAT "pmu_stat"
+#define LED_FUNCTION_PROG "prog"
+#define LED_FUNCTION_PROGRAMMING "programming"
+#define LED_FUNCTION_PULSE "pulse"
+#define LED_FUNCTION_PWR "pwr"
+#define LED_FUNCTION_QSS "qss"
+#define LED_FUNCTION_REAR "rear"
+#define LED_FUNCTION_REBUILD "rebuild"
+#define LED_FUNCTION_RIGHT "right"
+#define LED_FUNCTION_ROUTER "router"
+#define LED_FUNCTION_RS "rs"
+#define LED_FUNCTION_RX "rx"
+#define LED_FUNCTION_SATA "sata"
+#define LED_FUNCTION_SD "sd"
+#define LED_FUNCTION_SLEEP "sleep"
+#define LED_FUNCTION_STANDBY "standby"
+#define LED_FUNCTION_STATUS "status"
+#define LED_FUNCTION_SW "sw"
+#define LED_FUNCTION_SWRDY "swrdy"
+#define LED_FUNCTION_SYSTEM "system"
+#define LED_FUNCTION_TEL "tel"
+#define LED_FUNCTION_TOP "top"
+#define LED_FUNCTION_TORCH "torch"
+#define LED_FUNCTION_TV "tv"
+#define LED_FUNCTION_TX "tx"
+#define LED_FUNCTION_UP "up"
+#define LED_FUNCTION_USB "usb"
+#define LED_FUNCTION_USB_COPY "usb_copy"
+#define LED_FUNCTION_USER "user"
+#define LED_FUNCTION_USR "usr"
+#define LED_FUNCTION_WAN "wan"
+#define LED_FUNCTION_WIFI "wifi"
+#define LED_FUNCTION_WIRELESS "wireless"
+#define LED_FUNCTION_WLAN "wlan"
+#define LED_FUNCTION_WMODE "wmode"
+#define LED_FUNCTION_WPS "wps"
-- 
2.1.4
