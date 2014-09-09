From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] leds: Add DT support for leds-pca9532
Date: Tue, 09 Sep 2014 20:08:53 +0200
Message-ID: <17734612.3IvPuVrruO@wuerfel>
References: <1410269280-8761-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410269280-8761-1-git-send-email-stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, riku.voipio-X3B1VOXEql0@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Tuesday 09 September 2014 15:28:00 Roland Stigge wrote:
> +#ifdef CONFIG_OF
> +static struct pca9532_platform_data *pca9532_parse_dt(struct device *dev)
> +{
...
> +
>  static int pca9532_probe(struct i2c_client *client,
>         const struct i2c_device_id *id)
>  {
> @@ -449,6 +489,11 @@ static int pca9532_probe(struct i2c_clie
>         struct pca9532_platform_data *pca9532_pdata =
>                         dev_get_platdata(&client->dev);
>  
> +#ifdef CONFIG_OF
> +       if (!pca9532_pdata && client->dev.of_node)
> +               pca9532_pdata = pca9532_parse_dt(&client->dev);
> +#endif
> +

It would be better to remove the two #ifdef statements and instead
do this in C language as

	if (IS_ENABLED(CONFIG_OF) && !pca9532_pdata && client->dev.of_node)
		pca9532_pdata = pca9532_parse_dt(&client->dev);

This gives you extra compile-time coverage when CONFIG_OF is not
enabled.

I would probably also remove the !pca9532_pdata check there, since
we rarely do auxdata for new devices these days, but that is a separate
matter, and the check does not hurt.

> +       if (!of_property_read_u32_array(np, "nxp,pwm", &pwm[0], 2)) {
> +               for (i = 0; i < 2; i++)
> +                       pca9532_pdata->pwm[i] = pwm[i];
> +       }

Is this a full PWM controller? If it is, it would be better to also
provide a #pwm-cells property and register the device with the PWM
subsystem to allow arbitrary users.

If the PWM is only really usable for LED, it's probably enough to
leave this used by the LED subsystem.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
