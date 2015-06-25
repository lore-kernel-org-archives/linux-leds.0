From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH] leds:lp55xx: fix firmware loading error
Date: Fri, 26 Jun 2015 04:33:03 +0900
Message-ID: <1435260783-7132-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:33103 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751630AbbFYTdh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 25 Jun 2015 15:33:37 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com
Cc: Milo Kim <milo.kim@ti.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

LP55xx driver uses not firmware file but raw data to load program data through
the firmware interface.(Documents/leds/leds-lp55xx.txt)

  For example, run blinking green channel pattern,
  echo 2 > /sys/bus/i2c/devices/xxxx/select_engine     # 2 is for green channel
  echo "RGB" > /sys/bus/i2c/devices/xxxx/engine_mux    # engine mux for RGB
  echo 1 > /sys/class/firmware/lp5562/loading
  echo "4000600040FF6000" > /sys/class/firmware/lp5562/data
  echo 0 > /sys/class/firmware/lp5562/loading
  echo 1 > /sys/bus/i2c/devices/xxxx/run_engine

However, '/sys/class/firmware/<device name>' is not created after
firmware load user helper was introduced.

LP55xx driver requires not only enabling CONFIG_FW_LOADER_USER_HELPER_FALLBACK
but also option, 'FW_OPT_USERHELPER'.
When _request_firmware() is invoked, this option enables to load raw data
manually (aka, fw_load_from_user_helper() is called)
The second parameter 'uevent' of request_firmware_nowait() is used for this
option, 'FW_OPT_USERHELPER'.

Signed-off-by: Milo Kim <milo.kim@ti.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/Kconfig              | 1 +
 drivers/leds/leds-lp55xx-common.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 966b960..a39d608 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -206,6 +206,7 @@ config LEDS_LP55XX_COMMON
 	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
 	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
 	select FW_LOADER
+	select FW_LOADER_USER_HELPER_FALLBACK
 	help
 	  This option supports common operations for LP5521/5523/55231/5562/8501
 	  devices.
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 77c26bc..96d51e9 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -223,7 +223,7 @@ static int lp55xx_request_firmware(struct lp55xx_chip *chip)
 	const char *name = chip->cl->name;
 	struct device *dev = &chip->cl->dev;
 
-	return request_firmware_nowait(THIS_MODULE, true, name, dev,
+	return request_firmware_nowait(THIS_MODULE, false, name, dev,
 				GFP_KERNEL, chip, lp55xx_firmware_loaded);
 }
 
-- 
1.9.1
