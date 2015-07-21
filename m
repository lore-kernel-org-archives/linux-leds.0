From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH/RFC 03/51] leds: Add an internal
 led_set_brightness_nosleep function
Date: Tue, 21 Jul 2015 23:30:28 +0200
Message-ID: <20150721213027.GA14670@amd>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
 <1437122857-6765-4-git-send-email-j.anaszewski@samsung.com>
 <20150721095331.GC23841@amd>
 <55AE68A0.3080903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45498 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755199AbbGUVaa (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 21 Jul 2015 17:30:30 -0400
Content-Disposition: inline
In-Reply-To: <55AE68A0.3080903@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>

On Tue 2015-07-21 17:43:28, Jacek Anaszewski wrote:
> 
> 
> On 21.07.2015 11:53, Pavel Machek wrote:
> >
> >>  	/* Set LED brightness level */
> >>-	/* Must not sleep, use a workqueue if needed */
> >>+	/* Must not sleep if the driver sets LED_BRIGHTNESS_FAST flag */
> >>  	void		(*brightness_set)(struct led_classdev *led_cdev,
> >>  					  enum led_brightness brightness);
> >>  	/*
> >
> >Have fun improving static checkers to check for this kind of crazy
> >semantics.
> 
> I'd be grateful if you gave an example of the tool that would
> complain about it.

I'd be grateful if you would go through all the tools and check that
this does _not_ break them. Because what you are doing is quite crazy.

Start with lockdep.
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
