From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/2] leds: bcm6328: improve blink support
Date: Thu, 17 Dec 2015 09:42:13 +0100
Message-ID: <56727565.1040003@samsung.com>
References: <1450296829-31817-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46657 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755317AbbLQImR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 17 Dec 2015 03:42:17 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZH00ADUUUEBB20@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 17 Dec 2015 08:42:14 +0000 (GMT)
In-reply-to: <1450296829-31817-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-leds@vger.kernel.org, jogo@openwrt.org, f.fainelli@gmail.com, simon@fire.lp0.eu, cernekee@gmail.com

Hi Alvaro,

Thanks for the patch. Applied with modifications mentioned below.
Please always use scripts/checkpatch.pl before patch submission,
it allows to detect this kind of problems.

On 12/16/2015 09:13 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> BCM6328 controller has a margin of 20ms per blink step, which means t=
hat we
> can only set it to 20, 40, 60 ... 1260 ms (0x3f * 20ms).
> However, when checking if delay_on =3D=3D delay_off, we were not cons=
idering the
> case when the user had set delay_on=3D20 and delay_off=3D21, since th=
is will
> cause the driver to fallback to software blinking.
> This update fixes this issue and improves blink steps by rounding the=
m
> in a more sensible way. Now 30-49ms is rounded to 40 ms, and previous=
 behaviour
> implied 40-59ms being rounded to 40 ms.

Reformatted commit message so that it didn't break 75 characters line
length limit.

>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>   drivers/leds/leds-bcm6328.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.=
c
> index 47f7c9f..0d4d274 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -140,6 +140,16 @@ static void bcm6328_led_set(struct led_classdev =
*led_cdev,
>   	spin_unlock_irqrestore(led->lock, flags);
>   }
>
> +static unsigned long bcm6328_blink_delay(unsigned long delay)
> +{
> +	unsigned long bcm6328_delay;

added empty line here

> +	bcm6328_delay =3D delay + BCM6328_LED_INTERVAL_MS / 2;
> +	bcm6328_delay =3D bcm6328_delay / BCM6328_LED_INTERVAL_MS;
> +	if (bcm6328_delay =3D=3D 0)
> +		bcm6328_delay =3D 1;

and here

> +	return bcm6328_delay;
> +}
> +
>   static int bcm6328_blink_set(struct led_classdev *led_cdev,
>   			     unsigned long *delay_on, unsigned long *delay_off)
>   {
> @@ -153,16 +163,14 @@ static int bcm6328_blink_set(struct led_classde=
v *led_cdev,
>   	if (!*delay_off)
>   		*delay_off =3D BCM6328_LED_DEF_DELAY;
>
> -	if (*delay_on !=3D *delay_off) {
> +	delay =3D bcm6328_blink_delay(*delay_on);
> +	if (delay !=3D bcm6328_blink_delay(*delay_off)) {
>   		dev_dbg(led_cdev->dev,
>   			"fallback to soft blinking (delay_on !=3D delay_off)\n");
>   		return -EINVAL;
>   	}
>
> -	delay =3D *delay_on / BCM6328_LED_INTERVAL_MS;
> -	if (delay =3D=3D 0) {
> -		delay =3D 1;
> -	} else if (delay > BCM6328_LED_INTV_MASK) {
> +	if (delay > BCM6328_LED_INTV_MASK) {
>   		dev_dbg(led_cdev->dev,
>   			"fallback to soft blinking (delay > %ums)\n",
>   			BCM6328_LED_INTV_MASK * BCM6328_LED_INTERVAL_MS);
>


--=20
Best Regards,
Jacek Anaszewski
