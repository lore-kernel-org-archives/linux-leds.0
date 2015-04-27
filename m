From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Tue, 28 Apr 2015 00:14:33 +0300
Message-ID: <553EA6B9.5040309@list.ru>
References: <553E6CF5.4030601@list.ru> <20150427205441.GB1301@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp43.i.mail.ru ([94.100.177.103]:41246 "EHLO smtp43.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965095AbbD0VO6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 27 Apr 2015 17:14:58 -0400
In-Reply-To: <20150427205441.GB1301@xo-6d-61-c0.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

Hi.

27.04.2015 23:54, Pavel Machek =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi!
>
>> The following patches improve the precision of led
>> timer trigger and add the delay unit control.
>> That allows to make PWM brightness control with timer
>> trigger.
> Are you sure that is good idea? Doing LED pwm with main cpu is quite =
harsh...
Do you remember the pc-speaker driver? :)
In fact I tried the maximal possible freq on armada-xp
board (it doesn't go above approx 100KHz, perhaps this
all the HW timers can do on that board) and I haven't
measured any noticeable CPU load with htop.

> We already have "brightness" for... well... brightness level.
>
> Would it make sense to have an option (Kconfig?) to do PWM using time=
r on hardware
> that does not do hardware PWM?
I think it would make sense, but not for the "timer" trigger.
Maybe for "none" trigger, or inventing another trigger called
"pwm".
=46or the timer trigger I would pretty much like my approach to stay.
The reason is that the PWM I need to do, is not strictly a PWM -
it needs the ON period in range of tens or hundreds of milliseconds,
while the OFF period is in a couple of usecs (or vice-versa). No
generic PWM driver can afford such distribution, so I'd like to have
the "timer" trigger for the unusual things like that.
As I said, your idea can still be implemented for "none" trigger
or some new trigger, so its still all for good.
