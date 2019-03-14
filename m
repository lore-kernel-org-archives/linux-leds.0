From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 4/6] leds: netdev trigger: move name length checking to netdev_trig_set_device
Date: Thu, 14 Mar 2019 15:06:17 +0100
Message-ID: <20190314140619.3309-5-linux@rasmusvillemoes.dk>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314140619.3309-1-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

It's better to check that size is sane in the function that does the
memcpy'ing and 0-termination to the IFNAMSIZ-sized buffer instead of
relying on callers getting it right. Not rejecting size upfront does
mean we would do the cancel_delayed_work_sync(), but that gets fixed
up by the set_baseline_state() call.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/leds/trigger/ledtrig-netdev.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index c35439291424..e4a76ce4e4c7 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -104,9 +104,12 @@ static ssize_t device_name_show(struct device *dev,
 	return len;
 }
 
-static void netdev_trig_set_device(struct led_netdev_data *trigger_data,
-				   const char *buf, size_t size)
+static ssize_t netdev_trig_set_device(struct led_netdev_data *trigger_data,
+				      const char *buf, size_t size)
 {
+	if (size >= IFNAMSIZ)
+		return -EINVAL;
+
 	if (trigger_data->net_dev) {
 		dev_put(trigger_data->net_dev);
 		trigger_data->net_dev = NULL;
@@ -125,6 +128,7 @@ static void netdev_trig_set_device(struct led_netdev_data *trigger_data,
 			set_bit(NETDEV_LED_MODE_LINKUP, &trigger_data->mode);
 
 	trigger_data->last_activity = 0;
+	return 0;
 }
 
 static ssize_t device_name_store(struct device *dev,
@@ -133,23 +137,22 @@ static ssize_t device_name_store(struct device *dev,
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
 	size_t orig_size = size;
+	ssize_t ret;
 
 	/* Ignore trailing newline */
 	if (size > 0 && buf[size - 1] == '\n')
 		size--;
-	if (size >= IFNAMSIZ)
-		return -EINVAL;
 
 	cancel_delayed_work_sync(&trigger_data->work);
 
 	spin_lock_bh(&trigger_data->lock);
 
-	netdev_trig_set_device(trigger_data, buf, size);
+	ret = netdev_trig_set_device(trigger_data, buf, size);
 
 	set_baseline_state(trigger_data);
 	spin_unlock_bh(&trigger_data->lock);
 
-	return orig_size;
+	return ret ? ret : orig_size;
 }
 
 static DEVICE_ATTR_RW(device_name);
-- 
2.20.1
