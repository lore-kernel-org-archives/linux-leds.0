From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] leds: lp3952: Remove ACPI support for lp3952
Date: Tue, 21 Mar 2017 21:33:15 +0200
Message-ID: <20170321193315.33238-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:1232 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755420AbdCUTdk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 21 Mar 2017 15:33:40 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tony Makkiel <tony.makkiel@daqri.com>

In ACPI world any ID should be carefully chosen and registered
officially. The discussion as I read it gets to wilful assignment an ID
for non-existing real DSDT example.

Rafael already told [2] how this device would be enumerated using
compatible string.

Based on above, remove non-official ACPI IDs and enumeration from the
driver.

[1] https://e2e.ti.com/support/power_management/led_driver/f/192/t/524926
[2] http://article.gmane.org/gmane.linux.acpi.devel/85252

Cc: Tony Makkiel <tony.makkiel@daqri.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lp3952.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index 4847e89883a7..4c320f22ab84 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -10,7 +10,6 @@
  *
  */
 
-#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/i2c.h>
@@ -122,9 +121,9 @@ static int lp3952_register_led_classdev(struct lp3952_led_array *priv)
 	};
 
 	for (i = 0; i < LP3952_LED_ALL; i++) {
-		acpi_ret = lp3952_get_label(&priv->client->dev, led_name_hdl[i],
-					    priv->leds[i].name);
-		if (acpi_ret)
+		ret = lp3952_get_label(&priv->client->dev, led_name_hdl[i],
+				       priv->leds[i].name);
+		if (ret)
 			continue;
 
 		priv->leds[i].cdev.name = priv->leds[i].name;
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
