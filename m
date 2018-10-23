From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 2/3] leds: upboard: Add LED support
Date: Tue, 23 Oct 2018 12:23:13 -0700
Message-ID: <16591e6735e32baad10f083c688119ce79d12911.camel@perches.com>
References: <20180421085009.28773-1-javier@emutex.com>
         <1539969334-24577-1-git-send-email-dan@emutex.com>
         <1539969334-24577-3-git-send-email-dan@emutex.com>
         <ede59ef8-7caf-413d-6858-33a1eab5f084@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ede59ef8-7caf-413d-6858-33a1eab5f084@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan O'Donovan <dan@emutex.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Tue, 2018-10-23 at 20:50 +0200, Jacek Anaszewski wrote:
> > diff --git a/drivers/leds/leds-upboard.c b/drivers/leds/leds-upboard.c
> > new file mode 100644
> > index 0000000..34a6973
> > --- /dev/null
> > +++ b/drivers/leds/leds-upboard.c
> > @@ -0,0 +1,104 @@
[]
> > +#include <linux/kernel.h>
> > +#include <linux/leds.h>
> > +#include <linux/mfd/upboard.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/acpi.h>
> 
> The last include should go first to keep alphabetical order.

There is no accepted single kernel style for #include
file ordering.

drivers/leds does not use a single style nor is this
particular variant documented anywhere to my knowledge.

Until such a time when either a local preferred style
document or a treewide preferred style exists, please
stop asking people to modify #include ordering for
various styles like reverse christmas tree by length,
alphabetic ordering, or other individual styles.

My preferred style would always have kernel.h first
as that may help with precompiled headers and overall
kernel compilation time one day.
