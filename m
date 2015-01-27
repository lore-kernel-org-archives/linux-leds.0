From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 1/2] Documentation: leds: Add description of LED Flash class
 extension
Date: Tue, 27 Jan 2015 09:07:07 +0100
Message-ID: <1422346028-16739-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49232 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757518AbbA0IHe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 27 Jan 2015 03:07:34 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>

The documentation being added contains overall description of the
LED Flash Class and the related sysfs attributes.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 Documentation/leds/leds-class-flash.txt |   59 +++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/leds/leds-class-flash.txt

diff --git a/Documentation/leds/leds-class-flash.txt b/Documentation/leds/leds-class-flash.txt
new file mode 100644
index 0000000..297401a
--- /dev/null
+++ b/Documentation/leds/leds-class-flash.txt
@@ -0,0 +1,59 @@
+
+Flash LED handling under Linux
+==============================
+
+Some LED devices support two modes - torch and flash. In the LED subsystem
+those modes are supported by LED class (see Documentation/leds/leds-class.txt)
+and LED Flash class respectively. The torch mode related features are enabled
+by default and the flash ones only if a driver declares it by setting
+LED_DEV_CAP_FLASH flag.
+
+In order to enable support for flash LEDs CONFIG_LEDS_CLASS_FLASH symbol
+must be defined in the kernel config. A flash LED driver must register
+in the LED subsystem with led_classdev_flash_register function to gain flash
+related capabilities.
+
+There are flash LED devices which can control more than one LED and allow for
+strobing the sub-LEDs synchronously. A LED will be strobed synchronously with
+the one whose identifier is written to the flash_sync_strobe sysfs attribute.
+The list of available sub-LED identifiers can be read from the available_sync_leds
+sysfs attribute. In order to enable the related settings the driver must set
+LED_DEV_CAP_SYNC_STROBE flag.
+
+Following sysfs attributes are exposed for controlling flash LED devices:
+
+	- flash_brightness - flash LED brightness in microamperes (RW)
+	- max_flash_brightness - maximum available flash LED brightness (RO)
+	- flash_timeout - flash strobe duration in microseconds (RW)
+	- max_flash_timeout - maximum available flash strobe duration (RO)
+	- flash_strobe - flash strobe state (RW)
+	- available_sync_leds - list of sub-LEDs available for flash strobe
+				synchronization (RO)
+	- flash_sync_strobe - identifier of the sub-LED to synchronize the flash
+			      strobe with; 0 stands for no synchronization (RW)
+	- flash_fault - list of flash faults that may have occurred:
+		* led-over-voltage - flash controller voltage to the flash LED
+			has exceededthe limit specific to the flash controller
+		* flash-timeout-exceeded - the flash strobe was still on when
+			the timeout set by the user has expired; not all flash
+			controllers may set this in all such conditions
+		* controller-over-temperature - the flash controller has
+			overheated
+		* controller-short-circuit - the short circuit protection
+			of the flash controller has been triggered
+		* led-power-supply-over-current - current in the LED power
+			supply has exceeded the limit specific to the flash
+			controller
+		* indicator-led-fault - the flash controller has detected
+			a short or open circuit condition on the indicator LED
+		* led-under-voltage - flash controller voltage to the flash
+			LED has been below the minimum limit specific to
+			the flash
+		* controller-under-voltage - the input voltage of the flash
+			controller is below the limit under which strobing the
+			flash at full current will not be possible. The condition
+			persists until this flag is no longer set
+		* led-over-temperature - the temperature of the LED has exceeded
+			its allowed upper limit
+
+		Flash faults are cleared, if possible, by reading the attribute.
-- 
1.7.9.5
