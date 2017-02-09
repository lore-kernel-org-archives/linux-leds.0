From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: pca9532: Extend pca9532 device tree support
Date: Thu, 9 Feb 2017 15:24:08 +0100
Message-ID: <20170209142408.GB23373@xo-6d-61-c0.localdomain>
References: <aed3d861-eb7d-7bad-1fe2-73b5b3299a0c@ltec.ch>
 <f1649865-87cd-eb1c-68de-184990f64661@gmail.com>
 <c23bd1c9-934b-c1c6-e9ff-8d2041c52d09@ltec.ch>
 <725c338e-af4c-1332-6c27-462c2dc1b97f@gmail.com>
 <3bfc9206-18c7-470b-ca53-d7bdb9a34f0a@ltec.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60817 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752582AbdBIOY7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Feb 2017 09:24:59 -0500
Content-Disposition: inline
In-Reply-To: <3bfc9206-18c7-470b-ca53-d7bdb9a34f0a@ltec.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Felix Brack <fb@ltec.ch>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, riku.voipio@iki.fi, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, f.brack@eets.ch

Hi!

> >> This might be a misunderstanding. My patch is not meant to replace
> >> anything for driving the LEDs once the kernel is fully loaded. The LED
> >> subsystem offers quite a lot of possibilities to do this.
> >>
> >> My patch mainly deals with the 'default' state of the LEDs immediately
> >> when the driver gets loaded.
> >> Here is an example: I have a system with a LED named 'RUN' which is
> >> turned on steady by U-Boot (indicating "system booting"). When the
> >> PCA9532 driver loads this LED gets turned off due to initialization.
> >> However I would like it remain lit until later a script will make that
> >> 'RUN' LED blink (indicating "system running"). This script will of
> >> course use the existing LED subsystem to do so. To keep the 'RUN' LED
> >> lit I need the DT property 'default-state' being set to 'PCA9532_KEEP'.
> > 
> > It looks like all you need is default-state property.
> 
> For the example with keeping the 'RUN' led turned on, yes. However I
> would have to configure PSC and PWM registers to make the 'RUN' LED
> blink, for example.

Is that really useful? Keeping the state from u-boot until userland can take
control... ok, why not.

If it is useful, right, you can do it. But it will have to be generic for all
the LEDs, not like this.

You'll want something like

default_trigger = blinking;
default_trigger_parameters = < 2 sec on, 1 sec off >;

or something. You may want to coordinate with the USB LED people, which want
default triggers with parametrs.

									Pavel


									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
