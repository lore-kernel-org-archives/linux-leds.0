From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: ns2: Remove work queue
Date: Fri, 20 Nov 2015 11:44:28 +0100
Message-ID: <1448016268-23024-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55112 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758006AbbKTKoj (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 20 Nov 2015 05:44:39 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NY401RNI0IDD2D0@mailout1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 20 Nov 2015 19:44:37 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Simon Guinot <simon.guinot@sequanux.org>

Now the core implements the work queue, remove it from the driver,
and switch to using brightness_set_blocking op for 'cansleep' case.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Simon Guinot <simon.guinot@sequanux.org>
---
 drivers/leds/leds-ns2.c |   31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index a95a612..506b75b 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -45,24 +45,12 @@ struct ns2_led_data {
 	unsigned		cmd;
 	unsigned		slow;
 	bool			can_sleep;
-	int			mode_index;
 	unsigned char		sata; /* True when SATA mode active. */
 	rwlock_t		rw_lock; /* Lock GPIOs. */
-	struct work_struct	work;
 	int			num_modes;
 	struct ns2_led_modval	*modval;
 };
 
-static void ns2_led_work(struct work_struct *work)
-{
-	struct ns2_led_data *led_dat =
-		container_of(work, struct ns2_led_data, work);
-	int i = led_dat->mode_index;
-
-	gpio_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
-	gpio_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
-}
-
 static int ns2_led_get_mode(struct ns2_led_data *led_dat,
 			    enum ns2_led_modes *mode)
 {
@@ -112,8 +100,8 @@ static void ns2_led_set_mode(struct ns2_led_data *led_dat,
 		goto exit_unlock;
 	}
 
-	led_dat->mode_index = i;
-	schedule_work(&led_dat->work);
+	gpio_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
+	gpio_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
 
 exit_unlock:
 	write_unlock_irqrestore(&led_dat->rw_lock, flags);
@@ -136,6 +124,13 @@ static void ns2_led_set(struct led_classdev *led_cdev,
 	ns2_led_set_mode(led_dat, mode);
 }
 
+static int ns2_led_set_blocking(struct led_classdev *led_cdev,
+			enum led_brightness value)
+{
+	ns2_led_set(led_cdev, value);
+	return 0;
+}
+
 static ssize_t ns2_led_sata_store(struct device *dev,
 				  struct device_attribute *attr,
 				  const char *buff, size_t count)
@@ -219,13 +214,16 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 	led_dat->cdev.name = template->name;
 	led_dat->cdev.default_trigger = template->default_trigger;
 	led_dat->cdev.blink_set = NULL;
-	led_dat->cdev.brightness_set = ns2_led_set;
 	led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 	led_dat->cdev.groups = ns2_led_groups;
 	led_dat->cmd = template->cmd;
 	led_dat->slow = template->slow;
 	led_dat->can_sleep = gpio_cansleep(led_dat->cmd) |
 				gpio_cansleep(led_dat->slow);
+	if (led_dat->can_sleep)
+		led_dat->cdev.brightness_set_blocking = ns2_led_set_blocking;
+	else
+		led_dat->cdev.brightness_set = ns2_led_set;
 	led_dat->modval = template->modval;
 	led_dat->num_modes = template->num_modes;
 
@@ -238,8 +236,6 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 	led_dat->cdev.brightness =
 		(mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
 
-	INIT_WORK(&led_dat->work, ns2_led_work);
-
 	ret = led_classdev_register(&pdev->dev, &led_dat->cdev);
 	if (ret < 0)
 		return ret;
@@ -250,7 +246,6 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 static void delete_ns2_led(struct ns2_led_data *led_dat)
 {
 	led_classdev_unregister(&led_dat->cdev);
-	cancel_work_sync(&led_dat->work);
 }
 
 #ifdef CONFIG_OF_GPIO
-- 
1.7.9.5
