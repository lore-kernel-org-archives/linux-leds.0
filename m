From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds/trigger: system can't enter suspend.
Date: Sun, 7 May 2017 10:30:13 +0200
Message-ID: <20170507083013.GA11515@xo-6d-61-c0.localdomain>
References: <1494122481-15228-1-git-send-email-sanshan.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1494122481-15228-1-git-send-email-sanshan.zhang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sanshan zhang <sanshan.zhang@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net
List-Id: linux-leds@vger.kernel.org

On Sun 2017-05-07 10:01:21, sanshan zhang wrote:
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

Does this bug also happen on mainline kernels?

Are you sure noone relies on the "none" trigger behaviour? We usually
don't change user interface without good reason.

Actually.. is someone using those notifications at all? Telling userland
that userland changed LED trigger is somehow... interesting.

									Pavel

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
> -- 
> 1.9.1

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
