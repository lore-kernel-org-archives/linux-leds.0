From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Fix platform data in leds-pca955x.c
Date: Wed, 4 Jul 2018 20:04:30 +0300
Message-ID: <CAHp75VdEUquwcd3_OxbHAK+gOCnpff_Fd91jkHx87XKkD2xwKQ@mail.gmail.com>
References: <62fb47ea-9296-139b-1eeb-28ddc5826091@landley.net> <CAHp75Vc+2rjFcLfuV5ao0eGmz2aF4jRS_YTZQTaRx=45sOSFOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc+2rjFcLfuV5ao0eGmz2aF4jRS_YTZQTaRx=45sOSFOw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: clg@kaod.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Andrew Jeffery <andrew@aj.id.au>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Jul 4, 2018 at 8:00 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 4, 2018 at 3:46 AM, Rob Landley <rob@landley.net> wrote:

> For now, you can switch to unified device properties API (basically
> un-ifdef pca955x_pdata_of_init() and replacing of_* by device_* or
> fwnode_* compatible calls) and providing a static table of built-in
> device properties in the platform code in question.
> (see include/linux/property.h, for example users of
> PROPERTY_ENTRY_U*() macros, like arch/arm/mach-pxa/raumfeld.c)

Taking into consideration that device is enumerated by i2c core, which
is being aware of device properties (1), better example might be
drivers/platform/x86/intel_cht_int33fe.c

(1)
commit d3e1b617ae20c459627f501b4bc55b1ea91f662b
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Thu Feb 2 17:41:28 2017 -0800

   i2c: allow specify device properties in i2c_board_info

-- 
With Best Regards,
Andy Shevchenko
