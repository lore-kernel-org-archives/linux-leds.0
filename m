From: tnhuynh@apm.com
Subject: [PATCH V1] leds: pca955x: Add ACPI support for pca955x
Date: Wed, 23 Nov 2016 15:42:26 +0700
Message-ID: <1479890546-22644-1-git-send-email-tnhuynh@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, patches@apm.com, Tin Huynh <tnhuynh@apm.com>
List-Id: linux-leds@vger.kernel.org

From: Tin Huynh <tnhuynh@apm.com>

This patch enables ACPI support for leds-pca955x driver.

Signed-off-by: Tin Huynh <tnhuynh@apm.com>
---
 drivers/leds/leds-pca955x.c |   26 +++++++++++++++++++++++++-
 1 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 840401a..8770090 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -40,6 +40,7 @@
  *  bits the chip supports.
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/string.h>
@@ -100,6 +101,17 @@ struct pca955x_chipdef {
 };
 MODULE_DEVICE_TABLE(i2c, pca955x_id);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id pca955x_acpi_ids[] = {
+	{ .id = "PCA9550", .driver_data = pca9550 },
+	{ .id = "PCA9551", .driver_data = pca9551 },
+	{ .id = "PCA9552", .driver_data = pca9552 },
+	{ .id = "PCA9553", .driver_data = pca9553 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, pca955x_acpi_ids);
+#endif
+
 struct pca955x {
 	struct mutex lock;
 	struct pca955x_led *leds;
@@ -250,7 +262,18 @@ static int pca955x_probe(struct i2c_client *client,
 	struct led_platform_data *pdata;
 	int i, err;
 
-	chip = &pca955x_chipdefs[id->driver_data];
+	if (id)
+		chip = &pca955x_chipdefs[id->driver_data];
+#ifdef CONFIG_ACPI
+	else {
+		const struct acpi_device_id *acpi_id;
+
+		acpi_id = acpi_match_device(pca955x_acpi_ids, &client->dev);
+		if (!acpi_id)
+			return -ENODEV;
+		chip = &pca955x_chipdefs[acpi_id->driver_data];
+	}
+#endif
 	adapter = to_i2c_adapter(client->dev.parent);
 	pdata = dev_get_platdata(&client->dev);
 
@@ -358,6 +381,7 @@ static int pca955x_remove(struct i2c_client *client)
 static struct i2c_driver pca955x_driver = {
 	.driver = {
 		.name	= "leds-pca955x",
+		.acpi_match_table = ACPI_PTR(pca955x_acpi_ids),
 	},
 	.probe	= pca955x_probe,
 	.remove	= pca955x_remove,
-- 
1.7.1
