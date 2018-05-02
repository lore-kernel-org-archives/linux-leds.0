From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH RESEND 2/3] leds: upboard: Add LED support
Date: Wed, 02 May 2018 16:55:17 +0300
Message-ID: <1525269317.21176.625.camel@linux.intel.com>
References: <20180421085009.28773-1-javier@emutex.com>
         <20180421085009.28773-3-javier@emutex.com>
         <1524672945.21176.594.camel@linux.intel.com>
         <20180426023441.f2a7337sjlyd6xhf@localhost>
         <1524729349.21176.614.camel@linux.intel.com>
         <20180426124922.haddppocljgnj2ei@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426124922.haddppocljgnj2ei@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Arteaga <javier@emutex.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan O'Donovan <dan@emutex.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, 2018-04-26 at 13:49 +0100, Javier Arteaga wrote:
> On Thu, Apr 26, 2018 at 10:55:49AM +0300, Andy Shevchenko wrote:
> > On Thu, 2018-04-26 at 03:34 +0100, Javier Arteaga wrote:
> > > My understanding was that in this context, __init allows this
> > > probe()
> > > to
> > > be dropped from memory after module load.
> > > 
> > > What am I doing wrong there?
> > 
> > Just give another thought about it. The keyword(s) here is(are):
> > time to
> > live of the objects in question. It's good to get knowing what
> > unbind-
> > bind means (for built-in drivers).
> 
> So this is the bit that I _believed_ applied to the platform drivers
> for
> these MFD-registered devices (from driver-model/platform.txt):
> 
>   Or, in common situations where the device is known not to be hot-
> pluggable,
>   the probe() routine can live in an init section to reduce the
> driver's
>   runtime memory footprint:
> 
>   	int platform_driver_probe(struct platform_driver *drv,
>   			  int (*probe)(struct platform_device *))
> 
> I'm thinking my misunderstanding probably stems from assuming that
> these
> leds/pinctrl drivers will always find all devices registered at init
> time. Can't say I've validated that assumption - I just didn't see
> anything obviously blowing up in my tests so far :)
> 
> I'll keep reading and test out a few more things so I fully
> understand.
> Until then, I've taken out __init annotations from next version.

Just do one small test. Try to unbind the (built-in) driver and bind it
back. Would it work? Would kernel survive this?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
