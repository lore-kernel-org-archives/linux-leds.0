From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash
 class extension
Date: Mon, 16 Feb 2015 20:45:15 +0100
Message-ID: <20150216194515.GB13497@amd>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
 <20150211215723.GC11313@amd>
 <54DC671E.8010705@samsung.com>
 <20150212090756.GA30508@amd>
 <54DC7C1E.5020105@samsung.com>
 <20150212105417.GA10377@amd>
 <54DC8B6F.9080802@samsung.com>
 <20150212174444.GA9450@amd>
 <54E1D218.6020000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:52036 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbbBPTpS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Feb 2015 14:45:18 -0500
Content-Disposition: inline
In-Reply-To: <54E1D218.6020000@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com

Hi!

> >root@duo:~# cat /sys/power/state
> >freeze mem disk
> >root@duo:~# cat /sys/power/disk
> >[platform] shutdown reboot suspend
> >root@duo:~#
> >
> >>Could you propose the acceptable format then?
> >>The numbers alone are inconvenient to use, we need a human
> >>readable description next to them. Or some another way
> >>to obtain the name.
> >
> >Files like "0.active", "0.name", "1.active", "1.name"?
> >
> >Subdirectories 0/1 with "name" and "active" files?
> 
> We have flash_sync_strobe attribute which allows to read currently
> chosen sync_led. I would simplify this:
> 
> Let's assume there are two LED Flash class deviecs:
> 
> - max77693-flash1
> - max77693-flash2
> 
> Proposed design described by use cases:
> 
> #cd /sys/class/leds/max77693-flash1
> #cat available_flash_leds
> #[0.none] 1.max77693-flash2

Yeah. Should not have showed you /sys/power/state, right?

state gets away with this, because it uses few fixed strings. No funny
characters there, and it is "closely guarded". You don't have enough
control to do this... plus you have put the numbers there.

No.
									Pavel
									
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
