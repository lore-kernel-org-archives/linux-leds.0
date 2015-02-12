From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash
 class extension
Date: Thu, 12 Feb 2015 10:07:56 +0100
Message-ID: <20150212090756.GA30508@amd>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
 <20150211215723.GC11313@amd>
 <54DC671E.8010705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40020 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755036AbbBLJH7 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Feb 2015 04:07:59 -0500
Content-Disposition: inline
In-Reply-To: <54DC671E.8010705@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com

Hi!

> I can be 0 or 1. Let's make it more precise:
> 
> - flash_strobe - flash strobe state (RW):
> 			semantics on write:
> 				0: turn the flash LED off
> 				1: strobe the flash LED
> 			semantics on read:
> 				0: flash LED is off
> 				1: flash LED is strobing

Thanks.

> >>+	- available_sync_leds - list of sub-LEDs available for flash strobe
> >>+				synchronization (RO)
> >
> >"space separated"?
> 
> - available_sync_leds - space separated list of sub-LEDs available for
> 			flash strobe synchronization; each sub-LED is
> 			described in the form of chunks:
> 			[led_id: led_name]
> 
> 
> >So this will say something like "0 3 5"
> 
> Rather e.g.: [0: none] [1: max77693-led1] [2: max77693-led2]

No no, sorry, you can't do that. Sysfs is supposed to be one value per
file, and this is stretching it. (It would be also difficult to parse;
for example, you can reasonably have ":" in led name, and perhaps even
" " or "]"....
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
