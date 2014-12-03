From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] leds: leds-gpio: Fix multiple instances registration when
 'label' property is absent
Date: Wed, 3 Dec 2014 17:40:58 +0000
Message-ID: <CACxGe6sRJ_xChNoEN2Abif1a2gweWNxT3_1Pw=rx9LaTy3mHpA@mail.gmail.com>
References: <1417628073-22013-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:37635 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751110AbaLCRlU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 12:41:20 -0500
Received: by mail-ie0-f173.google.com with SMTP id y20so14067098ier.4
        for <linux-leds@vger.kernel.org>; Wed, 03 Dec 2014 09:41:19 -0800 (PST)
In-Reply-To: <1417628073-22013-1-git-send-email-festevam@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Dec 3, 2014 at 5:34 PM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Since commit a43f2cbbb009f96 ("leds: leds-gpio: Make use of device property
> API") it is no longer possible to register multiple gpio leds without passing
> the 'label' property.
>
> According to Documentation/devicetree/bindings/leds/common.txt:
>
> "Optional properties for child nodes:
> - label : The label for this LED.  If omitted, the label is
>   taken from the node name (excluding the unit address)."
>
> So retrieve the node name when the 'label' property is absent to keep the old
> behaviour and fix this regression.
>
> Reported-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/leds/leds-gpio.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index fd53968..a635330 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -170,6 +170,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>         struct fwnode_handle *child;
>         struct gpio_leds_priv *priv;
>         int count, ret;
> +       struct device_node *np;
>
>         count = device_get_child_node_count(dev);
>         if (!count)
> @@ -189,7 +190,12 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>                         goto err;
>                 }
>
> -               fwnode_property_read_string(child, "label", &led.name);
> +               np = of_node(child);
> +
> +               if (fwnode_property_present(child, "label"))
> +                       fwnode_property_read_string(child, "label", &led.name);
> +               else
> +                       led.name = np->name;

np will be NULL when ACPI is used and that will break this driver.
Instead you need to use the construct:
                 fwnode_property_read_string(child, "label", &led.name);
                 if (IS_ENABLED(CONFIG_OF) && !led.name && np)
                         led.name = np->name;
                 if (!led.name)
                         error;

>                 fwnode_property_read_string(child, "linux,default-trigger",
>                                             &led.default_trigger);
>
> --
> 1.9.1
>
