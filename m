From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 6/8] leds: gpio: fix and simplify reading property "label"
Date: Tue, 13 Sep 2016 08:03:34 +0200
Message-ID: <9f7cac79-f3e6-0300-cf95-b06d3560ed73@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34434 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751135AbcIMGEJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 02:04:09 -0400
Received: by mail-wm0-f68.google.com with SMTP id g141so5656028wmd.1
        for <linux-leds@vger.kernel.org>; Mon, 12 Sep 2016 23:04:08 -0700 (PDT)
In-Reply-To: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Checking for the presence of the property first isn't strictly needed
as we can react on the return code of fwnode_property_read_string.
Also, even if the presence of a property "label" was checked,
reading a string value for it theoretically still can fail and
this case isn't handled.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/leds-gpio.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 8e2ffc9..deea159 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -176,16 +176,14 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
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
