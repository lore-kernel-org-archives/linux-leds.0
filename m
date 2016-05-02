From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/5] leds: triggers: Allow to switch the trigger to
 "panic" on a kernel panic
Date: Mon, 2 May 2016 09:06:04 +0200
Message-ID: <20160502070604.GB13215@amd>
References: <1459801326-5541-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459801326-5541-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160424092551.GB23015@amd>
 <20160424092951.GA25596@amd>
 <571DBFAE.7060605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34581 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751187AbcEBHGH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 May 2016 03:06:07 -0400
Content-Disposition: inline
In-Reply-To: <571DBFAE.7060605@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Richard Purdie <rpurdie@rpsys.net>

On Mon 2016-04-25 08:56:46, Jacek Anaszewski wrote:
> On 04/24/2016 11:29 AM, Pavel Machek wrote:
> >On Sun 2016-04-24 11:25:51, Pavel Machek wrote:
> >>On Mon 2016-04-04 17:22:02, Ezequiel Garcia wrote:
> >>>This commit adds a new led_cdev flag LED_BLINK_AT_PANIC, which
> >>>allows to mark a specific LED to be switched to the "panic"
> >>>trigger, on a kernel panic.
> >>>
> >>>This is useful to allow the user to assign a regular trigger
> >>>to a given LED, and still blink that LED on a kernel panic.
> >>>
> >>>Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> >>
> >>
> >>>  drivers/leds/led-triggers.c | 52 +++++++++++++++++++++++++++++++++++++++++++++
> >>>  include/linux/leds.h        |  1 +
> >>
> >>Could we get this out of the core? I'm pretty sure most users are not
> >>interested...
> 
> Good point.

Dunno. Perhaps we can have something like struct led *panic_led, which
architecture can set, and then some helper that would blink the panic
led...? Should be smaller than this and will only be compiled on
platforms where it makes sense. On x86 we already have such support...

> >Thinking about it some more....
> >
> >This is not really a trigger. This is very special. Maybe hard-coded
> >handling, like we do for keyboard leds on x86 would be suitable?
> 
> Could you please spot the piece of code you have on mind?

drivers/input/serio/i8042.c: * i8042_panic_blink() will turn the keyboard LEDs on or off and is called

			       			   	     	 	  Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
