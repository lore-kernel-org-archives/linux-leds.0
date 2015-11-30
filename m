From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 5/7] leds-bcm6328: switch to __raw_readl() and
 __raw_writel()
Date: Sun, 29 Nov 2015 20:32:48 -0800
Message-ID: <565BD170.2050600@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1448814931-1369-5-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33285 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752268AbbK2Ucu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 29 Nov 2015 15:32:50 -0500
Received: by oixx65 with SMTP id x65so84565555oix.0
        for <linux-leds@vger.kernel.org>; Sun, 29 Nov 2015 12:32:50 -0800 (PST)
In-Reply-To: <1448814931-1369-5-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, cernekee@gmail.com, simon@fire.lp0.eu

Le 29/11/2015 08:35, =C3=81lvaro Fern=C3=A1ndez Rojas a =C3=A9crit :
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>

This driver has a slight chance of running on a BCM63138 SoC which is
ARM-based and little endian, so I would keep the wrapper around here
just so it is easy for somebody to add support for a different platform
later on.

> ---
>  drivers/leds/leds-bcm6328.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.=
c
> index cd54264..876f0ce 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -76,12 +76,12 @@ struct bcm6328_led {
> =20
>  static void bcm6328_led_write(void __iomem *reg, unsigned long data)
>  {
> -	iowrite32be(data, reg);
> +	__raw_writel(data, reg);
>  }
> =20
>  static unsigned long bcm6328_led_read(void __iomem *reg)
>  {
> -	return ioread32be(reg);
> +	return __raw_readl(reg);
>  }
> =20
>  /**
>=20
