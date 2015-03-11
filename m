From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH RFC] leds: Add status code trigger
Date: Wed, 11 Mar 2015 20:02:55 +0100
Message-ID: <20150311190255.GA20247@amd>
References: <1424334377.11286.3.camel@localhost>
 <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
 <20150310080042.GA27585@amd>
 <BLU172-W3716E59BC9E98F60F424C4AC180@phx.gbl>
 <20150310192226.GB11260@amd>
 <1426086614.59115.14.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53824 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751367AbbCKTC6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 11 Mar 2015 15:02:58 -0400
Content-Disposition: inline
In-Reply-To: <1426086614.59115.14.camel@localhost>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>
Cc: Joe Xue <lgxue@hotmail.com>, Bryan Wu <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hi!

> > > This patch is very similar to mine patten trigger and all features are covered by my patch.
> > > If you are considering to take this feature, could you consider my patch instead?
> > > http://thread.gmane.org/gmane.linux.documentation/19116/focus=19135
> > 
> > That one is indeed better than this patch (as it supports almost
> > arbitrary blinking pattern on single LED, it will not help much with
> > smooth brightness control.
> 
> I agree, that patch supports more features than mine, I didn't find it
> while browsing the mailing list archive.

> > Would solution below work for you?

> > > > I think I have interface to handle most of the issues: array of
> > > > integers in "brightness, length in miliseconds".
> > > > 
> > > > So for example slowly blinking LED would be "0 1000msec, 255 1000
> > > > msec". On off pattern would be "0 1000msec, 255 0msec, 255 1000msec, 0
> > > > 0msec".
> > > > 
> > > > Rapahael, this should be able to do all the stuff you want to do. It
> > > > can also do morse code, slow blinks, and combination of both. Do you
> > > > want to try implementing it?
> > >  		 	   		  
> > 
> 
> I could implement it. This is how I'd do it :
> When activated, the trigger would export three
> sysfs attributes : pattern, pattern_repeat, and pattern_once.
> 
> 	pattern : list of brightness/time couple, separated by newlines
> 		For the slowly blinking LED of your example,
> 		this attribute would contain :
> 		0 1000
> 		255 1000
> 
> 		For a heartbeat-like pattern :
> 		0 1000
> 		255 100
> 		0 100
> 		255 100

That would be "slowly go to zero intensity, quickly go to max
intensity, to zero, to maximum". If you wanted to turn the LED on/off
without going through partial brightnesses, you'd do

	        0 1000
		255 0
		255 100
		0 0
		0 100
		255 0
		255 100
		0 0

> 	pattern_repeat : repeat this pattern indefinitely ?
> 		1 -> yes, 0 -> no
> 
> 	pattern_once : if pattern_repeat = 0, writing 1 to this
> 		file makes the pattern run once .

I'd do attribute "repeat" with number of repetitions, or -1 == "repeat
forever" default value.

Best regards,
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
