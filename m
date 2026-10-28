Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191866;
	b=GYcCh/fDFwSUeIIVwKGNhZr823DpRMFTakV3DIUHiW68L7MsI7dbO7vr3kSUk6/NN1Vd
	 4unm3FsoFAjchOol79CFo6zM1AzgjgC7l7aamo36BwZI0P2BmAHWFyqWSvpt0thxCrqIL
	 hVs3sSPrYTc4pwG9mXHu94IQIZr4lptRFwZs1rc1RQTCY9BXtme6FlT1EEbL6q8wvXUj8
	 OxzoV4TzpfTQLmpQY+QMhtFuN19OjsGona3cGNzo58WyxNt/P+vXDRLVQwAVPNI//xA+B
	 jUCRdNV9lcglBG4UDM1Yu8P2nCjxEIpDlXE27mkmHzEa7Bmyc1N/MVs1X1oKMIWDC/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191866;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=gjH0BqzyY/Qk6BYhrJs2UDuY5EZjuq5PvWlb2XSyy9M=;
	b=yVgrOy94Pu3B4N6K1RXElbrOacI5qeC1VCWWxkecyoEkHVn42QgUlk1xC+3Us53YVGbd
	 YC2waugusz30xAbnSyilzglDxbvPnkr4vPBTeA9vh32JhN/HXF1PF7ydSPRf2GioeO5IS
	 l8FETJaiD/QqGnDmLW5OyLNuxFPifPoiUYPdjeLWZJe4hKgNYfXoOok0QDHbgaTAI7FgS
	 KQTMT6IZdTpHtEBkvMeM4b0A7fVOmP1hCkplwXgeQsyXGnf93PRINaag67+L09ahWsp33
	 NUAMTOQK6jzjYF3z0Z+Q2blWWq85glQ0CfNiji6uP5tyRfKfJbRiovfVGykEA5TArVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lcbtj1rv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087C4606A31C;
	Wed, 28 Oct 2026 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lcbtj1rv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8231F01825;
	Wed, 28 Oct 2026 12:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191865;
	bh=gjH0BqzyY/Qk6BYhrJs2UDuY5EZjuq5PvWlb2XSyy9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lcbtj1rv1Iq+h4f4pe4djQ7wtHvHc0pWRWB0pckSxqNuolCfh4ETY6Psr5q7p1iwD
	 p1QwG37T3Go24cLIsAI5kpxwb692ni2gbAJMPq6Uu+86Uw+RK3O9uoy5lxXE7Xjrbd
	 FqLm5UgcwtINA1bMJNDAlLMU4MYS+7c2mhYzX0mSul3NR007qFMwd7J9rTV4vj4hb/
	 sDJN+7gzhg+ZpHVonk22kJqcHN5B/e07GWaBIrehMjt9gDYdS3v5tRJmIjsUI4HlID
	 vgkkFyvYxTIy/OwwsWw/Mw0+T7AROdjDwgqWZ5+u10AhjsP5BiFEiKLw5zowUEB0mT
	 DcL+U6ol+EGFA==
Date: Wed, 28 Oct 2026 12:51:01 +0000
From: Lee Jones <lee@kernel.org>
To: plaztininikolai@gmail.com
Cc: Pavel Machek <pavel@kernel.org>, Hans de Goede <hansg@kernel.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: trigger: input-events: Restore previous
  brightness on input
Message-ID: <179213355690.2581328.7564173219916731857@kernel.org>
References: <20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com>
 <20261016-leds-input-events-brightness-v3-2-2c462cafe020@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-leds-input-events-brightness-v3-2-2c462cafe020@gmail.com>
X-AI-Review-Draft: <20261016-leds-input-events-brightness-v3-2-2c462cafe020@gmail.com>

On Fri, 16 Oct 2026, Nikolay Plastinin via B4 Relay wrote:

