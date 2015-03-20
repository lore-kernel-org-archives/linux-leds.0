From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] leds: Add arbitrary pattern trigger
Date: Fri, 20 Mar 2015 22:05:49 +0100
Message-ID: <20150320210549.GA10475@amd>
References: <1426862522.48232.3.camel@localhost>
 <CAK5ve-L7zLZ=L-3U12y65VD_Xv=mDC8YuJp+Nix7SfzRxCb7MQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK5ve-L7zLZ=L-3U12y65VD_Xv=mDC8YuJp+Nix7SfzRxCb7MQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: =?iso-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>, Joe Xue <lgxue@hotmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi!

> > Add a new led trigger supporting arbitrary patterns.
> > This is useful for embedded systems with no screen or network access.
> >
> > Export two sysfs attributes: "pattern", and "repeat".
> >
> > When "repeat"=-1, repeat the pattern indefinitely. Otherwise,
> > repeat it the specified number of times. "pattern" specifies
> > the pattern as comma separated couples of "brightness duration"
> > values. See detailled documentation in patch.
> >
> 
> Thanks for pushing this. But as we discussed in previous patches
> provided by Joe Xue, we won't merge this kind of complex trigger patch
> into kernel. I think we need to think about a new LED API to user
> space and make it easier to handle.

So, how do you propose to control intelligent LED controllers, such as
the one in N900? This pattern engine quite nicely matches the stuff
hardware can do.

And for a cell phone, it is quite important to be able to use the
hardware LED pattern engine, to save power. (And so that the LED keeps
working while machine is suspended -- important for Android phones). 

								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
