From: Javier Arteaga <javier@emutex.com>
Subject: Re: [RFC PATCH RESEND 2/3] leds: upboard: Add LED support
Date: Thu, 26 Apr 2018 14:03:54 +0100
Message-ID: <20180426130354.4kidtdwcsxtn5f2g@localhost>
References: <20180421085009.28773-1-javier@emutex.com>
 <20180421085009.28773-3-javier@emutex.com>
 <20180426073314.g2ccjjkx6vgbknhm@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180426073314.g2ccjjkx6vgbknhm@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan O'Donovan <dan@emutex.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Lee,

On Thu, Apr 26, 2018 at 08:34:05AM +0100, Lee Jones wrote:
> >  drivers/mfd/upboard.c       | 19 ++++++++
> 
> This change needs to be placed into a separate patch.

OK. I'll do ("add driver" -> "add cell") pairs of patches then.

> > +#define UPBOARD_LED_CELL(led_data, n)                   \
> > +	{                                               \
> > +		.name = "upboard-led",                  \
> > +		.id = (n),                              \
> > +		.platform_data = &led_data[(n)],        \
> > +		.pdata_size = sizeof(*(led_data)),      \
> > +	}
> > +
> 
> There is a subsystem-level MACRO currently being reviewed on the list.
> 
> Just use the full format in your structs for now.

Will do.

> >  /* UP Squared */
> >  
> >  static const struct regmap_range upboard_up2_readable_ranges[] = {
> > @@ -116,7 +124,18 @@ static const struct regmap_config upboard_up2_regmap_config = {
> >  	.wr_table = &upboard_up2_writable_table,
> >  };
> >  
> > +static struct upboard_led_data upboard_up2_led_data[] = {
> > +	{ .id = 0, .color = "blue" },
> > +	{ .id = 1, .color = "yellow" },
> > +	{ .id = 2, .color = "green" },
> > +	{ .id = 3, .color = "red" },
> > +};
> 
> How is this data used?
> 
> Does it ever change, from board to board?

This provides indexes into the LED control register, so the leds driver
knows which regmap bits to flip, and maps them to color names, so it can
name the led devices accordingly. The mapping does change for each board
(UP1 has 3 LEDs, UP Core depends on the carrier board).

> > +struct upboard_led_data {
> > +	unsigned int id;
> > +	const char *color;
> > +};
> 
> If this is going to stick around, which I'm not sure it should, you
> need to document it (using kerneldoc format), since 'id' is quite
> ambiguous.

True, it's not very clear. Would it help here to also pass the regmap
explicitly as platform_data (instead of leds-upboard getting to the
regmap through parent driver drvdata)?

Thanks for your review!
