From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC RESEND] leds: Use set_brightness_work for
 brightness_set ops that can sleep
Date: Tue, 30 Jun 2015 10:27:24 +0200
Message-ID: <559252EC.2050906@samsung.com>
References: <1435651268-9657-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34278 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750952AbbF3I1a (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jun 2015 04:27:30 -0400
In-reply-to: <1435651268-9657-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@users.sourceforge.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andreas Werner <andreas.werner@men.de>, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Ben Dooks <ben@simtec.co.uk>, Chris Boot <bootc@bootc.net>, Dan Murphy <dmurphy@ti.com>, Daniel Jeong <daniel.jeong@ti.com>, Daniel Mack <daniel@zonque.org>, "David S. Miller" <davem@davemloft.net>, Fabio Baltieri <fabio.baltieri@gmail.com>, Felipe Balbi <balbi@ti.com>, Florian Fainelli <florian@openwrt.org>, "G.Shark Jeong" <gshark.jeong@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Ingi Kim <ingi2.kim@samsung.com>, Jan-Simon Moeller <dl9pf@gmx.de>, Johan

On 06/29/2015 05:17 PM, Stas Sergeev wrote:> 29.06.2015 17:05, Jacek=20
Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
 >> +		 * If need to disable soft blinking delegate this to the
 >> +		 * work queue task to avoid problems in case we are
 >> +		 * called from hard irq context.
 >> +		 */
 >> +		led_cdev->flags |=3D LED_BLINK_DISABLE;
 > Wouldn't it be better to just enforce the callers
 > to explicitly disable software blink, so that it to
 > never happen from irq context? Something like in this
 > patch:
 > https://lkml.org/lkml/2015/5/13/491
 >

Blinking can be disabled not only by removing trigger explicitly,
but also by setting brightness to 0 and led_set_brightness
can be called from hard irq context. set_brightness_work
was originally introduced exactly for this use case.

--=20
Best Regards,
Jacek Anaszewski
