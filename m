From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC RESEND] leds: Use set_brightness_work for
 brightness_set ops that can sleep
Date: Wed, 01 Jul 2015 09:28:52 +0200
Message-ID: <559396B4.9020504@samsung.com>
References: <1435651268-9657-1-git-send-email-j.anaszewski@samsung.com>
 <20150630115809.GA13605@amd> <5592944B.5020809@samsung.com>
 <20150630174619.GA1852@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:18546 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092AbbGAH26 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 1 Jul 2015 03:28:58 -0400
In-reply-to: <20150630174619.GA1852@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Stas Sergeev <stsp@users.sourceforge.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andreas Werner <andreas.werner@men.de>, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Ben Dooks <ben@simtec.co.uk>, Chris Boot <bootc@bootc.net>, Dan Murphy <dmurphy@ti.com>, Daniel Jeong <daniel.jeong@ti.com>, Daniel Mack <daniel@zonque.org>, "David S. Miller" <davem@davemloft.net>, Fabio Baltieri <fabio.baltieri@gmail.com>, Felipe Balbi <balbi@ti.com>, Florian Fainelli <florian@openwrt.org>, "G.Shark Jeong" <gshark.jeong@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Ingi Kim <ingi2.kim@samsung.com>, Jan-Simon Moeller <dl9pf@gmx.de>, Johan Hovold <johan@kernel.org>, John

On 06/30/2015 07:46 PM, Pavel Machek wrote:
> On Tue 2015-06-30 15:06:19, Jacek Anaszewski wrote:
>> On 06/30/2015 01:58 PM, Pavel Machek wrote:
>>> On Tue 2015-06-30 10:01:08, Jacek Anaszewski wrote:
>>>> This patch rearranges the core LED subsystem code, so that it
>>>> now removes from drivers the responsibility of using work queues
>>>> internally in case their brightness_set ops can sleep.
>>>> Addition of two flags: LED_BRIGHTNESS_FAST and LED_BLINK_DISABLE
>>>> as well as new_brightness_value property to the struct led_classdev
>>>> allows for employing existing set_brightness_work to do the job.
>>>> The modifications allow also to get rid of brightness_set_sync op,
>>>> as flash LED devices can now be handled properly only basing on the
>>>> SET_BRIGHTNESS_SYNC flag.
>>>
>>> Are you sure this is good idea?
>>>
>>> You'll now use single callback for blocking and non-blocking
>>> behaviour. I'm pretty sure stuff like lockdep will have some fun with
>>> that.
>>
>> I enabled "Lock Debugging" options and didn't get any warning.
>> Could you describe the use case you are thinking of?
>
> You may get one when one of the sleeping functions uses some lock...

Drivers which use spin_lock in their brightness_set op will have to
set LED_BRIGHTNESS_FAST flag, which will instruct the LED core to
call the op synchronously. On the other hand drivers which can sleep
in their brightness_set op won't set the flag, which will make LED core
delegating the op to the work queue task. It is also possible that
driver with brightness_set op that can sleep set SET_BRIGHTNESS_SYNC
flag - then LED core will call it in a synchronous way from
led_brightness_set and it will schedule work queue task in case
the op is called from triggers.

If you want to NAK the patch, please come up with detailed analysis
on how it can cause problems. Without this I infer that you didn't
spend a second on analyzing the code. This is counterproductive.

> I'm not a lockdep expert, but mixing functions with different
> semantics under one function pointer is wrong thing to do. If it does
> not produce warnings today, it may start producing them tommorow. Just
> don't do it.

-- 
Best Regards,
Jacek Anaszewski
