From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Add the LED burst trigger
Date: Thu, 26 Dec 2013 15:26:08 +0100
Message-ID: <20131226142607.GA15225@amd.pavel.ucw.cz>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
 <20131225230935.GB13593@amd.pavel.ucw.cz>
 <BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:36525 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753025Ab3LZO0K (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Dec 2013 09:26:10 -0500
Content-Disposition: inline
In-Reply-To: <BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Joe Xue <lgxue@hotmail.com>
Cc: "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>

Hi!

> Yes, Morse code can indicate any means. But when we look at the LEDs, would we like to also have a Morse code book in hand?
> 
> The burst led blink idea is because it is easy to use and easy to describe. Mostly when users on site are describing the LEDs states to the support engineer.
>

Well.. above 7 or so blinks, people will be unable to count. "one
short, one long" will help to extend that. 

Plus, there may be patterns such as "keep it ON, count number of brief
OFFs"... 

That's why I suggested:

> > echo 40> step_length_ms
> > echo "- - - "> pattern
> >
> > do the same trick?
> >
> > Plus, you could for example do
> >
> > echo "- --- "> pattern
> >
> > to do morse code...

Interface

(Note that your client stripped some spaces out of it).

With that, it should be very easy to program all the reasonable
blinking patterns for single LED without PWM.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
