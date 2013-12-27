From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Add the LED burst trigger
Date: Fri, 27 Dec 2013 14:05:38 +0100
Message-ID: <20131227130538.GA21841@amd.pavel.ucw.cz>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
 <20131225230935.GB13593@amd.pavel.ucw.cz>
 <BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
 <20131226142607.GA15225@amd.pavel.ucw.cz>
 <BLU172-W3236C029069708048D5697ACC20@phx.gbl>
 <BLU172-W413E574F382D098B5F9028ACC20@phx.gbl>
 <52BD751B.4060307@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52BD751B.4060307@landley.net>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: Joe Xue <lgxue@hotmail.com>, "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri 2013-12-27 06:39:55, Rob Landley wrote:
> On 12/26/13 10:58, Joe Xue wrote:
> >Hi all,
> >
> >I think Pavel's suggestion is a good idea, I'm starting to write another trigger named Morse code trigger.
> 
> Those who don't know history are doomed to fail the class and have
> to retake it with the same instructor next year:
> 
> https://lkml.org/lkml/2003/1/30/43
> 
> And it didn't go very far because a decade ago not many people
> actually knew morse code anymore, even back then. (And I think that
> was back before they finally dropped the requirement to get a ham
> radio license...)

Don't get too fixated on the morse code aspect. It should be general
enough to allow the morse code, burst-of-blinks, various lighthouse
patterns, etc...

I do not propose to put morse code encoder into kernel (like someone
did with 2003), and with multicolor leds pretty much standard on the
cell phones these days...

Yes, it would be good to be able to say 'blink blue twice, then pause,
then repeat' for SMS message. (Like N900 already does; and yes, that's
under Linux. And yes, it needs better interface).

And ideally, it would also be offloaded to the LED controller, like
N900 already does, so your battery is not drained as the cellphone
waits for you to read the message.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
