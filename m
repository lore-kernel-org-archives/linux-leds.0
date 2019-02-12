From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC LEDs
Date: Tue, 12 Feb 2019 22:50:26 +0300
Message-ID: <20190212195026.GB5213@jeknote.loshitsa1.net>
References: <20190209221213.24052-1-jekhor@gmail.com>
 <20190209221213.24052-2-jekhor@gmail.com>
 <9319c977-b8d4-98cc-d719-b21df5ef5a88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9319c977-b8d4-98cc-d719-b21df5ef5a88@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Feb 11, 2019 at 10:36:30PM +0100, Jacek Anaszewski wrote:
> Hi Yauhen,
> 
> Thank you for the patch.
> 
> Please find few comments in the code.
> 
> On 2/9/19 11:12 PM, Yauhen Kharuzhy wrote:
> > diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
> > new file mode 100644
> > index 000000000000..82ed0845bf72
> > --- /dev/null
> > +++ b/drivers/leds/leds-cht-wcove.c
> > @@ -0,0 +1,278 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for LEDs connected to the Intel Cherry Trail Whiskey Cove PMIC
> > + *
> > + * Copyright 2019 Yauhen Kharuzhy <jekhor@gmail.com>
> > + *
> > + * Based on Lenovo Yoga Book Android kernel sources
> > + */
> 
> Please use uniform "//" comment style above.

OK.

> > +
> > +static int cht_wc_leds_brightness_set(struct led_classdev *cdev,
> > +				      enum led_brightness value)
> > +{
> > +	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
> > +	int ret;
> 
> You need mutex protection here. Think of the cases where brightness
> is set from sysfs and the call from trigger jumps in the middle.

Agree.

> > +enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
> > +{
> > +	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
> > +	int ret;
> > +	unsigned int val;
> 
> Ditto.

OK

> > +static int cht_wc_leds_blink_set(struct led_classdev *cdev,
> > +				 unsigned long *delay_on,
> > +				 unsigned long *delay_off)
> > +{
> > +	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
> > +	unsigned int ctrl;
> > +	int ret;
> 
> mutex needed as well.

OK

> 
> > +	if (!*delay_on && !*delay_off) {
> > +		/* Return current settings */
> > +		ret = regmap_read(led->pmic->regmap, led->ctrl_reg, &ctrl);
> 
> Why read? This op sets blinking. Please refer to the blink_set semantics
> description from include/linux/leds.h:
> 
> /*
>  * Activate hardware accelerated blink, delays are in milliseconds
>  * and if both are zero then a sensible default should be chosen.
>  * The call should adjust the timings in that case and if it can't
>  * match the values specified exactly.
>  * Deactivate blinking again when the brightness is set to LED_OFF
>  * via the brightness_set() callback.
>  */
> int             (*blink_set)(struct led_classdev *led_cdev,
>                              unsigned long *delay_on,
>                              unsigned long *delay_off);
> 
> Please compare how other LED class drivers do that.

Hmm... This was attempt to set 'reasonable default' to current blink
settings from hardware. But if this is too unpredictable behaviour for
LED class, I will change it to constant values.

> > +MODULE_DESCRIPTION("Intel Cherrytrail Whiskey Cove PMIC LEDs driver");
> > +MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
> > +MODULE_LICENSE("GPL");
> 
> s/GPL/GPL v2/

OK.

-- 
Yauhen Kharuzhy
