From: Pavel Machek <pavel@ucw.cz>
Subject: Re: RGB support prototype
Date: Sun, 13 Aug 2017 13:41:00 +0200
Message-ID: <20170813114100.GA6321@xo-6d-61-c0.localdomain>
References: <20170812224818.GA5960@amd>
 <87ddf9f2-40b8-fd3a-f106-35b202697391@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45107 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750930AbdHMLlD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Aug 2017 07:41:03 -0400
Content-Disposition: inline
In-Reply-To: <87ddf9f2-40b8-fd3a-f106-35b202697391@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi!

> > You mentioned you was working on RGB support prototype. Could you post
> > copy of the patches (even if unfinished)?
> 
> Unfortunately it is at the stage of unfinished proof of concept and
> I haven't managed yet to try how it fits to all API use cases we have.
> Nor is it in a shape ready to post to the lists.
> 
> I think we could try to discuss the design here. I'll list all the
> issues I encountered during the implementation:
> 
> Currently we set LED brightness with following API:
> 
> void led_set_brightness(struct led_classdev *led_cdev,
>                         enum led_brightness brightness);
> 
> In case of RGB LED we could have something like this:
> 
> struct led_color_triplet {
>         enum led_brightness red;
>         enum led_brightness green;
>         enum led_brightness blue;
> };
> 
> void led_rgb_set_brightness(struct led_rgb_classdev *led_rgb_cdev,
>                         struct led_color_triplet *color);
> 
> We've agreed that LED RGB class device color could be set by writing
> space separated list of "r g b" color values to a sysfs "color" file.
> 
> While the above itself shouldn't raise too many doubts, they
> arise quickly while trying to adapt it to the internal LED core
> facilities:
> 
> - led_base_timer_function()
> - set_brightness_delayed()
> - led_blink_* API family
> 
> All these introduce problems especially with brightness/color type.
> I tried to add a new abstraction layer by introducing
> struct led_base_cdev with a set of generic ops that could be initialized
> by particular type of LED but still the problem with brightness type
> generalization remains. One solution could be an union with fields
> mapping to either single or three brightness components.
> 
> Other option could be void *brightness type which could be then
> cast to the required brightness type basing on the LED flag.

Void *brightness is not really a good option.

We could pass triplet even in case of single-color LEDs, and then use
just one component.

Another option would be to store color in HSV colorspace (not RGB). Then existing
functions would get brightness (== value in HSV), and RGB-aware functions would
operate on all 3 components. Triggers/blinking/etc. would then continue operating,
without modifications.

We could even export (read-only) hue/saturation for single-color LEDs...

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
