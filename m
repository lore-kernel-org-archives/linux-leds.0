From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/3] mfd: upboard: Add UP2 platform controller driver
Date: Thu, 25 Oct 2018 16:15:23 +0300
Message-ID: <20181025131523.GY10650@smile.fi.intel.com>
References: <20180421085009.28773-1-javier@emutex.com>
 <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-2-git-send-email-dan@emutex.com>
 <CAHp75VdkwfcPdSmB0dYBF_xwwXMqkrLOa1tL0xkOJ4DVcx8h8g@mail.gmail.com>
 <20181025110505.GA4870@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181025110505.GA4870@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Dan O'Donovan <dan@emutex.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, carlos.iglesias@emutex.com, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Thu, Oct 25, 2018 at 12:05:05PM +0100, Lee Jones wrote:
> On Sat, 20 Oct 2018, Andy Shevchenko wrote:
> > On Fri, Oct 19, 2018 at 8:26 PM Dan O'Donovan <dan@emutex.com> wrote:

> > > +       ret = upboard_init_gpio(dev);
> > > +       if (ret) {
> > > +               if (ret != -EPROBE_DEFER)
> > > +                       dev_err(dev, "failed to init GPIOs: %d", ret);
> > > +               return ret;
> > > +       }
> > 
> > I don't know if probe_err() helper is going to be a part of v4.21
> > (which this series targets), it would be good to use it.
> 
> Interesting.  What does it do?

The code will tell better than I
https://lore.kernel.org/lkml/20181017132205.5204-1-a.hajda@samsung.com/


-- 
With Best Regards,
Andy Shevchenko
