From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 2/3] platform/chrome: Add Wilco EC keyboard backlight
 LEDs support
Date: Fri, 5 Apr 2019 13:15:34 -0700
Message-ID: <20190405201534.GA4426@roeck-us.net>
References: <20190404171007.160878-1-ncrews@chromium.org>
 <20190404171007.160878-2-ncrews@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190404171007.160878-2-ncrews@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>
Cc: enric.balletbo@collabora.com, bleung@chromium.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, alexandre.belloni@bootlin.com, a.zummo@towertech.it, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, dlaurie@chromium.org, sjg@google.com, groeck@google.com, dtor@google.com
List-Id: linux-leds@vger.kernel.org

On Thu, Apr 04, 2019 at 11:10:08AM -0600, Nick Crews wrote:
> The EC is in charge of controlling the keyboard backlight on
> the Wilco platform. We expose a standard LED class device at
> /sys/class/leds/platform::kbd_backlight. This driver is modeled
> after the standard Chrome OS keyboard backlight driver at
> drivers/platform/chrome/cros_kbd_led_backlight.c
> 
> Some Wilco devices do not support a keyboard backlight. This
> is checked via wilco_ec_keyboard_leds_exist() in the core driver,
> and a platform_device will only be registered by the core if
> a backlight is supported.
> 
> After an EC reset the backlight could be in a non-PWM mode.
> Earlier in the boot sequence the BIOS should send a command to
> the EC to set the brightness, so things **should** be set up,
> but we double check in probe() as we query the initial brightness.
> If not set up, then set the brightness to 0.
> 
> Since the EC will never change the backlight level of its own accord,
> we don't need to implement a brightness_get() method.
> 
> v5 changes:
> -Rename the LED device to "platform::kbd_backlight", to
> denote that this is the built-in system keyboard.
> 

NACK.

Per Documentation/leds/leds-class.txt, LED devices are named
	"devicename:colour:function"

This document also states "The naming scheme above leaves scope
for further attributes should they be needed". It does not permit,
however, to redefine one of the fields to mean "location", much less
the declaration that a devicename of "platform" shall refer to an
"internal" backlight, or that there shall be no more than one
"internal" backlight in a given system.

On top of that, with this naming scheme any system with more than
one internal backlight may result in duplicate sysfs attribute names.

If an attribute for "location" is desired or necessary as part of
the LED attribute name, such a change should be well defined, and
it should be documented, and it must not create the risk of
duplicate sysfs attribute names.

Thanks,
Guenter
