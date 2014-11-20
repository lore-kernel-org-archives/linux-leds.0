From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Add attributes neccessary for LED flashes to
 devicetree/bindings/leds/common.txt
Date: Thu, 20 Nov 2014 21:53:50 +0100
Message-ID: <20141120205350.GB19174@amd>
References: <20141120131713.GC27527@amd>
 <20141120150349.GZ8907@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54051 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757077AbaKTUxw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 20 Nov 2014 15:53:52 -0500
Content-Disposition: inline
In-Reply-To: <20141120150349.GZ8907@valkosipuli.retiisi.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: j.anaszewski@samsung.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net

Hi!

On Thu 2014-11-20 17:03:49, Sakari Ailus wrote:
> On Thu, Nov 20, 2014 at 02:17:13PM +0100, Pavel Machek wrote:

> > diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> > index 2d88816..e9acbbc 100644
> > --- a/Documentation/devicetree/bindings/leds/common.txt
> > +++ b/Documentation/devicetree/bindings/leds/common.txt
> > @@ -14,6 +14,15 @@ Optional properties for child nodes:
> >       "ide-disk" - LED indicates disk activity
> >       "timer" - LED flashes at a fixed, configurable rate
> >  
> > +- max-microamp : maximum intensity in microamperes of the LED
> > +  	         (torch LED for flash devices)
> > +- flash-max-microamp : maximum intensity in microamperes of the
> > +                       flash LED; it is mandatory if the LED should
> > +		       support the flash mode
> > +- flash-timeout-microsec : timeout in microseconds after which the flash
> > +                           LED is turned off
> 
> It might be good to add a note that these may be arrays, depending on the
> device.

No, they really can't be arrays. AFAICT common.txt describes single
LED, not array of them, and I don't think it is good idea to change
that.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
