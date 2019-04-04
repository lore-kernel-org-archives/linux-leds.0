From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 05/25] dt-bindings: leds: Add function and color
 properties
Date: Thu, 4 Apr 2019 15:21:52 +0200
Message-ID: <20190404132152.GA6124@xo-6d-61-c0.localdomain>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
 <20190310182836.20841-6-jacek.anaszewski@gmail.com>
 <98c1a41e-77bb-5ffd-b5b3-772a28c0f0a6@ti.com>
 <796a13a7-fb8c-9b5b-6bd5-dfb7458731fe@gmail.com>
 <232b6154-cccd-c1f9-80c3-438098f3ab08@gmail.com>
 <20190328002341.GB22901@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190328002341.GB22901@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org


> > > > > +- function: LED functon. Use one of the LED_FUNCTION_* prefixed
> > > > > definitions
> > > > > +        from the header include/dt-bindings/leds/common.h.
> > > > > +        If there is no matching LED_FUNCTION available, add a new one.
> > > > > +- color : Color of the LED. Use one of the LED_COLOR_NAME_*
> > > > > prefixed definitions
> > > > > +        from the header include/dt-bindings/leds/common.h.
> > > > > +        If there is no matching LED_COLOR_NAME available, add a
> > > > > new one.
> > > > > +
> > > > 
> > > > I am assuming multi color can re-use this property as well?
> > > 
> > > I intended it to be a string, but indeed it would be better if we will
> > > make it an integer to be consistent with the discussed LED multi color
> > > design.
> > 
> > Going further, I wonder if it would make sense to make function also
> > an integer. This way we could enforce use of LED functions known
> > to kernel.
> 
> I think if we did that, then we'd just need to keep label. I think we 
> need to allow for populating a string in DT matching a sticker next to 
> an LED on a device.

Well, there's often icon next to the LED... and we already use "label" for
something else. New property might make sense, but again, icons will make it tricky.

									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
