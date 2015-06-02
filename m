From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 01/20] leds: implement LED_BRIGHTNESS_FAST flag
Date: Tue, 02 Jun 2015 10:11:52 +0200
Message-ID: <556D6548.20905@samsung.com>
References: <555CA58A.10700@list.ru> <555CA5FA.2080308@list.ru>
 <556C1855.7070903@samsung.com> <556C4851.7060900@list.ru>
 <556C69EA.10000@samsung.com> <556C6E2F.7050100@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56351 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754932AbbFBIL4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 2 Jun 2015 04:11:56 -0400
In-reply-to: <556C6E2F.7050100@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>

On 06/01/2015 04:37 PM, Stas Sergeev wrote:
> 01.06.2015 17:19, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> In fact, the things are more complicated: some drivers do small
>>> udelay()'s but do not use a work-queue. I was not marking them as
>>> FAST, although perhaps they could still be marked as SYNC?
>> This could be handled by adding a property to struct led_classdev
>> for defining minimum acceptable delay. Then FAST flag should not
>> be needed.
> Oh c'mon, that's too difficult!
> Lets just have a flag whether we can do an SW PWM from hrtimer irq ca=
llback.
> If we can't do from irq callback - simply do not do anything below 10=
mS.
> IMHO a simple and practical solution.
> Otherwise we'll not have anything implemented at all I guess.
>

I agree if we are not going to mark the drivers using delays as FAST.
Otherwise the minimum acceptable value stemming from delay value
would be required. I prefer the former.

--=20
Best Regards,
Jacek Anaszewski
