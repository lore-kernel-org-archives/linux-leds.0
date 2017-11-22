From: Craig McQueen <craig.mcqueen@innerrange.com.au>
Subject: RE: Bug when using both "set" and "blink" functions
Date: Wed, 22 Nov 2017 03:36:49 +0000
Message-ID: <757efd9c568942a09a16ebe2084e7d9c@innerrange.com.au>
References: <5c59633100dd45e2b28e46d78cbf930c@innerrange.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.innerrange.com.au ([203.222.77.226]:39218 "EHLO
        mail.innerrange.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751445AbdKVDgv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Nov 2017 22:36:51 -0500
In-Reply-To: <5c59633100dd45e2b28e46d78cbf930c@innerrange.com.au>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

I wrote:
> I'd like to control a LED to possibly be any of:
>
> * Off
> * On
> * Blinking
>
> I've had this working fine in 3.14.x kernel.
> 
> But when upgrading to 4.4.x, I found that the transition from "blinking"
> to "on" didn't work. Namely, if it's blinking and then I call
> led_set_brightness(led_cdev, LED_FULL), then it wouldn't work (I can't
> remember if it turned off, or remained blinking; it wasn't on anyway).
> I worked around it by calling led_set_brightness(led_cdev, LED_OFF) just
> before led_set_brightness(led_cdev, LED_FULL).
> 
> Now I have upgraded to 4.9.x, and found that the transition from
> "blinking" to "on" again isn't working. The LED ends up being off
> instead of on.
> 
> Examining the code of led_set_brightness():
> 
> * Behaviour is different depending on whether the brightness is LED_OFF
>   (it schedules the blink to be turned off "soon") or other (it alters
>   the brightness of subsequent blinks).
> * It looks as though there are race conditions in the transition from
>   blinking to steady off -- it schedules the blink to be turned off
>   "soon", so it's difficult to guarantee a reliable transition from
>   blinking to on/off.
> 
> The combination of the above two points makes it seem difficult to
> robustly go from blinking to off/on.
> 
> So, my questions are:
> 
> * What is the correct way to use the API to reliably control an LED for
>   a combination of off/on/blinking?
> * Is my above analysis of the code correct, so that there are indeed
>   race conditions going from blinking to off, leading to undefined
>   behaviour? Can that be fixed?

I also thought I could perhaps use led_blink_set_oneshot() to effectively
turn the LED on or off in a blink-compatible way. But, I see that if a one-shot
blink is in-progress, then any attempt to change the 'invert' parameter is
ineffective because the function exits early.

-- 
Craig McQueen
