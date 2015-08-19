From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH/RFC v5 01/57] leds: Add brightness_set_nonblocking op
Date: Wed, 19 Aug 2015 21:31:17 +0200
Message-ID: <20150819193117.GA26567@amd>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
 <1439285890-27329-2-git-send-email-j.anaszewski@samsung.com>
 <20150813141547.GB32484@lunn.ch>
 <55CD9F7F.4020706@samsung.com>
 <55D48CA7.1030504@samsung.com>
 <20150819140944.GP4381@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59042 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751887AbbHSTbU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 19 Aug 2015 15:31:20 -0400
Content-Disposition: inline
In-Reply-To: <20150819140944.GP4381@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Sakari Ailus <sakari.ailus@linux.intel.com>


> > >There are around 60 drivers in the other kernel subsystems that register
> > >LED class devices. If we chose the way you proposed then we would have
> > >to adjust all of them to the LED core changes, which could complicate
> > >the situation during merge window if there were other modifications in
> > >the affected drivers.
> 
> You don't need to change anything, if the semantics of
> brightness_set() does not change. All current drivers don't
> sleep. They use a work queue if needed to ensure they don't
> sleep. Hence they are correct.

Exactly. As you explain above, there are 60 reasons not to change
existing semantics.

> By adding a new operation, brightness_set_blocking(), you can strip
> out this work queue and move to the new op member one driver at a
> time. And you can take as long as you want doing this. No flag day
> when an API suddenly means something totally different.

Yes please.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
