From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/2] leds: bcm6358: remove unneeded busy status check
Date: Thu, 17 Dec 2015 09:42:41 +0100
Message-ID: <56727581.1060907@samsung.com>
References: <1450296829-31817-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46682 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752011AbbLQImo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 17 Dec 2015 03:42:44 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZH00ABJUV6TL20@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 17 Dec 2015 08:42:42 +0000 (GMT)
In-reply-to: <1450296829-31817-2-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-leds@vger.kernel.org, jogo@openwrt.org, f.fainelli@gmail.com, simon@fire.lp0.eu, cernekee@gmail.com

Hi Alvaro,

Thanks for the patch. Applied.

On 12/16/2015 09:13 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> The busy status checking isn't needed while reading initial LED statu=
s.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>   drivers/leds/leds-bcm6358.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.=
c
> index 7413e3e..b2cc066 100644
> --- a/drivers/leds/leds-bcm6358.c
> +++ b/drivers/leds/leds-bcm6358.c
> @@ -123,9 +123,6 @@ static int bcm6358_led(struct device *dev, struct=
 device_node *nc, u32 reg,
>   			led->cdev.brightness =3D LED_FULL;
>   		} else if (!strcmp(state, "keep")) {
>   			unsigned long val;
> -
> -			bcm6358_led_busy(led->mem);
> -
>   			val =3D bcm6358_led_read(led->mem + BCM6358_REG_MODE);
>   			val &=3D BIT(led->pin);
>   			if ((led->active_low && !val) ||
>


--=20
Best Regards,
Jacek Anaszewski
