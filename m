From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds/trigger/activity: add a system activity LED trigger
Date: Sun, 27 Aug 2017 18:44:05 +0200
Message-ID: <ca324dc7-3c26-2d7b-dbb0-7d7cd2462d4b@gmail.com>
References: <1486856514-9634-1-git-send-email-w@1wt.eu>
 <5aefe1c8-1d3d-7056-4e51-f0a3d473d3bc@gmail.com>
 <20170824120757.GB19597@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170824120757.GB19597@1wt.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Willy Tarreau <w@1wt.eu>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Willy,

Thanks for the updated patch.

One formal note: please send the patches with git send-email instead
of attaching them to the message.

It simplifies reviewing and applying patches. For the purpose of this
review I just copied the contents of the attachment and pasted as
a quotation. Then I added my comments to the quoted code. Please
refer below.

On 08/24/2017 02:07 PM, Willy Tarreau wrote:
> Hi Jacek,
> 
> On Thu, Mar 09, 2017 at 09:48:39PM +0100, Jacek Anaszewski wrote:
>> Hi Willy,
>>
>> Thanks for the patch.
>>
>> Unfortunately I'm getting following build break, while trying to
>> test it on recent linux-next:
>>
>> drivers/leds/trigger/ledtrig-activity.c: In function
>> 'led_activity_function':
>> drivers/leds/trigger/ledtrig-activity.c:67:14: error: implicit
>> declaration of function 'cputime64_to_jiffies64'
>> [-Werror=implicit-function-declaration]
>>   curr_idle = cputime64_to_jiffies64(curr_idle);
> 
> It took me longer than I hoped to get back to this, but here's a new
> version which works on 4.13-rc6 by not relying on jiffies anymore.
> 
> Thanks!
> Willy
> 

---------- Beginning of the quoted patch ----------


>>From 655256adb790590bbc0c35a9e34bf0a22ea95b5d Mon Sep 17 00:00:00 2001
> From: Willy Tarreau <w@1wt.eu>
> Date: Fri, 10 Feb 2017 19:45:07 +0100
> Subject: leds/trigger/activity: add a system activity LED trigger
> 
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
> since v1:
>   - update to 4.13-rc6 by getting rid of cputime64_to_jiffies64()
>   - fix behaviour on NO_HZ where cumulated idle time could be wrong
> ---
>  drivers/leds/trigger/Kconfig            |   9 +
>  drivers/leds/trigger/Makefile           |   1 +
>  drivers/leds/trigger/ledtrig-activity.c | 297 ++++++++++++++++++++++++++++++++
>  3 files changed, 307 insertions(+)
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
> index 0000000..6f00235
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-activity.c
> @@ -0,0 +1,297 @@
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
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/kernel_stat.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/timer.h>
> +#include <linux/sched.h>
> +#include <linux/leds.h>
> +#include <linux/reboot.h>
> +#include <linux/suspend.h>

Please sort the includes alphabetically.

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
> +	if (unlikely(panic_detected)) {
> +		/* full brightness in case of panic */
> +		led_set_brightness_nosleep(led_cdev, led_cdev->max_brightness);
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
> +			led_cdev->max_brightness : LED_OFF);

Have you considered making the top brightness adjustable? I'd make it
possible especially that we have a similar solution in the
ledtrig-heartbeat.c already - see the following patch in 4.12:

commit fb3d769173d26268d7bf068094a599bb28b2ac63
Author: Jacek Anaszewski <j.anaszewski@samsung.com>
Date:   Wed Nov 9 11:43:46 2016 +0100

    leds: ledtrig-heartbeat: Make top brightness adjustable

    LED class heartbeat trigger allowed only for blinking with
max_brightness
    value. This patch adds more flexibility by exploiting part of LED core
    software blink infrastructure.


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
> +	led_activity_function(activity_data->timer.data);
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
> +static int activity_pm_notifier(struct notifier_block *nb,
> +                                unsigned long pm_event, void *unused)
> +{
> +	int rc;
> +
> +	switch (pm_event) {
> +	case PM_SUSPEND_PREPARE:
> +	case PM_HIBERNATION_PREPARE:
> +	case PM_RESTORE_PREPARE:
> +		led_trigger_unregister(&activity_led_trigger);
> +		break;
> +	case PM_POST_SUSPEND:
> +	case PM_POST_HIBERNATION:
> +	case PM_POST_RESTORE:
> +		rc = led_trigger_register(&activity_led_trigger);
> +		if (rc)
> +			pr_err("could not re-register activity trigger\n");
> +		break;
> +	default:
> +		break;
> +	}
> +	return NOTIFY_DONE;
> +}

It turned out to cause problems in ledtrig-heartbeat.c and was reverted.
Please don't register pm notifier and remove related facilities from the
patch according to the following revert patch:

commit 436c4c45b5b9562b59cedbb51b7343ab4a6dd8cc
Author: Zhang Bo <bo.zhang@nxp.com>
Date:   Tue Jun 13 10:39:20 2017 +0800

    Revert "leds: handle suspend/resume in heartbeat trigger"

    This reverts commit 5ab92a7cb82c66bf30685583a38a18538e3807db.

    System cannot enter suspend mode because of heartbeat led trigger.
    In autosleep_wq, try_to_suspend function will try to enter suspend
    mode in specific period. it will get wakeup_count then call pm_notifier
    chain callback function and freeze processes.
    Heartbeat_pm_notifier is called and it call led_trigger_unregister to
    change the trigger of led device to none. It will send uevent message
    and the wakeup source count changed. As wakeup_count changed, suspend
    will abort.




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
> +static struct notifier_block activity_pm_nb = {
> +	.notifier_call = activity_pm_notifier,
> +};
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
> +		register_pm_notifier(&activity_pm_nb);
> +	}
> +	return rc;
> +}
> +
> +static void __exit activity_exit(void)
> +{
> +	unregister_pm_notifier(&activity_pm_nb);
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

-- 
Best regards,
Jacek Anaszewski
