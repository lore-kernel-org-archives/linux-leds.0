From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 3/6] leds: netdev trigger: move newline handling back to device_name_store
Date: Thu, 14 Mar 2019 15:06:16 +0100
Message-ID: <20190314140619.3309-4-linux@rasmusvillemoes.dk>
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

Currently, setting device_name to a 15-character name requires
avoiding a trailing newline (e.g. by using 'echo -n' or 'printf'),
which is inconsistent and potentially surprising. Instead of
potentially including a newline in the copy and then overwriting it,
move the newline detection logic to the sysfs handler itself, and
handle it by passing a smaller buffer size to
netdev_trig_set_device().

This also makes netdev_trig_set_device() a better fit for a future
user, which will not need the newline truncation logic.

We still have to tell userspace we consumed all the bytes it gave us,
so we have to stash the original value of size.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/leds/trigger/ledtrig-netdev.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 21605033e322..c35439291424 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -114,8 +114,6 @@ static void netdev_trig_set_device(struct led_netdev_data *trigger_data,
 
 	memcpy(trigger_data->device_name, buf, size);
 	trigger_data->device_name[size] = 0;
-	if (size > 0 && trigger_data->device_name[size - 1] == '\n')
-		trigger_data->device_name[size - 1] = 0;
 
 	if (trigger_data->device_name[0] != 0)
 		trigger_data->net_dev =
@@ -134,7 +132,11 @@ static ssize_t device_name_store(struct device *dev,
 				 size_t size)
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
+	size_t orig_size = size;
 
+	/* Ignore trailing newline */
+	if (size > 0 && buf[size - 1] == '\n')
+		size--;
 	if (size >= IFNAMSIZ)
 		return -EINVAL;
 
@@ -147,7 +149,7 @@ static ssize_t device_name_store(struct device *dev,
 	set_baseline_state(trigger_data);
 	spin_unlock_bh(&trigger_data->lock);
 
-	return size;
+	return orig_size;
 }
 
 static DEVICE_ATTR_RW(device_name);
-- 
2.20.1
