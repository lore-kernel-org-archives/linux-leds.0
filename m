From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] mfd: upboard: Add UP2 platform controller driver
Date: Thu, 15 Nov 2018 15:56:27 +0100
Message-ID: <CACRpkda=xz=6sVuM1r81krR+09gOTaxBkab3_Xj0qMEB5AdVtQ@mail.gmail.com>
References: <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1541018689-20625-1-git-send-email-dan@emutex.com> <1541018689-20625-2-git-send-email-dan@emutex.com>
 <20181111112944.GA27666@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181111112944.GA27666@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan O'Donovan <dan@emutex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-leds@vger.kernel.org, carlos.iglesias@emutex.com
List-Id: linux-leds@vger.kernel.org

On Sun, Nov 11, 2018 at 12:29 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> > +static void __reg_io_start(const struct upboard_ddata * const ddata)
> > +{
> > +     /*
> > +      * CLEAR signal must be pulsed low before any register access.
> > +      * This resets internal counters in the controller and marks
> > +      * the start of a new register access.
> > +      */
> > +     set_clear(ddata, 0);
> > +     set_clear(ddata, 1);
> > +}
>
> We normally reserve __ prefix for different stuff. This is not using
> it appropriately.

+1

I actively dislike __underscore_notation as it seems to be
completely arbitrary and ambiguous. I think even
do_the_stuff_reg_io_start() is better.

But please come up with something to the point and
descriptive! :)

Yours,
Linus Walleij
