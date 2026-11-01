Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793538769;
	b=0Y6rxLz6CVWw/+mYEMaWnrnZA5YN0WVJKSuK9eycPM8lNKrx+OA6ayqNTSRq+ci26VSL
	 U/xrwbhohdykuB7dtOJ0Yo7iCX42OYuSWPJiAU7QWrqnRZMjI5q6vwjpBSR0wx6Ll/srx
	 PzXftqyB6exBI/KUU6i10fdZ7RbAUiRCxWkoi7dYw3Fk7iZp73tf22t2mfT2nabnQ+Vea
	 utPjPuR9lTMTdcE8HU1WsC26g2K/c47ETNBkuSMkmHtTK3b1K1r1MuqS4MzxD4YSlBSQW
	 fCICRNOpKxoQXObeLx6j9g18j1B0vqNTMjDsz3dAEmYuRBT7JqFCAd6pQKwUC8W7bvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793538769;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=j2LtLhA9pLMVs8zDGaOJzNcnav4jLgFgsfOJEwz4Fd4=;
	b=VcxN/q+Dik/ptHNxg2MeDyHvoySivigS03qcxOZegJ/zvgi+RRk5kbRTi+7Xw+J2cRdm
	 8l6sT3RACwbkHLRk8I6FoBJCGAbT8/oA9yml2teJt6aiW+gOLEmM0PfDDGgLHpmPWVS3B
	 2zv8Hc9OTP/vPTHuzjiojnKH4/KlEqyKg8I5tYlBFA8NFdHJvG0L6MX8ixDGXQdA1NRIj
	 MQrFZWMI1hGXSqiW7Q6mu2lWALrvprynablnVTK5CFqG5fr8DPdtJGSm3MlBO8PveiLUr
	 2ywyRl36z4m5VM80Ny4kk/qfiFnYsDt71uQ/9aIYAu3v/cRBhR5g8yUrpZ+caUL0b/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mvQO6LGC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B9F606A324;
	Sun,  1 Nov 2026 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mvQO6LGC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035A61F000C1;
	Sun,  1 Nov 2026 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793538768;
	bh=j2LtLhA9pLMVs8zDGaOJzNcnav4jLgFgsfOJEwz4Fd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mvQO6LGCSo6mN2bz+3xErtwHIbO0rP0HXGCvdAh6l13OFYzAQg8WpIwPBTVym9fiG
	 XpKWbw5ElNsoYOkcBTAbEZXuFxqN7eicE+7ieYiIBqMHBbXfL06vT4imXHNcHbIyjE
	 hUwm+RBfFb02XY6THmqk+1D0wBJLUI/FVgdbSEIo=
Date: Sun, 1 Nov 2026 14:12:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: plaztininikolai@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] leds: trigger: input-events: Restore previous
 brightness on input
Message-ID: <2026110122-graveness-hazy-8d62@gregkh>
References: <20261101-leds-input-events-brightness-v5-1-d5296b1957dc@gmail.com>
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
In-Reply-To: <20261101-leds-input-events-brightness-v5-1-d5296b1957dc@gmail.com>

On Sun, Nov 01, 2026 at 03:19:18PM +0800, Nikolay Plastinin via B4 Relay wrote:
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
> Iterate directly with list_for_each_entry_rcu() under guard(rcu)() for
> both the on and off paths. Skip LEDs whose activate() callback has not
> set up their state yet.

That says what you are doing, but not _WHY_ you are doing it.  Why is
rcu needed here?  That feels very odd for something like a LED, why
isn't the normal device lifetime rules applicable here which would
require RCU to somehow be added just for this?

> Clear trigger_data under the same lock used by the LED walker before
> freeing the per-LED state. Although normal trigger removal waits for an
> RCU grace period, the device_add_groups() error path calls deactivate()
> while the LED is still linked, so a walker must see NULL after teardown.

This is obviously LLM generated, please start from scratch and rewrite
this whole changelog on your own.

