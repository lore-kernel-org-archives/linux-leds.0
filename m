From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH] leds/trigger/activity: add a system activity LED trigger
Date: Mon, 28 Aug 2017 08:57:45 +0200
Message-ID: <20170828065745.GA26097@1wt.eu>
References: <1486856514-9634-1-git-send-email-w@1wt.eu>
 <5aefe1c8-1d3d-7056-4e51-f0a3d473d3bc@gmail.com>
 <20170824120757.GB19597@1wt.eu>
 <ca324dc7-3c26-2d7b-dbb0-7d7cd2462d4b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ca324dc7-3c26-2d7b-dbb0-7d7cd2462d4b@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On Sun, Aug 27, 2017 at 06:44:05PM +0200, Jacek Anaszewski wrote:
> Hi Willy,
> 
> Thanks for the updated patch.
> 
> One formal note: please send the patches with git send-email instead
> of attaching them to the message.

Yep, I hesitated and wanted to reply. Will do it the other way next
time, sorry for the hassle.

> > diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
> > new file mode 100644
> > index 0000000..6f00235
> > --- /dev/null
> > +++ b/drivers/leds/trigger/ledtrig-activity.c
> > @@ -0,0 +1,297 @@
> > +/*
> > + * Activity LED trigger
> > + *
> > + * Copyright (C) 2017 Willy Tarreau <w@1wt.eu>
> > + * Partially based on Atsushi Nemoto's ledtrig-heartbeat.c.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + */
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/kernel_stat.h>
> > +#include <linux/init.h>
> > +#include <linux/slab.h>
> > +#include <linux/timer.h>
> > +#include <linux/sched.h>
> > +#include <linux/leds.h>
> > +#include <linux/reboot.h>
> > +#include <linux/suspend.h>
> 
> Please sort the includes alphabetically.

I'm amazed I did this, I suspect I inherited it from the original file
because I'm also used to annoy people for the same thing! Shame on me!

> > +	activity_data->time_left -= 100;
> > +	if (activity_data->time_left <= 0) {
> > +		activity_data->time_left = 0;
> > +		activity_data->state = !activity_data->state;
> > +		led_set_brightness_nosleep(led_cdev,
> > +			(activity_data->state ^ activity_data->invert) ?
> > +			led_cdev->max_brightness : LED_OFF);
> 
> Have you considered making the top brightness adjustable? I'd make it
> possible especially that we have a similar solution in the
> ledtrig-heartbeat.c already - see the following patch in 4.12:
> 
> commit fb3d769173d26268d7bf068094a599bb28b2ac63
> Author: Jacek Anaszewski <j.anaszewski@samsung.com>
> Date:   Wed Nov 9 11:43:46 2016 +0100
(...)

I never thought about it and it makes a lot of sense actually. I'll check
this commit, thanks for the pointer.

> > +	switch (pm_event) {
> > +	case PM_SUSPEND_PREPARE:
> > +	case PM_HIBERNATION_PREPARE:
> > +	case PM_RESTORE_PREPARE:
> > +		led_trigger_unregister(&activity_led_trigger);
> > +		break;
> > +	case PM_POST_SUSPEND:
> > +	case PM_POST_HIBERNATION:
> > +	case PM_POST_RESTORE:
> > +		rc = led_trigger_register(&activity_led_trigger);
> > +		if (rc)
> > +			pr_err("could not re-register activity trigger\n");
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +	return NOTIFY_DONE;
> > +}
> 
> It turned out to cause problems in ledtrig-heartbeat.c and was reverted.
> Please don't register pm notifier and remove related facilities from the
> patch according to the following revert patch:
> 
> commit 436c4c45b5b9562b59cedbb51b7343ab4a6dd8cc
> Author: Zhang Bo <bo.zhang@nxp.com>
> Date:   Tue Jun 13 10:39:20 2017 +0800

OK fine for me. I thought it was mandatory to properly handle pm
eventhough I was not particularly interested in this for this
specific purpose.

I'll send you an updated patch ASAP.

Thanks very much for your review,
Willy
