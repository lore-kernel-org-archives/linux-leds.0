From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Thu, 30 Apr 2015 19:30:25 +0200
Message-ID: <20150430173024.GB21211@amd>
References: <553E6CF5.4030601@list.ru>
 <20150427205441.GB1301@xo-6d-61-c0.localdomain>
 <553EA6B9.5040309@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <553EA6B9.5040309@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

Hi!

> >>The following patches improve the precision of led
> >>timer trigger and add the delay unit control.
> >>That allows to make PWM brightness control with timer
> >>trigger.
> >Are you sure that is good idea? Doing LED pwm with main cpu is quite harsh...
> Do you remember the pc-speaker driver? :)

Actually yes, I do, and that one has the same interface as "normal"
sound cards.

> For the timer trigger I would pretty much like my approach to stay.
> The reason is that the PWM I need to do, is not strictly a PWM -
> it needs the ON period in range of tens or hundreds of milliseconds,
> while the OFF period is in a couple of usecs (or vice-versa). No

That is a PWM, right? I see why you'd want to have short "on", but I
don't see why you'd want short "off"...

There's one thing you have to do: having two files, one specifiying
units and second one specifying timeout is not going to work.

What about simply "echo 0.001 > delay_on"?

Thanks,
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