> The previous revision was tested on an ASUS ROG Flow X13 GV302XV:
> keyboard backlight levels 1 and 2 were restored after idle timeout and
> keyboard input, and 20 trigger activate/deactivate cycles completed
> successfully.
> 
> Assisted-by: LLM
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
> ---
> The input-events trigger turns LEDs back on with LED_FULL, so a keyboard
> backlight with several levels always comes back at maximum after being
> idle. This series restores the level the user picked instead.
> 
> V5 is a single patch. Iterate directly over the trigger's LEDs using
> list_for_each_entry_rcu() under guard(rcu)(), as requested by Greg KH.
> The per-LED state and locked teardown from v4 are unchanged. No changes
> to include/linux/leds.h or the LED core are needed.
> 
> This came up while looking at a keyboard backlight idle timeout for ASUS
> laptops in asusctl:
> https://github.com/OpenGamingCollective/asusctl/issues/98
> 
> Validation for v5: the module builds out of tree with W=1 against Fedora
> 7.2.12-200.fc44.x86_64 using the installed kernel headers. The user-space
> harness using the driver functions passes ASan/UBSan for the error-unwind
> ordering, brightness restoration, and 10,000 concurrent teardown cycles.
> The harness uses a mutex and a one-element list instead of kernel
> primitives; it is not kernel fault injection or an RCU implementation test.
> V5 hardware testing passed on the GV302XV with kernel 7.2.12: levels 1
> and 2 were restored after idle and input, and 20 activate/deactivate
> cycles completed. The original brightness 2 and trigger none were
> restored, and the test module was unloaded. A separate journalctl check
> of the test interval showed no kernel entries; the script's dmesg output
> included messages from earlier suspend/resume cycles.
> 
> V4 was tested on an ASUS ROG Flow X13 GV302XV with kernel
> 7.2.12-200.fc44.x86_64 and no external monitor: brightness levels 1 and 2
> were restored after idle timeout and keyboard input, and 20 trigger
> activate/deactivate cycles passed. No kernel messages appeared during
> the test. The original brightness and trigger were restored afterwards.
> No full kernel build has been performed.
> 
> LLM assistance was used for the implementation, tests and message drafts.
> ---
> Changes in v5:
> - Drop the common led_trigger_for_each_led() macro and its patch.
> - Open-code list_for_each_entry_rcu() next to guard(rcu)() in the trigger,
>   as requested by Greg KH; include linux/rculist.h directly.
> - Keep the locked trigger_data teardown from v4 unchanged.
> - Link to v4: https://lore.kernel.org/r/20261030-leds-input-events-brightness-v4-0-5ea0ead7480c@gmail.com
> 
> Changes in v4:
> - Clear trigger_data under input_events_data.lock before freeing per-LED
>   state in deactivate(), as suggested by Lee Jones. This also covers the
>   device_add_groups() error path, which deactivates before list removal.
> - Update the NULL-state comment to cover activation error unwind.
> - Patch 1 is unchanged.
> - Link to v3: https://lore.kernel.org/r/20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com
> 
> Changes in v3:
> - Replace led_trigger_walk_leds() with led_trigger_for_each_led(), an
>   RCU list iterator in include/linux/leds.h, as suggested by Lee Jones.
> - Remove the exported helper, callback typedef, and void-pointer argument.
> - Keep saving and restoring brightness in input_events_set_leds(), using
>   guard(rcu)() and a single loop for both the on and off paths.
> - Link to v2: https://lore.kernel.org/r/20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com
> 
> Changes in v2:
> - Keep the saved brightness in a per-LED struct allocated in activate()
>   and freed in deactivate(), stored in led_cdev->trigger_data, instead of
>   overloading blink_brightness (Lee Jones).
> - Add led_trigger_walk_leds() to led-triggers.c and use it instead of
>   walking led_cdevs/trig_list from the trigger (Lee Jones).
> - Use the Assisted-by tag format from coding-assistants.rst.
> - Link to v1: https://lore.kernel.org/r/20260924-leds-input-events-brightness-v1-1-b0ceff3a2343@gmail.com
> ---
>  drivers/leds/trigger/ledtrig-input-events.c | 78 ++++++++++++++++++++++++++---
>  1 file changed, 72 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
> index d057b2a23..5fbd3e853 100644
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
> @@ -28,7 +29,70 @@ static struct input_events_data {
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
> +	struct input_events_led *led;
> +
> +	scoped_guard(spinlock_irqsave, &input_events_data.lock) {
> +		led = led_get_trigger_data(led_cdev);
> +		led_set_trigger_data(led_cdev, NULL);
> +	}
> +	kfree(led);
> +}
> +
> +static struct led_trigger input_events_led_trigger = {
> +	.name = "input-events",
> +	.activate = input_events_activate,
> +	.deactivate = input_events_deactivate,
> +};
> +
> +/* Must be called with input_events_data.lock held */

Great, then add the proper static checking for this state so that the
tools catch it when someone does not do that.

> +static void input_events_set_leds(bool on)

"set" and "on"?  Naming is hard :)

Look at how this is used:

> +{
> +	struct led_classdev *led_cdev;
> +
> +	guard(rcu)();
> +	list_for_each_entry_rcu(led_cdev, &input_events_led_trigger.led_cdevs,
> +				trig_list) {
> +		struct input_events_led *led = led_get_trigger_data(led_cdev);
> +
> +		/* Not yet activated, or already deactivated during error unwind */
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
> @@ -42,7 +106,7 @@ static void led_input_events_work(struct work_struct *work)
>  	 * running before a new event pushed led_off_time back.
>  	 */
>  	if (time_after_eq(jiffies, data->led_off_time)) {
> -		led_trigger_event(input_events_led_trigger, LED_OFF);
> +		input_events_set_leds(false);

"Set" and "false"?  So you don't want to set anything?

Again, naming is hard, the original code here was obvious what was
happening, LED_OFF is self-describing.  Your change is now not that.

thanks,

greg k-h
