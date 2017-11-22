From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Bug when using both "set" and "blink" functions
Date: Wed, 22 Nov 2017 20:53:00 +0100
Message-ID: <0d0eb82e-0391-b033-9275-0e7673a76072@gmail.com>
References: <5c59633100dd45e2b28e46d78cbf930c@innerrange.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:37566 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751375AbdKVTx7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Nov 2017 14:53:59 -0500
Received: by mail-wr0-f172.google.com with SMTP id k61so15617759wrc.4
        for <linux-leds@vger.kernel.org>; Wed, 22 Nov 2017 11:53:59 -0800 (PST)
In-Reply-To: <5c59633100dd45e2b28e46d78cbf930c@innerrange.com.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Craig McQueen <craig.mcqueen@innerrange.com.au>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Craig,

On 11/22/2017 01:55 AM, Craig McQueen wrote:
> I'd like to control a LED to possibly be any of:
> 
> * Off
> * On
> * Blinking
> 
> I've had this working fine in 3.14.x kernel.
> 
> But when upgrading to 4.4.x, I found that the transition from "blinking" to "on" didn't work. Namely, if it's blinking and then I call led_set_brightness(led_cdev, LED_FULL), then it wouldn't work (I can't remember if it turned off, or remained blinking; it wasn't on anyway). I worked around it by calling led_set_brightness(led_cdev, LED_OFF) just before led_set_brightness(led_cdev, LED_FULL).

This is by design. Setting brightness to LED_OFF deactivates any active
trigger. There were some inconsistencies in the API semantics and it
was fixed.

See Documentation/ABI/testing/sysfs-class-led

What:           /sys/class/leds/<led>/brightness
Date:           March 2006
KernelVersion:  2.6.17
Contact:        Richard Purdie <rpurdie@rpsys.net>
Description:
                Set the brightness of the LED. Most LEDs don't
                have hardware brightness support, so will just be turned
on for
                non-zero brightness settings. The value is between 0 and
                /sys/class/leds/<led>/max_brightness.

                Writing 0 to this file clears active trigger.

                Writing non-zero to this file while trigger is active
changes the
                top brightness trigger is going to use.

> Now I have upgraded to 4.9.x, and found that the transition from "blinking" to "on" again isn't working. The LED ends up being off instead of on.
> 
> Examining the code of led_set_brightness():
> 
> * Behaviour is different depending on whether the brightness is LED_OFF (it schedules the blink to be turned off "soon") or other (it alters the brightness of subsequent blinks).
> * It looks as though there are race conditions in the transition from blinking to steady off -- it schedules the blink to be turned off "soon", so it's difficult to guarantee a reliable transition from blinking to on/off.
> 
> The combination of the above two points makes it seem difficult to robustly go from blinking to off/on.

Please make sure you have the following patch:

Author: Hans de Goede <hdegoede@redhat.com>  2016-11-08 14:38:46
Committer: Jacek Anaszewski <j.anaszewski@samsung.com>  2016-11-22 12:07:05
Parent: 8338eab50ffb3399a938d723f9605383ed9f8473 (leds: Add user LED
driver for NIC78bx device)
Follows: v4.9-rc1
Precedes: leds_for_4.10

    led: core: Use atomic bit-field for the blink-flags

    All the LED_BLINK* flags are accessed read-modify-write from e.g.
    led_set_brightness and led_blink_set_oneshot while both
    set_brightness_work and the blink_timer may be running.

    If these race then the modify step done by one of them may be lost,
    switch the LED_BLINK* flags to a new atomic work_flags bit-field
    to avoid this race.

> So, my questions are:
> 
> * What is the correct way to use the API to reliably control an LED for a combination of off/on/blinking?
> * Is my above analysis of the code correct, so that there are indeed race conditions going from blinking to off, leading to undefined behaviour? Can that be fixed?
> 

Frankly speaking I have never experienced the problem even before the
aforementioned patch. Could you share what driver are you using?
Is it implementing brightness_set or brightness_seT_blocking op?

-- 
Best regards,
Jacek Anaszewski