> From: Nikolay Plastinin <plaztininikolai@gmail.com>
>
> The trigger turns the LEDs back on with LED_FULL, which the LED core
> clamps to max_brightness. For keyboard backlights with several levels,
> such as asus::kbd_backlight, this means the backlight always comes back
> at maximum after being idle instead of at the level the user picked.
>
> Remember the brightness per LED before turning it off and restore it on
> the next input event. Keep the level in a per-LED state struct allocated
> in activate() and freed in deactivate(), converting the simple trigger
> to a regular trigger. Pick up brightness changes made while the LED is
> on before saving the level again.
>
> Use led_trigger_for_each_led() under guard(rcu)() for both the on and off
> paths. Skip LEDs whose activate() callback has not set up their state yet.
>
> Tested on an ASUS ROG Flow X13 GV302XV: keyboard backlight levels 1 and 2
> were restored after idle timeout and keyboard input, and 20 trigger
> activate/deactivate cycles completed successfully.
>
> Assisted-by: LLM
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-input-events.c | 70 ++++++++++++++++++++++++++---
>  1 file changed, 64 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
> index d057b2a23..b339f1e89 100644
> --- a/drivers/leds/trigger/ledtrig-input-events.c
> +++ b/drivers/leds/trigger/ledtrig-input-events.c
> @@ -28,7 +28,63 @@ static struct input_events_data {
>  	unsigned long led_off_time;
>  } input_events_data;
>
> -static struct led_trigger *input_events_led_trigger;
> +struct input_events_led {
> +	/* Brightness to restore on the next input event */
> +	int brightness;
> +};
> +
> +static int input_events_activate(struct led_classdev *led_cdev)
> +{
> +	struct input_events_data *data = &input_events_data;
> +	struct input_events_led *led;
> +	unsigned long flags;
> +
> +	led = kzalloc_obj(*led);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	/* Start with the current brightness, or full if the LED is off */
> +	led->brightness = led_cdev->brightness ?: led_cdev->max_brightness;
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +	led_set_trigger_data(led_cdev, led);
> +	led_set_brightness(led_cdev, data->led_on ? led->brightness : LED_OFF);
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static void input_events_deactivate(struct led_classdev *led_cdev)
> +{
> +	kfree(led_get_trigger_data(led_cdev));
> +}

Does calling kfree() directly here without synchronising on 'data->lock'
or waiting for an RCU grace period risk a use-after-free in
input_events_set_leds()?

led_trigger_set() removes 'led_cdev' from 'trig->led_cdevs' before
calling .deactivate(), an RCU walker in input_events_set_leds() that
started just before list_del_rcu() can still see 'led_cdev' while
input_events_deactivate() runs.

Since input_events_set_leds() is always called under 'data->lock',
clearing the trigger data under 'data->lock' before freeing 'led' would
prevent that race:

    struct input_events_led *led;

    scoped_guard(spinlock_irqsave, &input_events_data.lock) {
            led = led_get_trigger_data(led_cdev);
            led_set_trigger_data(led_cdev, NULL);
    }
    kfree(led);

> +
> +static struct led_trigger input_events_led_trigger = {
> +	.name = "input-events",
> +	.activate = input_events_activate,
> +	.deactivate = input_events_deactivate,
> +};
> +
> +/* Must be called with input_events_data.lock held */
> +static void input_events_set_leds(bool on)
> +{
> +	struct led_classdev *led_cdev;
> +
> +	guard(rcu)();
> +	led_trigger_for_each_led(led_cdev, &input_events_led_trigger) {
> +		struct input_events_led *led = led_get_trigger_data(led_cdev);
> +
> +		/* Added to the trigger, but activate() has not run yet */
> +		if (!led)
> +			continue;
> +
> +		/* Preserve brightness changes made while the LED was on. */
> +		if (led_cdev->brightness)
> +			led->brightness = led_cdev->brightness;
> +
> +		led_set_brightness(led_cdev, on ? led->brightness : LED_OFF);
> +	}
> +}
>
>  static void led_input_events_work(struct work_struct *work)
>  {
> @@ -42,7 +98,7 @@ static void led_input_events_work(struct work_struct *work)
>  	 * running before a new event pushed led_off_time back.
>  	 */
>  	if (time_after_eq(jiffies, data->led_off_time)) {
> -		led_trigger_event(input_events_led_trigger, LED_OFF);
> +		input_events_set_leds(false);
>  		data->led_on = false;
>  	}
>
> @@ -59,7 +115,7 @@ static void input_events_event(struct input_handle *handle, unsigned int type,
>  	spin_lock_irqsave(&data->lock, flags);
>
>  	if (!data->led_on) {
> -		led_trigger_event(input_events_led_trigger, LED_FULL);
> +		input_events_set_leds(true);
>  		data->led_on = true;
>  	}
>  	data->led_off_time = jiffies + led_off_delay;
> @@ -138,11 +194,13 @@ static int __init input_events_init(void)
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
> @@ -153,7 +211,7 @@ static void __exit input_events_exit(void)
>  {
>  	input_unregister_handler(&input_events_handler);
>  	cancel_delayed_work_sync(&input_events_data.work);
> -	led_trigger_unregister_simple(input_events_led_trigger);
> +	led_trigger_unregister(&input_events_led_trigger);
>  }
>
>  module_init(input_events_init);
>
> -- 
> 2.56.0
>
>

-- 
Lee Jones
