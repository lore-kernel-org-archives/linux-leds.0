From: Craig McQueen <craig.mcqueen@innerrange.com.au>
Subject: RE: Bug when using both "set" and "blink" functions
Date: Mon, 27 Nov 2017 06:51:12 +0000
Message-ID: <7d558c3c1f374177b441e4070f0b6665@innerrange.com.au>
References: <5c59633100dd45e2b28e46d78cbf930c@innerrange.com.au>
 <c967ba03-320e-8abd-6b6a-f2380ab2752b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.innerrange.com.au ([203.222.77.226]:62426 "EHLO
        mail.innerrange.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751136AbdK0GvS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Nov 2017 01:51:18 -0500
In-Reply-To: <c967ba03-320e-8abd-6b6a-f2380ab2752b@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Jacek Anaszewski wrote:
> On 11/22/2017 01:55 AM, Craig McQueen wrote:
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
> 
> Could you please check it with 4.14?

It isn't easy for me to try 4.14 in my current setup (Yocto build with meta-ti).

> The expected behavior in 4.14 is:
> 
> use case 1: led_set_brightness(led_cdev, LED_OFF) while timer trigger
>             is active.
> expected result: LED is off, trigger is deactivated.
> 
> use case 2: led_set_brightness(led_cdev, LED_FULL) while timer trigger
>             is active.
> expected result: LED blink brightness is LED_FULL, trigger remains active.

Yes, I understand that API design.

> > Now I have upgraded to 4.9.x, and found that the transition from "blinking"
> to "on" again isn't working. The LED ends up being off instead of on.
> 
> Could you provide the exact steps to reproduce this case?
> LED shouldn't be in any way off after setting brightness to non-zero value
> when blinking.

I'm using a custom kernel driver that tries to go from blinking to steady-on using these function calls:

		led_trigger_event(trigger, LED_OFF);
		led_trigger_event(trigger, LED_FULL);

> There were indeed changes in 4.9 in this area, that modified semantics of
> setting brightness to non-zero value when blinking. See the
> reasoning:
> 
> commit 7cfe749fad5158247282f2fee30773fd454029ab
> Author: Tony Makkiel <tony.makkiel@daqri.com>
> Date:   Wed May 18 17:22:45 2016 +0100
> 
>     leds: core: Fix brightness setting upon hardware blinking enabled
> 
>     Commit 76931edd54f8 ("leds: fix brightness changing when software
> blinking
>     is active") changed the semantics of led_set_brightness() which according
>     to the documentation should disable blinking upon any brightness setting.
>     Moreover it made it different for soft blink case, where it was possible
>     to change blink brightness, and for hardware blink case, where setting
>     any brightness greater than 0 was ignored.
> 
>     While the change itself is against the documentation claims, it was driven
>     also by the fact that timer trigger remained active after turning blinking
>     off. Fixing that would have required major refactoring in the led-core,
>     led-class, and led-triggers because of cyclic dependencies.
> 
>     Finally, it has been decided that allowing for brightness change during
>     blinking is beneficial as it can be accomplished without disturbing
>     blink rhythm.
> 
>     The change in brightness setting semantics will not affect existing
>     LED class drivers that implement blink_set op thanks to the LED_BLINK_SW
>     flag introduced by this patch. The flag state will be from now on checked
>     in led_set_brightness() which will allow to distinguish between software
>     and hardware blink mode. In the latter case the control will be passed
>     directly to the drivers which apply their semantics on brightness set,
>     which is disable the blinking in case of most such drivers. New drivers
>     will apply new semantics and just change the brightness while hardware
>     blinking is on, if possible.
> 
>     The issue was smuggled by subsequent LED core improvements, which
> modified
>     the code that originally introduced the problem.
> 
> 
> 
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
> > * What is the correct way to use the API to reliably control an LED for a
> combination of off/on/blinking?
> > * Is my above analysis of the code correct, so that there are indeed race
> conditions going from blinking to off, leading to undefined behaviour? Can
> that be fixed?
> 
> I checked earlier discussed case i.e. disabling trigger and immediately setting
> brightness to non-zero value and it seems to work fine. Checked with uleds
> driver:
> 
> # echo "timer" > trigger
> # echo 0 > brightness; echo 100 > brightness
> 
> Brightness always is 100 after that, even when setting delay_on/off to 1.

I still think there's a race condition, but you don't discover it when using userspace, because there's sufficient time between setting the brightness to 0 and later 100, for LED_BLINK_DISABLE to be processed in-between.

But I'm using a custom kernel driver that tries to go from blinking to steady-on using these function calls:

		led_trigger_event(trigger, LED_OFF);   /* which calls led_set_brightness(led_cdev, LED_OFF) */
		led_trigger_event(trigger, LED_FULL);  /* which calls led_set_brightness(led_cdev, LED_FULL) */

In this case, LED_BLINK_DISABLE is not yet processed before the second function call, so the second function call becomes ineffective, because the pending LED_BLINK_DISABLE is later processed, turning off the LED and leaving it off.

-- 
Craig McQueen
