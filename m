From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds/trigger: system can't enter suspend.
Date: Wed, 10 May 2017 22:51:06 +0200
Message-ID: <3ab1fb5d-7c79-f276-3f10-59fdbb2ab79f@gmail.com>
References: <1494122481-15228-1-git-send-email-sanshan.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:32942 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753162AbdEJUvx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 May 2017 16:51:53 -0400
In-Reply-To: <1494122481-15228-1-git-send-email-sanshan.zhang@nxp.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: sanshan zhang <sanshan.zhang@nxp.com>, linux-kernel@vger.kernel.org
Cc: linux-leds@vger.kernel.org, pavel@ucw.cz, j.anaszewski@samsung.com, rpurdie@rpsys.net

Hi Zhang,

Thanks for the patch.

I'd rather keep sending uevent on setting trigger to "none".

We could get rid of the problem you're trying to fix,
by modifying heartbeat_pm_notifier() so that it didn't go
through the whole procedure of unregistering/registering
the trigger on suspend/resume.

Instead of that we would need to add suspend/resume
ops to the struct led_trigger, that could be implemented
by triggers similarly to activate/deactivate.

We'd need also the led_trigger_suspend{resume}() API
that would iterate through all LED class devices registered
on given trigger and call their suspend/resume ops.

In this specifc case of ledtrig-heartbeat, that suspend
op would need only to call

del_timer_sync(&led_cdev->trigger_data->timer);

and resume would need to call setup_timer() accordingly.

led_trigger_suspend{resume} would replace
led_trigger_unregister{register} in heartbeat_pm_notifier().

I hope this rough design makes sense :-)

Best regards,
Jacek Anaszewski


On 05/07/2017 04:01 AM, sanshan zhang wrote:
> From: zhang sanshan <sanshan.zhang@nxp.com>
> 
> system can't enter suspend when enable led heartbeat.
> 
> pm will call heartbeat_pm_notifier when suspend.
> system will prepare led states, and led_trigger_unregister
> will use led_trigger_set to set trigger.
> kobject_uevent_env will send event,it will call ep_poll_callback
> to hold a wakeup source if we enable wakelock in kernel.
> So that system can't enter suspend.
> 
> If we set led device tigger to NONE, there is not need to
> send notification to user space.
> 
> Change-Id: I9f7ee5764d7e31b9a225dae5517cb36137675f9d
> Signed-off-by: zhang sanshan <sanshan.zhang@nxp.com>
> Signed-off-by: Zhang Bo <bo.zhang@nxp.com>
> ---
>  drivers/leds/led-triggers.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 431123b..f03c2bd1 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -108,13 +108,10 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
>  	unsigned long flags;
>  	char *event = NULL;
>  	char *envp[2];
> -	const char *name;
>  
>  	if (!led_cdev->trigger && !trig)
>  		return;
>  
> -	name = trig ? trig->name : "none";
> -	event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
>  
>  	/* Remove any existing trigger */
>  	if (led_cdev->trigger) {
> @@ -138,6 +135,10 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
>  			trig->activate(led_cdev);
>  	}
>  
> +	if (NULL != trig)
> +		event = kasprintf(GFP_KERNEL, "TRIGGER=%s", trig->name);
> +	else
> +		return;
>  	if (event) {
>  		envp[0] = event;
>  		envp[1] = NULL;
> 
