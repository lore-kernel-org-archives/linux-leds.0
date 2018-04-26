From: Javier Arteaga <javier@emutex.com>
Subject: Re: [RFC PATCH RESEND 3/3] pinctrl: upboard: Add UP2 pinctrl and
 gpio driver
Date: Thu, 26 Apr 2018 14:36:53 +0100
Message-ID: <20180426133653.4yhjv6uuaox7vt7m@localhost>
References: <20180421085009.28773-1-javier@emutex.com>
 <20180421085009.28773-4-javier@emutex.com>
 <20180426065028.fvdf7ke5va2kacmv@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180426065028.fvdf7ke5va2kacmv@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dan O'Donovan <dan@emutex.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Apr 26, 2018 at 07:50:28AM +0100, Lee Jones wrote:
> >  static const struct mfd_cell upboard_up2_mfd_cells[] = {
> > +	{ .name = "upboard-pinctrl" },
> >  	UPBOARD_LED_CELL(upboard_up2_led_data, 0),
> >  	UPBOARD_LED_CELL(upboard_up2_led_data, 1),
> >  	UPBOARD_LED_CELL(upboard_up2_led_data, 2),
> 
> Please made this a separate patch.
> 
> There aren't any build dependencies between the files.

Will do.

I have one further question about MFD in this patch too - should I keep
passing regmap into the driver via dev_get_drvdata(pdev->dev.parent),
or is explicit platform_data preferable?

Andy suggested platform_data allows more flexibility on the parent
device side (although I can't see upboard-pinctrl being used other than
as a child of the upboard driver).

I went with parent drvdata simply because that's what I found in other
MFD drivers and material [1].

Thank you!

[1]: http://events17.linuxfoundation.org/sites/events/files/slides/belloni-mfd-regmap-syscon_0.pdf
