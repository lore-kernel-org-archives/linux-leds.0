From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] leds: leds-gpio: Fix multiple instances registration when 'label' property is absent
Date: Wed,  3 Dec 2014 15:57:33 -0200
Message-ID: <1417629453-25719-1-git-send-email-festevam@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:49707 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751045AbaLCR5z (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 12:57:55 -0500
Received: by mail-qg0-f51.google.com with SMTP id l89so11097393qgf.38
        for <linux-leds@vger.kernel.org>; Wed, 03 Dec 2014 09:57:54 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com
Cc: rpurdie@rpsys.net, jean-michel.hautbois@vodalys.com, grant.likely@linaro.org, rafael.j.wysocki@intel.com, mika.westerberg@linux.intel.com, linux-leds@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

From: Fabio Estevam <fabio.estevam@freescale.com>

Since commit a43f2cbbb009f96 ("leds: leds-gpio: Make use of device property
API") it is no longer possible to register multiple gpio leds without passing
the 'label' property.

According to Documentation/devicetree/bindings/leds/common.txt:

"Optional properties for child nodes:
- label : The label for this LED.  If omitted, the label is
  taken from the node name (excluding the unit address)."

So retrieve the node name when the 'label' property is absent to keep the old
behaviour and fix this regression.

Reported-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
Changes since v1:
- Consider ACPI case as suggested by Grant

 drivers/leds/leds-gpio.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index fd53968..8a8ba11 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -170,6 +170,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 	struct fwnode_handle *child;
 	struct gpio_leds_priv *priv;
 	int count, ret;
+	struct device_node *np;
 
 	count = device_get_child_node_count(dev);
 	if (!count)
@@ -189,7 +190,16 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 			goto err;
 		}
 
-		fwnode_property_read_string(child, "label", &led.name);
+		np = of_node(child);
+
+		if (fwnode_property_present(child, "label")) {
+			fwnode_property_read_string(child, "label", &led.name);
+		} else {
+			if (IS_ENABLED(CONFIG_OF) && !led.name && np)
+				led.name = np->name;
+			if (!led.name)
+				return ERR_PTR(-EINVAL);
+		}
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led.default_trigger);
 
-- 
1.9.1
