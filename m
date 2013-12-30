From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Add LED pattern trigger
Date: Mon, 30 Dec 2013 19:33:03 +0100
Message-ID: <20131230183302.GA28430@amd.pavel.ucw.cz>
References: <1388362275-1618-1-git-send-email-lgxue@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1388362275-1618-1-git-send-email-lgxue@hotmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Joe Xue <lgxue@hotmail.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, rob@landley.net, milo.kim@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

> The LED pattern trigger allows LEDs blink in user defined pattern.
> 
> 	new file:   Documentation/leds/ledtrig-pattern.txt
> 	modified:   drivers/leds/trigger/Kconfig
> 	modified:   drivers/leds/trigger/Makefile
> 	new file:   drivers/leds/trigger/ledtrig-pattern.c
> 
> Suggested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Joe Xue <lgxue@hotmail.com>

> +     echo pattern > trigger
> +     echo "# ## /"
> +
> +     The behaviour is like below:
> +
> +     on(125ms)off(125ms)on(250ms)off


> +static void pattern_timer_function(unsigned long data)
> +{
> +	struct led_classdev *led_cdev = (struct led_classdev *) data;
> +	struct pattern_trig_data *pattern_data = led_cdev->trigger_data;
> +
> +	if (pattern_data->pattern[pattern_data->count] == '#') {
> +		__led_set_brightness(led_cdev, pattern_data->brightness_on);
> +		mod_timer(&pattern_data->timer,
> +			jiffies + msecs_to_jiffies(pattern_data->delay_unit));
> +	} else if (pattern_data->pattern[pattern_data->count] == ' ') {
> +		__led_set_brightness(led_cdev, LED_OFF);
> +		mod_timer(&pattern_data->timer,
> +			jiffies + msecs_to_jiffies(pattern_data->delay_unit));
> +	/* stop blinking */
> +	} else if (pattern_data->pattern[pattern_data->count] == '/') {
> +		return;
> +	}

What about something like this?

Not shcheduling timer when nothing changed should save a bit of power/cpu...

  	if (pattern_data->pattern[pattern_data->count] == '/') {
		return;
	}

	this = pattern_data->pattern[pattern_data->count]
	if (this == '#')
		new_brigtness = pattern_data->brightness_on;
	if (this == ' ')
		new_brigtness = LED_OFF;
	repeat = 1;
	while (pattern_data->pattern[pattern_data->count + repeat] == this)
	      repeat++;

	mod_timer(&pattern_data->timer,
		jiffies + msecs_to_jiffies(pattern_data->delay_unit * repeat));


Thanks,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
