From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Add LED driven by multiple gpio.
Date: Fri, 29 Apr 2016 14:58:16 +0200
Message-ID: <20160429125816.GA30794@amd>
References: <1461572078.2269.2.camel@dlinux>
 <20160426162658.761a88e7.drivshin.allworx@gmail.com>
 <572356BF.2040804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:52139 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753737AbcD2M6U (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 29 Apr 2016 08:58:20 -0400
Content-Disposition: inline
In-Reply-To: <572356BF.2040804@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>, Dmitry Bondar <bond@simicon.com>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>

Hi!

> >I'm hoping that if the RGB LED framework comes to fruition, that there
> >will be some way to combine arbitrary single-color LED devices into a
> >logical RGB LED.
> 
> It turns out that rgb-pattern trigger, we were discussing some time ago,
> would be useful also for LEDs of arbitrary colors. It should be given
> more generic name then, e.g. three-led-composite or so. The "color"
> sysfs attribute exposed by the trigger could be replaced with
> "subled_id", that would accept values 0, 1 or 2.
> 
> Brightness of such a compound LED could be set with:
> 
> led_trigger_3led_event(sturct led_trigger *trig,
>                        enum led_brightness led1,
>                        enum led_brightness led2,
>                        enum led_brightness led3)
> 
> Maybe we should think about making this scalable using
> C ellipsis feature:
> 
> led_trigger_3led_event(sturct led_trigger *trig,
>                        enum led_brightness led1,
>                        ...)

You don't need (and should not need) elipsis.

led_trigger_many_leds_event(sturct led_trigger *trig,
			      int num_leds,
                              enum led_brightness *brightness)

...should be fine.
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
