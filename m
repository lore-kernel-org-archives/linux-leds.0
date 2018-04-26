From: Javier Arteaga <javier@emutex.com>
Subject: Re: [RFC PATCH RESEND 2/3] leds: upboard: Add LED support
Date: Thu, 26 Apr 2018 13:49:22 +0100
Message-ID: <20180426124922.haddppocljgnj2ei@localhost>
References: <20180421085009.28773-1-javier@emutex.com>
 <20180421085009.28773-3-javier@emutex.com>
 <1524672945.21176.594.camel@linux.intel.com>
 <20180426023441.f2a7337sjlyd6xhf@localhost>
 <1524729349.21176.614.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524729349.21176.614.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan O'Donovan <dan@emutex.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Thanks Andy for these pointers :)

On Thu, Apr 26, 2018 at 10:55:49AM +0300, Andy Shevchenko wrote:
> On Thu, 2018-04-26 at 03:34 +0100, Javier Arteaga wrote:
> > My understanding was that in this context, __init allows this probe()
> > to
> > be dropped from memory after module load.
> > 
> > What am I doing wrong there?
> 
> Just give another thought about it. The keyword(s) here is(are): time to
> live of the objects in question. It's good to get knowing what unbind-
> bind means (for built-in drivers).

So this is the bit that I _believed_ applied to the platform drivers for
these MFD-registered devices (from driver-model/platform.txt):

  Or, in common situations where the device is known not to be hot-pluggable,
  the probe() routine can live in an init section to reduce the driver's
  runtime memory footprint:

  	int platform_driver_probe(struct platform_driver *drv,
  			  int (*probe)(struct platform_device *))

I'm thinking my misunderstanding probably stems from assuming that these
leds/pinctrl drivers will always find all devices registered at init
time. Can't say I've validated that assumption - I just didn't see
anything obviously blowing up in my tests so far :)

I'll keep reading and test out a few more things so I fully understand.
Until then, I've taken out __init annotations from next version.

> > > Don't use direct dereference to platform_data.
> > 
> > Sorry, I don't understand this one. What's the alternative?
> 
> See other drivers how they do that stuff. Hint: check inline functions
> in include/linux/device.h.

I wasn't looking at the right other drivers :)
I'll use the dev_get_platdata() wrapper going forwards.
