From: Tin Huynh <tnhuynh@apm.com>
Subject: [PATCH V3] leds: pca955x: Add ACPI support for pca955x
Date: Wed, 30 Nov 2016 10:08:31 +0700
Message-ID: <1480475311-14385-1-git-send-email-tnhuynh@apm.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pg0-f52.google.com ([74.125.83.52]:35273 "EHLO
        mail-pg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755070AbcK3DJZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Nov 2016 22:09:25 -0500
Received: by mail-pg0-f52.google.com with SMTP id p66so76565730pga.2
        for <linux-leds@vger.kernel.org>; Tue, 29 Nov 2016 19:08:42 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, patches@apm.com, Tin Huynh <tnhuynh@apm.com>

This patch enables ACPI support for leds-pca955x driver.

Signed-off-by: Tin Huynh <tnhuynh@apm.com>
---
 drivers/leds/leds-pca955x.c |   22 +++++++++++++++++++++-
 1 files changed, 21 insertions(+), 1 deletions(-)

Change from V2:
 -Correct coding conventions.

Change from V1: 
 -Remove CONFIG_ACPI.

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 840401a..b168ebe 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -40,6 +40,7 @@
  *  bits the chip supports.
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/string.h>
@@ -100,6 +101,15 @@ struct pca955x_chipdef {
 };
 MODULE_DEVICE_TABLE(i2c, pca955x_id);
 
+static const struct acpi_device_id pca955x_acpi_ids[] = {
+	{ .id = "PCA9550", .driver_data = pca9550 },
+	{ .id = "PCA9551", .driver_data = pca9551 },
+	{ .id = "PCA9552", .driver_data = pca9552 },
+	{ .id = "PCA9553", .driver_data = pca9553 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, pca955x_acpi_ids);
+
 struct pca955x {
 	struct mutex lock;
 	struct pca955x_led *leds;
@@ -250,7 +260,16 @@ static int pca955x_probe(struct i2c_client *client,
 	struct led_platform_data *pdata;
 	int i, err;
 
-	chip = &pca955x_chipdefs[id->driver_data];
+	if (id) {
+		chip = &pca955x_chipdefs[id->driver_data];
+	} else {
+		const struct acpi_device_id *acpi_id;
+
+		acpi_id = acpi_match_device(pca955x_acpi_ids, &client->dev);
+		if (!acpi_id)
+			return -ENODEV;
+		chip = &pca955x_chipdefs[acpi_id->driver_data];
+	}
 	adapter = to_i2c_adapter(client->dev.parent);
 	pdata = dev_get_platdata(&client->dev);
 
@@ -358,6 +377,7 @@ static int pca955x_remove(struct i2c_client *client)
 static struct i2c_driver pca955x_driver = {
 	.driver = {
 		.name	= "leds-pca955x",
+		.acpi_match_table = ACPI_PTR(pca955x_acpi_ids),
 	},
 	.probe	= pca955x_probe,
 	.remove	= pca955x_remove,
-- 
1.7.1
