From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3] leds/trigger/activity: add a system activity LED
 trigger
Date: Tue, 29 Aug 2017 22:44:03 +0200
Message-ID: <5cc06596-c6fd-6c9c-a703-7063616c3a89@gmail.com>
References: <ca324dc7-3c26-2d7b-dbb0-7d7cd2462d4b@gmail.com>
 <1503945891-31722-1-git-send-email-w@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:32992 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750909AbdH2Uou (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Aug 2017 16:44:50 -0400
In-Reply-To: <1503945891-31722-1-git-send-email-w@1wt.eu>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Willy Tarreau <w@1wt.eu>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Willy,

Thanks for the update.

On 08/28/2017 08:44 PM, Willy Tarreau wrote:
> The "activity" trigger was inspired by the heartbeat one, but aims at
> providing instant indication of the immediate CPU usage. Under idle
> condition, it flashes 10ms every second. At 100% usage, it flashes
> 90ms every 100ms. The blinking frequency increases from 1 to 10 Hz
> until either the load is high enough to saturate one CPU core or 50%
> load is reached on a single-core system. Then past this point only the
> duty cycle increases from 10 to 90%.
> 
> This results in a very visible activity reporting allowing one to
> immediately tell whether a machine is under load or not, making it
> quite suitable to be used in clusters.
> 
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> 
> ---
> 
> I've applied all the changes you recommended and tested them on an
> orangepi-pc2, everything still works fine.
> 
> since v2:
>   - sorted includes
>   - removed pm notifiers as in 436c4c45b5
>   - made max brightness adjustable as in fb3d7691
> since v1:
>   - update to 4.13-rc6 by getting rid of cputime64_to_jiffies64()
>   - fix behaviour on NO_HZ where cumulated idle time could be wrong
> ---
>  drivers/leds/trigger/Kconfig            |   9 ++
>  drivers/leds/trigger/Makefile           |   1 +
>  drivers/leds/trigger/ledtrig-activity.c | 273 ++++++++++++++++++++++++++++++++
>  3 files changed, 283 insertions(+)
>  create mode 100644 drivers/leds/trigger/ledtrig-activity.c
> 
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index 3f9ddb9..8432d9e 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -77,6 +77,15 @@ config LEDS_TRIGGER_CPU
>  
>  	  If unsure, say N.
>  
> +config LEDS_TRIGGER_ACTIVITY
> +	tristate "LED activity Trigger"
> +	depends on LEDS_TRIGGERS
> +	help
> +	  This allows LEDs to be controlled by a immediate CPU usage.
> +	  The flash frequency and duty cycle varies from faint flashes to
> +	  intense brightness depending on the instant CPU load.
> +	  If unsure, say Y.
> +
>  config LEDS_TRIGGER_GPIO
>  	tristate "LED GPIO Trigger"
>  	depends on LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
> index a72c43c..e572ce57 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_LEDS_TRIGGER_HEARTBEAT)	+= ledtrig-heartbeat.o
>  obj-$(CONFIG_LEDS_TRIGGER_BACKLIGHT)	+= ledtrig-backlight.o
>  obj-$(CONFIG_LEDS_TRIGGER_GPIO)		+= ledtrig-gpio.o
>  obj-$(CONFIG_LEDS_TRIGGER_CPU)		+= ledtrig-cpu.o
> +obj-$(CONFIG_LEDS_TRIGGER_ACTIVITY)	+= ledtrig-activity.o
>  obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+= ledtrig-default-on.o
>  obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+= ledtrig-transient.o
>  obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+= ledtrig-camera.o
> diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
> new file mode 100644
> index 0000000..c6635c5
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-activity.c
> @@ -0,0 +1,273 @@
> +/*
> + * Activity LED trigger
> + *
> + * Copyright (C) 2017 Willy Tarreau <w@1wt.eu>
> + * Partially based on Atsushi Nemoto's ledtrig-heartbeat.c.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/kernel_stat.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/reboot.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/timer.h>
> +#include "../leds.h"
> +
> +static int panic_detected;
> +
> +struct activity_data {
> +	struct timer_list timer;
> +	u64 last_used;
> +	u64 last_boot;
> +	int time_left;
> +	int state;
> +	int invert;
> +};
> +
> +static void led_activity_function(unsigned long data)
> +{
> +	struct led_classdev *led_cdev = (struct led_classdev *)data;
> +	struct activity_data *activity_data = led_cdev->trigger_data;
> +	struct timespec boot_time;
> +	unsigned int target;
> +	unsigned int usage;
> +	int delay;
> +	u64 curr_used;
> +	u64 curr_boot;
> +	s32 diff_used;
> +	s32 diff_boot;
> +	int cpus;
> +	int i;
> +
> +	if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags))
> +		led_cdev->blink_brightness = led_cdev->new_blink_brightness;
> +
> +	if (unlikely(panic_detected)) {
> +		/* full brightness in case of panic */
> +		led_set_brightness_nosleep(led_cdev, led_cdev->blink_brightness);
> +		return;
> +	}
> +
> +	get_monotonic_boottime(&boot_time);
> +
> +	cpus = 0;
> +	curr_used = 0;
> +
> +	for_each_possible_cpu(i) {
> +		curr_used += kcpustat_cpu(i).cpustat[CPUTIME_USER]
> +			  +  kcpustat_cpu(i).cpustat[CPUTIME_NICE]
> +			  +  kcpustat_cpu(i).cpustat[CPUTIME_SYSTEM]
> +			  +  kcpustat_cpu(i).cpustat[CPUTIME_SOFTIRQ]
> +			  +  kcpustat_cpu(i).cpustat[CPUTIME_IRQ];
> +		cpus++;
> +	}
> +
> +	/* We come here every 100ms in the worst case, so that's 100M ns of
> +	 * cumulated time. By dividing by 2^16, we get the time resolution
> +	 * down to 16us, ensuring we won't overflow 32-bit computations below
> +	 * even up to 3k CPUs, while keeping divides cheap on smaller systems.
> +	 */
> +	curr_boot = timespec_to_ns(&boot_time) * cpus;
> +	diff_boot = (curr_boot - activity_data->last_boot) >> 16;
> +	diff_used = (curr_used - activity_data->last_used) >> 16;
> +	activity_data->last_boot = curr_boot;
> +	activity_data->last_used = curr_used;
> +
> +	if (diff_boot <= 0 || diff_used < 0)
> +		usage = 0;
> +	else if (diff_used >= diff_boot)
> +		usage = 100;
> +	else
> +		usage = 100 * diff_used / diff_boot;
> +
> +	/*
> +	 * Now we know the total boot_time multiplied by the number of CPUs, and
> +	 * the total idle+wait time for all CPUs. We'll compare how they evolved
> +	 * since last call. The % of overall CPU usage is :
> +	 *
> +	 *      1 - delta_idle / delta_boot
> +	 *
> +	 * What we want is that when the CPU usage is zero, the LED must blink
> +	 * slowly with very faint flashes that are detectable but not disturbing
> +	 * (typically 10ms every second, or 10ms ON, 990ms OFF). Then we want
> +	 * blinking frequency to increase up to the point where the load is
> +	 * enough to saturate one core in multi-core systems or 50% in single
> +	 * core systems. At this point it should reach 10 Hz with a 10/90 duty
> +	 * cycle (10ms ON, 90ms OFF). After this point, the blinking frequency
> +	 * remains stable (10 Hz) and only the duty cycle increases to report
> +	 * the activity, up to the point where we have 90ms ON, 10ms OFF when
> +	 * all cores are saturated. It's important that the LED never stays in
> +	 * a steady state so that it's easy to distinguish an idle or saturated
> +	 * machine from a hung one.
> +	 *
> +	 * This gives us :
> +	 *   - a target CPU usage of min(50%, 100%/#CPU) for a 10% duty cycle
> +	 *     (10ms ON, 90ms OFF)
> +	 *   - below target :
> +	 *      ON_ms  = 10
> +	 *      OFF_ms = 90 + (1 - usage/target) * 900
> +	 *   - above target :
> +	 *      ON_ms  = 10 + (usage-target)/(100%-target) * 80
> +	 *      OFF_ms = 90 - (usage-target)/(100%-target) * 80
> +	 *
> +	 * In order to keep a good responsiveness, we cap the sleep time to
> +	 * 100 ms and keep track of the sleep time left. This allows us to
> +	 * quickly change it if needed.
> +	 */
> +
> +	activity_data->time_left -= 100;
> +	if (activity_data->time_left <= 0) {
> +		activity_data->time_left = 0;
> +		activity_data->state = !activity_data->state;
> +		led_set_brightness_nosleep(led_cdev,
> +			(activity_data->state ^ activity_data->invert) ?
> +			led_cdev->blink_brightness : LED_OFF);
> +	}
> +
> +	target = (cpus > 1) ? (100 / cpus) : 50;
> +
> +	if (usage < target)
> +		delay = activity_data->state ?
> +			10 :                        /* ON  */
> +			990 - 900 * usage / target; /* OFF */
> +	else
> +		delay = activity_data->state ?
> +			10 + 80 * (usage - target) / (100 - target) : /* ON  */
> +			90 - 80 * (usage - target) / (100 - target);  /* OFF */
> +
> +
> +	if (!activity_data->time_left || delay <= activity_data->time_left)
> +		activity_data->time_left = delay;
> +
> +	delay = min_t(int, activity_data->time_left, 100);
> +	mod_timer(&activity_data->timer, jiffies + msecs_to_jiffies(delay));
> +}
> +
> +static ssize_t led_invert_show(struct device *dev,
> +                               struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct activity_data *activity_data = led_cdev->trigger_data;
> +
> +	return sprintf(buf, "%u\n", activity_data->invert);
> +}
> +
> +static ssize_t led_invert_store(struct device *dev,
> +                                struct device_attribute *attr,
> +                                const char *buf, size_t size)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct activity_data *activity_data = led_cdev->trigger_data;
> +	unsigned long state;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &state);
> +	if (ret)
> +		return ret;
> +
> +	activity_data->invert = !!state;
> +
> +	return size;
> +}
> +
> +static DEVICE_ATTR(invert, 0644, led_invert_show, led_invert_store);
> +
> +static void activity_activate(struct led_classdev *led_cdev)
> +{
> +	struct activity_data *activity_data;
> +	int rc;
> +
> +	activity_data = kzalloc(sizeof(*activity_data), GFP_KERNEL);
> +	if (!activity_data)
> +		return;
> +
> +	led_cdev->trigger_data = activity_data;
> +	rc = device_create_file(led_cdev->dev, &dev_attr_invert);
> +	if (rc) {
> +		kfree(led_cdev->trigger_data);
> +		return;
> +	}
> +
> +	setup_timer(&activity_data->timer,
> +		    led_activity_function, (unsigned long)led_cdev);
> +	if (!led_cdev->blink_brightness)
> +		led_cdev->blink_brightness = led_cdev->max_brightness;
> +	led_activity_function(activity_data->timer.data);
> +	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
> +	led_cdev->activated = true;
> +}
> +
> +static void activity_deactivate(struct led_classdev *led_cdev)
> +{
> +	struct activity_data *activity_data = led_cdev->trigger_data;
> +
> +	if (led_cdev->activated) {
> +		del_timer_sync(&activity_data->timer);
> +		device_remove_file(led_cdev->dev, &dev_attr_invert);
> +		kfree(activity_data);
> +		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
> +		led_cdev->activated = false;
> +	}
> +}
> +
> +static struct led_trigger activity_led_trigger = {
> +	.name       = "activity",
> +	.activate   = activity_activate,
> +	.deactivate = activity_deactivate,
> +};
> +
> +static int activity_reboot_notifier(struct notifier_block *nb,
> +                                    unsigned long code, void *unused)
> +{
> +	led_trigger_unregister(&activity_led_trigger);
> +	return NOTIFY_DONE;
> +}
> +
> +static int activity_panic_notifier(struct notifier_block *nb,
> +                                   unsigned long code, void *unused)
> +{
> +	panic_detected = 1;
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block activity_reboot_nb = {
> +	.notifier_call = activity_reboot_notifier,
> +};
> +
> +static struct notifier_block activity_panic_nb = {
> +	.notifier_call = activity_panic_notifier,
> +};
> +
> +static int __init activity_init(void)
> +{
> +	int rc = led_trigger_register(&activity_led_trigger);
> +
> +	if (!rc) {
> +		atomic_notifier_chain_register(&panic_notifier_list,
> +					       &activity_panic_nb);
> +		register_reboot_notifier(&activity_reboot_nb);
> +	}
> +	return rc;
> +}
> +
> +static void __exit activity_exit(void)
> +{
> +	unregister_reboot_notifier(&activity_reboot_nb);
> +	atomic_notifier_chain_unregister(&panic_notifier_list,
> +					 &activity_panic_nb);
> +	led_trigger_unregister(&activity_led_trigger);
> +}
> +
> +module_init(activity_init);
> +module_exit(activity_exit);
> +
> +MODULE_AUTHOR("Willy Tarreau <w@1wt.eu>");
> +MODULE_DESCRIPTION("Activity LED trigger");
> +MODULE_LICENSE("GPL");
> 

Applied to the for-4.15 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
