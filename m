From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/7] leds-bcm6328: code cleaning
Date: Mon, 30 Nov 2015 11:46:16 +0100
Message-ID: <565C28F8.7080102@samsung.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:37706 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753466AbbK3KqU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Nov 2015 05:46:20 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYM009P2J95ZN60@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 30 Nov 2015 10:46:17 +0000 (GMT)
In-reply-to: <1448814931-1369-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-leds@vger.kernel.org, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu

Hi Alvaro,

Thanks for the patches. Please use "leds: bcm6328"
(or leds: bcm6358) prefix in the commit title. Please also add commit
description to the patches that are missing it.

On 11/29/2015 05:35 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> - Remove double whitespace
> - Add missing brackets
> - Add spinlock info
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>   drivers/leds/leds-bcm6328.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.=
c
> index 0329dee..1ef69c2 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -42,7 +42,7 @@
>   #define BCM6328_LED_SHIFT_TEST		BIT(30)
>   #define BCM6328_LED_TEST		BIT(31)
>   #define BCM6328_INIT_MASK		(BCM6328_SERIAL_LED_EN | \
> -					 BCM6328_SERIAL_LED_MUX  | \
> +					 BCM6328_SERIAL_LED_MUX | \
>   					 BCM6328_SERIAL_LED_CLK_NPOL | \
>   					 BCM6328_SERIAL_LED_DATA_PPOL | \
>   					 BCM6328_SERIAL_LED_SHIFT_DIR)
> @@ -151,9 +151,9 @@ static int bcm6328_blink_set(struct led_classdev =
*led_cdev,
>   	}
>
>   	delay =3D *delay_on / BCM6328_LED_INTERVAL_MS;
> -	if (delay =3D=3D 0)
> +	if (delay =3D=3D 0) {
>   		delay =3D 1;
> -	else if (delay > BCM6328_LED_INTV_MASK) {
> +	} else if (delay > BCM6328_LED_INTV_MASK) {
>   		dev_dbg(led_cdev->dev,
>   			"fallback to soft blinking (delay > %ums)\n",
>   			BCM6328_LED_INTV_MASK * BCM6328_LED_INTERVAL_MS);
> @@ -337,7 +337,7 @@ static int bcm6328_leds_probe(struct platform_dev=
ice *pdev)
>   	struct device_node *child;
>   	struct resource *mem_r;
>   	void __iomem *mem;
> -	spinlock_t *lock;
> +	spinlock_t *lock; /* memory lock */
>   	unsigned long val, *blink_leds, *blink_delay;
>
>   	mem_r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>


--=20
Best Regards,
Jacek Anaszewski
