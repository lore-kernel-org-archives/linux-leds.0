From: Javier Arteaga <javier@emutex.com>
Subject: Re: [RFC PATCH RESEND 2/3] leds: upboard: Add LED support
Date: Wed, 25 Apr 2018 08:02:27 +0100
Message-ID: <20180425070227.exixjo64spvt36vo@localhost>
References: <20180421085009.28773-1-javier@emutex.com>
 <20180421085009.28773-3-javier@emutex.com>
 <20180425064133.GC5352@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180425064133.GC5352@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan O'Donovan <dan@emutex.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On Wed, Apr 25, 2018 at 08:41:33AM +0200, Pavel Machek wrote:
> On Sat 2018-04-21 09:50:08, Javier Arteaga wrote:
> > Allow userspace to use the on-board LEDs as "upboard:<color>:".
> > 
> > Signed-off-by: Javier Arteaga <javier@emutex.com>
> 
> > +static enum led_brightness upboard_led_brightness_get(struct led_classdev *cdev)
> > +{
> > +	struct upboard_led *led = container_of(cdev, struct upboard_led, cdev);
> > +	int brightness = 0;
> > +
> > +	regmap_field_read(led->field, &brightness);
> > +
> > +	return brightness;
> > +};
> 
> I'm slightly confused here. Is each led controlled by single bit?

Yes. Each regmap field is one bit wide.

> What is going on with ";" at end of function? We don't do that.

Huh, I totally missed this. It's all throughout the patchset too, and
it's going away in v2 of course.

> If it is single bit, max_brightness should be one, and != LED_OFF test
> should not be needed.

Got it. Will do for v2.

Thanks for your time!
