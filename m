From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC RESEND] leds: Use set_brightness_work for
 brightness_set ops that can sleep
Date: Tue, 30 Jun 2015 14:41:31 +0200
Message-ID: <55928E7B.2020306@samsung.com>
References: <1435651268-9657-1-git-send-email-j.anaszewski@samsung.com>
 <559252EC.2050906@samsung.com> <55928054.8070705@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <55928054.8070705@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: Stas Sergeev <stsp@users.sourceforge.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andreas Werner <andreas.werner@men.de>, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Ben Dooks <ben@simtec.co.uk>, Chris Boot <bootc@bootc.net>, Dan Murphy <dmurphy@ti.com>, Daniel Jeong <daniel.jeong@ti.com>, Daniel Mack <daniel@zonque.org>, "David S. Miller" <davem@davemloft.net>, Fabio Baltieri <fabio.baltieri@gmail.com>, Felipe Balbi <balbi@ti.com>, Florian Fainelli <florian@openwrt.org>, "G.Shark Jeong" <gshark.jeong@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Ingi Kim <ingi2.kim@samsung.com>, Jan-Simon Moeller <dl9pf@gmx.de>, Johan
List-Id: linux-leds@vger.kernel.org

On 06/30/2015 01:41 PM, Stas Sergeev wrote:
> 30.06.2015 11:27, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 06/29/2015 05:17 PM, Stas Sergeev wrote:> 29.06.2015 17:05, Jacek=
 Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> +         * If need to disable soft blinking delegate this to the
>>>> +         * work queue task to avoid problems in case we are
>>>> +         * called from hard irq context.
>>>> +         */
>>>> +        led_cdev->flags |=3D LED_BLINK_DISABLE;
>>> Wouldn't it be better to just enforce the callers
>>> to explicitly disable software blink, so that it to
>>> never happen from irq context? Something like in this
>>> patch:
>>> https://lkml.org/lkml/2015/5/13/491
>>>
>>
>> Blinking can be disabled not only by removing trigger explicitly,
>> but also by setting brightness to 0 and led_set_brightness
>> can be called from hard irq context. set_brightness_work
>> was originally introduced exactly for this use case.
> Could you please describe where does this happen?

This in fact doesn't take place in the mainline kernel,
however there are some out of tree users apparently [1].
We could remove this possibility, just give me a reason
why we should do that? If we removed it, we would force
any potential driver wanting to call led_set_brightness(LED_OFF)
from hard irq context to use the work queue on its own.

Modifications I am proposing also need set_brightness_work,
so there is almost no cost of keeping the support for calling=20
led_set_brightness from hard irq context intact.

> I can see LED_OFF happening only in led_heartbeat_function(), but
> it doesn't use soft-blink, so it will not activate the delayed
> timer cancel.
>
> I would suggest the patch below to make it explicit that
> led_heartbeat_function() doesn't want to cancel soft blink.
> Note that led_heartbeat_function() already uses led_set_brightness_as=
ync()
> in a normal case.

With the new approach it should call led_set_brightness_nosleep there.

>
> diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/=
trigger/ledtrig-heartbeat.c
> index fea6871..0f89d12 100644
> --- a/drivers/leds/trigger/ledtrig-heartbeat.c
> +++ b/drivers/leds/trigger/ledtrig-heartbeat.c
> @@ -37,7 +37,7 @@ static void led_heartbeat_function(unsigned long da=
ta)
>   	unsigned long delay =3D 0;
>
>   	if (unlikely(panic_heartbeats)) {
> -		led_set_brightness(led_cdev, LED_OFF);
> +		led_set_brightness_async(led_cdev, LED_OFF);
>   		return;
>   	}
>
>

[1] http://www.spinics.net/lists/linux-leds/msg00006.html

--=20
Best Regards,
Jacek Anaszewski
