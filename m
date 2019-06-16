From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 0/9] Multicolor Framework update
Date: Sun, 16 Jun 2019 17:49:34 +0200
Message-ID: <20190616154934.GC24837@xo-6d-61-c0.localdomain>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <55737098.K72IVJ5cDM@ada>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55737098.K72IVJ5cDM@ada>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Dahl <ada@thorsis.com>
Cc: linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

> Am Donnerstag, 23. Mai 2019, 14:08:11 CEST schrieb Dan Murphy:
> >   leds: multicolor: Add sysfs interface definition
> >   dt: bindings: Add multicolor class dt bindings documention
> >   documention: leds: Add multicolor class documentation
> >   dt-bindings: leds: Add multicolor ID to the color ID  list
> >   leds: Add multicolor ID to the color ID list
> >   leds: multicolor: Introduce a multicolor class definition
> >   dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
> >   leds: lp50xx: Add the LP50XX family of the RGB LED driver
> >   leds: Update the lp55xx to use the multi color framework
> 
> While not having much experience with the implementation of the LED subsystem, 
> I've had a short look at those. Curious question: would it be possible to take 
> three gpio-leds and group those together to one multicolor-led? I know at 
> least one board, where things are wired up like this, see e.g. 
> at91-sama5d27_som1_ek.dts

Probably could be done, but is not really a good match. Multicolor was meant for
LEDs with many brightness levels.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
