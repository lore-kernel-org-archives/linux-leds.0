From: Tin Huynh <tnhuynh@apm.com>
Subject: [PATCH V1] leds: pca963x: Add ACPI support
Date: Tue, 29 Nov 2016 11:18:20 +0700
Message-ID: <1480393100-1397-1-git-send-email-tnhuynh@apm.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pg0-f42.google.com ([74.125.83.42]:33001 "EHLO
        mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752196AbcK2ESc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Nov 2016 23:18:32 -0500
Received: by mail-pg0-f42.google.com with SMTP id 3so64671447pgd.0
        for <linux-leds@vger.kernel.org>; Mon, 28 Nov 2016 20:18:32 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, patches@apm.com, Tin Huynh <tnhuynh@apm.com>

This patch enables ACPI support for leds-pca963x driver.

Signed-off-by: Tin Huynh <tnhuynh@apm.com>
---
 drivers/leds/leds-pca963x.c |   22 +++++++++++++++++++++-
 1 files changed, 21 insertions(+), 1 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 407eba1..be51a12 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -25,6 +25,7 @@
  * or by adding the 'nxp,hw-blink' property to the DTS.
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/string.h>
@@ -95,6 +96,15 @@ struct pca963x_chipdef {
 };
 MODULE_DEVICE_TABLE(i2c, pca963x_id);
 
+static const struct acpi_device_id pca963x_acpi_ids[] = {
+	{ "PCA9632", pca9633 },
+	{ "PCA9633", pca9633 },
+	{ "PCA9634", pca9634 },
+	{ "PCA9635", pca9635 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, pca963x_acpi_ids);
+
 struct pca963x_led;
 
 struct pca963x {
@@ -322,7 +332,16 @@ static int pca963x_probe(struct i2c_client *client,
 	struct pca963x_chipdef *chip;
 	int i, err;
 
-	chip = &pca963x_chipdefs[id->driver_data];
+	if (id) {
+		chip = &pca963x_chipdefs[id->driver_data];
+	} else {
+		const struct acpi_device_id *acpi_id;
+
+		acpi_id = acpi_match_device(pca963x_acpi_ids, &client->dev);
+		if (!acpi_id)
+			return -ENODEV;
+		chip = &pca963x_chipdefs[acpi_id->driver_data];
+	}
 	pdata = dev_get_platdata(&client->dev);
 
 	if (!pdata) {
@@ -426,6 +445,7 @@ static int pca963x_remove(struct i2c_client *client)
 	.driver = {
 		.name	= "leds-pca963x",
 		.of_match_table = of_match_ptr(of_pca963x_match),
+		.acpi_match_table = ACPI_PTR(pca963x_acpi_ids),
 	},
 	.probe	= pca963x_probe,
 	.remove	= pca963x_remove,
-- 
1.7.1
