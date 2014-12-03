From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v2] leds: leds-gpio: Fix multiple instances registration
 when 'label' property is absent
Date: Wed, 3 Dec 2014 23:17:42 +0000
Message-ID: <CACxGe6srjVUAxXEahDMPGNYKn7O-TqoExwGrGkDE9bb1tiA-jA@mail.gmail.com>
References: <1417629453-25719-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:56615 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030AbaLCXSC (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 18:18:02 -0500
Received: by mail-ig0-f174.google.com with SMTP id hn15so17782130igb.7
        for <linux-leds@vger.kernel.org>; Wed, 03 Dec 2014 15:18:02 -0800 (PST)
In-Reply-To: <1417629453-25719-1-git-send-email-festevam@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Dec 3, 2014 at 5:57 PM, Fabio Estevam <festevam@gmail.com> wrote:
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

Acked-by: Grant Likely <grant.likely@linaro.org>

(Assuming that creating a fwnode_get_name() function turns out to be a
non-starter.)

g.

> ---
> Changes since v1:
> - Consider ACPI case as suggested by Grant
>
>  drivers/leds/leds-gpio.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index fd53968..8a8ba11 100644
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
> @@ -189,7 +190,16 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>                         goto err;
>                 }
>
> -               fwnode_property_read_string(child, "label", &led.name);
> +               np = of_node(child);
> +
> +               if (fwnode_property_present(child, "label")) {
> +                       fwnode_property_read_string(child, "label", &led.name);
> +               } else {
> +                       if (IS_ENABLED(CONFIG_OF) && !led.name && np)
> +                               led.name = np->name;
> +                       if (!led.name)
> +                               return ERR_PTR(-EINVAL);
> +               }
>                 fwnode_property_read_string(child, "linux,default-trigger",
>                                             &led.default_trigger);
>
> --
> 1.9.1
>
