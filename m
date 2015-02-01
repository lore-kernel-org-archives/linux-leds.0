From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] leds: leds-gpio: Pass on error codes unmodified
Date: Sun, 1 Feb 2015 08:59:54 -0800
Message-ID: <20150201165954.GX13057@xsjandreislx>
References: <1422760500-21793-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nbfkord-smmo03.seg.att.com ([209.65.160.84]:52256 "EHLO
	nbfkord-smmo03.seg.att.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753307AbbBARHX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 1 Feb 2015 12:07:23 -0500
Content-Disposition: inline
In-Reply-To: <1422760500-21793-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>

+ Andreas who actually reported this issue and also tested the patch.

On Sat, 2015-01-31 at 07:15PM -0800, Soren Brinkmann wrote:
> Instead of overriding error codes, pass them on unmodified. This
> way a EPROBE_DEFER is correctly passed to the driver core. This resul=
ts
> in the LED driver correctly requesting probe deferral in cases the GP=
IO
> controller is not yet available.
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

Here should be a:
Reported-and-tested-by: Andreas F=C3=A4rber <afaerber@suse.de>

> ---
> Adding pinctrl on Zynq shuffled with probing order quite a bit and a =
lot
> of deferred probing is going on. With those changes I saw the LEDs
> failing to probe due to the GPIO controller deferring probe until the
> pincontroller is available. With this patch things work again:
>=20
> dmesg | grep -i led:
>   of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/ds=
23[0]' - status (-517)
>   platform leds: Driver leds-gpio requests probe deferral
>   of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/ds=
23[0]' - status (0)
>=20
>   	Soren
> ---
>  drivers/leds/leds-gpio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 7ea1ea42c2d2..d26af0a79a90 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -187,6 +187,7 @@ static struct gpio_leds_priv *gpio_leds_create(st=
ruct platform_device *pdev)
>  		led.gpiod =3D devm_get_gpiod_from_child(dev, child);
>  		if (IS_ERR(led.gpiod)) {
>  			fwnode_handle_put(child);
> +			ret =3D PTR_ERR(led.gpiod);
>  			goto err;
>  		}
> =20
> @@ -229,7 +230,7 @@ static struct gpio_leds_priv *gpio_leds_create(st=
ruct platform_device *pdev)
>  err:
>  	for (count =3D priv->num_leds - 2; count >=3D 0; count--)
>  		delete_gpio_led(&priv->leds[count]);
> -	return ERR_PTR(-ENODEV);
> +	return ERR_PTR(ret);
>  }
> =20
>  static const struct of_device_id of_gpio_leds_match[] =3D {
> --=20
> 2.2.2.1.g63c5777
>=20
