From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Wed, 30 Mar 2016 15:03:19 +0200
Message-ID: <20160330130319.GB19994@amd>
References: <56D608ED.2090406@gmail.com>
 <20160329100258.GA24964@amd>
 <56FAE7A8.2070302@gmail.com>
 <20160329214323.GA10455@amd>
 <56FB893C.60203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:58792 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751432AbcC3NDY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 30 Mar 2016 09:03:24 -0400
Content-Disposition: inline
In-Reply-To: <56FB893C.60203@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, patrikbachan@gmail.com, serge@hallyn.com, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org

Hi!

> >Ok, so:
> >
> >a) Do we want RGB leds to be handled by existing subsystem, or do we
> >need separate layer on top of that?
> >
> >b) Does RGB make sense, or HSV? RGB is quite widely used in graphics,
> >and it is what hardware implements. (But we'd need to do gamma
> >correction).
> >
> >c) My hardware has "acceleration engine", LED is independend from
> >CPU. That's rather big deal. Does yours? It seems to be quite common,
> >at least in cellphones.
> >
> >Ideally, I'd like to have "triggers", but different ones. As in: if
> >charging, do yellow " .xX" pattern. If fully charged, do green steady
> >light. If message is waiting, do blue " x x" pattern. If none of
> >above, do slow white blinking. (Plus priorities of events). But that's
> >quite different from existing support...)
> 
> Please note that HSV colour scheme allows to neatly project monochrome
> brightness semantics on the RGB realm. I.e. you can have fixed
> hue and saturation, and by changing the brightness component a perceived
> colour intensity can be altered.

I see HSV has some advantages. But we already have LEDs with multiple
colors, and kernel already handles them:

pavel@duo:~$ ls -1 /sys/class/leds/
tpacpi:green:batt
tpacpi:orange:batt

This is physically 2 leds but hidden under one indicator, so you got
"off", "green", "orange" and "green+orange".
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
