From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 29/57] leds: dac124d085: Remove work queue
Date: Tue, 11 Aug 2015 11:37:42 +0200
Message-ID: <1439285890-27329-30-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-dac124s085.c |   34 +++++++---------------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

diff --git a/drivers/leds/leds-dac124s085.c b/drivers/leds/leds-dac124s085.c
index db3ba8b..62039a1 100644
--- a/drivers/leds/leds-dac124s085.c
+++ b/drivers/leds/leds-dac124s085.c
@@ -13,20 +13,15 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/workqueue.h>
 #include <linux/spi/spi.h>
 
 struct dac124s085_led {
 	struct led_classdev	ldev;
 	struct spi_device	*spi;
 	int			id;
-	int			brightness;
 	char			name[sizeof("dac124s085-3")];
 
 	struct mutex		mutex;
-	struct work_struct	work;
-	spinlock_t		lock;
 };
 
 struct dac124s085 {
@@ -38,31 +33,20 @@ struct dac124s085 {
 #define ALL_WRITE_UPDATE	(2 << 12)
 #define POWER_DOWN_OUTPUT	(3 << 12)
 
-static void dac124s085_led_work(struct work_struct *work)
+static void dac124s085_set_brightness(struct led_classdev *ldev,
+				      enum led_brightness brightness)
 {
-	struct dac124s085_led *led = container_of(work, struct dac124s085_led,
-						  work);
+	struct dac124s085_led *led = container_of(ldev, struct dac124s085_led,
+						  ldev);
 	u16 word;
 
 	mutex_lock(&led->mutex);
 	word = cpu_to_le16(((led->id) << 14) | REG_WRITE_UPDATE |
-			   (led->brightness & 0xfff));
+			   (brightness & 0xfff));
 	spi_write(led->spi, (const u8 *)&word, sizeof(word));
 	mutex_unlock(&led->mutex);
 }
 
-static void dac124s085_set_brightness(struct led_classdev *ldev,
-				      enum led_brightness brightness)
-{
-	struct dac124s085_led *led = container_of(ldev, struct dac124s085_led,
-						  ldev);
-
-	spin_lock(&led->lock);
-	led->brightness = brightness;
-	schedule_work(&led->work);
-	spin_unlock(&led->lock);
-}
-
 static int dac124s085_probe(struct spi_device *spi)
 {
 	struct dac124s085	*dac;
@@ -78,16 +62,14 @@ static int dac124s085_probe(struct spi_device *spi)
 	for (i = 0; i < ARRAY_SIZE(dac->leds); i++) {
 		led		= dac->leds + i;
 		led->id		= i;
-		led->brightness	= LED_OFF;
 		led->spi	= spi;
 		snprintf(led->name, sizeof(led->name), "dac124s085-%d", i);
-		spin_lock_init(&led->lock);
-		INIT_WORK(&led->work, dac124s085_led_work);
 		mutex_init(&led->mutex);
 		led->ldev.name = led->name;
 		led->ldev.brightness = LED_OFF;
 		led->ldev.max_brightness = 0xfff;
 		led->ldev.brightness_set = dac124s085_set_brightness;
+		led->ldev.flags |= LED_BRIGHTNESS_BLOCKING;
 		ret = led_classdev_register(&spi->dev, &led->ldev);
 		if (ret < 0)
 			goto eledcr;
@@ -109,10 +91,8 @@ static int dac124s085_remove(struct spi_device *spi)
 	struct dac124s085	*dac = spi_get_drvdata(spi);
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(dac->leds); i++) {
+	for (i = 0; i < ARRAY_SIZE(dac->leds); i++)
 		led_classdev_unregister(&dac->leds[i].ldev);
-		cancel_work_sync(&dac->leds[i].work);
-	}
 
 	return 0;
 }
-- 
1.7.9.5
