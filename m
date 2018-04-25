From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH RESEND 2/3] leds: upboard: Add LED support
Date: Wed, 25 Apr 2018 19:15:45 +0300
Message-ID: <1524672945.21176.594.camel@linux.intel.com>
References: <20180421085009.28773-1-javier@emutex.com>
         <20180421085009.28773-3-javier@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180421085009.28773-3-javier@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Arteaga <javier@emutex.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Dan O'Donovan <dan@emutex.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Sat, 2018-04-21 at 09:50 +0100, Javier Arteaga wrote:
> Allow userspace to use the on-board LEDs as "upboard:<color>:".

> +	struct upboard_led *led = container_of(cdev, struct
> upboard_led, cdev);

#define to_upboard_led(cdev) container_of(cdev, struct upboard_led,
cdev)

... led = to_upboard_led(cdev);

> +	struct upboard_led *led = container_of(cdev, struct
> upboard_led, cdev);

Ditto.

> +static int __init upboard_led_probe(struct platform_device *pdev)

Are you sure about __init here?

> +	struct upboard_led_data * const pdata = pdev-
> >dev.platform_data;

Don't use direct dereference to platform_data.

> +	if (!pdev->dev.parent)
> +		return -EINVAL;
> +
> +	upboard = dev_get_drvdata(pdev->dev.parent);
> +	if (!upboard || !pdata)
> +		return -EINVAL;

Wouldn't be better to supply regmap as part of platform data?
It will allow be flexible of parent device.

> +MODULE_LICENSE("GPL");

License mismatch.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
