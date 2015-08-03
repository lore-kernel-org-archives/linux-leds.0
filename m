From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH v2] LED/MIPS: Move SEAD3 LED driver to where it belongs.
Date: Mon, 3 Aug 2015 17:04:01 +0200
Message-ID: <20150803150401.GD2843@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:40875 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753122AbbHCPEI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2015 11:04:08 -0400
Received: from localhost.localdomain ([127.0.0.1]:35140 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012092AbbHCPEGuqNIv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2015 17:04:06 +0200
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-leds@vger.kernel.org, linux-mips@linux-mips.org

Fixes the following randconfig problem

leds-sead3.c:(.text+0x7dc): undefined reference to `led_classdev_unregister'
leds-sead3.c:(.text+0x7e8): undefined reference to `led_classdev_unregister'

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-leds@vger.kernel.org
Cc: linux-mips@linux-mips.org
---
 arch/mips/mti-sead3/Makefile                       |  2 --
 drivers/leds/Kconfig                               | 10 ++++++++++
 drivers/leds/Makefile                              |  1 +
 {arch/mips/mti-sead3 => drivers/leds}/leds-sead3.c |  1 +
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mti-sead3/Makefile b/arch/mips/mti-sead3/Makefile
index 2e52cbd..7a584e0 100644
--- a/arch/mips/mti-sead3/Makefile
+++ b/arch/mips/mti-sead3/Makefile
@@ -12,6 +12,4 @@ obj-y				:= sead3-lcd.o sead3-display.o sead3-init.o \
 				   sead3-int.o sead3-platform.o sead3-reset.o \
 				   sead3-setup.o sead3-time.o
 
-obj-y				+= leds-sead3.o
-
 obj-$(CONFIG_EARLY_PRINTK)	+= sead3-console.o
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 9ad35f7..531729c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -550,6 +550,16 @@ config LEDS_KTD2692
 
 	  Say Y to enable this driver.
 
+config LEDS_SEAD3
+	tristate "LED support for the MIPS SEAD 3 board"
+	depends on LEDS_CLASS && MIPS_SEAD3
+	help
+	  Say Y here to include support for the FLED and PLED LEDs on SEAD3 eval
+	  boards.
+
+	  This driver can also be built as a module. If so the module
+	  will be called leds-sead3.
+
 comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
 
 config LEDS_BLINKM
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 8d6a24a..a976161 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_LEDS_VERSATILE)		+= leds-versatile.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
 obj-$(CONFIG_LEDS_PM8941_WLED)		+= leds-pm8941-wled.o
 obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
+obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/arch/mips/mti-sead3/leds-sead3.c b/drivers/leds/leds-sead3.c
similarity index 99%
rename from arch/mips/mti-sead3/leds-sead3.c
rename to drivers/leds/leds-sead3.c
index c938cee..eb97a32 100644
--- a/arch/mips/mti-sead3/leds-sead3.c
+++ b/drivers/leds/leds-sead3.c
@@ -59,6 +59,7 @@ static int sead3_led_remove(struct platform_device *pdev)
 {
 	led_classdev_unregister(&sead3_pled);
 	led_classdev_unregister(&sead3_fled);
+
 	return 0;
 }
 
