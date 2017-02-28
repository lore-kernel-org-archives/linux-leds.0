From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 2/4] leds: triggers: add early support for trigger-type DT property
Date: Tue, 28 Feb 2017 13:04:50 +0100
Message-ID: <20170228120452.10043-2-zajec5@gmail.com>
References: <20170228120452.10043-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34873 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751883AbdB1MhN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Feb 2017 07:37:13 -0500
In-Reply-To: <20170228120452.10043-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

This adds support for getting DT node pointed in "triggers" property
and reading its "trigger-type". This will allow:
1) Activating proper trigger as specified in DT
2) Accessing DT info in specific triggers

Please note there is a validation of specified trigger type. This
requires documenting every supported value instead of blindly mapping
them into Linux triggers.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/leds/led-triggers.c | 41 +++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h        |  1 +
 2 files changed, 42 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 572ede298d68..83897e0d6b76 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -16,6 +16,7 @@
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/device.h>
+#include <linux/of.h>
 #include <linux/timer.h>
 #include <linux/rwsem.h>
 #include <linux/leds.h>
@@ -157,11 +158,48 @@ void led_trigger_remove(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_remove);
 
+static void led_trigger_of_read_trigger(struct led_classdev *led_cdev)
+{
+	struct device *dev = led_cdev->dev;
+	struct device_node *led_np = dev_of_node(dev);
+	struct of_phandle_args args;
+	const char *trigger_type;
+	int err;
+
+	if (!led_np)
+		return;
+
+	/* Currently we support only 1 trigger at a time */
+	err = of_parse_phandle_with_args(led_np, "triggers", NULL, 0, &args);
+	if (err)
+		return;
+
+	err = of_property_read_string(args.np, "trigger-type", &trigger_type);
+	if (err) {
+		dev_err(dev, "Failed to read trigger type\n");
+		goto err_node_put;
+	}
+
+	/* Check if trigger specified in DT is supported */
+	if (1) /* TODO */
+		goto err_node_put;
+
+	led_cdev->default_trigger = trigger_type;
+	led_cdev->trigger_node = args.np;
+
+	return;
+
+err_node_put:
+	of_node_put(args.np);
+}
+
 int led_trigger_set_default(struct led_classdev *led_cdev)
 {
 	struct led_trigger *trig;
 	int ret = -EPROBE_DEFER;
 
+	led_trigger_of_read_trigger(led_cdev);
+
 	if (!led_cdev->default_trigger)
 		return 0;
 
@@ -252,6 +290,9 @@ void led_trigger_unregister(struct led_trigger *trig)
 		up_write(&led_cdev->trigger_lock);
 	}
 	up_read(&leds_list_lock);
+
+	if (led_cdev->trigger_node)
+		of_node_put(led_cdev->trigger_node);
 }
 EXPORT_SYMBOL_GPL(led_trigger_unregister);
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 97ff66e3e8c4..bb6dcb9da4a9 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -106,6 +106,7 @@ struct led_classdev {
 
 	struct led_trigger	*trigger;
 	struct list_head	 trig_list;
+	struct device_node	*trigger_node;
 	void			*trigger_data;
 	/* true if activated - deactivate routine uses it to do cleanup */
 	bool			activated;
-- 
2.11.0
