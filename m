From: Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH 5/7] leds-bcm6328: switch to __raw_readl() and
 __raw_writel()
Date: Sun, 29 Nov 2015 20:25:30 +0000
Message-ID: <565B5F3A.1030008@simon.arlott.org.uk>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1448814931-1369-5-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from proxima.lp0.eu ([81.2.80.65]:55154 "EHLO proxima.lp0.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752198AbbK2UZn (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 29 Nov 2015 15:25:43 -0500
In-Reply-To: <1448814931-1369-5-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com

On 29/11/15 16:35, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
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

If the wrapper functions don't add anything, would it not be better to
just remove them completely?

--=20
Simon Arlott
