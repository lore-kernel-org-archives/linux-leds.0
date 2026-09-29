Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E753EB104;
	Tue, 29 Sep 2026 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673116; cv=none; b=QL/OoUmlLh/HTSDaZoeW2xuJ+wrDSMDT+adH9CICvawQy1imHZ78KtIsImSMyin27t//fK5dEacMZRAxwpJObds1SruSsyNTt5ex79T/3irU7PEm54fYPdu7xForxBbpbxlAJCd07x5JGnv6PWtSrM0IljPJSvGrMs5TWFUWu7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673116; c=relaxed/simple;
	bh=ZRKYSA9lNoFvz9hkgdqIrCwDiB1kNbapUnQ7cGvbzJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQE9hdrqxlYWyHGlPu4SLs2uSGlhXW0CHU99iVKyoSI92TTehcdWjuQ8ds50aK390PXtUp4sX2+1uDaxy9ZeuStYDZIVqTeXZ//1q6PsT0nDj2ErOsdiW+Dt4hCvLH3kiF1HE/NoPn0e3gubM1lReT7X9MOqAZPMrOKmsdQJpqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdkkaCQN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdkkaCQN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A371F000FF;
	Tue, 29 Sep 2026 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790673105;
	bh=iRZrKKdjj6wJIDn1Q4IR6UHPk0wgRtP6EBV9HRXQbLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZdkkaCQNenS6wvDDz2+phvixL2neFWfVW9W3jvgnJ6qjlsXpnlTDuxzyiRBnbuANB
	 V0ToswbpZnJrgNmhXyO/7He4tWmuDs7FbKHQj8UABoO2ZgE0SvbWjZFrn/A4FrqTd9
	 SALzZA/5kMy52YzBnzYgufKEW+RTphQMLDuzEwsaMTedBc6NHjc4i0JcifGJFLt+Yv
	 zE1mxCxQGDUuPNYusQUD6LRsGrY0dpUqGCJqxGitF5LPyDFU6OuzfCO4PFQnhwL1In
	 7Agxzrc2D2PJBiRr3X8pygT2/j8w4KULvoqhS3hZVeTeTlvV9dea34OvUWjiw60ejo
	 yc5J/gpWcsfJg==
Date: Tue, 29 Sep 2026 10:11:41 +0100
From: Lee Jones <lee@kernel.org>
To: plaztininikolai@gmail.com
Cc: Pavel Machek <pavel@kernel.org>, Hans de Goede <hansg@kernel.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: input-events: Restore previous brightness
 on input
Message-ID: <20260929091141.GD2112133@google.com>
References: <20260924-leds-input-events-brightness-v1-1-b0ceff3a2343@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-leds-input-events-brightness-v1-1-b0ceff3a2343@gmail.com>

On Thu, 24 Sep 2026, Nikolay Plastinin via B4 Relay wrote:

