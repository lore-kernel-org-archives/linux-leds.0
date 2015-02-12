From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash
 class extension
Date: Thu, 12 Feb 2015 11:54:17 +0100
Message-ID: <20150212105417.GA10377@amd>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
 <20150211215723.GC11313@amd>
 <54DC671E.8010705@samsung.com>
 <20150212090756.GA30508@amd>
 <54DC7C1E.5020105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:42927 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752254AbbBLKyU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Feb 2015 05:54:20 -0500
Content-Disposition: inline
In-Reply-To: <54DC7C1E.5020105@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com

On Thu 2015-02-12 11:10:38, Jacek Anaszewski wrote:
> On 02/12/2015 10:07 AM, Pavel Machek wrote:
> >Hi!
> >
> >>I can be 0 or 1. Let's make it more precise:
> >>
> >>- flash_strobe - flash strobe state (RW):
> >>			semantics on write:
> >>				0: turn the flash LED off
> >>				1: strobe the flash LED
> >>			semantics on read:
> >>				0: flash LED is off
> >>				1: flash LED is strobing
> >
> >Thanks.
> >
> >>>>+	- available_sync_leds - list of sub-LEDs available for flash strobe
> >>>>+				synchronization (RO)
> >>>
> >>>"space separated"?
> >>
> >>- available_sync_leds - space separated list of sub-LEDs available for
> >>			flash strobe synchronization; each sub-LED is
> >>			described in the form of chunks:
> >>			[led_id: led_name]
> >>
> >>
> >>>So this will say something like "0 3 5"
> >>
> >>Rather e.g.: [0: none] [1: max77693-led1] [2: max77693-led2]
> >
> >No no, sorry, you can't do that. Sysfs is supposed to be one value per
> >file, and this is stretching it. (It would be also difficult to parse;
> >for example, you can reasonably have ":" in led name, and perhaps even
> >" " or "]"....
> 
> You acked LED Flash class patch, didn't you? :)
> 
> There are many attributes documented in the list fashion, e.g.:
> available_frequencies in the Documentation/ABI/testing/sysfs-class-devfreq.

No, sorry, you can't do this. We have this parsing nightmare in /proc,
before, and we don't want it again.

> If we changed this a bit it would be easily parsed with AWK:
> 
> echo "0 none;1 max77693-led1;2 max77693-led2" | awk -F';' '{ for (i=1;
> i<=NF; i++) print $i}' | awk '{print $1": "$2}'

sysfs is one entry per file. If someone screwed it up in devfreq, it
is not reason to screw it up here. (Space separated lists of integers
might be acceptable. Fixed strings with one marked by []s happen,
too. Maps between ints and names are not.)
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
