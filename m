From: Nick Crews <ncrews@chromium.org>
Subject: Re: [PATCH] platform/chrome: Add Wilco EC keyboard backlight LEDs support
Date: Mon, 11 Mar 2019 09:29:06 -0600
Message-ID: <CAHX4x85=_76=Kyepf3Nw++4yVKOZujhLsonzaicZOnY5fi-Pfw@mail.gmail.com>
References: <20190308203801.57920-1-ncrews@chromium.org> <20190308210843.GA16125@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190308210843.GA16125@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Daniel Erat <derat@google.com>, Guenter Roeck <groeck@google.com>, Dmitry Torokhov <dtor@google.com>
List-Id: linux-leds@vger.kernel.org

Thanks for looking this over. I will fix most of your concerns, but
have one question.

On Fri, Mar 8, 2019 at 2:08 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Fri 2019-03-08 13:38:02, Nick Crews wrote:
> > This patch is meant to be applied on top of the for-next
> > branch of the platform/chrome repository, as it uses some of
> > the code staged there.
> >
> > The EC is in charge of controlling the keyboard backlight on
> > the Wilco platform. We expose a standard LED class device at
> > /sys/class/leds/wilco::kbd_backlight. This driver is modeled
> > after the standard Chrome OS keyboard backlight driver at
> > drivers/platform/chrome/cros_kbd_led_backlight.c
>
> Can you make it "platform::kbd_backlight"? We want some consistency
> there.

The analogous name in the standard driver
drivers/platform/chrome/cros_kbd_led_backlight.c is
"chromeos::kbd_backlight", and I thought "wilco" was a better
substitute for "chromeos" than "platform" would be. What other thing
are you saying "platform" would be consistent with?

>
> > Some Wilco devices do not support a keyboard backlight. This
> > is checked in probe(), and in this case the sysfs entry will
> > not appear, and everything will behave normally.
>
> Good.
>
> > When the EC is reset (loses all AC and battery power), it will
> > restart in some unpredictable state. The brightness on the
> > keyboard could be anything, and reading the brightness
> > from the EC is undefined behavior. Therefore, at startup the
> > brightness should be set, and then everything will work.
>
> Really? Undefined behavior?

By undefined I guess I meant "not conforming with the schema
that Chrome OS normally uses." The EC begins in non-PWM mode,
so while it may behave consistently, it doesn't behave as the rest of
Chrome OS expects. I think the solution is going to be to hard-code in
setting the brightness to 0 at probe(), and then everything should be
in a consistent state.

>
> > index e09e4cebe9b4..15b56f5ce090 100644
> > --- a/drivers/platform/chrome/wilco_ec/Kconfig
> > +++ b/drivers/platform/chrome/wilco_ec/Kconfig
> > @@ -18,3 +18,12 @@ config WILCO_EC_DEBUGFS
> >         manipulation and allow for testing arbitrary commands.  This
> >         interface is intended for debug only and will not be present
> >         on production devices.
> > +
> > +config WILCO_EC_KBD_BACKLIGHT
> > +     tristate "Enable keyboard led backlight control"
>
> Delete "led" or make it "LED".
>
> > +     depends on WILCO_EC
> > +     help
> > +       If you say Y here, you get support to set the keyboard backlight led
>
> Same here.
>
> > +#define DRV_NAME             "wilco-kbd-backlight"
> > +
> > +#define EC_COMMAND_KB_BKLIGHT        0x75
> > +#define KBBL_MSG_SIZE                16
> > +/* The EC can set the backlight brightness in several different modes.
> > +The mode we care about is PWM mode, where we separately supply a
> > +literal percentage to set the brightness to. We need to set the proper
> > +KBBL_PWM_MODE flag in the KBBL_MODE_INDEX-th byte in the message, and
> > +then supply the percentage within the KBBL_BRIGHTNESS_INDEX-th byte
> > +within the message. When we read the brightness, the percentage is
> > +returned in this same byte location. */
>
> Please use comment style specified in CodingStyle.
>
> Best regards,
>                                                                         Pavel

Cheers,
Nick
