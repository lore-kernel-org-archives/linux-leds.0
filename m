From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH/RFC RESEND] leds: Use set_brightness_work for
 brightness_set ops that can sleep
Date: Tue, 30 Jun 2015 19:46:19 +0200
Message-ID: <20150630174619.GA1852@amd>
References: <1435651268-9657-1-git-send-email-j.anaszewski@samsung.com>
 <20150630115809.GA13605@amd>
 <5592944B.5020809@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38012 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753349AbbF3RqW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jun 2015 13:46:22 -0400
Content-Disposition: inline
In-Reply-To: <5592944B.5020809@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Stas Sergeev <stsp@users.sourceforge.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andreas Werner <andreas.werner@men.de>, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Ben Dooks <ben@simtec.co.uk>, Chris Boot <bootc@bootc.net>, Dan Murphy <dmurphy@ti.com>, Daniel Jeong <daniel.jeong@ti.com>, Daniel Mack <daniel@zonque.org>, "David S. Miller" <davem@davemloft.net>, Fabio Baltieri <fabio.baltieri@gmail.com>, Felipe Balbi <balbi@ti.com>, Florian Fainelli <florian@openwrt.org>, "G.Shark Jeong" <gshark.jeong@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Ingi Kim <ingi2.kim@samsung.com>, Jan-Simon Moeller <dl9pf@gmx.de>, Johan Hovold <johan@kernel.org>, John

On Tue 2015-06-30 15:06:19, Jacek Anaszewski wrote:
> On 06/30/2015 01:58 PM, Pavel Machek wrote:
> >On Tue 2015-06-30 10:01:08, Jacek Anaszewski wrote:
> >>This patch rearranges the core LED subsystem code, so that it
> >>now removes from drivers the responsibility of using work queues
> >>internally in case their brightness_set ops can sleep.
> >>Addition of two flags: LED_BRIGHTNESS_FAST and LED_BLINK_DISABLE
> >>as well as new_brightness_value property to the struct led_classdev
> >>allows for employing existing set_brightness_work to do the job.
> >>The modifications allow also to get rid of brightness_set_sync op,
> >>as flash LED devices can now be handled properly only basing on the
> >>SET_BRIGHTNESS_SYNC flag.
> >
> >Are you sure this is good idea?
> >
> >You'll now use single callback for blocking and non-blocking
> >behaviour. I'm pretty sure stuff like lockdep will have some fun with
> >that.
> 
> I enabled "Lock Debugging" options and didn't get any warning.
> Could you describe the use case you are thinking of?

You may get one when one of the sleeping functions uses some lock...

I'm not a lockdep expert, but mixing functions with different
semantics under one function pointer is wrong thing to do. If it does
not produce warnings today, it may start producing them tommorow. Just
don't do it.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
