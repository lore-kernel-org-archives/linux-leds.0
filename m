From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Sun, 03 May 2015 14:35:47 +0300
Message-ID: <55460813.6030100@list.ru>
References: <553E6CF5.4030601@list.ru> <20150427205441.GB1301@xo-6d-61-c0.localdomain> <553EA6B9.5040309@list.ru> <20150430173024.GB21211@amd> <554293BB.6000709@list.ru> <20150503103436.GA4317@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp40.i.mail.ru ([94.100.177.100]:43018 "EHLO smtp40.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751062AbbECLgP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 3 May 2015 07:36:15 -0400
In-Reply-To: <20150503103436.GA4317@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

03.05.2015 13:34, Pavel Machek =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> What about simply "echo 0.001 > delay_on"?
>> This is possible.
>> But please consider the following reservations:
>> - There is already 2 files, so you are not going to write settings
>> atomically anyway. When resolution changes, it might be better
>> to just reset to the sane defaults (not in my current patch).
> Sane defaults would be mandatory, but lets get reasonable interface.
>
> Someone left 1 in delay_on. You want 100 nsec. You echo nsec >
> delay_on_units, bang, dead machine, looping in kernel.
That's exactly what the aforementioned "reset to the sane defaults"
should solve: if you change the delay_units, all delays should
reset to the sane defaults. FYI, there was no "delay_on_units",
just "delay_unit" for both ON and OFF delays.

> Someone left 100 / nsec in delay on. You want one usec. Echo 1 >
> delay_on, bang, dead machine.
There are 2 things needed to address this:
1. No interface should allow a michine lock-up. Locking up the
machine by writing 0.000000001 is just as bad as by writing
"nsec" and then "1". So I'll simply remove nsecs, regardless of
what interface I'll end up implementing.
2. Since changing "delay_unit" should reset the delays to the
sane default, the user should always write the delay_unit first,
then the value.

>> - As was already discussed in the same thread, not all drivers
>> can support sub-ms delays. For these drivers such resolutions
>> should not be available. With separate file this is naturally
>> achieved: you either don't create it at all, or list only the possib=
le
>> resolutions. With your approach you never know whether you
>> can write 0.0001 or not.
> Well, so you get back einval. Knowing "unit" is not enough to know ho=
w
> short delays hw can support.
The idea was that you can at least find out the order of the
supported delay. But indeed checking for EINVAL looks like a
more robust and precise solution.

>> - You will set the delay in ms units. For example for 100us you'll
>> write 0.1. IMHO it is counter-intuitive: people will make a mistake
>> and try 0.0001 instead, wrongly assuming that this is in seconds.
>> And nanoseconds should then better be removed, as writing
>> nanosecond delay will just require too much zeros.
> This is machine-to-machine interface. And users can handle this.
OK. I think you mostly convinced me that this solution is not
that bad. :) But I am going to add an explicit "Acked-by" then,
to emphasize that it is your idea and not mine.

I'll post a v3 a couple of weeks later, thanks!
