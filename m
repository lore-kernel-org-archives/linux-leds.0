From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH/RFC RESEND] leds: Use set_brightness_work for brightness_set
 ops that can sleep
Date: Tue, 30 Jun 2015 15:55:36 +0300
Message-ID: <559291C8.2010504@list.ru>
References: <1435651268-9657-1-git-send-email-j.anaszewski@samsung.com> <559252EC.2050906@samsung.com> <55928054.8070705@list.ru> <55928E7B.2020306@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp38.i.mail.ru ([94.100.177.98]:34203 "EHLO smtp38.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751817AbbF3M4y (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 30 Jun 2015 08:56:54 -0400
In-Reply-To: <55928E7B.2020306@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Stas Sergeev <stsp@users.sourceforge.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andreas Werner <andreas.werner@men.de>, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Ben Dooks <ben@simtec.co.uk>, Chris Boot <bootc@bootc.net>, Dan Murphy <dmurphy@ti.com>, Daniel Jeong <daniel.jeong@ti.com>, Daniel Mack <daniel@zonque.org>, "David S. Miller" <davem@davemloft.net>, Fabio Baltieri <fabio.baltieri@gmail.com>, Felipe Balbi <balbi@ti.com>, Florian Fainelli <florian@openwrt.org>, "G.Shark Jeong" <gshark.jeong@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Ingi Kim <ingi2.kim@samsung.com>, Jan-Simon Moeller <dl9pf@gmx.de>, Johan

30.06.2015 15:41, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 06/30/2015 01:41 PM, Stas Sergeev wrote:
>> 30.06.2015 11:27, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 06/29/2015 05:17 PM, Stas Sergeev wrote:> 29.06.2015 17:05, Jace=
k Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> +         * If need to disable soft blinking delegate this to the
>>>>> +         * work queue task to avoid problems in case we are
>>>>> +         * called from hard irq context.
>>>>> +         */
>>>>> +        led_cdev->flags |=3D LED_BLINK_DISABLE;
>>>> Wouldn't it be better to just enforce the callers
>>>> to explicitly disable software blink, so that it to
>>>> never happen from irq context? Something like in this
>>>> patch:
>>>> https://lkml.org/lkml/2015/5/13/491
>>>>
>>>
>>> Blinking can be disabled not only by removing trigger explicitly,
>>> but also by setting brightness to 0 and led_set_brightness
>>> can be called from hard irq context. set_brightness_work
>>> was originally introduced exactly for this use case.
>> Could you please describe where does this happen?
> This in fact doesn't take place in the mainline kernel,
> however there are some out of tree users apparently [1].
Oh, IMHO the hooks that are needed only for out-of-tree code
require the appropriate comment, at least. I was entirely
confused by its existence. IIRC in the past there was even
the policy to not include any hooks for out-of-tree code at
all.

> Modifications I am proposing also need set_brightness_work,
> so there is almost no cost of keeping the support for calling led_set=
_brightness from hard irq context intact.
I wonder if there are possible races, eg you schedule disabling
of the softblink timer, and someone else at the same time also
disables it (and probably also re-enables).
Well if you think that code is safe, I would agree that the cost
is now very small with your patch, so maybe it is not a big deal
any more.
