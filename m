From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/3] mfd: upboard: Add UP2 platform controller driver
Date: Thu, 25 Oct 2018 12:05:05 +0100
Message-ID: <20181025110505.GA4870@dell>
References: <20180421085009.28773-1-javier@emutex.com>
 <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-2-git-send-email-dan@emutex.com>
 <CAHp75VdkwfcPdSmB0dYBF_xwwXMqkrLOa1tL0xkOJ4DVcx8h8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VdkwfcPdSmB0dYBF_xwwXMqkrLOa1tL0xkOJ4DVcx8h8g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dan O'Donovan <dan@emutex.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, carlos.iglesias@emutex.com, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Sat, 20 Oct 2018, Andy Shevchenko wrote:

> On Fri, Oct 19, 2018 at 8:26 PM Dan O'Donovan <dan@emutex.com> wrote:
> >
> > From: Javier Arteaga <javier@emutex.com>
> >
> > UP Squared (UP2) is a x86 SBC from AAEON based on Intel Apollo Lake. It
> > features a MAX 10 FPGA that routes lines from both SoC and on-board
> > devices to two I/O headers:
> >
> >                                 +------------------------+
> >                                 | 40-pin RPi-like header |
> >                          +------|         (HAT)          |
> >                          |      +------------------------+
> >     +-------+    +--------+
> >     |       |    |        |     +------------------------+
> >     |  SoC  |----|  FPGA  |-----|  Custom UP2 pin header |
> >     |       |    |        |     |        (EXHAT)         |
> >     +-------+    +--------+     +------------------------+
> >                          |
> >                          +------* On-board devices: LED, VLS...
> >
> > This is intended to enable vendor-specific applications to customize I/O
> > header pinout, as well as include low-latency functionality. It also
> > performs voltage level translation between the SoC (1.8V) and HAT header
> > (3.3V).
> >
> > Out of the box, this block implements a platform controller with a
> > GPIO-bitbanged control interface. It's enumerated by ACPI and provides
> > registers to control:
> >
> > - Configuration of all FPGA-routed header lines. These can be driven
> >   SoC-to-header, header-to-SoC or set in high impedance.
> >
> > - On-board LEDs and enable lines for other platform devices.
> >
> > Add core support for this platform controller as a MFD device, exposing
> > these registers as a regmap.
> 
> Can we see a link to or an excerpt of ACPI table for this device?
> 
> > +#define set_clear(u, x) gpiod_set_value((u)->clear_gpio, (x))
> > +#define set_strobe(u, x) gpiod_set_value((u)->strobe_gpio, (x))
> > +#define set_datain(u, x) gpiod_set_value((u)->datain_gpio, (x))
> > +#define get_dataout(u) gpiod_get_value((u)->dataout_gpio)
> 
> I think these macros don't bring much value. (Up to you and Lee to decide)

I agree.

In fact I think they only serve to obfuscate instead of clarify.

[...]

> > +               set_strobe(ddata, 0);
> > +               set_strobe(ddata, 1);
> > +               *val |= get_dataout(ddata) << i;
> > +       }
> > +}
> 
> > +static int upboard_check_supported(struct device *dev, struct regmap *regmap)
> > +{
> > +       uint8_t manufacturer_id, build, major, minor, patch;
> > +       unsigned int platform_id, firmware_id;
> > +       int ret;
> 
> > +       manufacturer_id = platform_id & 0xff;
> 
> Redundant & 0xff part.

Maybe not required, but lets the reader know it's intended.

[...]

> > +       ret = upboard_init_gpio(dev);
> > +       if (ret) {
> > +               if (ret != -EPROBE_DEFER)
> > +                       dev_err(dev, "failed to init GPIOs: %d", ret);
> > +               return ret;
> > +       }
> 
> I don't know if probe_err() helper is going to be a part of v4.21
> (which this series targets), it would be good to use it.

Interesting.  What does it do?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
