From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Sun, 3 May 2015 12:34:36 +0200
Message-ID: <20150503103436.GA4317@amd>
References: <553E6CF5.4030601@list.ru>
 <20150427205441.GB1301@xo-6d-61-c0.localdomain>
 <553EA6B9.5040309@list.ru>
 <20150430173024.GB21211@amd>
 <554293BB.6000709@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34686 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169AbbECKej (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 3 May 2015 06:34:39 -0400
Content-Disposition: inline
In-Reply-To: <554293BB.6000709@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>


> >What about simply "echo 0.001 > delay_on"?
> This is possible.
> But please consider the following reservations:
> - There is already 2 files, so you are not going to write settings
> atomically anyway. When resolution changes, it might be better
> to just reset to the sane defaults (not in my current patch).

Sane defaults would be mandatory, but lets get reasonable interface.

Someone left 1 in delay_on. You want 100 nsec. You echo nsec >
delay_on_units, bang, dead machine, looping in kernel.

Someone left 100 / nsec in delay on. You want one usec. Echo 1 >
delay_on, bang, dead machine.

> - As was already discussed in the same thread, not all drivers
> can support sub-ms delays. For these drivers such resolutions
> should not be available. With separate file this is naturally
> achieved: you either don't create it at all, or list only the possible
> resolutions. With your approach you never know whether you
> can write 0.0001 or not.

Well, so you get back einval. Knowing "unit" is not enough to know how
short delays hw can support.

> - You will set the delay in ms units. For example for 100us you'll
> write 0.1. IMHO it is counter-intuitive: people will make a mistake
> and try 0.0001 instead, wrongly assuming that this is in seconds.
> And nanoseconds should then better be removed, as writing
> nanosecond delay will just require too much zeros.

This is machine-to-machine interface. And users can handle this.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
