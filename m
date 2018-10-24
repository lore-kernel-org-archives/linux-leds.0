From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/3] leds: upboard: Add LED support
Date: Wed, 24 Oct 2018 13:13:40 +0300
Message-ID: <20181024101340.GR10650@smile.fi.intel.com>
References: <20180421085009.28773-1-javier@emutex.com>
 <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-3-git-send-email-dan@emutex.com>
 <ede59ef8-7caf-413d-6858-33a1eab5f084@gmail.com>
 <16591e6735e32baad10f083c688119ce79d12911.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16591e6735e32baad10f083c688119ce79d12911.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan O'Donovan <dan@emutex.com>, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Tue, Oct 23, 2018 at 12:23:13PM -0700, Joe Perches wrote:
> On Tue, 2018-10-23 at 20:50 +0200, Jacek Anaszewski wrote:
> > > diff --git a/drivers/leds/leds-upboard.c b/drivers/leds/leds-upboard.c
> > > new file mode 100644
> > > index 0000000..34a6973
> > > --- /dev/null
> > > +++ b/drivers/leds/leds-upboard.c
> > > @@ -0,0 +1,104 @@
> []
> > > +#include <linux/kernel.h>
> > > +#include <linux/leds.h>
> > > +#include <linux/mfd/upboard.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/acpi.h>
> > 
> > The last include should go first to keep alphabetical order.
> 
> There is no accepted single kernel style for #include
> file ordering.

There is a rule of (subtly) better maintenance.
If you need to add / remove some header later in a (long) list of unordered
list, it would be error prone.

Just run `make includecheck` and see the result.

I personally fixed some header duplications and removal of init.h in unsorted
lists, which have been missed by some reasons.

> drivers/leds does not use a single style nor is this
> particular variant documented anywhere to my knowledge.

Neither does kernel in general.
But kernel is evolving and styles also. When you do such statement consider to
divide by a time period when certain code was pushed to upstream.

> Until such a time when either a local preferred style
> document or a treewide preferred style exists, please
> stop asking people to modify #include ordering for
> various styles like reverse christmas tree by length,
> alphabetic ordering, or other individual styles.

Why? It makes a sense to ask for new code (and even for patches against old one in some cases).

> My preferred style would always have kernel.h first
> as that may help with precompiled headers and overall
> kernel compilation time one day.

How ordering would screw this up?

-- 
With Best Regards,
Andy Shevchenko
