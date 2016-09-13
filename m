From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 4/6] leds: gpio: fix and simplify reading property "label"
Date: Tue, 13 Sep 2016 20:56:26 +0200
Message-ID: <60a7f96e-631d-1f2f-f359-901584361406@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

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
