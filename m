From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] leds: lp3952: Remove ACPI support for lp3952
Date: Wed, 22 Mar 2017 17:00:20 +0200
Message-ID: <20170322150021.62311-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:9349 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758917AbdCVPBH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Mar 2017 11:01:07 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tony Makkiel <tony.makkiel@daqri.com>

In ACPI world any ID should be carefully chosen and registered
officially. The discussion [1] as I read it gets to wilful assignment
an ID for non-existing real DSDT example.

Rafael already told [2] how this device would be enumerated using
compatible string. To be more precise look at the possible DSDT excerpt
below:

	Device (LDX0) {
		Name (_HID, "PRP0001")
		Name (_DDN, "TI LP3952 compatible led driver")
		...
	})

	Name (_DSD, Package () {
		ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
		Package () {
			Package () {"compatible", "ti,lp3952"},
			...
		}
	})
Based on above, remove non-official ACPI IDs and enumeration from the
driver.

Note: currently driver has no compatible strings at all, to make above
working one should add at least one.

[1] https://e2e.ti.com/support/power_management/led_driver/f/192/t/524926
[2] https://www.spinics.net/lists/linux-acpi/msg67125.html

Cc: Tony Makkiel <tony.makkiel@daqri.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 v2:
 - extend commit message to show how PRP0001 is supposed to work
 - update link to Rafael's review
 - revert wrong ret variable fix
 drivers/leds/leds-lp3952.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index 4847e89883a7..5184436b8905 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -10,7 +10,6 @@
  *
  */
 
-#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/i2c.h>
@@ -276,19 +275,9 @@ static const struct i2c_device_id lp3952_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lp3952_id);
 
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id lp3952_acpi_match[] = {
-	{"TXNW3952", 0},
-	{}
-};
-
-MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
-#endif
-
 static struct i2c_driver lp3952_i2c_driver = {
 	.driver = {
 			.name = LP3952_NAME,
-			.acpi_match_table = ACPI_PTR(lp3952_acpi_match),
 	},
 	.probe = lp3952_probe,
 	.remove = lp3952_remove,
-- 
2.11.0
