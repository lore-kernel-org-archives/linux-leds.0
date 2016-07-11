From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-gpio: Set of_node for created LED devices
Date: Mon, 11 Jul 2016 09:34:30 +0200
Message-ID: <57834C06.4020506@samsung.com>
References: <1467982420-15718-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53604 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751046AbcGKHee (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 Jul 2016 03:34:34 -0400
In-reply-to: <1467982420-15718-1-git-send-email-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Hi Rafa=C5=82,

Thanks for the patch.

On 07/08/2016 02:53 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> When working with Device Tree we iterate over children of "gpio-leds"
> compatible node and create LED device for each of them. We take care =
of
> all common DT properties (label, default trigger, state, etc.), howev=
er
> some triggers may want to support more of them.
>
> It could be useful for timer trigger to support setting delay on/off
> values with Device Tree property. Or for transient trigger to support
> e.g. duration property.
>
> We obviously should handle such properties in triggers, not in generi=
c
> code. To let trigger drivers read properties from DT node we need to =
set
> of_node to point the relevant node. This change allows using all kind=
 of
> of helpers in e.g. "activate" callbacks.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>   drivers/leds/leds-gpio.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 8229f06..9b991d4 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -165,6 +165,7 @@ static struct gpio_leds_priv *gpio_leds_create(st=
ruct platform_device *pdev)
>   		return ERR_PTR(-ENOMEM);
>
>   	device_for_each_child_node(dev, child) {
> +		struct gpio_led_data *led_dat =3D &priv->leds[priv->num_leds];

This seems to be an unrelated change.

>   		struct gpio_led led =3D {};
>   		const char *state =3D NULL;
>
> @@ -205,12 +206,12 @@ static struct gpio_leds_priv *gpio_leds_create(=
struct platform_device *pdev)
>   		if (fwnode_property_present(child, "panic-indicator"))
>   			led.panic_indicator =3D 1;
>
> -		ret =3D create_gpio_led(&led, &priv->leds[priv->num_leds],
> -				      dev, NULL);
> +		ret =3D create_gpio_led(&led, led_dat, dev, NULL);
>   		if (ret < 0) {
>   			fwnode_handle_put(child);
>   			goto err;
>   		}
> +		led_dat->cdev.dev->of_node =3D np;
>   		priv->num_leds++;
>   	}
>
>


--=20
Best regards,
Jacek Anaszewski
