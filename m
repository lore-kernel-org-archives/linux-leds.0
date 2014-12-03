From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH] Add attributes neccessary for LED flashes to
 devicetree/bindings/leds/common.txt
Date: Wed, 3 Dec 2014 18:10:41 +0200
Message-ID: <20141203161041.GL14746@valkosipuli.retiisi.org.uk>
References: <20141120131713.GC27527@amd>
 <546DEEC3.7090508@samsung.com>
 <546DFF3A.7020702@samsung.com>
 <20141120205254.GA19174@amd>
 <546EF4A3.2000101@samsung.com>
 <20141124225319.GA22383@amd>
 <CAK5ve-+FBoHD+CPy8GmNDOd3BxvTn_6UB0ZOmjCrEJCpWGyAww@mail.gmail.com>
 <20141203155155.GA22783@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:40695 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751898AbaLCQLP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 11:11:15 -0500
Content-Disposition: inline
In-Reply-To: <20141203155155.GA22783@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Bryan Wu <cooloney@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>

Hi Pavel and Bryan,

On Wed, Dec 03, 2014 at 04:51:55PM +0100, Pavel Machek wrote:
> On Tue 2014-11-25 22:09:49, Bryan Wu wrote:
> > On Mon, Nov 24, 2014 at 2:53 PM, Pavel Machek <pavel@ucw.cz> wrote:
> > > On Fri 2014-11-21 09:15:31, Jacek Anaszewski wrote:
> > >> Hi Pavel,
> > >>
> > >> On 11/20/2014 09:52 PM, Pavel Machek wrote:
> > >> >On Thu 2014-11-20 15:48:26, Jacek Anaszewski wrote:
> > >> >>On 11/20/2014 02:38 PM, Jacek Anaszewski wrote:
> > >> >>>Hi Pavel,
> > >> >>>
> > >> >>>On 11/20/2014 02:17 PM, Pavel Machek wrote:
> > >> >>>>
> > >> >>>>Add attributes neccessary for LED flashes to
> > >> >>>>devicetree/bindings/leds/common.txt .
> > >> >>>>
> > >> >>>>This will allow me to add device tree support for adp1653 i2c flash
> > >> >>>>LED driver, and allow Jacek Anaszewski to add support for more LED
> > >> >>>>drivers..
> > >> >..
> > >> >>
> > >> >>Actually, we've agreed with Sakari that we can handle
> > >> >>indicator-pattern later.
> > >> >
> > >> >Good.
> > >> >
> > >> >>I would remove references to you, me and adp1653 driver from the commit
> > >> >>message and mention that this modifications adjust the led common
> > >> >>bindings to the LED Flash class that is to be added.
> > >> >
> > >> >Ok, who can take this patch? Can you edit the changelog, or should I
> > >> >do it? Anything else that needs changing?
> > >>
> > >> It's your patch :) For me the contents of the patch are ok.
> > >> It requires device tree maintainer approval anyway.
> > >
> > > Yeah, I was hoping relevant maintainers would speak up. I was not
> > > asking you to edit the changelog, sorry I was unclear.
> > >
> > > Bryan Wu, Richard Purdie: You are the maintainers. Can you take the
> > > patch?
> > 
> > I'm OK for this patch, but since Jacek and Sakari are working on
> > pushing LED Flash class and driver into our LED subsystem. I need you
> > guys' Ack for this. Then I can take it in my tree.
> 
> Jacek acked it (provided I modify changelog).
> 
> I can't get Sakari to get explicit ACK, but he was cc-ed on the
> discussion, and was ok with the idea. That should be enough...?

My apologies for missing this one --- I've gotten too much mail lately. :-P

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

The flash timeout is really a very coarse way to avoid overheating the flash
(controller or LED) but it's still what is often used in practice. This
doesn't prevent strobing the flash right after the previous strobe has
stopped, but is definitely better than nothing; this at least prevents
accidental overheating of the components.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