> From: Nikolay Plastinin <plaztininikolai@gmail.com>
> 
> The trigger turns the LEDs back on with LED_FULL, which the LED core
> clamps to max_brightness. For keyboard backlights with several levels,
> such as asus::kbd_backlight, this means the backlight always comes back
> at maximum after being idle instead of at the level the user picked.
> 
> Remember the brightness in blink_brightness before turning the LEDs off
> and use it when turning them back on, as the netdev trigger does.
> Brightness changes made while the trigger is active are picked up too.
> This needs per-LED handling, so convert the trigger from the simple
> trigger API to a regular trigger with an activate callback.
> 
> Tested on an ASUS ROG Flow X13 GV302XV: with the keyboard backlight at
> level 1, it now comes back at level 1 after going idle instead of at 3.
> A level changed with the brightness hotkeys while the trigger is active
> is restored after the next idle period as well.
> 
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
> ---
> This came up while looking at a keyboard backlight idle timeout for ASUS
> laptops in asusctl:
> https://github.com/OpenGamingCollective/asusctl/issues/98
> 
> The trigger walks trig->led_cdevs under rcu_read_lock() the same way
> led_trigger_event() does. I can add a helper in led-triggers.c instead
> if that is preferred.
> ---
>  drivers/leds/trigger/ledtrig-input-events.c | 56 +++++++++++++++++++++++++----
>  1 file changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
> index d057b2a23..d1ef14ae8 100644
> --- a/drivers/leds/trigger/ledtrig-input-events.c
> +++ b/drivers/leds/trigger/ledtrig-input-events.c
> @@ -10,6 +10,7 @@
>  #include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> +#include <linux/rculist.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
> @@ -28,7 +29,48 @@ static struct input_events_data {
>  	unsigned long led_off_time;
>  } input_events_data;
>  
> -static struct led_trigger *input_events_led_trigger;
> +static int input_events_activate(struct led_classdev *led_cdev)
> +{
> +	struct input_events_data *data = &input_events_data;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	if (led_cdev->brightness)
> +		led_cdev->blink_brightness = led_cdev->brightness;

Should we be overloading 'blink_brightness' like this?   It would be cleaner to
allocate a small per-LED state struct in the 'activate()' callback, store it in
'led_cdev->trigger_data', and free it in a 'deactivate()' callback.

> +	if (!led_cdev->blink_brightness)
> +		led_cdev->blink_brightness = led_cdev->max_brightness;
> +
> +	led_set_brightness(led_cdev, data->led_on ? led_cdev->blink_brightness : LED_OFF);
> +
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static struct led_trigger input_events_led_trigger = {
> +	.name = "input-events",
> +	.activate = input_events_activate,
> +};
> +
> +/* Must be called with input_events_data.lock held */
> +static void input_events_set_leds(bool on)
> +{
> +	struct led_classdev *led_cdev;
> +
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(led_cdev, &input_events_led_trigger.led_cdevs, trig_list) {

Please avoid accessing 'led_cdevs' and 'trig_list' directly from outside the LED
core.  As you suggested in the commit message, adding a helper in
'led-triggers.c' would be much preferred.

> +		/*
> +		 * Remember the brightness the LED was last set to, so that it
> +		 * is restored instead of max brightness on the next input event.
> +		 */
> +		if (led_cdev->brightness)
> +			led_cdev->blink_brightness = led_cdev->brightness;
> +
> +		led_set_brightness(led_cdev, on ? led_cdev->blink_brightness : LED_OFF);
> +	}
> +	rcu_read_unlock();
> +}
>  
>  static void led_input_events_work(struct work_struct *work)
>  {
> @@ -42,7 +84,7 @@ static void led_input_events_work(struct work_struct *work)
>  	 * running before a new event pushed led_off_time back.
>  	 */
>  	if (time_after_eq(jiffies, data->led_off_time)) {
> -		led_trigger_event(input_events_led_trigger, LED_OFF);
> +		input_events_set_leds(false);
>  		data->led_on = false;
>  	}
>  
> @@ -59,7 +101,7 @@ static void input_events_event(struct input_handle *handle, unsigned int type,
>  	spin_lock_irqsave(&data->lock, flags);
>  
>  	if (!data->led_on) {
> -		led_trigger_event(input_events_led_trigger, LED_FULL);
> +		input_events_set_leds(true);
>  		data->led_on = true;
>  	}
>  	data->led_off_time = jiffies + led_off_delay;
> @@ -138,11 +180,13 @@ static int __init input_events_init(void)
>  	INIT_DELAYED_WORK(&input_events_data.work, led_input_events_work);
>  	spin_lock_init(&input_events_data.lock);
>  
> -	led_trigger_register_simple("input-events", &input_events_led_trigger);
> +	ret = led_trigger_register(&input_events_led_trigger);
> +	if (ret)
> +		return ret;
>  
>  	ret = input_register_handler(&input_events_handler);
>  	if (ret) {
> -		led_trigger_unregister_simple(input_events_led_trigger);
> +		led_trigger_unregister(&input_events_led_trigger);
>  		return ret;
>  	}
>  
> @@ -153,7 +197,7 @@ static void __exit input_events_exit(void)
>  {
>  	input_unregister_handler(&input_events_handler);
>  	cancel_delayed_work_sync(&input_events_data.work);
> -	led_trigger_unregister_simple(input_events_led_trigger);
> +	led_trigger_unregister(&input_events_led_trigger);
>  }
>  
>  module_init(input_events_init);
> 
> ---
> base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
> change-id: 20260924-leds-input-events-brightness-a76ae9a77b85
> 
> Best regards,
> -- 
> Nikolay Plastinin <plaztininikolai@gmail.com>
> 
> 

-- 
Lee Jones
