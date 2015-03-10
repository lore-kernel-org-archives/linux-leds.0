From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH RFC] leds: Add status code trigger
Date: Tue, 10 Mar 2015 09:00:42 +0100
Message-ID: <20150310080042.GA27585@amd>
References: <1424334377.11286.3.camel@localhost>
 <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:37406 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257AbbCJIAp (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 10 Mar 2015 04:00:45 -0400
Content-Disposition: inline
In-Reply-To: <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: =?iso-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>, Joe Xue <lgxue@hotmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hi!

> > Here is a new trigger. It would allow userspace to make an LED
> > blink with a pattern to show a status (or error) code to a human.
> > This is useful for embedded systems without screen or network
> > access. Obviously, the LED will keep on blinking even if userspace
> > crashes.
> 
> Thanks for bringing up this. We did get similar idea and patches
> before. The problem is people are seeking more complicated
> applications like define a script language to do blink such as
> "~~~xxxxx~x~x" and there is a decoder to translate this script to
> program the leds.
> 
> It was pointed out we need another API between kernel and user space,
> but I don't have such time to do that.
> 
> I will add more people to review this patch and discuss this new
> feature.

And then there are LEDs that can do smooth brightness transitions, and
LEDs that provide RGB colors, and programmable LED engines.

I think I have interface to handle most of the issues: array of
integers in "brightness, length in miliseconds".

So for example slowly blinking LED would be "0 1000msec, 255 1000
msec". On off pattern would be "0 1000msec, 255 0msec, 255 1000msec, 0
0msec".

Rapahael, this should be able to do all the stuff you want to do. It
can also do morse code, slow blinks, and combination of both. Do you
want to try implementing it?

Thanks,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
