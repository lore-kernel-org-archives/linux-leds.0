From: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] leds: Add ktd2692 flash LED driver
Date: Fri, 27 Feb 2015 09:06:45 +0530
Message-ID: <CAEUmHybnzdVk59UTsVczW59hpLrimoMeF+j5Gbtue2jNayHHuw@mail.gmail.com>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
	<1424998891-25591-4-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424998891-25591-4-git-send-email-ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-SEjsEC/fJMIdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, florian.vaussard-p8DiymsW2f8@public.gmane.org, arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Hayato Suzuki <hytszk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 02/27/2015 06:31 AM, Ingi Kim wrote:
> This patch adds a driver to support the ktd2692 flash LEDs.
> ktd2692 can control flash current by ExpressWire interface.
>
> Signed-off-by: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>   drivers/leds/Kconfig        |    8 ++
>   drivers/leds/Makefile       |    1 +
>   drivers/leds/leds-ktd2692.c |  245 +++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 254 insertions(+)
>   create mode 100644 drivers/leds/leds-ktd2692.c
>
(...)

> +static struct ktd2692_context *ktd2692_parse_dt(struct device *dev)
> +{
> + struct device_node *np = dev->of_node;
> + struct ktd2692_context *led;
> +
> + led = devm_kzalloc(dev, sizeof(struct ktd2692_context), GFP_KERNEL);
> + if (!led)
> + return ERR_PTR((long)led);

What about using sizeof(*led) in place of sizeof(struct ktd2692_context)..?

Also the error return for devm_kzalloc() should be -ENOMEM.

> +
> + led->strobe_gpio = of_get_named_gpio(np, "strobe-gpio", 0);
> + if (!gpio_is_valid(led->strobe_gpio)) {
> + dev_err(dev, "no strobe_gpio property found\n");
> + return ERR_PTR(led->strobe_gpio);
> + }
> +
> + return led;
> +}
> +
> +static int ktd2692_probe(struct platform_device *pdev)
> +{
> + struct device *dev = &pdev->dev;
> + struct ktd2692_context *led;
> + int ret;
> +
> + if (!dev->of_node)
> + return -ENODEV;
> +
> + led = ktd2692_parse_dt(dev);
> + if (IS_ERR(led))
> + return PTR_ERR(led);
> +
> + led->cdev.name = KTD2692_DEFAULT_NAME;
> + led->cdev.brightness = LED_OFF;
> + led->cdev.max_brightness = LED_FULL;
> + led->cdev.flags |= LED_CORE_SUSPENDRESUME;
> + led->cdev.brightness_set = ktd2692_brightness_set;
> + led->cdev.brightness_get = ktd2692_brightness_get;
> + led->mode = KTD2692_REG_MODE_BASE | KTD2692_MODE_DISABLE;
> +
> + platform_set_drvdata(pdev, led);
> +
> + ret = led_classdev_register(&pdev->dev, &led->cdev);
> + if (ret) {
> + dev_err(dev, "couldn't register LED %s\n", led->cdev.name);
> + return ret;
> + }
> +
> + ret = ktd2692_brightness_set_gpio(led);
> + if (ret) {
> + led_classdev_unregister(&led->cdev);
> + return ret;
> + }
> +
> + ktd2692_expresswire_reset(led);
> +
> + return ret;

return 0 instead of ret...?



-- 
Thanks,
Varka Bhadram.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
