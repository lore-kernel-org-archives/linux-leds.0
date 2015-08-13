From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH/RFC v5 01/57] leds: Add brightness_set_nonblocking op
Date: Thu, 13 Aug 2015 16:23:49 +0200
Message-ID: <20150813142349.GA14736@amd>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
 <1439285890-27329-2-git-send-email-j.anaszewski@samsung.com>
 <20150813141547.GB32484@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51926 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752127AbbHMOXw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 13 Aug 2015 10:23:52 -0400
Content-Disposition: inline
In-Reply-To: <20150813141547.GB32484@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Sakari Ailus <sakari.ailus@linux.intel.com>

On Thu 2015-08-13 16:15:47, Andrew Lunn wrote:
> On Tue, Aug 11, 2015 at 11:37:14AM +0200, Jacek Anaszewski wrote:
> > This patch adds a new brightness_set_nonblocking op to the LED subsystem.
> > The op is intended for drivers that set brightness in a non-blocking way,
> > i.e. they neither sleep nor use delays while setting brightness.
> > 
> > Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> > Cc: Bryan Wu <cooloney@gmail.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Stas Sergeev <stsp@users.sourceforge.net>
> > ---
> >  include/linux/leds.h |    3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index b122eea..c32f1b8 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -53,6 +53,9 @@ struct led_classdev {
> >  	/* Must not sleep, use a workqueue if needed */
> >  	void		(*brightness_set)(struct led_classdev *led_cdev,
> >  					  enum led_brightness brightness);
> > +	/* Intended for drivers that set brightness in a non-blocking way */
> > +	void (*brightness_set_nonblocking)(struct led_classdev *led_cdev,
> > +					  enum led_brightness brightness);
> 
> Hi Jacek
> 
> >From an API design point of view, i'm not sure this is the best way to
> go. You now have two calls which do the same thing, with the plan that
> you want to invert the meaning of brightness_set, the old well known
> API call, sometime later. This inverting the meaning is going to catch
> people out and introduce bugs.

Yes please.
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
