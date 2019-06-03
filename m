From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [RFC PATCH 30/57] drivers: leds: Use class_find_device_by_name() helper
Date: Mon,  3 Jun 2019 16:49:56 +0100
Message-ID: <1559577023-558-31-git-send-email-suzuki.poulose@arm.com>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, suzuki.poulose@arm.com, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Use the new class_find_device_by_name() helper.

Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/leds/led-class.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 85848c5..ee052aa 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -216,13 +216,6 @@ static int led_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
 
-static int match_name(struct device *dev, const void *data)
-{
-	if (!dev_name(dev))
-		return 0;
-	return !strcmp(dev_name(dev), (char *)data);
-}
-
 static int led_classdev_next_name(const char *init_name, char *name,
 				  size_t len)
 {
@@ -233,7 +226,7 @@ static int led_classdev_next_name(const char *init_name, char *name,
 	strlcpy(name, init_name, len);
 
 	while ((ret < len) &&
-	       (dev = class_find_device(leds_class, NULL, name, match_name))) {
+	       (dev = class_find_device_by_name(leds_class, NULL, name))) {
 		put_device(dev);
 		ret = snprintf(name, len, "%s_%u", init_name, ++i);
 	}
-- 
2.7.4
