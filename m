From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [RFC PATCH 1/3] leds: trigger: add activity LED trigger
Date: Fri, 09 Sep 2016 16:52:08 +0200
Message-ID: <09e39c80-e21e-748d-7bd7-1a8b026c270b@samsung.com>
References: <1473163848-5408-1-git-send-email-tobias.doerffel@ed-chemnitz.de>
 <1473163848-5408-2-git-send-email-tobias.doerffel@ed-chemnitz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62828 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750816AbcIIOwN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Sep 2016 10:52:13 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OD800DZPRYXW800@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 09 Sep 2016 15:52:09 +0100 (BST)
In-reply-to: <1473163848-5408-2-git-send-email-tobias.doerffel@ed-chemnitz.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tobias Doerffel <tobias.doerffel@ed-chemnitz.de>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>

Hi Tobias,

Thanks for the patch. Please find my comment below.

On 09/06/2016 02:10 PM, Tobias Doerffel wrote:
> The LED activity trigger allows device drivers to indicate device
> activity by blinking LEDs. A typical use case is to signal RX and/or
> TX activity on e.g. CAN busses or serial ports.
>
> This is meant to replace similar code in various device drivers which
> register all their activity LEDs individually.
>
> Signed-off-by: Tobias Doerffel <tobias.doerffel@ed-chemnitz.de>
> ---
>  drivers/leds/trigger/Kconfig            |  10 +++
>  drivers/leds/trigger/Makefile           |   1 +
>  drivers/leds/trigger/ledtrig-activity.c | 147 ++++++++++++++++++++++++++++++++
>  include/linux/leds.h                    |  71 +++++++++++++++
>  4 files changed, 229 insertions(+)
>  create mode 100644 drivers/leds/trigger/ledtrig-activity.c
>
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index 3f9ddb9..ca69bac 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -33,6 +33,16 @@ config LEDS_TRIGGER_ONESHOT
>
>  	  If unsure, say Y.
>
> +config LEDS_TRIGGER_ACTIVITY
> +	tristate "LED Activity Trigger"
> +	depends on LEDS_TRIGGERS
> +	help
> +	  This allows device drivers to indicate device activity by blinking
> +	  LEDs. A typical use case is to signal RX and/or TX activity on e.g.
> +	  CAN busses or serial ports
> +
> +	  If unsure, say Y.
> +
>  config LEDS_TRIGGER_DISK
>  	bool "LED Disk Trigger"
>  	depends on IDE_GD_ATA || ATA
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
> index a72c43c..8431f18 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -1,5 +1,6 @@
>  obj-$(CONFIG_LEDS_TRIGGER_TIMER)	+= ledtrig-timer.o
>  obj-$(CONFIG_LEDS_TRIGGER_ONESHOT)	+= ledtrig-oneshot.o
> +obj-$(CONFIG_LEDS_TRIGGER_ACTIVITY)	+= ledtrig-activity.o
>  obj-$(CONFIG_LEDS_TRIGGER_DISK)		+= ledtrig-disk.o
>  obj-$(CONFIG_LEDS_TRIGGER_MTD)		+= ledtrig-mtd.o
>  obj-$(CONFIG_LEDS_TRIGGER_HEARTBEAT)	+= ledtrig-heartbeat.o
> diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
> new file mode 100644
> index 0000000..fb71738
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-activity.c
> @@ -0,0 +1,147 @@
> +/*
> + * Activity LED Trigger
> + *
> + * Copyright 2016 EDC Electronic Design Chemnitz GmbH
> + *
> + * Author: Tobias Doerffel <tobias.doerffel@ed-chemnitz.de>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/leds.h>
> +
> +static const char *activity_suffixes[ACTIVITY_LED_COUNT] = {
> +	[ACTIVITY_LED_RX] = "rx",
> +	[ACTIVITY_LED_TX] = "tx",
> +	[ACTIVITY_LED_RXTX] = "rxtx",
> +	[ACTIVITY_LED_RECONNECT] = "recon"
> +};
> +
> +void ledtrig_activity_event(struct activity_led_trigger *trig,
> +			    enum activity_led_event event)
> +{
> +	int i;
> +	int event_leds = 0;
> +	unsigned long led_delay = 0;
> +
> +	switch (event) {
> +	case ACTIVITY_LED_EVENT_START:
> +		for (i = 0; i < ACTIVITY_LED_COUNT; i++) {
> +			if (trig->triggers[i].led_trig) {
> +				led_trigger_event(trig->triggers[i].led_trig,
> +						  LED_FULL);
> +			}
> +		}
> +		break;
> +	case ACTIVITY_LED_EVENT_STOP:
> +		for (i = 0; i < ACTIVITY_LED_COUNT; i++) {
> +			if (trig->triggers[i].led_trig) {
> +				led_trigger_event(trig->triggers[i].led_trig,
> +						  LED_OFF);
> +			}
> +		}
> +		break;
> +	case ACTIVITY_LED_EVENT_RX:
> +		event_leds = (ACTIVITY_LEDS_RX | ACTIVITY_LEDS_RXTX);
> +		break;
> +	case ACTIVITY_LED_EVENT_TX:
> +		event_leds = (ACTIVITY_LEDS_TX | ACTIVITY_LEDS_RXTX);
> +		break;
> +	case ACTIVITY_LED_EVENT_RXTX:
> +		event_leds = ACTIVITY_LEDS_RXTX;
> +		break;
> +	case ACTIVITY_LED_EVENT_RECONNECT:
> +		event_leds = ACTIVITY_LEDS_RECONNECT;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	for (i = 0; i < ACTIVITY_LED_COUNT; i++) {
> +		led_delay = trig->triggers[i].delay;
> +		if (led_delay > 0 &&
> +		    (1 << trig->triggers[i].led) & event_leds) {
> +			led_trigger_blink_oneshot(trig->triggers[i].led_trig,
> +						  &led_delay, &led_delay, 1);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_GPL(ledtrig_activity_event);
> +
> +void ledtrig_activity_register(const char *name, int leds,
> +			       struct activity_led_trigger **tp)
> +{
> +	int i;
> +	struct activity_led_trigger *trig;
> +
> +	trig = kzalloc(sizeof(struct activity_led_trigger), GFP_KERNEL);
> +
> +	for (i = 0; i < ACTIVITY_LED_COUNT; i++) {
> +		if (leds & (1 << i)) {
> +			trig->triggers[i].led = i;
> +			trig->triggers[i].delay = ACTIVITY_LED_DEFAULT_DELAY;
> +			snprintf(trig->triggers[i].led_trig_name,
> +				 sizeof(trig->triggers[i].led_trig_name),
> +				 "%s-%s", name, activity_suffixes[i]);
> +			led_trigger_register_simple(
> +						trig->triggers[i].led_trig_name,
> +						&trig->triggers[i].led_trig);
> +		}
> +	}

This will result in registering as many triggers of this type, as many
drivers will call this API. It will be in the contrary with the concept
of generic trigger, that all the triggers in drivers/leds/triggers
adhere to. Those modules register only one instance of the trigger and
this creates a layer through which drivers can notify all the LEDs
listening to the given trigger notifications.

This trigger is just not generic enough IMHO.

> +
> +	*tp = trig;
> +}
> +EXPORT_SYMBOL_GPL(ledtrig_activity_register);
> +
> +void ledtrig_activity_unregister(struct activity_led_trigger *trig)
> +{
> +	int i;
> +
> +	for (i = 0; i < ACTIVITY_LED_COUNT; i++) {
> +		if (trig->triggers[i].led_trig) {
> +			led_trigger_unregister_simple(
> +						trig->triggers[i].led_trig);
> +		}
> +	}
> +
> +	kfree(trig);
> +}
> +EXPORT_SYMBOL_GPL(ledtrig_activity_unregister);
> +
> +void ledtrig_activity_rename(const char *name,
> +			     struct activity_led_trigger *trig)
> +{
> +	int i;
> +	char trig_name[TRIG_NAME_MAX];
> +
> +	for (i = 0; i < ACTIVITY_LED_COUNT; i++) {
> +		if (trig->triggers[i].led_trig) {
> +			snprintf(trig_name, sizeof(trig_name),
> +				 "%s-%s", name, activity_suffixes[i]);
> +			led_trigger_rename_static(trig_name,
> +						  trig->triggers[i].led_trig);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_GPL(ledtrig_activity_rename);
> +
> +void ledtrig_activity_set_delay(struct activity_led_trigger *trig, int leds,
> +				unsigned long delay)
> +{
> +	int i;
> +
> +	for (i = 0; i < ACTIVITY_LED_COUNT; i++) {
> +		if (leds & (1 << i))
> +			trig->triggers[i].delay = delay;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(ledtrig_activity_set_delay);
> +
> +MODULE_AUTHOR("Tobias Doerffel <tobias.doerffel@ed-chemnitz.de>");
> +MODULE_DESCRIPTION("Activity LED trigger");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 8a3b5d2..8a37f97 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -414,4 +414,75 @@ static inline void ledtrig_cpu(enum cpu_led_event evt)
>  }
>  #endif
>
> +/*
> + * Activity LED trigger
> + */
> +
> +enum activity_led_event {
> +	ACTIVITY_LED_EVENT_START,
> +	ACTIVITY_LED_EVENT_STOP,
> +	ACTIVITY_LED_EVENT_RX,
> +	ACTIVITY_LED_EVENT_TX,
> +	ACTIVITY_LED_EVENT_RXTX,
> +	ACTIVITY_LED_EVENT_RECONNECT,
> +};
> +
> +enum activity_led {
> +	ACTIVITY_LED_RX,
> +	ACTIVITY_LED_TX,
> +	ACTIVITY_LED_RXTX,
> +	ACTIVITY_LED_RECONNECT,
> +	ACTIVITY_LED_COUNT,
> +};
> +
> +#define	ACTIVITY_LEDS_RX		(1 << ACTIVITY_LED_RX)
> +#define	ACTIVITY_LEDS_TX		(1 << ACTIVITY_LED_TX)
> +#define	ACTIVITY_LEDS_RXTX		(1 << ACTIVITY_LED_RXTX)
> +#define	ACTIVITY_LEDS_RECONNECT	(1 << ACTIVITY_LED_RECONNECT)
> +
> +#define ACTIVITY_LED_DEFAULT_DELAY	50
> +
> +struct activity_led_event_trigger {
> +	struct led_trigger *led_trig;
> +	char led_trig_name[TRIG_NAME_MAX];
> +	int led;
> +	unsigned long delay;
> +};
> +
> +struct activity_led_trigger {
> +	struct activity_led_event_trigger triggers[ACTIVITY_LED_COUNT];
> +};
> +
> +#ifdef CONFIG_LEDS_TRIGGER_ACTIVITY
> +void ledtrig_activity_event(struct activity_led_trigger *trig,
> +			    enum activity_led_event event);
> +void ledtrig_activity_register(const char *name, int leds,
> +			       struct activity_led_trigger **tp);
> +void ledtrig_activity_unregister(struct activity_led_trigger *trig);
> +void ledtrig_activity_rename(const char *name,
> +			     struct activity_led_trigger *trig);
> +void ledtrig_activity_set_delay(struct activity_led_trigger *trig, int leds,
> +				unsigned long delay);
> +#else
> +void ledtrig_activity_event(struct activity_led_trigger *trig,
> +			    enum activity_led_event event)
> +{
> +}
> +void ledtrig_activity_register(const char *name, int leds,
> +			       struct activity_led_trigger **tp)
> +{
> +}
> +void ledtrig_activity_unregister(struct activity_led_trigger *trig)
> +{
> +}
> +void ledtrig_activity_rename(const char *name,
> +			     struct activity_led_trigger *trig)
> +{
> +}
> +void ledtrig_activity_set_delay(struct activity_led_trigger *trig, int leds,
> +				unsigned long delay)
> +{
> +}
> +#endif
> +
>  #endif		/* __LINUX_LEDS_H_INCLUDED */
>


-- 
Best regards,
Jacek Anaszewski
