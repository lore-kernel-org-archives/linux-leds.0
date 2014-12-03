From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Add attributes neccessary for LED flashes to
 devicetree/bindings/leds/common.txt
Date: Wed, 3 Dec 2014 19:58:22 +0100
Message-ID: <20141203185822.GA25306@amd>
References: <20141120131713.GC27527@amd>
 <546DEEC3.7090508@samsung.com>
 <546DFF3A.7020702@samsung.com>
 <20141120205254.GA19174@amd>
 <546EF4A3.2000101@samsung.com>
 <20141124225319.GA22383@amd>
 <CAK5ve-+FBoHD+CPy8GmNDOd3BxvTn_6UB0ZOmjCrEJCpWGyAww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:43591 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030AbaLCS6Y (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 13:58:24 -0500
Content-Disposition: inline
In-Reply-To: <CAK5ve-+FBoHD+CPy8GmNDOd3BxvTn_6UB0ZOmjCrEJCpWGyAww@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>

On Tue 2014-11-25 22:09:49, Bryan Wu wrote:
> On Mon, Nov 24, 2014 at 2:53 PM, Pavel Machek <pavel@ucw.cz> wrote:
> > On Fri 2014-11-21 09:15:31, Jacek Anaszewski wrote:
> >> Hi Pavel,
> >>
> >> On 11/20/2014 09:52 PM, Pavel Machek wrote:
> >> >On Thu 2014-11-20 15:48:26, Jacek Anaszewski wrote:
> >> >>On 11/20/2014 02:38 PM, Jacek Anaszewski wrote:
> >> >>>Hi Pavel,
> >> >>>
> >> >>>On 11/20/2014 02:17 PM, Pavel Machek wrote:
> >> >>>>
> >> >>>>Add attributes neccessary for LED flashes to
> >> >>>>devicetree/bindings/leds/common.txt .
> >> >>>>
> >> >>>>This will allow me to add device tree support for adp1653 i2c flash
> >> >>>>LED driver, and allow Jacek Anaszewski to add support for more LED
> >> >>>>drivers..
> >> >..
> >> >>
> >> >>Actually, we've agreed with Sakari that we can handle
> >> >>indicator-pattern later.
> >> >
> >> >Good.
> >> >
> >> >>I would remove references to you, me and adp1653 driver from the commit
> >> >>message and mention that this modifications adjust the led common
> >> >>bindings to the LED Flash class that is to be added.
> >> >
> >> >Ok, who can take this patch? Can you edit the changelog, or should I
> >> >do it? Anything else that needs changing?
> >>
> >> It's your patch :) For me the contents of the patch are ok.
> >> It requires device tree maintainer approval anyway.
> >
> > Yeah, I was hoping relevant maintainers would speak up. I was not
> > asking you to edit the changelog, sorry I was unclear.
> >
> > Bryan Wu, Richard Purdie: You are the maintainers. Can you take the
> > patch?
> 
> I'm OK for this patch, but since Jacek and Sakari are working on
> pushing LED Flash class and driver into our LED subsystem. I need you
> guys' Ack for this. Then I can take it in my tree.

Ok, patch with the 2 acks is now waiting in your inbox :-).
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
