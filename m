From: Tin Huynh <tnhuynh@apm.com>
Subject: [PATCH V5] leds: pca955x: Add ACPI support for pca955x
Date: Fri,  2 Dec 2016 11:39:13 +0700
Message-ID: <1480653553-22911-1-git-send-email-tnhuynh@apm.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Peter Rosin <peda@axentia.se>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, patches@apm.com, Tin Huynh <tnhuynh@apm.com>
List-Id: linux-leds@vger.kernel.org

This patch enables ACPI support for leds-pca955x driver.

Signed-off-by: Tin Huynh <tnhuynh@apm.com>
---
 drivers/leds/leds-pca955x.c |   24 ++++++++++++++++++++++--
 1 files changed, 22 insertions(+), 2 deletions(-)

Change from V4:
 -Using client->name instead of id->name to avoid NULL pointer in ACPI.
 
Change from V3:
 -Drop ".id =" and ".driver_data =" from pca955x_acpi_ids initializers.

Change from V2:
 -Correct coding conventions.

Change from V1:
 -Remove CONFIG_ACPI.

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 840401a..78a7ce8 100644
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
+	{ "PCA9550",  pca9550 },
+	{ "PCA9551",  pca9551 },
+	{ "PCA9552",  pca9552 },
+	{ "PCA9553",  pca9553 },
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
 
@@ -264,7 +283,7 @@ static int pca955x_probe(struct i2c_client *client,
 
 	dev_info(&client->dev, "leds-pca955x: Using %s %d-bit LED driver at "
 			"slave address 0x%02x\n",
-			id->name, chip->bits, client->addr);
+			client->name, chip->bits, client->addr);
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -EIO;
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

