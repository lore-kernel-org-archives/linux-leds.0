From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Tue, 12 May 2015 00:11:39 +0200
Message-ID: <20150511221138.GB4434@amd>
References: <553E6CF5.4030601@list.ru>
 <20150427205441.GB1301@xo-6d-61-c0.localdomain>
 <553EA6B9.5040309@list.ru>
 <20150430173024.GB21211@amd>
 <554293BB.6000709@list.ru>
 <20150503103436.GA4317@amd>
 <55460813.6030100@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40514 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837AbbEKWLl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 May 2015 18:11:41 -0400
Content-Disposition: inline
In-Reply-To: <55460813.6030100@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

> >>- You will set the delay in ms units. For example for 100us you'll
> >>write 0.1. IMHO it is counter-intuitive: people will make a mistake
> >>and try 0.0001 instead, wrongly assuming that this is in seconds.
> >>And nanoseconds should then better be removed, as writing
> >>nanosecond delay will just require too much zeros.
> >This is machine-to-machine interface. And users can handle this.
> OK. I think you mostly convinced me that this solution is not
> that bad. :) But I am going to add an explicit "Acked-by" then,
> to emphasize that it is your idea and not mine.

Feel free to note that it is my idea, but I'd have to see&like the
patch before you can add Acked-by.

Thanks,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
