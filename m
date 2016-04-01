From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Fri, 1 Apr 2016 17:03:31 +0200
Message-ID: <20160401150331.GG11860@amd>
References: <20160329100258.GA24964@amd>
 <56FAE7A8.2070302@gmail.com>
 <20160329214323.GA10455@amd>
 <56FB893C.60203@samsung.com>
 <20160330130319.GB19994@amd>
 <CAFSsGVuzToswt6bh9w3L2LqC6SiVyPw1-wSgUa3i=O14io85kg@mail.gmail.com>
 <20160401125540.GC11860@amd>
 <56FE779B.9020602@samsung.com>
 <20160401140731.GE11860@amd>
 <56FE8563.9090609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39495 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751925AbcDAPDe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 1 Apr 2016 11:03:34 -0400
Content-Disposition: inline
In-Reply-To: <56FE8563.9090609@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>

Hi!

> >>The main drawback is that you can't set the colour at one go,
> >>but have to set brightness of each LED class device (R,G,B)
> >>separately. It incurs delays between setting each colour component.
> >
> >Yeah. Well, on some hardware, that's just the way it is. If the leds
> >are separate devices on i2c, you can't really set them in one go.
> 
> Delays can occur even if the LEDs are controlled by the same device.
> Brightness of each LED class device is set with separate system
> call and there will be always some time shift between particular I2C
> transmissions that set the brightness for each sub-LED.
> 
> If the three sub-LEDs were controlled by a single LED class device
> then we could setup the brightness of each sub-LED with single I2C
> transmission.

Ok, well, yes, maybe you could.

You can still do that with the proposed interface, but yes, it will be
trickier.

OTOH proposed interface will also help with the hardware pattern
support, will work with existing leds, and matches the way hardware
works. So I believe it is worth it.

Best regards,

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
