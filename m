From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH/RFC RESEND] leds: Use set_brightness_work for brightness_set
 ops that can sleep
Date: Tue, 30 Jun 2015 14:41:08 +0300
Message-ID: <55928054.8070705@list.ru>
References: <1435651268-9657-1-git-send-email-j.anaszewski@samsung.com> <559252EC.2050906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <559252EC.2050906@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Stas Sergeev <stsp@users.sourceforge.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andreas Werner <andreas.werner@men.de>, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Ben Dooks <ben@simtec.co.uk>, Chris Boot <bootc@bootc.net>, Dan Murphy <dmurphy@ti.com>, Daniel Jeong <daniel.jeong@ti.com>, Daniel Mack <daniel@zonque.org>, "David S. Miller" <davem@davemloft.net>, Fabio Baltieri <fabio.baltieri@gmail.com>, Felipe Balbi <balbi@ti.com>, Florian Fainelli <florian@openwrt.org>, "G.Shark Jeong" <gshark.jeong@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Ingi Kim <ingi2.kim@samsung.com>, Jan-Simon Moeller <dl9pf@gmx.de>, Johan Hovold <johan@kernel.org>, John Lenz <lenz@cs.wisc.>
List-Id: linux-leds@vger.kernel.org

30.06.2015 11:27, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 06/29/2015 05:17 PM, Stas Sergeev wrote:> 29.06.2015 17:05, Jacek =
Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> +         * If need to disable soft blinking delegate this to the
>>> +         * work queue task to avoid problems in case we are
>>> +         * called from hard irq context.
>>> +         */
>>> +        led_cdev->flags |=3D LED_BLINK_DISABLE;
>> Wouldn't it be better to just enforce the callers
>> to explicitly disable software blink, so that it to
>> never happen from irq context? Something like in this
>> patch:
>> https://lkml.org/lkml/2015/5/13/491
>>
>=20
> Blinking can be disabled not only by removing trigger explicitly,
> but also by setting brightness to 0 and led_set_brightness
> can be called from hard irq context. set_brightness_work
> was originally introduced exactly for this use case.
Could you please describe where does this happen?
I can see LED_OFF happening only in led_heartbeat_function(), but
it doesn't use soft-blink, so it will not activate the delayed
timer cancel.

I would suggest the patch below to make it explicit that
led_heartbeat_function() doesn't want to cancel soft blink.
Note that led_heartbeat_function() already uses led_set_brightness_asyn=
c()
in a normal case.


diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/tr=
igger/ledtrig-heartbeat.c
index fea6871..0f89d12 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -37,7 +37,7 @@ static void led_heartbeat_function(unsigned long data=
)
 	unsigned long delay =3D 0;

 	if (unlikely(panic_heartbeats)) {
-		led_set_brightness(led_cdev, LED_OFF);
+		led_set_brightness_async(led_cdev, LED_OFF);
 		return;
 	}
