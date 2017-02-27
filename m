From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 1/2] leds: core: add struct device_node pointer to the struct led_classdev
Date: Mon, 27 Feb 2017 23:22:59 +0100
Message-ID: <20170227222300.2060-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34868 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751418AbdB0WwX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Feb 2017 17:52:23 -0500
Received: by mail-lf0-f65.google.com with SMTP id z127so7178393lfa.2
        for <linux-leds@vger.kernel.org>; Mon, 27 Feb 2017 14:50:39 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

This allows every led_classdev_register user to set of_node before
calling that function. Thanks to this LEDs core code may access DT node
during LED registration (e.g. to read extra info).

A small disadvantage of this imlementation is keeping of_node pointer in
two places: struct led_classdev and struct device.
Another solutions were:
1) Passing pointer with a led_classdev_register call
   This would require changing & complicating the API.
2) Moving allocation part of led_classdev_register to separated function
   This would make registering LED even more complicated.

Having duplicated pointer semms like a reasonable trade-off.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/leds/led-class.c | 1 +
 include/linux/leds.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 326ee6e925a2..9db9d05e4832 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -199,6 +199,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 				led_cdev, led_cdev->groups, "%s", name);
 	if (IS_ERR(led_cdev->dev))
 		return PTR_ERR(led_cdev->dev);
+	led_cdev->dev->of_node = led_cdev->of_node;
 
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 569cb531094c..7dc4a679f376 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -85,6 +85,7 @@ struct led_classdev {
 				     unsigned long *delay_off);
 
 	struct device		*dev;
+	struct device_node	*of_node;
 	const struct attribute_group	**groups;
 
 	struct list_head	 node;			/* LED Device list */
-- 
2.11.0
