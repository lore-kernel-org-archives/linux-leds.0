From: Dmitry Torokhov <dtor@chromium.org>
Subject: Re: [PATCH] platform/chrome: Add Wilco EC keyboard backlight LEDs support
Date: Fri, 8 Mar 2019 14:01:07 -0800
Message-ID: <CAE_wzQ-Ds5a9iPuLTpV5mBHBtoUUh_-fRw66s0Su7eOifygqKQ@mail.gmail.com>
References: <20190308203801.57920-1-ncrews@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190308203801.57920-1-ncrews@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>
Cc: enric.balletbo@collabora.com, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, Pavel Machek <pavel@ucw.cz>, lkml <linux-kernel@vger.kernel.org>, dlaurie@chromium.org, Daniel Erat <derat@google.com>, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org

On Fri, Mar 8, 2019 at 12:41 PM Nick Crews <ncrews@chromium.org> wrote:
>
> This patch is meant to be applied on top of the for-next
> branch of the platform/chrome repository, as it uses some of
> the code staged there.
>
> The EC is in charge of controlling the keyboard backlight on
> the Wilco platform. We expose a standard LED class device at
> /sys/class/leds/wilco::kbd_backlight. This driver is modeled
> after the standard Chrome OS keyboard backlight driver at
> drivers/platform/chrome/cros_kbd_led_backlight.c
>
> Some Wilco devices do not support a keyboard backlight. This
> is checked in probe(), and in this case the sysfs entry will
> not appear, and everything will behave normally.

It would be even better if we did not register platform device if EC
does not support backlight.

> +       data->led.brightness_set = keyboard_led_set_brightness;
> +       data->led.brightness_get = keyboard_led_get_brightness;

wilco_ec_mailbox() may sleep, so you need to assign it to
led.brightness_set_blocking.

Thanks,
Dmitry
