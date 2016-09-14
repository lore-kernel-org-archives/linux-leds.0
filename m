From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 5/7] leds: gpio: fix and simplify reading property "label"
Date: Wed, 14 Sep 2016 20:55:18 +0200
Message-ID: <af8f2553-2651-453f-28dc-60f294af222e@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36383 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763486AbcINS4C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Sep 2016 14:56:02 -0400
In-Reply-To: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Checking for the presence of the property first isn't strictly needed
as we can react on the return code of fwnode_property_read_string.
Also, even if the presence of a property "label" was checked,
reading a string value for it theoretically still can fail and
this case isn't handled.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- rebased due to removal of patch 2 of the original series
---
 drivers/leds/leds-gpio.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 171ba2f..00a24e3 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -181,16 +181,14 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 			goto err;
 		}
 
-		if (fwnode_property_present(child, "label")) {
-			fwnode_property_read_string(child, "label", &led.name);
-		} else {
-			if (IS_ENABLED(CONFIG_OF) && !led.name && np)
-				led.name = np->name;
-			if (!led.name) {
-				ret = -EINVAL;
-				goto err;
-			}
+		ret = fwnode_property_read_string(child, "label", &led.name);
+		if (ret && IS_ENABLED(CONFIG_OF) && np)
+			led.name = np->name;
+		if (!led.name) {
+			ret = -EINVAL;
+			goto err;
 		}
+
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led.default_trigger);
 
-- 
2.9.2
