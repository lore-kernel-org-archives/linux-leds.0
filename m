From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC PATCH RESEND 2/3] leds: upboard: Add LED support
Date: Fri, 27 Apr 2018 08:38:43 +0100
Message-ID: <20180427073843.ljeswd5tn6z3z4wc@dell>
References: <20180421085009.28773-1-javier@emutex.com>
 <20180421085009.28773-3-javier@emutex.com>
 <20180426073314.g2ccjjkx6vgbknhm@dell>
 <20180426130354.4kidtdwcsxtn5f2g@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180426130354.4kidtdwcsxtn5f2g@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Arteaga <javier@emutex.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan O'Donovan <dan@emutex.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, 26 Apr 2018, Javier Arteaga wrote:

[...]

> > >  static const struct regmap_range upboard_up2_readable_ranges[] = {
> > > @@ -116,7 +124,18 @@ static const struct regmap_config upboard_up2_regmap_config = {
> > >  	.wr_table = &upboard_up2_writable_table,
> > >  };
> > >  
> > > +static struct upboard_led_data upboard_up2_led_data[] = {
> > > +	{ .id = 0, .color = "blue" },
> > > +	{ .id = 1, .color = "yellow" },
> > > +	{ .id = 2, .color = "green" },
> > > +	{ .id = 3, .color = "red" },
> > > +};
> > 
> > How is this data used?
> > 
> > Does it ever change, from board to board?
> 
> This provides indexes into the LED control register, so the leds driver
> knows which regmap bits to flip, and maps them to color names, so it can
> name the led devices accordingly. The mapping does change for each board
> (UP1 has 3 LEDs, UP Core depends on the carrier board).

I think this information should live in the driver which consumes it.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
