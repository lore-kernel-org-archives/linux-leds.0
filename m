From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: [PATCH v3 1/4] leds: pca955x: add device tree support
Date: Tue,  8 Aug 2017 15:42:37 +0200
Message-ID: <1502199760-763-2-git-send-email-clg@kaod.org>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502199760-763-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

It will be used in a following patch to define different operation
modes for each pin.

Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
---
Changes since v2:

 - removed 'if (pdata)' test

 drivers/leds/leds-pca955x.c | 101 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 89 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 9a873118ea5f..2d34009d00e6 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -41,14 +41,17 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/string.h>
 #include <linux/ctype.h>
-#include <linux/leds.h>
+#include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/gpio.h>
 #include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 /* LED select registers determine the source that drives LED outputs */
 #define PCA955X_LS_LED_ON	0x0	/* Output LOW */
@@ -122,6 +125,12 @@ struct pca955x_led {
 	struct led_classdev	led_cdev;
 	int			led_num;	/* 0 .. 15 potentially */
 	char			name[32];
+	const char		*default_trigger;
+};
+
+struct pca955x_platform_data {
+	struct pca955x_led	*leds;
+	int			num_leds;
 };
 
 /* 8 bits per input register */
@@ -250,6 +259,70 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_OF)
+static struct pca955x_platform_data *
+pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
+{
+	struct device_node *np = client->dev.of_node;
+	struct device_node *child;
+	struct pca955x_platform_data *pdata;
+	int count;
+
+	count = of_get_child_count(np);
+	if (!count || count > chip->bits)
+		return ERR_PTR(-ENODEV);
+
+	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->leds = devm_kzalloc(&client->dev,
+				   sizeof(struct pca955x_led) * chip->bits,
+				   GFP_KERNEL);
+	if (!pdata->leds)
+		return ERR_PTR(-ENOMEM);
+
+	for_each_child_of_node(np, child) {
+		const char *name;
+		u32 reg;
+		int res;
+
+		res = of_property_read_u32(child, "reg", &reg);
+		if ((res != 0) || (reg >= chip->bits))
+			continue;
+
+		if (of_property_read_string(child, "label", &name))
+			name = child->name;
+
+		snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].name),
+			 "%s", name);
+
+		of_property_read_string(child, "linux,default-trigger",
+					&pdata->leds[reg].default_trigger);
+	}
+
+	pdata->num_leds = chip->bits;
+
+	return pdata;
+}
+
+static const struct of_device_id of_pca955x_match[] = {
+	{ .compatible = "nxp,pca9550", .data = (void *)pca9550 },
+	{ .compatible = "nxp,pca9551", .data = (void *)pca9551 },
+	{ .compatible = "nxp,pca9552", .data = (void *)pca9552 },
+	{ .compatible = "nxp,pca9553", .data = (void *)pca9553 },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, of_pca955x_match);
+#else
+static struct pca955x_platform_data *
+pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
 static int pca955x_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
@@ -257,8 +330,8 @@ static int pca955x_probe(struct i2c_client *client,
 	struct pca955x_led *pca955x_led;
 	struct pca955x_chipdef *chip;
 	struct i2c_adapter *adapter;
-	struct led_platform_data *pdata;
 	int i, err;
+	struct pca955x_platform_data *pdata;
 
 	if (id) {
 		chip = &pca955x_chipdefs[id->driver_data];
@@ -272,6 +345,11 @@ static int pca955x_probe(struct i2c_client *client,
 	}
 	adapter = to_i2c_adapter(client->dev.parent);
 	pdata = dev_get_platdata(&client->dev);
+	if (!pdata) {
+		pdata =	pca955x_pdata_of_init(client, chip);
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
+	}
 
 	/* Make sure the slave address / chip type combo given is possible */
 	if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
@@ -288,13 +366,11 @@ static int pca955x_probe(struct i2c_client *client,
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
 
-	if (pdata) {
-		if (pdata->num_leds != chip->bits) {
-			dev_err(&client->dev, "board info claims %d LEDs"
-					" on a %d-bit chip\n",
-					pdata->num_leds, chip->bits);
-			return -ENODEV;
-		}
+	if (pdata->num_leds != chip->bits) {
+		dev_err(&client->dev,
+			"board info claims %d LEDs on a %d-bit chip\n",
+			pdata->num_leds, chip->bits);
+		return -ENODEV;
 	}
 
 	pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
@@ -378,6 +454,7 @@ static struct i2c_driver pca955x_driver = {
 	.driver = {
 		.name	= "leds-pca955x",
 		.acpi_match_table = ACPI_PTR(pca955x_acpi_ids),
+		.of_match_table = of_match_ptr(of_pca955x_match),
 	},
 	.probe	= pca955x_probe,
 	.remove	= pca955x_remove,
-- 
2.7.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
