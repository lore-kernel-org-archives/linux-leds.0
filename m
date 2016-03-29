From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Tue, 29 Mar 2016 12:02:58 +0200
Message-ID: <20160329100258.GA24964@amd>
References: <56D608ED.2090406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56D608ED.2090406@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Greg KH <greg@kroah.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

First, please Cc me on RGB color support.

> Add generic support for RGB Color LED's.
> 
> Basic idea is to use enum led_brightness also for the hue and saturation
> color components.This allows to implement the color extension w/o
> changes to struct led_classdev.
> 
> Select LEDS_RGB to enable building drivers using the RGB extension.
> 
> Flag LED_SET_HUE_SAT allows to specify that hue / saturation
> should be overridden even if the provided values are zero.
> 
> Some examples for writing values to /sys/class/leds/<xx>/brightness:
> (now also hex notation can be used)
> 
> 255 -> set full brightness and keep existing color if set
> 0 -> switch LED off but keep existing color so that it can be restored
>      if the LED is switched on again later
> 0x1000000 -> switch LED off and set also hue and saturation to 0
> 0x00ffff -> set full brightness, full saturation and set hue to 0
> (red)

Umm, that's rather strange interface -- and three values in single sysfs
file is actually forbidden.

Plus, it is very much unlike existing interfaces for RGB LEDs, which
we already have supported in the tree. (At least nokia N900 and Sony
motion controller already contain supported three-color LEDs).

Now... yes, there's work to be done for the 3-color LEDs. Currently,
they are treated as three different LEDs. (Which makes some sense, you
can use "battery charging" trigger for LED, and CPU activity trigger
for green, for example). It would be good to have some kind of
grouping, so that userspace can tell "these 3 leds are actually
combined into one light".

Second, we should define that LED brightness has similar gamma to the
monitor, so that expected colors are displayed when user requests
them.

(And then.. I guess we should talk about more advanced stuff, like
hardware that can drive the LED changes independently of the main
CPU.)

Best regards,
								Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
