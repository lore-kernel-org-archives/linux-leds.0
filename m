From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 2/6] leds: netdev trigger: factor out middle part of device_name_store
Date: Thu, 14 Mar 2019 15:06:15 +0100
Message-ID: <20190314140619.3309-3-linux@rasmusvillemoes.dk>
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

Take the part of device_name_store that puts the old device (if any),
copies the new device name, looks the name up etc. into a separate
helper function. This is preparation for using that helper from a
function that will initialize the led_netdev_data from a device tree
node. No functional change.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/leds/trigger/ledtrig-netdev.c | 30 ++++++++++++++++-----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 8d476b92f58c..21605033e322 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -104,19 +104,9 @@ static ssize_t device_name_show(struct device *dev,
 	return len;
 }
 
-static ssize_t device_name_store(struct device *dev,
-				 struct device_attribute *attr, const char *buf,
-				 size_t size)
+static void netdev_trig_set_device(struct led_netdev_data *trigger_data,
+				   const char *buf, size_t size)
 {
-	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
-
-	if (size >= IFNAMSIZ)
-		return -EINVAL;
-
-	cancel_delayed_work_sync(&trigger_data->work);
-
-	spin_lock_bh(&trigger_data->lock);
-
 	if (trigger_data->net_dev) {
 		dev_put(trigger_data->net_dev);
 		trigger_data->net_dev = NULL;
@@ -137,6 +127,22 @@ static ssize_t device_name_store(struct device *dev,
 			set_bit(NETDEV_LED_MODE_LINKUP, &trigger_data->mode);
 
 	trigger_data->last_activity = 0;
+}
+
+static ssize_t device_name_store(struct device *dev,
+				 struct device_attribute *attr, const char *buf,
+				 size_t size)
+{
+	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
+
+	if (size >= IFNAMSIZ)
+		return -EINVAL;
+
+	cancel_delayed_work_sync(&trigger_data->work);
+
+	spin_lock_bh(&trigger_data->lock);
+
+	netdev_trig_set_device(trigger_data, buf, size);
 
 	set_baseline_state(trigger_data);
 	spin_unlock_bh(&trigger_data->lock);
-- 
2.20.1
