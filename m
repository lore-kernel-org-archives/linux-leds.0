From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: fix brightness changing when software blinking is
 active
Date: Thu, 14 May 2015 14:09:16 +0200
Message-ID: <5554906C.9060405@samsung.com>
References: <55535DA4.2010509@list.ru> <55546084.9050704@samsung.com>
 <55546EAC.70408@list.ru> <55547A0C.3060103@samsung.com>
 <555480FD.3020301@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <555480FD.3020301@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

On 05/14/2015 01:03 PM, Stas Sergeev wrote:
> 14.05.2015 13:33, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Indeed, but with these changes there should be no requirement
>>> for disabling a soft-blink from hard-irq context, which is what
>>> I really wanted to have. What am I missing?
>> Please look at this [1]. Author mentions setting brightness
>> from sound-card irq handler.
>>
>> [1] http://www.spinics.net/lists/linux-leds/msg00006.html
> He points to the following (out-of-tree??) code:
> ---
>          if ((jiffies / HZ / 2) & 1)
>                  led_trigger_blink_oneshot(ledtrig_ide,
>                                  &ide_blink_delay, &ide_blink_delay, =
0);
>          if ((jiffies / HZ / 4) & 1)
>                  led_trigger_event(ledtrig_ide, 100);
>          if ((jiffies / HZ / 8) & 1)
>                  led_trigger_event(ledtrig_ide, 0);
> ---
> I think the problem was that oneshot_trig_deactivate() was
> not doing led_stop_software_blink(led_cdev), and so he needed
> a work-queue for switching out from oneshot trigger.
> My patch fixes exactly that: now oneshot trigger does the
> proper cleanup itself.
> Do you think my patch is not enough to handle this case?
>

This problem is related to the issue of locking between hard IRQ
and Softirqs [1]. I've just discovered also that there had been already
an attempt [2] of using work queue internally in led_set_brightness,
but it wouldn't have found its way to the mainline. Probably for a
reason.

[1]=20
https://www.kernel.org/pub/linux/kernel/people/rusty/kernel-locking/c18=
8.html
[2] http://www.serverphorums.com/read.php?12,563432

--=20
Best Regards,
Jacek Anaszewski
