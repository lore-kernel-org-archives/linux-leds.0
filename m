From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 1/3] leds: trigger: Introduce a kernel panic LED trigger
Date: Wed, 30 Mar 2016 16:11:09 -0300
Message-ID: <20160330191109.GA27372@laptop.cereza>
References: <1459283749-22451-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459283749-22451-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <56FB9C6A.2090402@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:36507 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752452AbcC3TLP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 30 Mar 2016 15:11:15 -0400
Received: by mail-qg0-f41.google.com with SMTP id w104so42114792qge.3
        for <linux-leds@vger.kernel.org>; Wed, 30 Mar 2016 12:11:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <56FB9C6A.2090402@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Richard Purdie <rpurdie@rpsys.net>, kgene@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org

+lkml

On 30 Mar 11:29 AM, Jacek Anaszewski wrote:
> Hi Ezequiel,
> 
> Thanks for the patch. I've tested it on exynos4412-trats2 board
> with leds-aat1290 driver, by executing:
> 
> echo "c" > /proc/sysrq-trigger
> 
> I was able to notice the blinking then.
> 
> Applied to the for-next branch of linux-leds.git.
> 

Notice that we currently need LEDs to be dedicated
to the panic trigger, which is pretty lame as LEDs
are scarce and are most likely assigned to something else.

So, here's a toy patch to switch all the installed LEDs
to the panic trigger on kernel panic. Patch is half-baked,
but it shows the idea.

(Interestingly, it also blinks the LEDs on a USB keyboard!)

Is there any value in polishing this and find a way upstream?

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index aa84e5b37593..caaf6161a7ae 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -321,6 +321,20 @@ void devm_led_classdev_unregister(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
 
+static int led_panic_notifier(struct notifier_block *nb,
+			      unsigned long code, void *unused)
+{
+	struct led_classdev *led_cdev;
+
+	list_for_each_entry(led_cdev, &leds_list, node)
+		led_trigger_set_at_panic(led_cdev, "panic");
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block led_panic_nb = {
+	.notifier_call = led_panic_notifier,
+};
+
 static int __init leds_init(void)
 {
 	leds_class = class_create(THIS_MODULE, "leds");
@@ -328,6 +342,8 @@ static int __init leds_init(void)
 		return PTR_ERR(leds_class);
 	leds_class->pm = &leds_class_dev_pm_ops;
 	leds_class->dev_groups = led_groups;
+	atomic_notifier_chain_register(&panic_notifier_list,
+				       &led_panic_nb);
 	return 0;
 }
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 2181581795d3..8c1d33acdfa8 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -148,6 +148,21 @@ void led_trigger_remove(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_remove);
 
+void led_trigger_set_at_panic(struct led_classdev *led_cdev, const char *name)
+{
+	struct led_trigger *trig;
+
+	list_for_each_entry(trig, &trigger_list, next_trig) {
+		if (strcmp(name, trig->name))
+			continue;
+		list_add_tail(&led_cdev->trig_list, &trig->led_cdevs);
+		led_cdev->trigger = trig;
+		if (trig->activate)
+			trig->activate(led_cdev);
+		break;
+	}
+}
+
 void led_trigger_set_default(struct led_classdev *led_cdev)
 {
 	struct led_trigger *trig;
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index db3f20da7221..8cfa10f626a6 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -21,6 +21,7 @@ static inline int led_get_brightness(struct led_classdev *led_cdev)
 	return led_cdev->brightness;
 }
 
+void led_trigger_set_at_panic(struct led_classdev *led_cdev, const char *name);
 void led_init_core(struct led_classdev *led_cdev);
 void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev,
-- 
2.7.0


-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
