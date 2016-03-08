From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: [PATCH v2 4/4] leds: Add SN3218 and SN3216 support to the IS31FL32XX driver
Date: Mon,  7 Mar 2016 19:57:16 -0500
Message-ID: <1457398636-6485-5-git-send-email-drivshin.allworx@gmail.com>
References: <1457398636-6485-1-git-send-email-drivshin.allworx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457398636-6485-1-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: David Rivshin <drivshin@allworx.com>

Si-En Technology was acquired by ISSI in 2011, and it appears that
the IS31FL3218/IS31FL3216 are just rebranded SN3218/SN3216 devices.

Add the "si-en,sn3218" and "si-en,sn3216" compatible strings into the
IS31FL32XX driver as aliases for the issi equivalents, and update
binding documentation.

Datasheets:
    IS31FL3218: http://www.issi.com/WW/pdf/31FL3218.pdf
    SN3218:     http://www.si-en.com/uploadpdf/s2011517171720.pdf

    IS31FL3216: http://www.issi.com/WW/pdf/31FL3216.pdf
    SN3216:     http://www.si-en.com/uploadpdf/SN3216201152410148.pdf

Signed-off-by: David Rivshin <drivshin@allworx.com>
Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
---

Changes from v1:
 - no longer removes leds-sn3218, as that will be done separately
 - commit log modified to remove references to leds-sn3218 driver
 - added Rob's ack (for binding change) [1]
 - added Tested-By from Stefan (for SN3218) [2]

Changes from RFC:
 new patch

[1] https://lkml.org/lkml/2016/3/4/960
[2] https://lkml.org/lkml/2016/3/4/773

 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt | 9 ++++++---
 drivers/leds/Kconfig                                       | 6 +++---
 drivers/leds/leds-is31fl32xx.c                             | 6 +++++-
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
index e72ed66..926c211 100644
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
@@ -1,6 +1,6 @@
-Binding for ISSI IS31FL32xx LED Drivers
+Binding for ISSI IS31FL32xx and Si-En SN32xx LED Drivers
 
-The IS31FL32xx family of LED drivers are I2C devices with multiple
+The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
 constant-current channels, each with independent 256-level PWM control.
 Each LED is represented as a sub-node of the device.
 
@@ -10,6 +10,8 @@ Required properties:
 	issi,is31fl3235
 	issi,is31fl3218
 	issi,is31fl3216
+	si-en,sn3218
+	si-en,sn3216
 - reg: I2C slave address
 - address-cells : must be 1
 - size-cells : must be 0
@@ -45,5 +47,6 @@ is31fl3236: led-controller@3c {
 	};
 };
 
-For more product information please see the link below:
+For more product information please see the links below:
 http://www.issi.com/US/product-analog-fxled-driver.shtml
+http://www.si-en.com/product.asp?parentid=890
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 08a5743..1f64151 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -572,9 +572,9 @@ config LEDS_IS31FL32XX
 	tristate "LED support for ISSI IS31FL32XX I2C LED controller family"
 	depends on LEDS_CLASS && I2C && OF
 	help
-	  Say Y here to include support for ISSI IS31FL32XX LED controllers.
-	  They are I2C devices with multiple constant-current channels, each
-	  with independent 256-level PWM control.
+	  Say Y here to include support for ISSI IS31FL32XX and Si-En SN32xx
+	  LED controllers. They are I2C devices with multiple constant-current
+	  channels, each with independent 256-level PWM control.
 
 comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
 
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 9a67856..c901d13 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -8,7 +8,9 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  *
- * Datasheets: http://www.issi.com/US/product-analog-fxled-driver.shtml
+ * Datasheets:
+ *   http://www.issi.com/US/product-analog-fxled-driver.shtml
+ *   http://www.si-en.com/product.asp?parentid=890
  */
 
 #include <linux/device.h>
@@ -424,7 +426,9 @@ static const struct of_device_id of_is31fl31xx_match[] = {
 	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
 	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
 	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
+	{ .compatible = "si-en,sn3218",    .data = &is31fl3218_cdef, },
 	{ .compatible = "issi,is31fl3216", .data = &is31fl3216_cdef, },
+	{ .compatible = "si-en,sn3216",    .data = &is31fl3216_cdef, },
 	{},
 };
 
-- 
2.5.0
