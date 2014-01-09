From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Broken locking in leds-lp5523.c
Date: Thu, 9 Jan 2014 23:45:41 +0100
Message-ID: <20140109224541.GA19516@amd.pavel.ucw.cz>
References: <20140107204233.GA22413@amd.pavel.ucw.cz>
 <CAK5ve-Kk9BuH=56F98aZOgPS+w-=8iF0HtpOYWNjRN8am2Zqjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK5ve-Kk9BuH=56F98aZOgPS+w-=8iF0HtpOYWNjRN8am2Zqjg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, milo kim <milo.kim@ti.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Sebastian Reichel <sre@debian.org>, Sebastian Reichel <sre@ring0.de>
List-Id: linux-leds@vger.kernel.org

Hi!

> > Now, this is untested patch from my reverse-engineering. I hope I
> > understood things right...
> >
> > In particular, there's unbalanced unlock in
> > lp5523_update_program_memory, and lp5523_update_program_memory needs
> > to be protected by the lock.
> >
> > Comments? Does someone maintain this?
> >
> 
> Actually the locking issue was fixed in my for-next branch,
> http://git.kernel.org/cgit/linux/kernel/git/cooloney/linux-leds.git/commit/?h=for-next&id=0d70bdb957cde2c25a4b3e4c93d0d33403795be9
> 

Yes, that should solve it. Thanks!
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
