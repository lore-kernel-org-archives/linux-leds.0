From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH RFC] leds: Add status code trigger
Date: Tue, 10 Mar 2015 20:22:26 +0100
Message-ID: <20150310192226.GB11260@amd>
References: <1424334377.11286.3.camel@localhost>
 <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
 <20150310080042.GA27585@amd>
 <BLU172-W3716E59BC9E98F60F424C4AC180@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BLU172-W3716E59BC9E98F60F424C4AC180@phx.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Xue <lgxue@hotmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, =?iso-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi!

> This patch is very similar to mine patten trigger and all features are covered by my patch.
> If you are considering to take this feature, could you consider my patch instead?
> http://thread.gmane.org/gmane.linux.documentation/19116/focus=19135

That one is indeed better than this patch (as it supports almost
arbitrary blinking pattern on single LED, it will not help much with
smooth brightness control.

Would solution below work for you?

Best regards,
									Pavel

> > I think I have interface to handle most of the issues: array of
> > integers in "brightness, length in miliseconds".
> > 
> > So for example slowly blinking LED would be "0 1000msec, 255 1000
> > msec". On off pattern would be "0 1000msec, 255 0msec, 255 1000msec, 0
> > 0msec".
> > 
> > Rapahael, this should be able to do all the stuff you want to do. It
> > can also do morse code, slow blinks, and combination of both. Do you
> > want to try implementing it?
>  		 	   		  

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
