From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Thu, 30 Apr 2015 23:42:35 +0300
Message-ID: <554293BB.6000709@list.ru>
References: <553E6CF5.4030601@list.ru> <20150427205441.GB1301@xo-6d-61-c0.localdomain> <553EA6B9.5040309@list.ru> <20150430173024.GB21211@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp10.mail.ru ([94.100.181.92]:36663 "EHLO smtp10.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751236AbbD3UnD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 30 Apr 2015 16:43:03 -0400
In-Reply-To: <20150430173024.GB21211@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

30.04.2015 20:30, Pavel Machek =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> For the timer trigger I would pretty much like my approach to stay.
>> The reason is that the PWM I need to do, is not strictly a PWM -
>> it needs the ON period in range of tens or hundreds of milliseconds,
>> while the OFF period is in a couple of usecs (or vice-versa). No
> That is a PWM, right? I see why you'd want to have short "on", but I
> don't see why you'd want short "off"...
OK so you demand the full details... sigh. :)
Well the board I have, was created by some crazy people.
They wanted to add an external watchdog, and what they
did was to program one of the leds to "heartbeat" and wire
it to the external MCU that controls the power. So when it
heartbeats, watchdog will not re-power the board.
Now I want to use that led as a led, not as a watchdog.
=46or that I unfortunately need those "almost ON/almost OFF"
timings.
This board is all but linux-friendly. For example I have already
submitted the patches that allow mvneta MAC to work without
MDIO. And there is a lot of fun ahead in getting the rest to work.

> There's one thing you have to do: having two files, one specifiying
> units and second one specifying timeout is not going to work.
Oh but there is already 2: delay_on/delay_off.

> What about simply "echo 0.001 > delay_on"?
This is possible.
But please consider the following reservations:
- There is already 2 files, so you are not going to write settings
atomically anyway. When resolution changes, it might be better
to just reset to the sane defaults (not in my current patch).
- As was already discussed in the same thread, not all drivers
can support sub-ms delays. For these drivers such resolutions
should not be available. With separate file this is naturally
achieved: you either don't create it at all, or list only the possible
resolutions. With your approach you never know whether you
can write 0.0001 or not.
- You will set the delay in ms units. For example for 100us you'll
write 0.1. IMHO it is counter-intuitive: people will make a mistake
and try 0.0001 instead, wrongly assuming that this is in seconds.
And nanoseconds should then better be removed, as writing
nanosecond delay will just require too much zeros.

Now I am not saying I am against that approach.
More like I have already considered it and have not prioritized
it over the one with the new file. But feel free to convince me
that it is better and I'll implement it in the next update.
