From: Craig McQueen <craig.mcqueen@innerrange.com.au>
Subject: RE: Bug when using both "set" and "blink" functions
Date: Thu, 23 Nov 2017 00:14:13 +0000
Message-ID: <5bd49c5bd6c24edf93bc9d22ca409235@innerrange.com.au>
References: <5c59633100dd45e2b28e46d78cbf930c@innerrange.com.au>
 <20171122123605.GB10654@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.innerrange.com.au ([203.222.77.226]:15673 "EHLO
        mail.innerrange.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751494AbdKWAOS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Nov 2017 19:14:18 -0500
In-Reply-To: <20171122123605.GB10654@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Pavel Machek wrote:
> On Wed 2017-11-22 00:55:12, Craig McQueen wrote:
> > I'd like to control a LED to possibly be any of:
> >
> > * Off
> > * On
> > * Blinking
> >
> > I've had this working fine in 3.14.x kernel.
> >
> > But when upgrading to 4.4.x, I found that the transition from "blinking" to
> "on" didn't work. Namely, if it's blinking and then I call
> led_set_brightness(led_cdev, LED_FULL), then it wouldn't work (I can't
> remember if it turned off, or remained blinking; it wasn't on anyway). I
> worked around it by calling led_set_brightness(led_cdev, LED_OFF) just
> before led_set_brightness(led_cdev, LED_FULL).
> >
> > Now I have upgraded to 4.9.x, and found that the transition from "blinking"
> to "on" again isn't working. The LED ends up being off instead of on.
> >
> > Examining the code of led_set_brightness():
> >
> > * Behaviour is different depending on whether the brightness is LED_OFF
> (it schedules the blink to be turned off "soon") or other (it alters the
> brightness of subsequent blinks).
> > * It looks as though there are race conditions in the transition from blinking
> to steady off -- it schedules the blink to be turned off "soon", so it's difficult
> to guarantee a reliable transition from blinking to on/off.
> >
> > The combination of the above two points makes it seem difficult to
> robustly go from blinking to off/on.
> >
> > So, my questions are:
> >
> > * What is the correct way to use the API to reliably control an LED
> > for a combination of off/on/blinking?
> 
> You should be able to use sysfs from the userland. .. if that is broken we
> need to fix it.
> 
> What are you trying to do?

I've written a kernel driver for a power supply interface on some custom hardware. I'm using LED trigger API to make two LED triggers, "power" and "battery". The "battery" LED trigger should be off when no battery, on when battery is present and okay, or flashing when battery is present but in fault condition.

* Off: led_trigger_event(trigger, LED_OFF)
* On: led_trigger_event(trigger, LED_FULL)
* Flashing: led_trigger_blink(trigger, &delay_on, &delay_off)

But for kernel 4.4, going from flashing to on didn't work. I had to change the On case to:
* On: led_trigger_event(trigger, LED_OFF); led_trigger_event(trigger, LED_FULL);

But for kernel 4.9, that again doesn't work when going from flashing to on (the LED is turned off).

My driver is using triggers, but the trigger calls lead fairly directly to:

* Off: led_trigger_event(trigger, LED_OFF) --> led_set_brightness(led_cdev, LED_OFF)
* On: led_trigger_event(trigger, LED_FULL) --> led_set_brightness(led_cdev, LED_FULL)
* Flashing: led_trigger_blink(trigger, &delay_on, &delay_off) --> led_blink_set(led_cdev, delay_on, delay_off)

-- 
Craig McQueen
