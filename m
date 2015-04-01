From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v5 3/3] leds: Add ktd2692 flash LED driver
Date: Tue, 31 Mar 2015 21:07:30 -0700
Message-ID: <1427861250.18175.51.camel@perches.com>
References: <1427860708-32559-1-git-send-email-ingi2.kim@samsung.com>
	 <1427860708-32559-4-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427860708-32559-4-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, 2015-04-01 at 12:58 +0900, Ingi Kim wrote:
> This patch adds a driver to support the ktd2692 flash LEDs.
> ktd2692 can control flash current by ExpressWire interface.

trivia:

> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
[]
> +static void ktd2692_brightness_set(struct ktd2692_context *led,
> +					enum led_brightness brightness)
> +{
> +	mutex_lock(&led->lock);
> +
> +	if (brightness == LED_OFF) {
> +		led->mode = KTD2692_MODE_DISABLE;
> +		gpio_set_value(led->aux_gpio, KTD2692_LOW);
> +		goto out;
> +	}
> +
> +	ktd2692_expresswire_write(led, KTD2692_REG_MOVIE_CURRENT_BASE |
> +				KTD2692_BRIGHTNESS_RANGE_255_TO_8(brightness));
> +	led->mode = KTD2692_MODE_MOVIE;
> +
> +out:
> +	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
> +	mutex_unlock(&led->lock);
> +}

Perhaps this function would be better with if/else
without the out: label

> +static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
> +						bool state)
> +{
> +	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
> +	struct led_flash_setting *timeout = &fled_cdev->timeout;
> +	u32 flash_tm_reg;
> +
> +	mutex_lock(&led->lock);
> +
> +	if (state == 0) {
> +		led->mode = KTD2692_MODE_DISABLE;
> +		gpio_set_value(led->aux_gpio, KTD2692_LOW);
> +		goto done;
> +	}
> +
> +	flash_tm_reg = GET_TIMEOUT_OFFSET(timeout->val, timeout->step);
> +	ktd2692_expresswire_write(led, flash_tm_reg
> +			| KTD2692_REG_FLASH_TIMEOUT_BASE);
> +
> +	led->mode = KTD2692_MODE_FLASH;
> +	gpio_set_value(led->aux_gpio, KTD2692_HIGH);
> +
> +done:
> +	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);

Same if/else with the done: label?
